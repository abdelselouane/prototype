<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Phototype | <!-- CMSBlog:Name --> | <!-- CMSBlogPost:Title --></title>
<link rel="stylesheet" href="/css/foundation.css" />
<link rel="stylesheet" href="/css/master.css" />
<link rel="stylesheet" href="/css/main.css" />
<!--#include virtual="/includes/font.aspx"-->
<!--#include virtual="/includes/analytics.aspx" -->
<script src="/js/vendor/modernizr.js"></script>
</head>

<body id="news">
<div id="main-container">
	<!--#include virtual="/includes/header.aspx" -->
	<div class="row collapse">
		<div class="small-12 columns">
	
			<!--heading-->
			<div class="row collapse">
				<div class="small-12 columns">
					<section id="main-heading">
						<div class="editable-content">
							<h1><!-- CMSBlog:Name --></h1>
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
							<div class="small-12 medium-9 medium-push-3 columns">
								<h2><!-- CMSBlogPost:Title --></h2>
								<!-- CMSBlogPost:Article -->
							</div>
							<div id="blog-nav" class="small-12 medium-3 medium-pull-9 columns">
								<h3>Most Recent</h3>
								<div id="bloglinks">
									<!-- CMSBlog:Dynamic:PostLastX:10 -->
								</div>
								<h3>Archives</h3>
								<div id="rhtBlogArchives" style="display: none;">
									<!-- CMSBlog:Archives -->
								</div>
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
<script src="http://scripts.redhawk-tech.com/jQuery/rhtBlogArchives.js"></script>
<script>
	jQuery(document).foundation();
</script>
</body>
</html>
