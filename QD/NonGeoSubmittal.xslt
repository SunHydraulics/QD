<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<form id="frmmain" method="post">
			<input type="hidden" id="data_txtaction" name="data_txtaction"/>
			<div class="site--wrapper">
				<div class="container" style="padding-top:12px;">
					<a href="#" style="">
						<xsl:attribute name="onclick">
							window.close();
							return false;
						</xsl:attribute>
						Close
					</a>
				</div>
				<div class="container bg--white pad content--wrapper">
					<div class="reporthead">
						<!--<xsl:value-of select="//page/qd/screenlabels[@id=703]/@label"/>-->
						Create a new version using the current schematic and the manifold geometry from a previous submittal.
						<span style="padding-left:4px;">
							<xsl:value-of select="//page/qd/thispartno/@partno"/>
						</span>
					</div>
					<xsl:if test="//page[qd/errormessage or errormessage]">
						<div id="errormessage">
							<xsl:value-of select="//page/qd/errormessage"/>
							<xsl:value-of select="//page/errormessage"/>
						</div>
					</xsl:if>
					<xsl:if test="//page[not(qd/errormessage) and not(errormessage)]">
						<section class="bg--light-grey pad block bottom-space grid lightborder">
							<div class="divuploadstep">
								<span>Step 1: Select the manifold geometry version to use</span>
								<select id="data_versionlist" name="data_versionlist" style="width:40%">
									<xsl:for-each select="//page/qd/versions">
										<option>
											<xsl:if test="@selected">
												<xsl:attribute name="selected">true</xsl:attribute>										
											</xsl:if>
											<xsl:attribute name="value">
												<xsl:value-of select="@id"/>

											</xsl:attribute>
											<xsl:value-of select="@display"/>
										</option>
									</xsl:for-each>
								</select>
							</div>
							<div class="divuploadstep">
								<span>Step 2: Validate the schematic against this geometry</span>
								<input type="button" value="Validate" class="button--blue" style="width:100px;">
									<xsl:attribute name="onclick">
										$("#data_txtaction").val("validate");
										$("#spanwait").show();
										document.forms[0].submit();
									</xsl:attribute>

								</input>
								<div style="margin-left:15px;">
								<span id="spanwait" class="nodisplay">Please wait, this could take several seconds...</span>
								</div>
							</div>
					
						<div id="divstep3" class="divuploadstep display">
							<span>Step 3: Analysis:	 </span>
							<div style="margin-left:15px">
								<span><xsl:value-of select="//page/qd/uploaddata/@errortext"/></span>
							</div>
							<div style="margin-left:15px;">
								<xsl:if test="//page/qd/uploaddata[@submitstatus='1']">
									<span>
										<xsl:value-of select="//page/qd/pagemessages/@submitmessage"/>
										<xsl:if test="//page/qd/nongeoanalysis">
											<div style="font-size:80%;padding:8px;">
												Cartridge analysis: <xsl:value-of select="//page/qd/nongeoanalysis/@stext"/>
											</div>
										</xsl:if>
									</span>
									<div style="width:140px">
										<input type="button" value="Submit" class="button bg--blue">
											<xsl:attribute name="onclick">
												$("#data_txtaction").val("submitit")
												submitit();
											</xsl:attribute>
										</input>					
									</div>
		
								</xsl:if>
							</div>
						</div>
						</section>
					</xsl:if>
				</div>

			</div>
		</form>
	</xsl:template>
</xsl:stylesheet>
