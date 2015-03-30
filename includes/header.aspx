<header class="has-background-color">
	<section class="full-width subheader show-for-medium-up">
		<div class="row collapse">
			<div class="large-offset-8 large-4 columns">
				<div class="right search-box">
					<table id="table-search">
						<tr>
							<td>
								<form name="search" method="get" action="/Search.aspx" style="margin: 0px; padding: 0px">
									<input name="q" type="search" class="formfield" id="input-search" size="18" value='<%=request.querystring("q") %>'>
								</form>
							</td>
							<td>
								<a class="tiny button round" href="/Contact-Us/">Let&rsquo;s Talk</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
	<div class="row">
		<nav class="top-bar" data-topbar>
			<ul class="title-area">
				<li class="name">
					<a href="/"><img class="show-for-large-up" src="/images/common/phototype_logo.png" /><img class="show-for-medium-down" src="/images/common/phototype_logo_small.png" /></a>
				</li>
				<li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
			</ul>
			<section class="top-bar-section">
				<!--#include virtual="/includes/header-nav.aspx" -->
			</section>
		</nav>
	</div>
</header>
