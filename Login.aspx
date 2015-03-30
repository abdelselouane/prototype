<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Phototype | Login</title>
<link rel="stylesheet" href="/css/foundation.css" />
<link rel="stylesheet" href="/css/master.css" />
<link rel="stylesheet" href="/css/main.css" />
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
							<h1>Login</h1>
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
						<div class="row">
							<div class="small-12 medium-8 large-6 end columns">
								<label for="username">Username:
									<input name="username" id="username" type="text" runat="server" width="200" />
								</label>
							</div>
						</div>
						<div class="row">
							<div class="small-12 medium-8 large-6 end columns">
								<label for="password">Password:
									<input name="password" type="password" id="password" runat="server" width="200" />
								</label>
								<p><button id="login" class="button round">Login</button></p>
							</div>
						</div>
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
<script>
	jQuery(document).foundation();
	
	jQuery('#login').on('click', function() {
		jQuery('#txtCMSUser').val(jQuery('#username').val());
		jQuery('#txtCMSPassword').val(jQuery('#password').val());
		
		jQuery('.rhui-dialog-buttonpane button:first').click();
	});
</script>
</body>
</html>
