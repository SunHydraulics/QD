<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">

    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <div class="reporthead">
          Server Activity
        </div>
        <div class="commenttext">
          Currently active <span style="padding-left:200px">

            <a class="tx--orange" href="report.aspx?page=servermonitor" onclick="this.enabled='false'">Refresh </a>

          </span>
        </div>

        <table class="reporttable">

          <tr>
            <td rowspan="2">
              QuickDesign

            </td>
            <td class="cellheader" valign="top" align="center">
              <xsl:attribute name="colspan">
                <xsl:value-of select="//page/qd/servercount/@ncount"/>
              </xsl:attribute>
              Autorouter
            </td>
            <td rowspan="2">
              Drawings


            </td>
          </tr>
      
          <tr>
            <xsl:for-each select ="//page/qd/arservers">
              <td >
                <xsl:value-of select="@sharename"/>
              </td>
            </xsl:for-each>
          </tr>

          <tr>
            <td>
              <xsl:for-each select ="//page/qd/items[@statusid='1']">
                <div class="divcontent">
                  <a class="quotelink" target="_blank">
                    <xsl:attribute name="href">
                      default.aspx?page=documents&amp;quoteid=<xsl:value-of select="@qquoteid"/>
                    </xsl:attribute>
                    <xsl:value-of select="@filename"/>
                  </a>

                  <span class="divtime smallgrid">
                    (<xsl:value-of select="@timeelapsed"/>)
                  </span>
                  <span class="divtime smallgrid">
                    (Conn. <xsl:value-of select="@conncount"/>)
                  </span>

                </div>
                <div class="diverror smallgrid">
                  <xsl:value-of select="@errortext"/>
                </div>
              </xsl:for-each>
            </td>
            <xsl:for-each select ="//page/qd/arservers">
              <xsl:variable name="x" select="." />
              <td>
                <xsl:for-each select ="//page/qd/items[@statusid='2' and @arserverid = $x/@id]">
                  <div class="divcontent">
                    <a class="quotelink" target="_blank">
                      <xsl:attribute name="href">
                        default.aspx?page=documents&amp;quoteid=<xsl:value-of select="@qquoteid"/>
                      </xsl:attribute>
                      <xsl:value-of select="@filename"/>
                    </a>

                    <span class="divtime smallgrid">
                      (<xsl:value-of select="@timeelapsed"/>)
                    </span>
                    <span class="divtime smallgrid">
                      (Conn. <xsl:value-of select="@conncount"/>)
                    </span>
                  </div>
                  <div class="diverror">
                    <xsl:value-of select="@errortext"/>
                  </div>
                </xsl:for-each>
              </td>
            </xsl:for-each>
            <td>
              <xsl:for-each select ="//page/qd/items[@statusid='3']">
                <div class="divcontent">
                  <a class="quotelink" target="_blank">
                    <xsl:attribute name="href">
                      default.aspx?page=documents&amp;quoteid=<xsl:value-of select="@qquoteid"/>
                    </xsl:attribute>
                    <xsl:value-of select="@filename"/>
                  </a>

                  <span class="divtime smallgrid">
                    (<xsl:value-of select="@timeelapsed"/>)
                  </span>
                </div>
                <div class="diverror smallgrid">
                  <xsl:value-of select="@errortext"/>
                </div>
              </xsl:for-each>
            </td>
          </tr>

        </table>
        <br/>


        <a class="tx--orange" href="#">
          <xsl:attribute name="onclick">
            loadXMLDoc("servermonitorstats", this);
            //clearTimeout(tovar);
            $('#divservermonitorstats').toggle("slow");

            return false;
          </xsl:attribute>
          Concurrent Usage Stats (past 7 days)
          <img id="imgsmstats" src="images/redarrowdown.gif" style="cursor:pointer" alt="Show">
          </img>
        </a>
        <div id="divservermonitorstats"></div>
        <br/>
        <div class="commenttext">Log (past 7 days)</div>
        <table class="reporttable smallgrid">
          <thead>
          <tr>
            <td rowspan="2" colspan="2">
              Design
            </td>
            <td rowspan="2">
              Requested
            </td>
            <td rowspan="2">
              Status
            </td>
            <td rowspan="2">
              ARServer
            </td>
            <td colspan="3">
              Durations
            </td>
            <td rowspan="2">
              Notes
            </td>
          </tr>
          <tr>

            <td >
              QD
            </td>
            <td >
              AR
            </td>
            <td >
              Drawings
            </td>


          </tr></thead>
          <xsl:for-each select ="//page/qd/dlog">
            <tr>
              <xsl:if test="@status='Failed'">
                <xsl:attribute name="style">background-color: #ff9988;</xsl:attribute>
              </xsl:if>
              <xsl:if test="@status='Pending'">
                <xsl:attribute name="style">background-color: #ffff66;</xsl:attribute>
              </xsl:if>
              <xsl:if test="@status='Cancelled'">
                <xsl:attribute name="style">background-color: #e1e1a1;</xsl:attribute>
              </xsl:if>
              <td style="background-color:white">
                <xsl:if test="@iscurrent='1'">
                  <img src="images/checked.gif" title="Is current version"/>
                </xsl:if>
              </td>
              <td nowrap="true">
                <a target="_blank">
                  <xsl:attribute name="href">
                    default.aspx?page=documents&amp;quoteid=<xsl:value-of select="@qquoteid"/>
                  </xsl:attribute>
                  <xsl:value-of select="@filename"/>
                </a>

              </td>
              <td>
                <xsl:value-of select="@areqdate"/>
              </td>
              <td>
                <xsl:value-of select="@status"/>
              </td>
              <td>
                <xsl:value-of select="//page/qd/arservers[@id = current()/@arserverid]/@sharename"/>
              </td>
              <td>
                <xsl:value-of select="@qdtime"/>
              </td>
              <td>
                <xsl:value-of select="@artime"/>
              </td>
              <td>
                <xsl:value-of select="@ptime"/>
              </td>
              <td>
                <xsl:value-of select="@aerrortext"/>
                <xsl:value-of select="@perrortext"/>
              </td>
            </tr>
          </xsl:for-each>

        </table>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
