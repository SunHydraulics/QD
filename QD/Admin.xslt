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
					QuickDesign Admin
				</h1>
			</div>
		</header>
		<div class="site--wrapper">
			<div class="container bg--white content--wrapper pad noborder">
				<xsl:if test="//page/qd/errormessage">
					<div id="errormessage" class="notecard">
						<xsl:value-of select="//page/qd/errormessage"/>
					</div>
				</xsl:if>
				<h2>Agreement Text</h2>
				<div>
					<table class="admineditblocks">
						<tr>
							<td style="width:50%;">
								<xsl:for-each select="//page/qd/attr">
									<input class="userbox" type="radio" style="width:30px;">
										<xsl:attribute name="name">chkso</xsl:attribute>
										<xsl:if test="@selected">
											<xsl:attribute name="checked">true</xsl:attribute>
										</xsl:if>
										<xsl:attribute name="value">
											<xsl:value-of select="@id"/>
										</xsl:attribute>
										<xsl:attribute name="onclick">

											submitit();
										</xsl:attribute>

									</input>
									<labelfor class="labelfor">
										<xsl:value-of select="@name"/>
									</labelfor>

									<br/>
								</xsl:for-each>
							</td>
							<td>
								<b>Now online: <xsl:value-of select="//page/qd/thisuser/@name"/></b><br/>
								<div class="grayitalic left-space"><xsl:value-of select="//page/qd/thisuser/@smessage"/></div>
							</td>
						</tr>
					</table>
				</div>
				<div style="float:clear;"/>
				<xsl:if test="//page/qd/attr/@selected">
				<div>
					<div class="admineditblocks">
						<b>Display</b>
						<div class="grayitalic left-space">
							<xsl:value-of select="//page/qd/attr[@selected]/@notes"/>
						</div>
						<div id="displayblock" class="mdtoolstext">
							<xsl:value-of select="//page/qd/attr[@selected]/@english" disable-output-escaping="yes"/>
						</div>
					</div>
					<div class="admineditblocks">
						<b>Text/HTML</b><br/>
						<a class="underline small left-space" href="#">
							<xsl:attribute name="onclick">
								sval=$("#htmlblock").val();

								$("#displayblock").html(sval);
							</xsl:attribute>  Update Display
						</a>
						<a class="underline small left-space" href="#">
							<xsl:attribute name="onclick">
								document.getElementById("data_action").value="savechanges";
								submitit();
								
							</xsl:attribute>  Save Changes
						</a>
						<div class="grayitalic left-space">
							
							Make changes below, then 
							click on "Update Display"<br/> 
							Use simple HTML tags only.  Many
							aspects of style, such as colors and font size, are controlled by the site.

						</div>
						<textarea id="htmlblock" style="height:500px;margin-left:8px;">
							<xsl:value-of select="//page/qd/attr[@selected]/@english"/>
						</textarea>
					</div>
				</div>
				</xsl:if>
				<div class="popup faqdiv">
					<div>
						<input type="button" class="button bg--darker-grey smallbutton" value="Close">
							<xsl:attribute name="onclick">
								$('.popup').hide();
								$('.popup-overlay').removeClass('active');
							</xsl:attribute>
						</input>
						<input type="button" class="button bg--darker-grey smallbutton" value="Save">
							<xsl:attribute name="onclick">
								var aval=$("#txtid").val();
								aval="alink"+aval;
								submititanchor(aval);
							</xsl:attribute>
						</input>
					</div>
					<hr/>
					<input type="hidden" id="txtid"></input>
					<div id="divhelpedit">

					</div>
				</div>
			</div>
		</div>
		<div class="popup-overlay"></div>

		<br/>
		<br/>
	</xsl:template>
</xsl:stylesheet>
