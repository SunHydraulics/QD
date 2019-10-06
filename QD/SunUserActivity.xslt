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
          Sun User Activity, Past 12 months
        </div>
        <xsl:if test="//page[qd/errormessage or errormessage]">
          <div id="errormessage">
            <xsl:value-of select="//page/qd/errormessage"/>
            <xsl:value-of select="//page/errormessage"/>
          </div>
        </xsl:if>
        <xsl:if test="//page[not(qd/errormessage) and not(errormessage)]">
            <div class="commenttext">
            Designs with one or more status changes made by the user in the past 12 months.<br/>
						The Detail section shows the <i>most recent</i> status change date, the most recent PBOM update date,
						and the most recent schematic activity.  The detail is sorted by P/N, in reverse order
             
            </div><br/>
          <section class="bg--light-grey pad block bottom-space grid lightborder ">

            <div class="commenttext">
							<table>
								<tr>
									<td>Name</td>
									<td>Designs <font style="font-size:80%">(click on the number to show/hide detail)</font></td>
								</tr>
							 <xsl:for-each select="//page/qd/user">
								 <tr>
									 <td style="width:220px">
										 <xsl:value-of select="@username"/>
									 </td>
									 <td style="cursor:pointer;" title="Click to show/hide detail">
											 <xsl:attribute name="onclick">
												 $(this).children('.sunuserdiv').toggle();
											 </xsl:attribute>
										 <xsl:value-of select="@items"/>

										 <div class="sunuserdiv">
											 <table>
												 <tr>
													 <td>Partno</td>
													 <td>Status</td>
													 <td>Status Date</td>
													 <td>PBOM Update</td>
													 <td>Schematic Activity</td>
												 </tr>

											 <xsl:for-each select="part">
												 <tr>
													 <td>
														 <xsl:value-of select="@partno"/>
													 </td>
													 <td>
														 <xsl:value-of select="@status"/>
													 </td>
													 <td>
														 <xsl:value-of select="@statusdate"/>
													 </td>
													 <td>
														 <xsl:value-of select="@pbomupdate"/>
													 </td>
													 <td>
														 <xsl:value-of select="@schematicopendate"/>
													 </td>
												 </tr>												 
											 </xsl:for-each>
											 </table>
										 </div>
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
