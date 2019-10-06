<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
<xsl:output method="html" indent="yes"/>
<xsl:template match="/">


	<div class="reporthead">
		MDTools Upload, <xsl:value-of select="//page/qd/partno"/>
	</div>
	<xsl:if test="//page[qd/errormessage or errormessage]">
		<div id="errormessage">
			<xsl:value-of select="//page/qd/errormessage" disable-output-escaping="yes"/>
			
			<xsl:value-of select="//page/errormessage" disable-output-escaping="yes"/>
		</div>
	</xsl:if>
	<xsl:if test="//page[not(qd/errormessage) and not(errormessage)]">
		<div>
			Use this page to upload your MDTools design to QuickDesign
		</div>
	</xsl:if>
	<br/>
	<xsl:if test="//page/qd/featurecomp">
		<section class="bg--light-grey pad block bottom-space grid lightborder ">				
			<table>
				<xsl:for-each select="//page/qd/featurecomp">
					<tr>
						<td>
							<xsl:value-of select="@feature"/>
						</td>
						<td>
							<xsl:value-of select="@stamp"/>
						</td>
						<td>
							<xsl:value-of select="@portno"/>
						</td>
						<td>
							<xsl:value-of select="@connects"/>
						</td>
					</tr>					
				</xsl:for-each>					
			</table>
		</section>
	</xsl:if>



	</xsl:template>
</xsl:stylesheet>
