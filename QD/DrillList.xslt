<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <script language="javascript">
      <xsl:comment>
        function hideshowmetric(nhide){
        sdivs=document.getElementsByTagName('div');
        sstr="";
        sthisid="";
        for (i=0; i &lt; sdivs.length; i++){
        sthisobj=sdivs(i);
        if(sthisobj.className=="divmetricvalues"){
        if(nhide==0){sthisobj.style.display="inline"}
        if(nhide==1){sthisobj.style.display="none"}
        }
        if(sthisobj.className=="divusvalues"){
        if(nhide==1){sthisobj.style.display="inline"}
        if(nhide==0){sthisobj.style.display="none"}
        }
        }
        }

      </xsl:comment>
    </script>
    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <div class="reporthead">
          <xsl:value-of select="//page/qd/title/@prefix"/>
                <xsl:value-of select="//page/qd/title/@partno"/>
        </div>
        <div class="reportsection">
          <div style="float:left">
              <div class="reportlist">
                Rev:
                <xsl:value-of select="//page/qd/title/@rev"/>,
                <xsl:value-of select="//page/qd/title/@revdate"/>
              </div>
            <div class="reportlist">
                Distributor:
                <xsl:value-of select="//page/qd/title/@distributor"/>
              </div>
            <div class="reportlist">
                Sales Person:
                <xsl:value-of select="//page/qd/title/@salesperson"/>
              </div>

          </div>
          <div style="float:left;padding-left:190px;width:500px;">
            <div class="reportlist">
              <input type="radio" name="optinch" class="autowidth">
                <xsl:if test="//page/qd[ismetric='0']">
                  <xsl:attribute name="checked">true</xsl:attribute>
                </xsl:if>
                <xsl:attribute name="onclick">
                  hideshowmetric(1)
                </xsl:attribute>
                Inch
              </input>
            </div>
            <div class="reportlist">
              <input type="radio" name="optinch" class="autowidth" >
                <xsl:if test="//page/qd[ismetric='1']">
                  <xsl:attribute name="checked">true</xsl:attribute>
                </xsl:if>
                <xsl:attribute name="onclick">
                  hideshowmetric(0)
                </xsl:attribute>
                Metric
              </input>
            </div>
          </div>
        </div>
        <div style="clear:both;"/>
        <table class="reporttable">
          <thead>
          <tr>
            <td>No.</td>
            <td>Feature</td>
            <td>Operation</td>
            <td>Tool/Dia</td>
            <td>Vert</td>
            <td>Horiz</td>
            <td>Depth</td>
            <td>Incl</td>
            <td>Rot</td>
            <td>Remarks</td>
          </tr></thead>
          <xsl:for-each select="//page/qd/drilllist">
            <tr>
              <td >
                <xsl:if test="@isfeature='1'">
                  <xsl:attribute name="class">drilllistcell</xsl:attribute>
                </xsl:if>
                <xsl:if test="@isfeature='0'">
                  <xsl:attribute name="class">drilllistfacecell</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@no"/>

              </td>
              <td>
                <xsl:if test="@isfeature='1'">
                  <xsl:attribute name="class">drilllistcell</xsl:attribute>
                </xsl:if>
                <xsl:if test="@isfeature='0'">
                  <xsl:attribute name="class">drilllistfacecell</xsl:attribute>
                </xsl:if>

                <div class="divusvalues">
                  <xsl:if test="//page/qd[ismetric='1']">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@feature"/>
                </div>
                <div class="divmetricvalues">
                  <xsl:if test="//page/qd[ismetric='0']">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@mfeature"/>
                </div>

              </td>
              <td>
                <xsl:if test="@isfeature='1'">
                  <xsl:attribute name="class">drilllistcell</xsl:attribute>
                </xsl:if>
                <xsl:if test="@isfeature='0'">
                  <xsl:attribute name="class">drilllistfacecell</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@operation"/>

              </td>
              <td>
                <xsl:if test="@isfeature='1'">
                  <xsl:attribute name="class">drilllistcell</xsl:attribute>
                </xsl:if>
                <xsl:if test="@isfeature='0'">
                  <xsl:attribute name="class">drilllistfacecell</xsl:attribute>
                </xsl:if>
                <div class="divusvalues">
                  <xsl:if test="//page/qd[ismetric='0']">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@dia"/>
                </div>
                <div class="divmetricvalues">
                  <xsl:if test="//page/qd[ismetric='1']">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@mdia"/>
                </div>

              </td>
              <td>
                <xsl:if test="@isfeature='1'">
                  <xsl:attribute name="class">drilllistcell</xsl:attribute>
                </xsl:if>
                <xsl:if test="@isfeature='0'">
                  <xsl:attribute name="class">drilllistfacecell</xsl:attribute>
                </xsl:if>
                <div class="divusvalues">
                  <xsl:if test="//page/qd[ismetric='1']">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@vert"/>
                </div>
                <div class="divmetricvalues">
                  <xsl:if test="//page/qd[ismetric='0']">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@mvert"/>
                </div>

              </td>
              <td>
                <xsl:if test="@isfeature='1'">
                  <xsl:attribute name="class">drilllistcell</xsl:attribute>
                </xsl:if>
                <xsl:if test="@isfeature='0'">
                  <xsl:attribute name="class">drilllistfacecell</xsl:attribute>
                </xsl:if>
                <div class="divusvalues">
                  <xsl:if test="//page/qd[ismetric='1']">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@horiz"/>
                </div>
                <div class="divmetricvalues">
                  <xsl:if test="//page/qd[ismetric='0']">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@mhoriz"/>
                </div>

              </td>
              <td>
                <xsl:if test="@isfeature='1'">
                  <xsl:attribute name="class">drilllistcell</xsl:attribute>
                </xsl:if>
                <xsl:if test="@isfeature='0'">
                  <xsl:attribute name="class">drilllistfacecell</xsl:attribute>
                </xsl:if>
                <div class="divusvalues">
                  <xsl:if test="//page/qd[ismetric='1']">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@depth"/>
                </div>
                <div class="divmetricvalues">
                  <xsl:if test="//page/qd[ismetric='0']">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@mdepth"/>
                </div>

              </td>
              <td>
                <xsl:if test="@isfeature='1'">
                  <xsl:attribute name="class">drilllistcell</xsl:attribute>
                </xsl:if>
                <xsl:if test="@isfeature='0'">
                  <xsl:attribute name="class">drilllistfacecell</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@incl"/>

              </td>
              <td>
                <xsl:if test="@isfeature='1'">
                  <xsl:attribute name="class">drilllistcell</xsl:attribute>
                </xsl:if>
                <xsl:if test="@isfeature='0'">
                  <xsl:attribute name="class">drilllistfacecell</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@rot"/>

              </td>
              <td>
                <xsl:if test="@isfeature='1'">
                  <xsl:attribute name="class">drilllistcell</xsl:attribute>
                </xsl:if>
                <xsl:if test="@isfeature='0'">
                  <xsl:attribute name="class">drilllistfacecell</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@remarks"/>

              </td>

            </tr>
          </xsl:for-each>
          <tr>
            <td colspan="10" class="drilllistcell">

            </td>
          </tr>
        </table>
				<br/>
				<!--
				<div>
					<xsl:value-of select="//page/qd/glossary/@stext" disable-output-escaping="yes"/>
				</div>
				-->			
      </div>
    </div>

    <script language="javascript">    
       <xsl:comment>
        nopt=1;
        <xsl:if test="//page/qd[ismetric='0']">
          nopt=0;
        </xsl:if>
         //hideshowmetric(nopt);
      </xsl:comment>
     
    </script>

  </xsl:template>

</xsl:stylesheet>
