/* ------------------------------------------------------------------------
 * Plugin: submissionOK
 * Author: Ryan Molley
 * Company: Red Hawk Technologies (http://www.redhawk-tech.com)
 * Version: 3.1.5
 * Completion: October 28, 2014
 * ------------------------------------------------------------------------- */
(function(jQuery) {
		  
	jQuery.fn.submissionOK = function(options) {
		numErrors = 0;
		
		var o = jQuery.extend({}, jQuery.fn.submissionOK.defaults, options, jQuery.expr[':'],																		
		{																				
			
			init: function(item) {
				jQuery('body *').removeClass('sok_errorAlert').removeClass('sok_errorBorder').removeClass('sok_noBorder');
				if(jQuery('.sok_errorLabel').length > 0) jQuery('.sok_errorLabel').remove();
				
				var len = jQuery(item).length;
				
				if(jQuery('[reqmask]').length > 0) jQuery('[reqmask]').keyup();
		
				jQuery(item).each(function(index) {	
					if(index === 0) {
						if(jQuery('#' + o.errorsId).length > 0)
							jQuery('#' + o.errorsId).addClass('sok_displayErrors').html('<div id="sok_errorMessages"><h3>' + o.errorLabel + '</h3><ul></ul></div>');
					}
					
					o.checkType(this);
					
					if(index == len - 1) {
						if(jQuery('[reqsub]')) {
							jQuery('[reqsub]').each(function() {
								o.checkType(null, this);				 
							});
						}
						
						if(numErrors == 0)
							jQuery('#' + o.captchaId).length > 0 ? jQuery.fn.submissionOK.checkCaptcha(o) : (!o.testMode ? jQuery.fn.submissionOK.formSubmission(o) : console.log('Form successfully submitted.'));
						else
							o.animateErrors ? jQuery('#' + o.errorsId).trigger('ErrorOccurred').slideDown('slow') : jQuery('#' + o.errorsId).trigger('ErrorOccurred');
					}
					
				});
			},
			
			checkType: function(item, subItem) {
				var id_ = (subItem ? jQuery(subItem).attr('id') : jQuery(item).attr('req'));
					
				if(jQuery('#' + id_).is('select'))
					this.typeSelect(id_, item);
				else if(jQuery('#' + id_).is('input[type="checkbox"]') || jQuery('#' + id_).is('input[type="radio"]'))
					this.typeArray(id_, item);
				else
					this.typeText(id_, item, subItem);
			},
			
			typeArray: function(id_, item) {
				var name = jQuery('#' + id_).attr('name');

				if(name.indexOf("$") > 0) name = name.substring(0, name.indexOf("$"));

				var i = 0;
				
				jQuery('[name^="' + name + '"]').each(function() {
					if(jQuery(this).is(':checked'))
						i += 1;
				});
				
				highlightErrors(o, id_, i, true, item);					
			},
			
			typeSelect: function(id_, item) {				
				if(!jQuery('#' + id_ + 'option:selected') || jQuery('#' + id_).val() == this.selectFirstValue) 
					highlightErrors(o, id_, 0, false, item);					
			},
			
			typeText: function(id_, item, subItem) {
				var defaultValue;
				
				if(subItem) {
					jQuery('#' + id_).attr('reqdefault') == null ? defaultValue = '' : defaultValue = jQuery('#' + id_).attr('reqdefault');
					
					var subVal = jQuery(subItem).attr('reqsub').split(':');
					this.validateSub(id_, subItem, subVal[0], subVal[1], defaultValue);	
				}
				else {
					jQuery('#' + id_).attr('reqdefault') == null ? defaultValue = '' : defaultValue = jQuery('#' + id_).attr('reqdefault');
					if(jQuery('#' + id_).val() == defaultValue) highlightErrors(o, id_, 0, false, item);
				}
				
				if(jQuery(item).attr('reqvalidate') != null && jQuery('#' + id_).val() != defaultValue) {
					var evaluateRegex = this.regex(jQuery('#' + id_).val());
					if(!evaluateRegex) highlightErrors(o, id_, 0, false, item, 'email');
				}	
			},
			
			validateSub: function(id_, item, reqId, reqValue, defaultValue) {
				if(reqValue) {
					if(jQuery('#' + reqId).is('input[type="checkbox"]') || jQuery('#' + reqId).is('input[type="radio"]'))
						highlight(jQuery('#' + reqId + ':checked').val() == reqValue);
					else
						highlight(jQuery('#' + reqId).val() == reqValue);
				}
				else {
					if(jQuery('#' + reqId).is('input[type^="select"]'))
						highlight(jQuery('#' + reqId).val() != this.selectFirstValue || jQuery('#' + reqId).is(':checked'));
					else if(jQuery('#' + reqId).is('input[type="checkbox"]') || jQuery('#' + reqId).is('input[type="radio"]')) {
						var name = jQuery('#' + reqId).attr('name');
						highlight(jQuery('[name="' + name + '"]:checked').val());
					}
					else
						highlight(jQuery('#' + reqId).val());
				}
				
				function highlight(parentValueCheck) {
					if(parentValueCheck)
						jQuery('#' + id_).val() != defaultValue ? highlightErrors(o, id_, 1, false, item) : highlightErrors(o, id_, 0, false, item, true);	
				}
			},
			
			regex: function(text) {
				var regex = /([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})/;
				return (regex.test(text));
			}
			
		});
				
		o.init(this);
	};
	
	var numErrors = 0;
	
	jQuery(function () {
	    jQuery('[reqmask]').each(function () {

	        jQuery(this).keypress(function (e) {
	            if (((e.keyCode ? e.keyCode : e.which) < 48 || (e.keyCode ? e.keyCode : e.which) > 57) && 
					((e.keyCode ? e.keyCode : e.which) != 46 && (e.keyCode ? e.keyCode : e.which) != 8) && 
					((e.keyCode ? e.keyCode : e.which) < 37 && (e.keyCode ? e.keyCode : e.which) > 40)) return false;
	        });

	        jQuery(this).keyup(function (e) {
	            var non_mask = jQuery(this).val().split(''),
                reqmask = jQuery(this).attr('reqmask').split('');

	            if ((e.keyCode ? e.keyCode : e.which) >= 37 && (e.keyCode ? e.keyCode : e.which) <= 40) return false;

	            if (non_mask.join('') != jQuery(this).attr('reqdefault')) {

	                non_mask = jQuery.grep(non_mask, function (n) { return !isNaN(n) && n != ' '; });

	                for (var i = 0; i < non_mask.length; i++) {

	                    for (var j = i; j < reqmask.length; j++) {
	                        if (reqmask[j] == '#' || reqmask[j] == non_mask[i]) break;
	                        else {
	                            non_mask.splice(i, 0, reqmask[j]);
	                            i++;
	                        }
	                    }
	                }

	                if (non_mask.length > reqmask.length) non_mask = jQuery.grep(non_mask, function (n) { return !isNaN(n) && n != ' '; });

	                jQuery(this).val(non_mask.join(''));
	            }
	        });

	    });

	    jQuery('[reqdefault]').each(function () {

	        if (this.value == jQuery(this).attr('reqdefault')) jQuery(this).addClass('sok_defaultValue');

	        jQuery(this).focus(function () {
	            if (this.value == jQuery(this).attr('reqdefault')) {
	                this.value = '';
	                jQuery(this).removeClass('sok_defaultValue');
	            }
	        }).blur(function () {
	            if (this.value == '') {
	                this.value = jQuery(this).attr('reqdefault');
	                jQuery(this).addClass('sok_defaultValue');
	            }
	        });

	    });
	});
	
	highlightErrors = function(o, id_, errorIndicatorValue, highlightArrays, item, subItem) {
		var labelBorder;
		
		o.highlight ? labelBorder = 'sok_errorBorder' : labelBorder = 'sok_noBorder';

		if(errorIndicatorValue == 0) {
			addErrorHandlers();
			subItem ? errorMessage(o, labelBorder, item, subItem) : errorMessage(o, labelBorder, item);
		}
		
		function addErrorHandlers() {
			if(o.label) {
				if(id_ != jQuery(item).attr('id')) {
					if(!subItem || subItem == 'email' || subItem == 'captcha')
						jQuery(item).addClass('sok_errorAlert');
				}
			}
				
			if(highlightArrays) {
				var node = jQuery('#' + id_).parent().get(0).tagName.toLowerCase();
				node == 'li' ? jQuery('#' + id_).closest('ul').addClass(labelBorder) : jQuery('#' + id_).parent().addClass(labelBorder);
			}
			else 
				jQuery('#' + id_).addClass(labelBorder);
		}
		
	}
	
	errorMessage = function(o, labelBorder, item, errorMessageType) {
		numErrors += 1;
		
		var reqName = jQuery(item).attr('reqname'),
			reqSub = jQuery(item).attr('reqsub'),
			reqError = jQuery(item).attr('reqerror'),
			req = jQuery(item).attr('req');
			
		if(o.displayOnForm)
			inlineErrors();
		
		if(jQuery('#sok_errorMessages').length > 0)
			listOfErrors();
		
		function listOfErrors() {
			if(reqError)
				jQuery('#sok_errorMessages ul').append('<li>' + reqError + '</li>');
			else if(errorMessageType == 'captcha')
				jQuery('#sok_errorMessages ul').append('<li>' + (reqName ? reqName : req) + ' ' + o.errorMessages.captchaCheck + '</li>');
			else if(errorMessageType != null)
				jQuery('#sok_errorMessages ul').append('<li>' + (reqName ? reqName : req) + ' ' + o.errorMessages.invalidFormat + '</li>');	
			else
				jQuery('#sok_errorMessages ul').append('<li>' + (reqName ? reqName : (req ? req : reqSub)) + ' ' + o.errorMessages.default + '</li>');
		}
		
		function inlineErrors() {
			var id_ = jQuery(item).attr('id');
			var $req, selection;
			
			selection = (reqSub ? id_ : req);
			
			if(jQuery('#' + selection).next('label').length)
				$req = jQuery('#' + selection).next('label');
			else if(jQuery('[reqplaceholder="' + selection + '"]').length)
				$req = jQuery('[reqplaceholder="' + selection + '"]');
			else
				$req = jQuery('#' + selection).closest('.' + labelBorder);

			if(reqSub)
				reqError ? ($req.after('<div class="sok_errorLabel">' + reqError + '</div>')) : ($req.after('<div class="sok_errorLabel">' + (reqName ? reqName : (req ? req : reqSub)) + ' ' + o.errorMessages.default + '</div>'));
			else if(reqError)
				$req.after('<div class="sok_errorLabel">' + reqError + '</div>');
			else if(errorMessageType == 'captcha')
				$req.after('<div class="sok_errorLabel">' + (reqName ? reqName : req) + ' ' + o.errorMessages.captchaCheck + '</div>');
			else if(errorMessageType != null)
				$req.after('<div class="sok_errorLabel">' + (reqName ? reqName : req) + ' ' + o.errorMessages.invalidFormat + '</div>');
			else
				$req.after('<div class="sok_errorLabel">' + (reqName ? reqName : (req ? req : reqSub)) + ' ' + o.errorMessages.default + '</div>');
		}
	}
	
	jQuery.fn.submissionOK.checkCaptcha = function(o) {
		// -- Captcha variables to use with submissionOK --
		
		// var item = jQuery('[req="' + o.captchaId + '"]');
		// var id_ = jQuery(item).attr('req');
		
		// -- Captcha error handling --
		
		// highlightErrors(o, id_, 0, false, item, 'captcha');
		// jQuery('#' + o.errorsId).trigger('ErrorOccurred');
		
		// if(o.animateErrors) jQuery('#' + o.errorsId).slideDown('slow');
		
		jQuery.fn.submissionOK.formSubmission(o);
	}
	
	jQuery.fn.submissionOK.formSubmission = function(o) {
		jQuery('form[reqform]').submit();
	}
	
	jQuery.fn.submissionOK.defaults = {
		selectFirstValue: '',
		label: false,
		highlight: false,
		animateErrors: false,
		displayOnForm: true,
		errorsId: 'sok_errors',
		captchaId: 'recaptcha_response_field',
		errorLabel: 'Errors found:',
		errorMessages: {
			'default': 'is a required field.',
			'invalidFormat': 'is not in a valid format.',
			'captchaCheck': 'value does not appear to be valid, please try again.'
		},
		testMode: false
	}
	
})(jQuery);