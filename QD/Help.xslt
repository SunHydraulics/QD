<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<header class="site--header container">
			<input type="hidden" id="languageid" name="languageid">
				<xsl:attribute name="value">
					<xsl:value-of select="//page/qd/languageid"/>
				</xsl:attribute>
			</input>
			<div id="screenmessage" class="speechbubble nodisplay"/>
			<div class="logo-wrapper">
				<a href="default.aspx">
					<img src="images/QuickDesign-Logo.svg" alt="" class="logo"
               onerror="this.src=images/QuickDesign-Logo.png;this.onerror=null;"/>
				</a>
				<div class="right tx--right">
					<div class="languages">
						<select style="width:130px;font-size:85%;">
							<xsl:attribute name="onchange">
								var sid = $(this).find('option:selected').attr('id');
								document.getElementById("languageid").value=sid;
								submitit();
							</xsl:attribute>
							<xsl:for-each select="//page/qd/langflags">
								<option>									
									<xsl:attribute name="id"><xsl:value-of select="@languageid"/></xsl:attribute>
									<xsl:if test="@selected">
										<xsl:attribute name="selected">true</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="@alt"/>
								</option>
							</xsl:for-each>
						</select>

					</div>
				</div>
			</div>
			<xsl:if test="//page/qd/headeritems">
				<nav class="site--nav">
					<div class="links">
						<xsl:for-each select="//page/qd/headeritems">
							<a>
								<xsl:if test="@selected">
									<xsl:attribute name="selected">true</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="href">
									<xsl:value-of select="@surl"/>
								</xsl:attribute>
								<xsl:value-of select="@label"/>
							</a>
						</xsl:for-each>
					</div>
				</nav>
			</xsl:if>
			<div class="page-header pad">
				<h1 class="title">
					<xsl:value-of select="//page/qd/screenlabels[@id=637]/@label"/>
					<!--Using QuickDesign-->
				</h1>
			</div>
		</header>
		<div class="site--wrapper">
			<div class="container bg--white content--wrapper pad noborder">
				<div class="helpsearch">
					<input id="data_searchterm" name="data_searchterm" class="col-3-5" type="text">
						<xsl:attribute name="placeholder">
							<xsl:value-of select="//page/qd/screenlabels[@id=638]/@label"/>
							<!--Enter a search word-->
						</xsl:attribute>

						<xsl:attribute name="onkeydown">
							if(event.keyCode==13){
							submitit();
							}
						</xsl:attribute>
						<xsl:if test="//page/qd/search/@searchterm">
							<xsl:attribute name="value">
								<xsl:value-of select='//page/qd/search/@searchterm'/>
							</xsl:attribute>
						</xsl:if>
					</input>
					<a class="helpbutton">
						<xsl:attribute name="onclick">submitit();return false;</xsl:attribute>
					</a>
				</div>
				<div class="helpbackground"></div>
				<div>

					<section class="bg--light-grey pad block">
						<div class="col-1-2">
							<h2 class="block-title">
								Videos
							</h2>
							<div class="videotitle">
								<xsl:value-of select="//page/qd/screenlabels[@id=639]/@label"/>
								<!--Getting Started-->
							</div>
							<script charset="ISO-8859-1" src="//fast.wistia.com/assets/external/E-v1.js" async=""></script>
							<div class="wistia_responsive_padding" style="padding:56.25% 0 0 0;position:relative;">
								<div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
									<span class="wistia_embed wistia_async_tx3vhge9wi popover=true popoverAnimateThumbnail=true videoFoam=true"
												style="display:inline-block;height:100%;width:100%">
									</span>

								</div>
							</div>
							<br/>
							<br/>
							<div class="videotitle">
								Technical Webinar Recording
								<!--Getting Started-->
							</div>
							<script src="//fast.wistia.com/embed/medias/ui5k7w7bgi.jsonp" async=""></script>
							<script src="//fast.wistia.com/assets/external/E-v1.js" async=""></script>
							<div class="wistia_responsive_padding" style="padding:56.25% 0 0 0;position:relative;">
								<div class="wistia_responsive_wrapper" style="height:100%;left:0;position:absolute;top:0;width:100%;">
									<span class="wistia_embed wistia_async_ui5k7w7bgi popover=true popoverAnimateThumbnail=true videoFoam=true"
												style="display:inline-block;height:100%;width:100%"></span>
								</div>
							</div>

						</div>
						<div class="col-1-3">
							<h2 class="block-title">
								<xsl:value-of select="//page/qd/screenlabels[@id=640]/@label"/>
								<!--Help Topics-->
							</h2>
							<ul class="helpfaq">
								<xsl:for-each select="//page/qd/categories">
									<xsl:variable name="thiscategory" select="."/>
									<li>
										<xsl:attribute name="onclick">
											$(".faqdiv").hide();
											nthisid = '#<xsl:value-of select="@id"/>'
											$(nthisid).show();
											$('.popup-overlay').addClass('active');
										</xsl:attribute>
										<xsl:value-of select="@name"/>
									</li>
									<div class="popup faqdiv">
										<xsl:attribute name="id">
											<xsl:value-of select="$thiscategory/@id"/>
										</xsl:attribute>
										<input type="button" class="smallbutton faqclosebutton" value="Close">
											<xsl:attribute name="onclick">
												nthisid = '#<xsl:value-of select="@id"/>'
												$(nthisid).hide();
												$('.popup-overlay').removeClass('active');
											</xsl:attribute>
										</input>

										<h1 class="title">
											<xsl:value-of select="@name"/>
										</h1>

										<xsl:for-each select="//page/qd/faqs[@categoryid=$thiscategory/@id]">
											<div class="faqq">
												<xsl:value-of select="@q" disable-output-escaping="yes"/>
											</div>
											<div class="faqa">
												<xsl:value-of select="@a" disable-output-escaping="yes"/>
											</div>
										</xsl:for-each>
									</div>
								</xsl:for-each>
								<li>
									<a class="tx--orange" target="toolbox">
										<xsl:attribute name="href">
											<xsl:value-of select="//page/qd/toolbox/@surl"/>
										</xsl:attribute>
										<xsl:value-of select="//page/qd/toolbox/@title"/>
									</a>
								</li>
							</ul>
							<div class="helpcontactblock">
								<h2 class="block-title">
									<xsl:value-of select="//page/qd/screenlabels[@id=641]/@label"/>
									<!--Contact Us-->
								</h2>
								<div class="helpcontact">
									<xsl:value-of select="//page/qd/contactstr/@sstr" disable-output-escaping="yes"/><br/><br/>
									<a href="mailto:SunQuickDesign@sunhydraulics.com">Sun US</a> --
									<a href="mailto:SunQuickDesign@sunuk.com">Sun UK</a> --
									<a href="mailto:SunQuickDesignGermany@sunhydraulics.com">Sun GmbH</a> --
									<a href="mailto:SunQuickDesignChina@sunhydraulics.com">Sun China</a>

								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
			<div style="clear:both;"/>
		</div>
		<div class="popup-overlay"></div>
		<xsl:if test="//page/qd/categories[@id=0]">
			<script language="javascript">
				<xsl:comment>
					$(".faqdiv").hide();
					nthisid = '#0'
					$(nthisid).show();
					$('.popup-overlay').addClass('active');
				</xsl:comment>
			</script>
		</xsl:if>
		<br/>
		<br/>
	</xsl:template>
</xsl:stylesheet>
