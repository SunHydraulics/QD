<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <input type="hidden" id="resetpwd" name="resetpwd" value="1"/>
    <input type="hidden" id="resetexec" name="resetexec" value="0"/>
    <input type="hidden" id="shash" name="shash">
      <xsl:attribute name="value">
        <xsl:value-of select="//page/pwd/shash"/>
      </xsl:attribute>
    </input>
    <input type="hidden" id="sid" name="sid">
      <xsl:attribute name="value">
        <xsl:value-of select="//page/pwd/sid"/>
      </xsl:attribute>
    </input>
    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <div class="grid">
          <div class="col-1-2">
            <h2>
              QuickDesign Reset Password
            </h2>
          </div>
        </div>
        <div class="grayitalic divpaddingbottom">Enter your new password below, then press the Next button.</div>
        
        <div class="row">
          <label>
            New Password
          </label>
          <input type="password" id="qdpw1" name="qdpw1" maxlength="20">
            <xsl:attribute name="onfocus">
              this.select();
            </xsl:attribute>
          </input>
        </div>
        <div class="row">
          <label>
            Confirm Password
          </label>
          <input type="password" id="confirmqdpw" name="confirmqdpw" maxlength="20">
            <xsl:attribute name="onfocus">
              this.select();
            </xsl:attribute>
          </input>
        </div>
        <input type="button" class="button bg--orange smallbutton" id="cmdnext"  name="cmdnext" value="Next">
          <xsl:attribute name="onclick">
            spw1 = document.getElementById("qdpw1").value
            if(checkstrong(spw1)==false)
            {
            alert(checkstrongmsg())
            return false
            }
            if(spw1 == document.getElementById("confirmqdpw").value){
            npw=document.getElementById("qdpw1").value
            }
            else{
            alert("Passwords don't match");
            return false;
            }
            document.getElementById("qdpw1").value = sha1Hash(spw1);
            document.getElementById("resetexec").value = "1";
            document.getElementById("confirmqdpw").value="";
            document.forms[0].submit();
          </xsl:attribute>
        </input>
        

      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>

