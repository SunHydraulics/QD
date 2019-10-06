<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">


<div style="margin-left:15px;">
	<span><xsl:value-of select="//page/qd/uploaddata/@errortext"/></span>
</div>	
		
	<div style="margin-left:15px;">
		<xsl:if test="//page/qd/uploaddata[@submitstatus='1']">
			<span>
				<xsl:value-of select="//page/qd/pagemessages/@submitmessage"/>
			</span>
			<div style="width:140px">
				<input type="button" value="Submit" class="button bg--blue">
					<xsl:attribute name="onclick">
						$("#txtaction").val("submitit")
						submitit();
					</xsl:attribute>
				</input>					
			</div>
		
		</xsl:if>
	</div>

	</xsl:template>
</xsl:stylesheet>
