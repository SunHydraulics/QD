<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<input type="hidden" id="data_action" name="data_action"/>
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
			</div>

			<div class="page-header pad">
				<h1 class="title">
					Whats New Admin
				</h1>
			</div>
		</header>
		<div class="site--wrapper">
			<div class="container bg--white content--wrapper pad noborder">
				<section class="bg--light-grey pad block bottom-space ">
					<div id="whatsnewgrid" class="grid">
						<div class="row">
							<label>Show To</label>
							<select id="data_showto" name="data_showto">
								<xsl:for-each select="//page/qd/showto">
									<option>
										<xsl:attribute name="value">
											<xsl:value-of select="@id"/>
										</xsl:attribute>
										<xsl:if test="@selected">
											<xsl:attribute name="selected">true</xsl:attribute>
										</xsl:if>
										<xsl:value-of select="@name"/>
									</option>
								</xsl:for-each>
							</select>
						</div>
						<div class="row">
							<label>Start Date</label>
							<input  id="data_effectdate" name="data_effectdate" maxlength="20">
								<xsl:attribute name="value">
									<xsl:value-of select="//page/qd/qdwhatsnew/@effectdate"/>
								</xsl:attribute>
							</input>
							<label>End Date</label>
							<input id="data_effectiveto" name="data_effectiveto" maxlength="20">
								<xsl:attribute name="value">
									<xsl:value-of select="//page/qd/qdwhatsnew/@effectiveto"/>
								</xsl:attribute>
							</input>
						</div>
						<div class="row">
							<label>Header</label>
							<textarea id="data_header" name="data_header">
								<xsl:value-of select="//page/qd/qdwhatsnew/@header"/>
							</textarea>
						</div>
						<!--
						<div class="row">
							<label>HTML/Text</label>
							<textarea id="data_english" name="data_english" style="height:150px">
								<xsl:value-of select="//page/qd/qdwhatsnew/@english" disable-output-escaping="yes"/>
							</textarea>
						</div>
						-->
						<div class="pad">
							<a class="button bg--blue" href="#">
								<xsl:attribute name="onclick">
									document.getElementById("data_action").value="savewhatsnew";
									submitit();
								</xsl:attribute>
								Save
							</a>
						</div>
					</div>
				</section>
				<section class="bg--light-grey pad block bottom-space ">
					<div style="width:650px;height:400px;border:1px solid maroon;padding:24px">
					<div class="whatsnewheader">
						<xsl:value-of select="//page/qd/qdwhatsnew/@header" disable-output-escaping="yes"/>
					</div>
					<div class="whatsnewtext" >
						<div style="max-height:200px;overflow:auto;">
							<xsl:for-each select="//page/qd/tandc">
								<xsl:value-of select="@english" disable-output-escaping="yes"/>
								<br/>
								<hr/>
							</xsl:for-each>							
						</div>

					</div>
					</div>
				</section>

			</div>
		</div>
		<div class="popup-overlay"></div>

		<br/>
		<br/>
	</xsl:template>
</xsl:stylesheet>
