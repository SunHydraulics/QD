<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template name="conngrid" match="/">

    <script>
      <xsl:comment>
        ah = new Array(40);
        rh = new Array(40);
        oh = new Array(40);
      </xsl:comment>
    </script>

    <div id="divparent">
      <div class="title">
        Connection Grid <xsl:value-of select="//page/qd/partno/@partno"/>
        <span style="padding-left:30px;font-size:70%;">
          <xsl:value-of select="//page/qd/partno/@datenow"/>
        </span>
      </div>

      <table cellspacing="0" cellpadding="2">
        <tr>
          <td class="cellgridheader" colspan="2" rowspan="2" valign="bottom">Ports</td>
          <td class="cellgridheader" >
            <xsl:attribute name="colspan">
              <xsl:value-of select="//page/qd/netcount/@ncount"/>
            </xsl:attribute>
            <span style="font-size:90%;">Segments</span>
          </td>
          <td class="cellgridheader" colspan="1" rowspan="2" valign="bottom">Sizes</td>
        </tr>
        <tr>
          <xsl:for-each select="//page/qd/letters">
            <td class="cellletter">
              <xsl:attribute name="style">
                background:<xsl:value-of select="@netcolor"/>;
              </xsl:attribute>
              <xsl:value-of select="@letter"/>
            </td>
          </xsl:for-each>
          <!--
						<td style="display:none;">
							Options
							<input type="button" value="A" onclick="document.forms[0].submit();" title="Proportional-resizes image, but only so far"></input>
							<input type="button" value="B" onclick="resizeit(2)" title="Image Full Size"></input>
							<input type="button" value="C" onclick="resizeit(3)" title="Cell Minimum Size - resize image as much as necessary to make letter boxes the same size"></input>
							<span id="spansize"></span>
						</td>
						-->
        </tr>
        <xsl:for-each select="//page/qd/conn">
          <xsl:if test="@isfirstsymbol">
            <tr>
              <td class="cellgridheader" colspan="1">Cartridges</td>
              <td class="cellportno" colspan="1">Port</td>
              <td style="border-top:1px solid #777777;" >
                <xsl:attribute name="colspan">
                  <xsl:value-of select="//page/qd/netcount/@ncount"/>
                </xsl:attribute>
              </td>
              <td class="cellgridheader" colspan="1">Symbols</td>
            </tr>
          </xsl:if>
          <xsl:variable name="x" select="." />
          <tr>
            <xsl:if test="@istop">
              <td class="cellgrid" nowrap="nowrap">
                <xsl:attribute name="rowspan">
                  <xsl:value-of select="@connections"/>
                </xsl:attribute>
                <div>
                  <xsl:value-of select="@stamp1"/>
                  <xsl:if test="@stamp2">
                    <div>
                      <xsl:value-of select="@stamp2"/>
                    </div>
                  </xsl:if>
                </div>
                <xsl:if test="@istop">
                  <div title="cavity" style="font-size:x-small;color:#666666;font-style:italic;
										padding-top:2px;padding-left:18px;padding-bottom:-4px;text-align: right;">
                    <xsl:value-of select="@cavity"/>
                  </div>
                </xsl:if>
                <xsl:if test="@cavitynotnow">
                  <div style="font-size:x-small;color:maroon;float:right;position:absolute;bottom:0;right:0;font-style:italic;">
                    <xsl:if test="@istop">
                      <xsl:value-of select="@cavity"/>
                    </xsl:if>
                  </div>
                </xsl:if>
              </td>
            </xsl:if>
            <td class="cellportno">
              <xsl:if test="current()[@isblack='1']">
                <xsl:attribute name="style">background:black;</xsl:attribute>
              </xsl:if>

              <xsl:if test="@symbol">
                <xsl:value-of select="@portnolabel"/>
              </xsl:if>
            </td>
            <xsl:for-each select="//page/qd/letters">
              <td class="cellletter">
                <xsl:if test="current()[@letter = $x/@connects]">
                  <xsl:attribute name="style">
                    background:<xsl:value-of select="@netcolor"/>;
                  </xsl:attribute>
                  <xsl:value-of select="@letter"/>
                </xsl:if>
              </td>
            </xsl:for-each>
            <xsl:if test="current()[@isport='1' and not(@symbolpath) and @istop]">
              <xsl:if test="@istopqqlabel">
                <td class="cellqqlabel" align="center">
                  <xsl:attribute name="rowspan">
                    <xsl:value-of select="@qqlabelrows"/>
                  </xsl:attribute>
                  <xsl:value-of select="@qqlabel"/>
                </td>
              </xsl:if>
            </xsl:if>
            <xsl:if test="@istopsymbol">
              <td class="cellqqlabel" align="center">
                <xsl:attribute name="rowspan">
                  <xsl:value-of select="@symbolrows"/>
                </xsl:attribute>
                <xsl:if test="current()[@isport='1']">
                  <xsl:value-of select="@qqlabel"/>
                </xsl:if>
                <xsl:if test="current()[@isport='0']">
                  <img alt="image" >
                    <xsl:attribute name="id">
                      sym<xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <xsl:attribute name="src">
                      <xsl:value-of select="@symbolpath"/>
                    </xsl:attribute>
                    <xsl:attribute name="onclick">
                      alert(this.height);
                      alert(ah[<xsl:value-of select="@id"/>]);
                    </xsl:attribute>
                  </img>
                </xsl:if>
              </td>
            </xsl:if>
            <td nowrap="true" >
            </td>
          </tr>
        </xsl:for-each>
      </table>
    </div>

    <xsl:for-each select="/page/quote/conn[@istopsymbol]">
      <script>
        <xsl:comment>
          nidval = "<xsl:value-of select='@id'/>" * 1

          nid = "sym"+"<xsl:value-of select='@id'/>";
          nrows = "<xsl:value-of select='@symbolrows'/>";
          nmaxreduce = "<xsl:value-of select='//page/qd/maxreduce'/>" * 1;
          nobj = document.getElementById(nid);
          nthisheight = nobj.naturalHeight * 1;
          if(isNaN(nthisheight) || nthisheight==0){
          nthisheight = nobj.height * 1;
          }
          ah[nidval] = nthisheight;
          rh[nidval] = nthisheight;
          oh[nidval] = nthisheight;
          nmax = nrows * 19;
          if (nthisheight &gt; nmax){
          rh[nidval] = nmax;
          oh[nidval] = nmax;
          if (nthisheight * nmaxreduce &gt; nmax){
          nmax = nthisheight * nmaxreduce;
          oh[nidval] = nmax;
          }
          nobj.height = nmax;
          nobj.style.height = nmax+"px";
          nobj.style.width = "auto";
          }
        </xsl:comment>
      </script>
    </xsl:for-each>

    <script>
      <xsl:comment>
        function resizeit(nopt) {
        simg = document.getElementsByTagName('img');
        for (i = 0; i &lt; simg.length; i++) {
        sthisobj = simg[i].id + "";
        if (sthisobj.search("sym") != -1 ) {
        sthisid = sthisobj.replace("sym","")
        if(nopt==1){
        nh = oh[sthisid];
        }
        if(nopt==2){
        nh = ah[sthisid];
        }
        if(nopt==3){
        nh = rh[sthisid];
        }
        nh = Math.floor(nh);
        simg[i].height=nh;
        simg[i].style.height = nh+"px";
        }
        }
        ndivheight = document.getElementById("divparent").offsetHeight.toString();
        ndivheight = ndivheight+ "px";
        document.getElementById("spansize").innerText =ndivheight;
        }
      </xsl:comment>
    </script>

  </xsl:template>
</xsl:stylesheet>
