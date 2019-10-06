<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
    <PBOM>
      <Partno>
        <xsl:value-of select="MANIFOLD/Manifold_Properties/@Part_No"/>
      </Partno>
      <Rev>
        <xsl:value-of select="MANIFOLD/Manifold_Properties/@Revision"/>
      </Rev>
      <Revdate>
        <xsl:value-of select="MANIFOLD/Manifold_Properties/@Release_Date"/>
      </Revdate>
      <Dimensions>
        <Length>
          <xsl:value-of select="MANIFOLD/Manifold_Properties/Dimensions/@Length"/>
        </Length>
        <Width>
          <xsl:value-of select="MANIFOLD/Manifold_Properties/Dimensions/@Width"/>
        </Width>
        <Height>
          <xsl:value-of select="MANIFOLD/Manifold_Properties/Dimensions/@Height"/>
        </Height>
      </Dimensions>
      <Design_Units>
        <Length>
          <xsl:value-of select="MANIFOLD/Manifold_Properties/Design_Units/@Length"/>
        </Length>
      </Design_Units>
      <xsl:for-each select="MANIFOLD/Manifold_Footprints/Footprint">
        <Footprint>
          <Name>
            <xsl:value-of select="@Footprint_Name"/>
          </Name>
          <Stamp>
            <xsl:value-of select="@Component_ID"/>
          </Stamp>
          <Label>
            <xsl:value-of select="@Label"/>
          </Label>
          <Face>
            <xsl:value-of select="@Manifold_Face"/>
          </Face>
          <Rot>
            <xsl:value-of select="@FootPrint_Rotation_Angle"/>
          </Rot>
          <xsl:for-each select="Cavity">
            <Cavity>
              <Name>
                <xsl:value-of select="@Feature_Name"/>
              </Name>
              <Hole_ID>
                <xsl:value-of select="@Hole_ID"/>
              </Hole_ID>
              <LS>
                <xsl:value-of select="@LS_Depth"/>
              </LS>
							<IsConstPort>
								<xsl:value-of select="@Is_Construction_Port"/>
							</IsConstPort>
							<X>
                <xsl:value-of select="Center/@X"/>
              </X>
              <Y>
                <xsl:value-of select="Center/@Y"/>
              </Y>
              <Z>
                <xsl:value-of select="Center/@Z"/>
              </Z>
              <AngleA>
                <xsl:value-of select="Angle/@Alpha"/>
              </AngleA>
              <AngleB>
                <xsl:value-of select="Angle/@Beta"/>
              </AngleB>
              <Code>
                <xsl:value-of select="NBOM_CallOut/Row/@Code"/>
              </Code>
              <xsl:for-each select="Step_Information/Step">
                <xsl:if test="@Index=0">
                  <Step0Dia>
                    <xsl:value-of select="@Diameter"/>
                  </Step0Dia>
                  <Step0Depth>
                    <xsl:value-of select="@Depth"/>
                  </Step0Depth>
                </xsl:if>
                <xsl:if test="@Index=12">
                  <Step12Dia>
                    <xsl:value-of select="@Diameter"/>
                  </Step12Dia>
                  <Step12Depth>
                    <xsl:value-of select="@Depth"/>
                  </Step12Depth>
                </xsl:if>
              </xsl:for-each>

              <xsl:for-each select="Port_Information/Port">
                <Port>
                  <Index>
                    <xsl:value-of select="@Index"/>
                  </Index>
                  <Net>
                    <xsl:value-of select="@Net_Name"/>
                  </Net>
                  <!--
							<Con>
								<xsl:value-of select="@Connectivity"/>
							</Con>
							-->
                </Port>
              </xsl:for-each>

            </Cavity>
          </xsl:for-each>
        </Footprint>
      </xsl:for-each>
    </PBOM>
  </xsl:template>
</xsl:stylesheet>