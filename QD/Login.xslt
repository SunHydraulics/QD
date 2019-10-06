<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <script language="javascript">
      <xsl:comment>

      </xsl:comment>
    </script>

    <header class="site--header container">
      <div class="logo-wrapper">
        <a href="/">
          <img src="images/QuickDesign-Logo.svg" alt="" class="logo" onerror="this.src=images/QuickDesign-Logo.png;this.onerror=null;"/>
        </a>

        <div class="right tx--right">
          <div class="languages">
            <a class="flag" href="#">
              <img src="images/us.png" alt=""/>
            </a>
            <a class="flag" href="#">
              <img src="images/en.png" alt=""/>
            </a>
            <a class="flag" href="#">
              <img src="images/fr.png" alt=""/>
            </a>
            <a class="flag" href="#">
              <img src="images/de.png" alt=""/>
            </a>
            <a class="flag" href="#">
              <img src="images/zh-hans.png" alt=""/>
            </a>
          </div>
          <a href="#" class="button bg--blue">Start a new project</a>
        </div>
      </div>

      <nav class="site--nav">
        <div class="links">
          <a href="#">Homepage</a>
          <a href="#">Projects</a>
          <a href="#">Settings</a>
        </div>

        <a href="#" class="button bg--darker-grey small user-status">
          Sign Out <span class="user">
          </span>
        </a>
      </nav>
      <div class="page-header pad">
        <h1 class="title">Homepage</h1>
      </div>
    </header>
    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">


        <section class="bg--light-grey pad block bottom-space grid">
          <h2 class="block-title">Manage your account</h2>
          <div class="right grid align-to-title">
            <a href="#" class="button bg--orange right bottom-space-half" >Change Settings</a>
            <a href="#" class="button bg--orange right" style="clear:both;">Change Preferences</a>
          </div>
          <a href="#" class="tx--orange bottom-space-half">QuickDesign Log</a>
          <br/>
            <a href="#" class="tx--orange">Statistics</a>
          </section>

        <section class="bg--light-grey pad block bottom-space">
          <h2 class="block-title">Search existing projects</h2>

        </section>

      </div>
      <!-- .container -->

      <footer class="site--footer container pad">
        Copyright © 2009-2015 - All rights reserved
        <div>
          <a href="#">Sun Hydraulics Corporation</a> - <a href="#">Terms and Conditions</a>
        </div>
      </footer>

    </div>
    <!-- page-wrapper -->

    <div class="popup small">
      <div class="header pad">
        <img src="images/QuickDesign-Logo.svg" alt="" class="logo" onerror="this.src=images/QuickDesign-Logo.png;this.onerror=null;"/>
      </div>
      <div class="content pad grid content--wrapper">

          <h3 for="#">Change Your Password</h3>
          <div class="row">
            <label>Email Address</label>
            <input type="text"/>
              <small class="description">We will send an email to your account with a link to reset your password. Follow the directions in the email to create a new password.</small>
            </div>
          <input type="button" class="button bg--orange right"/>

      </div>
    </div>

    <div class="popup small active">
      <div class="header pad">
        <img src="images/QuickDesign-Logo.svg" alt="" class="logo" onerror="this.src=images/QuickDesign-Logo.png;this.onerror=null;"/>
      </div>
      <div class="content pad grid content--wrapper">

        <h3 for="#">User Login</h3>
        <div class="row">
          <label>Email Address</label>
          <input name="txtusername" id="txtusername"
             maxlength="50" runat="server">
            <xsl:attribute name="value">
              <xsl:value-of select="//page/username"/>
            </xsl:attribute>
            
          </input>
        </div>

          <div class="row">
            <label>Password</label>
            <input type="password" name="txtpassword" id="txtpassword"
                  maxlength="50" textmode="password" runat="server">
              <xsl:attribute name="onfocus">
                this.select();
              </xsl:attribute>
              <xsl:attribute name="onkeydown">
                if(event.keyCode==13){
                if(this.value==""){return false;}
                uli();
                }
              </xsl:attribute>
              <xsl:attribute name="value">
                <xsl:value-of select="//page/passwordOLD"/>
              </xsl:attribute>
            </input>
            <input type="hidden" id="txtpwdhidden"/>
          </div>
        <div class="row">
          <input id="chkrememberme" type="checkbox" class="userbox">
            <span class="rememberme">Remember me on this computer</span></input>
          
        </div>        
          <a class="button bg--orange right">
            <xsl:attribute name="onclick">
              uli();
            </xsl:attribute>Sign On
          </a>


        <xsl:if test="//page/errmess">
          <div class="row">
            <xsl:value-of select="//page/errmess" disable-output-escaping="yes"/>
          </div>
        </xsl:if>
        <input type="hidden" name="username" value=""/>
        <input type="hidden" name="pwd" value=""/>
        <br/>
        <br/>


        <div class="notification alert pad-half" id="screenmessage" style="display:none"/>


        <hr/>

        <div class="description" style="font-size:12px;">
          <div>
         Click
          <a class="tx--orange" href="#"><xsl:attribute name="onclick">
              forgotpassword();</xsl:attribute>here</a>to request a new password. </div>
          <div>
            Click <a class="tx--orange" href="#">
            <xsl:attribute name="onclick">
              document.getElementById("divpwtrouble").style.display="block";
            </xsl:attribute>here</a>if you are having trouble logging in. </div>
            
            Remember that new users need to <a class="tx--orange" href="register.aspx">register</a>to use QuickDesign
        </div>
        <div id="divpwtrouble">
          <h3 class="header pad">Trouble logging in?</h3>
          <div class="loginoptions">                     
          If you recently changed your password and are having trouble logging in, try these steps:
          <ul>
            <li>On the QuickDesign login page, verify that your email address is correct. Uncheck the 
            "Remember me" checkbox.  Manually type your password into the box.
            Then try to sign on.</li>
            <li>If you still can’t log in, try deleting the browser’s password cache (your browser might be "remembering"
              your previous password). Then repeat the step above.
            </li>
            <li>If you still have problems, try closing your browser window. Then open the browser and try again.</li>
            <li>If none of the above works, and you are sure you are using the correct password, contact sunquickdesign@sunhydraulics.com.  Remember 
            that you can change your password whenever you wish.</li>
          </ul>
  
            <div style="text-align:center;">
              <br/>
              <a class="button bg--orange">
                <xsl:attribute name="onclick">
                  document.getElementById("divpwtrouble").style.display="none";
                  return false;
                </xsl:attribute>OK
              </a>
            </div>

          </div>
        </div>

      </div>
    </div>


    <div class="popup-overlay active"></div>

      <script language="javascript">
        <xsl:comment>
          if(document.getElementById("txtusername").value==""){
            var cusername=getcookie("cusername");
            var cpwd=getcookie("cpwd")
            if(cusername != ""){document.getElementById("txtusername").value=cusername}
            if(cpwd != ""){document.getElementById("txtpassword").value=cpwd}
            document.getElementById("chkrememberme").checked=true;
            document.getElementById("txtusername").focus();
          }
        </xsl:comment>
      </script>
   
  </xsl:template>
</xsl:stylesheet>
