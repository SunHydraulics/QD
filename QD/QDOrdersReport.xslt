<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<div class="container">
			<a href="#" style="">
				<xsl:attribute name="onclick">
					window.close();
					return false;
				</xsl:attribute>
				Close
			</a>
		</div>
		<div class="site--wrapper">
			<div class="container bg--white pad content--wrapper">
				<div class="reporthead">
					QD Orders Report
				</div>
				<xsl:if test="//page[qd/errormessage or errormessage]">
					<div id="errormessage">
						<xsl:value-of select="//page/qd/errormessage"/>
						<xsl:value-of select="//page/errormessage"/>
					</div>
				</xsl:if>
				<xsl:if test="//page[not(qd/errormessage) and not(errormessage)]">

					<br/>
					<section class="bg--light-grey pad block bottom-space grid lightborder ">
						<div class="commenttext">
							<b>Designs ordered in the past 7 days</b>
							<div>
								QD=<xsl:value-of select="//page/qd/totals[@stype='QD']/@order"/>,
								SD=<xsl:value-of select="//page/qd/totals[@stype='SD']/@order"/>
							</div>
						</div>
						<div class="commenttext">
							<table>
								<tr>
									<td>Ordered</td>
									<td>
										Project
									</td>
									<td>
										Requested Ship
									</td>
									<td>
										PO
									</td>
									<td>
										Designer
									</td>
								</tr>
								<xsl:for-each select="//page/qd/report[@orderthisweek='1']">
									<tr>
										<td>
											<xsl:value-of select="@orderdate"/>
										</td>
										<td>
											<xsl:value-of select="@partno"/>
										</td>
										<td>
											<xsl:value-of select="@reqshipdate"/>
										</td>
										<td>
											<xsl:value-of select="@ponumber"/>
										</td>
										<td>
											<xsl:value-of select="@designer"/>
										</td>

									</tr>

								</xsl:for-each>
							</table>

						</div>

					</section>
					<section class="bg--light-grey pad block bottom-space grid lightborder ">
						<div class="commenttext">
							<b>Designs due to ship in the next 7 days (or are past due)</b>
							<div>
								QD=<xsl:value-of select="//page/qd/totals[@stype='QD']/@ship"/>,
								SD=<xsl:value-of select="//page/qd/totals[@stype='SD']/@ship"/>
							</div>
						</div>
						<div class="commenttext">
							<table>
								<tr>
									<td>Ordered</td>
									<td>
										Project
									</td>
									<td>
										Requested Ship
									</td>
									<td>
										PO
									</td>
									<td>
										Designer
									</td>
								</tr>
								<xsl:for-each select="//page/qd/report[@shipthisweek='1']">
									<tr>
										<td>
											<xsl:value-of select="@orderdate"/>
										</td>
										
										<td>
											<xsl:value-of select="@partno"/>
										</td>
										<td>
											<xsl:value-of select="@reqshipdate"/>
										</td>
										<td>
											<xsl:value-of select="@ponumber"/>
										</td>
										<td>
											<xsl:value-of select="@designer"/>
										</td>

									</tr>

								</xsl:for-each>
							</table>

						</div>

					</section>

				</xsl:if>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
