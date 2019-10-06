<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<div class="site--wrapper">
			<div class="container bg--white pad content--wrapper">
				<section class="bg--light-grey pad block bottom-space grid lightborder">

					<h2 class="block-title">
						Terms and Conditions
						<a name="searchblock"/>
					</h2>
					<div class="mdtoolstext">
						<xsl:for-each select="//page/qd/qdtermsandcond">
							<xsl:value-of select="@displaytext" disable-output-escaping="yes"/>
							<hr/>
						</xsl:for-each>
						
					</div>
				</section>
				</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
