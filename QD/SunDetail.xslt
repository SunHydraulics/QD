<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:include href="datepicker.xslt"/>
  <xsl:variable name="hdatepicker">
    <xsl:call-template name="datepicker"/>
  </xsl:variable>

  <xsl:template match="/">
    <input type="hidden" id="thisrowgroup" value="1"/>
    <xsl:if test="//page/qd/errormessage">
      <div id="errormessage" class="notecard">
        <xsl:value-of select="//page/qd/errormessage"/>
      </div>
    </xsl:if>
    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <section class="bg--light-grey pad lightborder">

          <h2 class="block-title">
            Sun Admin Price Data
          </h2>
        </section>
      </div>
      <div class="container bg--white pad content--wrapper">
        <table class="admintable">
          <tr>
            <td colspan="20">B606-290-QD0, Version 1</td>
          </tr>
          <tr>
            <td>Created by</td>
            <td>Fred McLean</td>
          </tr>
          <tr>
            <td>Company</td>
            <td>QD01, QuickDesign Manufacturing, Inc.</td>
          </tr>
          <tr>
            <td>Customer</td>
            <td>A Test Customer</td>
          </tr>
          <tr>
            <td>Status</td>
            <td>Quote</td>
          </tr>
          <tr>
            <td>Complexity</td>
            <td>Typical</td>
          </tr>
        </table>
        <table class="admintable">
          <tr>
            <td>
              <br/>Description
            </td>
            <td>
              <br/>Code
            </td>
            <td>
              <br/>Item
            </td>
            <td>
              <br/>Qty
            </td>
            <td>
              <br/>Conn.
            </td>
            <td>
              Market<br/>Mult.
            </td>
            <td>
              Price<br/>Each
            </td>
            <td>
              Cart.<br/>Series
            </td>
            <td>
              List Cartridge<br/>Asssembly<br/>Price Each
            </td>
          </tr>

          <tr class="gridrow" >
            <td>Cartridge</td>
            <td>
              T-11A
            </td>
            <td>
              CBBCLAN
            </td>
            <td>
              2
            </td>
            <td>
              6
            </td>
            <td>
              0.90
            </td>
            <td>
              $56.90

            </td>
            <td>
              1

            </td>
            <td>
              2.00

            </td>
          </tr>

          <tr class="gridrow" >
            <td>Cartridge</td>
            <td>
              T-3A
            </td>
            <td>
              XCOAXXN
            </td>
            <td>
              1
            </td>
            <td>
              0
            </td>
            <td>
              1.08
            </td>
            <td>
              $18.80

            </td>
            <td>
              2

            </td>
            <td>
              3.00

            </td>
          </tr>

          <tr class="gridrow" >
            <td>SUN STD S-129-6 PORT</td>
            <td>
              SA6
            </td>
            <td>
              SAE 6
            </td>
            <td>
              3
            </td>
            <td>
              3
            </td>
            <td>
              0.36
            </td>
            <td>

            </td>
            <td>

            </td>
            <td>

            </td>
          </tr>

          <tr class="gridrow" >
            <td>Manifold</td>
            <td>

            </td>
            <td>
              6061-T651 Aluminum
            </td>
            <td>

            </td>
            <td>

            </td>
            <td>

            </td>
            <td>

            </td>
            <td>

            </td>
            <td>

            </td>
          </tr>
        </table>
        <br/>
        <table class="admintable">
          <tr>
            <td colspan="4">Discounts / Qty Net Pricing</td>
          </tr>
          <tr>
            <td colspan="1" class="gridcell">
              <b>Type</b>
            </td>
            <td colspan="1" class="gridcell">
              <b>Source</b>
            </td>
            <td colspan="1" class="gridcell">
              <b>Discount</b>
            </td>
          </tr>

          <tr>
            <td>Cartridge discount</td>
            <td>System: (default)</td>
            <td>50%</td>
          </tr>
          <tr>
            <td>Manifold discount table</td>
            <td>System: (default)</td>
            <td>U.S. Distributor</td>
          </tr>
        </table>
        <div>
          <table class="admintable">
            <tr>
              <td colspan="3">
                <b>Sun Production Net</b>
                <i>(ZQBody Fixed or ZQBody List + coating adder * (1 - factor)) + net cartridge + net assembly</i>
              </td>
            </tr>
          </table>
          <table class="admintable">
            <tr>
              <td>Qty</td>
              <td>Factor</td>
              <td>Net Price</td>
            </tr>
            <tr>
              <td>1</td>
              <td>0.0000</td>
              <td>$187.00</td>
            </tr>
            <tr>
              <td>3</td>
              <td>0.1600</td>
              <td>$168.30</td>
            </tr>
            <tr>
              <td>10</td>
              <td>0.3200</td>
              <td>$149.50</td>
            </tr>
            <tr>
              <td>30</td>
              <td>0.4200</td>
              <td>$137.80</td>
            </tr>
            <tr>
              <td>100</td>
              <td>0.4800</td>
              <td>$130.80</td>
            </tr>
          </table>
        </div>
        <br/>
        <table class="admintable">
          <tr>
            <td valign="top">
              <table>
                <tr>
                  <td colspan="20">Net Prices</td>
                </tr>
                <tr>
                  <td>Net Manifold Price</td>
                  <td>$61.00</td>
                </tr>
                <tr>
                  <td>Net Cartridge Price</td>
                  <td>$66.30</td>
                </tr>
                <tr>
                  <td>Net Cartridge Assembly Price</td>
                  <td>$3.50</td>
                </tr>
                <tr>
                  <td>Net Coating Adder</td>
                  <td>$0</td>
                </tr>
                <tr>
                  <td>Net Valvepak Price</td>
                  <td>$130.80</td>
                </tr>
              </table>

            </td>
            <td valign="top">
              <table>
                <tr>
                  <td colspan="20">List Prices</td>
                </tr>
                <tr>
                  <td>List Cartridge Price</td>
                  <td>$132.60</td>
                </tr>
                <tr>
                  <td >List Cartridge Assembly Price</td>
                  <td>$7.00</td>
                </tr>
                <tr>
                  <td>ZBody/-Q Body List Price</td>
                  <td>$117.20</td>
                </tr>
                <tr>
                  <td>
                    <i>Fixed ZBody/-Q List Price</i>
                  </td>
                  <td>$0</td>
                </tr>
                <tr>
                  <td>Coating Adder</td>
                  <td>$0</td>
                </tr>
                <tr>
                  <td>
                    <i>Fixed Coating Price</i>
                  </td>
                  <td>$0</td>
                </tr>
                <tr>
                  <td>List Valvepak Price</td>
                  <td>$256.80</td>
                </tr>

              </table>

            </td>
            <td valign="top">
              <table>
                <tr>
                  <td colspan="20">Costs</td>
                </tr>
                <tr>
                  <td class="gridcell">Connections</td>
                  <td>11</td>
                </tr>
                <tr>
                  <td>Variable Cost</td>
                  <td>18.7</td>
                </tr>
                <tr>
                  <td>Material Cost</td>
                  <td>5.5165</td>
                </tr>
                <tr>
                  <td>Total Cost</td>
                  <td>34.024183</td>
                </tr>
              </table>

            </td>
          </tr>
        </table>

        <table class="admintable">
          <tr>
            <td colspan="20">QQ Factors</td>
          </tr>
          <tr>
            <td>100 Piece Manifold List Conversion Factor</td>
            <td class="gridcell">.52</td>
          </tr>
          <tr>
            <td>3AQ: Max Overall Length</td>
            <td class="gridcell">24</td>
          </tr>
          <tr>
            <td>3AQ: Max Stock Size</td>
            <td class="gridcell">8</td>
          </tr>
          <tr>
            <td>3AQ: NBOM Price Factor</td>
            <td class="gridcell">1.2</td>
          </tr>
          <tr>
            <td>Cost per Connection</td>
            <td class="gridcell">1.7</td>
          </tr>
          <tr>
            <td>FOH Rate</td>
            <td class="gridcell">.32</td>
          </tr>
          <tr>
            <td>Material Cost Factor</td>
            <td class="gridcell">.295</td>
          </tr>
          <tr>
            <td>Max Connections</td>
            <td class="gridcell">100</td>
          </tr>
          <tr>
            <td>Max Manifold Length</td>
            <td class="gridcell">16</td>
          </tr>
          <tr>
            <td>Max Percent of Non-Sun Cavities</td>
            <td class="gridcell">.5</td>
          </tr>
          <tr>
            <td>Min Qty of Sun Cavities/Cartridges</td>
            <td class="gridcell">1</td>
          </tr>
          <tr>
            <td>Percent Increase for Manifold Fixed Price</td>
            <td class="gridcell">3</td>
          </tr>
          <tr>
            <td>Profit Factor</td>
            <td class="gridcell">1.6287</td>
          </tr>
          <tr>
            <td>Prototype Adder</td>
            <td class="gridcell">10</td>
          </tr>
          <tr>
            <td>QD Warning - Number of Cavities</td>
            <td class="gridcell">12</td>
          </tr>
          <tr>
            <td>QD Warning - Number of ISOs</td>
            <td class="gridcell">2</td>
          </tr>
          <tr>
            <td>QDLite: Max Cartridges+Cavities</td>
            <td class="gridcell">15</td>
          </tr>
          <tr>
            <td>QDLite: Max ISO Interfaces</td>
            <td class="gridcell">3</td>
          </tr>
          <tr>
            <td>SE and A</td>
            <td class="gridcell">.085</td>
          </tr>
        </table>
        <div>QD Pricing Message</div>
        <div>The design is not in a status that allows quick design pricing.</div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
