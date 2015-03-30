<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Contact_Us" %>

<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Phototype | Contact Us</title>
<link rel="stylesheet" href="/css/foundation.css" />
<link rel="stylesheet" href="/css/master.css" />
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet" href="/css/form.css" />
<link rel="stylesheet" href="/css/submissionOK.css"
<!--#include virtual="/includes/font.aspx"-->
<!--#include virtual="/includes/analytics.aspx" -->
<script src="/js/vendor/modernizr.js"></script>
</head>

<body id="generic">
<div id="main-container">
	<!--#include virtual="/includes/header.aspx" -->
	<div class="row collapse">
		<div class="small-12 columns">
	
			<!--heading-->
			<div class="row collapse">
				<div class="small-12 columns">
					<section id="main-heading">
						<div class="editable-content">
						<!-- CMSContentStart:Heading -->
							<h1>Contact Us</h1>
						<!-- CMSContentEnd:Heading -->
						</div>
						<div class="triangle"></div>
					</section>
				</div>
			</div>
			
			<!--content-->
			<div class="row">
				<div class="small-12 columns">
					<section id="main-content">
						<form id="form1" reqform="form1" runat="server">
							<div class="row">
								<div class="small-12 columns">
									<h2>Thanks for reaching out. What would you like to talk about?</h2>
								</div>
							</div>
							<hr />
							<div class="row">
								<div class="small-12 large-4 columns">
									<asp:CheckBoxList ID="talkAbout1" RepeatLayout="Flow" TextAlign="Right" runat="server">
										<asp:ListItem Value="SmartArt(SM)">SmartArt<small><sup>SM</sup></small></asp:ListItem>
										<asp:ListItem Value="Strategic Design">Strategic Design</asp:ListItem>
										<asp:ListItem Value="Adaptive Design">Adaptive Design</asp:ListItem>
										<asp:ListItem Value="Production Art">Production Art</asp:ListItem>
										<asp:ListItem Value="Electronic Assembly">Electronic Assembly</asp:ListItem>
									</asp:CheckBoxList>
								</div>
								<div class="small-12 large-4 columns">
									<asp:CheckBoxList ID="talkAbout2" RepeatLayout="Flow" TextAlign="Right" runat="server">
										<asp:ListItem Value="Contract Color Proofing">Contract Color Proofing</asp:ListItem>
										<asp:ListItem Value="Print Services">Print Services</asp:ListItem>
										<asp:ListItem Value="3D Rendering">3D Rendering</asp:ListItem>
										<asp:ListItem Value="Project Management">Project Management</asp:ListItem>
										<asp:ListItem Value="Color Management">Color Management</asp:ListItem>
									</asp:CheckBoxList>
								</div>
								<div class="small-12 large-4 columns">
									<asp:CheckBoxList ID="talkAbout3" RepeatLayout="Flow" TextAlign="Right" runat="server">
										<asp:ListItem Value="File Routing & Collaboration">File Routing & Collaboration</asp:ListItem>
										<asp:ListItem Value="Digital Asset Management">Digital Asset Management</asp:ListItem>
										<asp:ListItem Value="Other">Other</asp:ListItem>
									</asp:CheckBoxList>
									<input type="text" id="talkAboutOther" placeholder="Other" runat="server" />
								</div>
							</div>
							<hr />
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="firstName" req="firstName" reqname="First name" class="right inline"><span class="formrequired">*</span> First Name:</label>
								</div>
								<div class="small-12 medium-9 columns">
									<input type="text" id="firstName" placeholder="First Name" runat="server" />
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="lastName" req="lastName" reqname="Last name" class="right inline"><span class="formrequired">*</span> Last Name:</label>
								</div>
								<div class="small-12 medium-9 columns">
									<input type="text" id="lastName" placeholder="Last Name" runat="server" />
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="email" req="email" reqvalidate="email" reqname="Email" class="right inline"><span class="formrequired">*</span> Email:</label>
								</div>
								<div class="small-12 medium-9 columns">
									<input type="text" id="email" placeholder="Email" runat="server" />
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="phone" class="right inline">Phone:</label>
								</div>
								<div class="small-12 medium-9 columns">
									<input type="text" id="phone" placeholder="Phone" runat="server" />
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="title" class="right inline">Title</label>
								</div>
								<div class="small-12 medium-9 columns">
									<input type="text" id="title" placeholder="Title" runat="server" />
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="company" req="company" reqname="Company" class="right inline"><span class="formrequired">*</span> Company</label>
								</div>
								<div class="small-12 medium-9 columns">
									<input type="text" id="company" placeholder="Company" runat="server" />
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="city" req="city" reqname="City" class="right inline"><span class="formrequired">*</span> City</label>
								</div>
								<div class="small-12 medium-9 columns">
									<input type="text" id="city" placeholder="City" runat="server" />
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="state" req="state" reqname="State" class="right inline"><span class="formrequired">*</span> State</label>
								</div>
								<div class="small-12 medium-9 columns">
									<asp:DropDownList ID="state" runat="server">
										<asp:ListItem Selected="True" Value="">Select State</asp:ListItem>
										<asp:ListItem Value="AK">AK</asp:ListItem>
										<asp:ListItem Value="AL">AL</asp:ListItem>
										<asp:ListItem Value="AR">AR</asp:ListItem>
										<asp:ListItem Value="AZ">AZ</asp:ListItem>
										<asp:ListItem Value="CA">CA</asp:ListItem>
										<asp:ListItem Value="CO">CO</asp:ListItem>
										<asp:ListItem Value="CT">CT</asp:ListItem>
										<asp:ListItem Value="DC">DC</asp:ListItem>
										<asp:ListItem Value="DE">DE</asp:ListItem>
										<asp:ListItem Value="FL">FL</asp:ListItem>
										<asp:ListItem Value="GA">GA</asp:ListItem>
										<asp:ListItem Value="HI">HI</asp:ListItem>
										<asp:ListItem Value="IA">IA</asp:ListItem>
										<asp:ListItem Value="ID">ID</asp:ListItem>
										<asp:ListItem Value="IL">IL</asp:ListItem>
										<asp:ListItem Value="IN">IN</asp:ListItem>
										<asp:ListItem Value="KS">KS</asp:ListItem>
										<asp:ListItem Value="KY">KY</asp:ListItem>
										<asp:ListItem Value="LA">LA</asp:ListItem>
										<asp:ListItem Value="MA">MA</asp:ListItem>
										<asp:ListItem Value="MD">MD</asp:ListItem>
										<asp:ListItem Value="ME">ME</asp:ListItem>
										<asp:ListItem Value="MI">MI</asp:ListItem>
										<asp:ListItem Value="MN">MN</asp:ListItem>
										<asp:ListItem Value="MO">MO</asp:ListItem>
										<asp:ListItem Value="MS">MS</asp:ListItem>
										<asp:ListItem Value="MT">MT</asp:ListItem>
										<asp:ListItem Value="NC">NC</asp:ListItem>
										<asp:ListItem Value="ND">ND</asp:ListItem>
										<asp:ListItem Value="NE">NE</asp:ListItem>
										<asp:ListItem Value="NH">NH</asp:ListItem>
										<asp:ListItem Value="NJ">NJ</asp:ListItem>
										<asp:ListItem Value="NM">NM</asp:ListItem>
										<asp:ListItem Value="NV">NV</asp:ListItem>
										<asp:ListItem Value="NY">NY</asp:ListItem>
										<asp:ListItem Value="OH">OH</asp:ListItem>
										<asp:ListItem Value="OK">OK</asp:ListItem>
										<asp:ListItem Value="OR">OR</asp:ListItem>
										<asp:ListItem Value="PA">PA</asp:ListItem>
										<asp:ListItem Value="RI">RI</asp:ListItem>
										<asp:ListItem Value="SC">SC</asp:ListItem>
										<asp:ListItem Value="SD">SD</asp:ListItem>
										<asp:ListItem Value="TN">TN</asp:ListItem>
										<asp:ListItem Value="TX">TX</asp:ListItem>
										<asp:ListItem Value="UT">UT</asp:ListItem>
										<asp:ListItem Value="VA">VA</asp:ListItem>
										<asp:ListItem Value="VT">VT</asp:ListItem>
										<asp:ListItem Value="WA">WA</asp:ListItem>
										<asp:ListItem Value="WI">WI</asp:ListItem>
										<asp:ListItem Value="WV">WV</asp:ListItem>
										<asp:ListItem Value="WY">WY</asp:ListItem>
									</asp:DropDownList>
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="zipcode" req="zipcode" reqname="Zip" class="right inline"><span class="formrequired">*</span> Zip</label>
								</div>
								<div class="small-12 medium-9 columns">
									<input type="text" placeholder="Zip" id="zipcode" runat="server" />
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="country" class="right inline">Country</label>
								</div>
								<div class="small-12 medium-9 columns">
									<input type="text" placeholder="Country" id="country" runat="server" />
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label for="comments" class="right inline">Comments:</label>
								</div>
								<div class="small-12 medium-9 columns">
									<textarea cols="42" rows="5" class="textArea" placeholder="Comments" id="comments" runat="server"></textarea>
								</div>
							</div>
							<hr />
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label>&nbsp;</label>
								</div>
								<div class="small-12 medium-9 columns">
									<div class="g-recaptcha" data-sitekey="6LcLFwQTAAAAAB280HNSb-1rKYesu6de6hd5kiJJ"></div>
									<p><asp:Label ID="sok_ErrorMessage" runat="server" CssClass="sok_errorLabel"></asp:Label></p>
									<input type="hidden" id="captchaResponse" runat="server" />
								</div>
							</div>
							<div class="row">
								<div class="medium-3 columns show-for-medium-up">
									<label>&nbsp;</label>
								</div>
								<div class="small-12 medium-9 columns">
									<asp:Button ID="SubmitForm1Button" runat="server" CssClass="invisible" Text="Submit" /><button id="formsubmit" class="button round">Submit</button> &nbsp;&nbsp;&nbsp;&nbsp; <span class="formrequired">*</span> required information
								</div>
							</div>
						</form>
					</section>
				</div>
			</div>
		
		</div>
	</div>
</div>
<!--#include virtual="/includes/footer.aspx" -->
<script src="/js/vendor/jquery.js"></script> 
<script src="/js/foundation.min.js"></script>
<script src="/js/main.js"></script>
<script src="//www.google.com/recaptcha/api.js"></script>
<script src="/js/jquery.submissionOK.js"></script>
<script>
	jQuery(document).foundation();

	jQuery(function () {
		jQuery('#formsubmit').click(function () {
			jQuery('#captchaResponse').val(grecaptcha.getResponse());

			jQuery('[req]').submissionOK({ highlight: true, displayOnForm: false });
			return false;
		});
	});
	
	jQuery.fn.submissionOK.formSubmission = function(o) {
		jQuery('#SubmitForm1Button').click();
	};
</script>
</body>
</html>

