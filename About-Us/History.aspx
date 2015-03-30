<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Phototype | History</title>
<link rel="stylesheet" href="/css/foundation.css" />
<link rel="stylesheet" href="/css/timeline.css" />
<link rel="stylesheet" href="/css/master.css" />
<link rel="stylesheet" href="/css/main.css" />
<!--#include virtual="/includes/font.aspx"-->
<!--#include virtual="/includes/analytics.aspx" -->
<script src="/js/vendor/modernizr.js"></script>
</head>

<body id="about-us">
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
							<h1>H1 Tag</h1>
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
						<div class="editable-content">
							<!-- CMSContentStart:Main -->
							<p><br />It all began in 1919 with three men who shared a common passion for delivering high-quality work and superior service. With just $4,000 between them, they acted on that passion and opened up a small production shop in Cincinnati, Ohio and named it Phototype Engraving. The rest, as they say, is history&hellip;</p>
							<!-- CMSContentEnd:Main -->
						</div>
						<div class="timelineLoader">
							<img src="/images/timeline/ajax-loader.gif" />
						</div>
						<div class="timelineFlat">
							<div class="item" data-name="2012" data-id="2/1919/2012">
								<img src="/images/history/2012.png" />
								<div class="read_more" data-id="2/1919/2012"><h4>2012</h4></div>
							</div>
							<div class="item_open" data-id="2/1919/2012">
								<h2>2012</h2>
								<h3>Getting bigger in Texas</h3>
								<p>Phototype opened an additional production facility in Dallas, TX, to better meet the needs of clients like Church & Dwight and Pinnacle Foods. During the same year, Phototype entered into a new, collaborative partnership with Hershey and opened an innovative 3D studio in its Columbus, OH, office.</p>
							</div>
							<div class="item" data-name="2014" data-id="1/Present/2014">
								<img src="/images/history/2014.png" />
								<div class="read_more" data-id="1/Present/2014"><h4>2014</h4></div>
							</div>
							<div class="item_open" data-id="1/Present/2014">
								<h2>2014</h2>
								<h3>At the top</h3>
								<p>Phototype reaches 260 employees and is recognized regionally as an Enquirer Media Top Workplace for 2014. Sadly, Phototype also said goodbye to Dick Olberding (its patriarch for 63 years) but his vision lives on in the leadership and family spirit of the company&hellip; a company that is certainly poised for future growth.</p>
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
<script src="/js/jquery.easing.1.3.js"></script>
<script src="/js/jquery.timeline.js"></script>
<script>
	jQuery(document).foundation();
	
	jQuery(window).load(function() {
		jQuery('.timelineFlat').timeline({
			openTriggerClass: '.read_more',
			startItem: 'last',
			closeText: '',
			hideControls: true,
			itemMargin: 10,
			categories: ['1919', 'Present'],
			numberOfSegments: [1, 1],
			yearsOn: false
		});
		
		//jQuery('.read_more').click(function() {
//			jQuery('.read_more').show();
//			jQuery(this).hide();
//		});
//		
//		jQuery('.t_close').click(function() {
//			jQuery('.read_more').show();
//		});

		jQuery('.timelineFlat').bind('itemOpen', function(event) {
			console.log(event);
		});
		
		jQuery('.timelineFlat').bind('itemClose', function(event) {
			console.log(event);
		});
	});
</script>
</body>
</html>
