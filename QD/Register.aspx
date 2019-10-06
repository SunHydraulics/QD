<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Register.aspx.vb" Inherits="QD.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Sun QuickDesign Registration</title>
 <meta http-equiv="X-UA-Compatible" content="IE=100" />
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

 <% If System.Net.Dns.GetHostName() <> "McLeanWorks" Then %>
<!-- Google Tag Manager
<script>
    (function (w, d, s, l, i) {
        w[l] = w[l] || []; w[l].push({
            'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-M9M2TR');</script>
End Google Tag Manager -->
<%End if %>

  <link runat="server" rel="icon" href="favicon.ico" type="image/ico"/>
  <!-- Styles -->
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="css/qd.css"/>
	  <link rel="stylesheet" href="css/legalese.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="scripts/register.js"></script>
   <script type="text/javascript" src="scripts/qdpwenc.js"></script>
</head>
<body>
<!-- Google Tag Manager (noscript) 
<noscript id="nsgtm" runat="server">
    <iframe src = "https://www.googletagmanager.com/ns.html?id=GTM-M9M2TR" height="0" width="0" style="display:none;visibility:hidden">
    </iframe>
</noscript>
end Google Tag Manager (noscript) -->
    <form id="form1" runat="server">
   <asp:Xml ID="xslcontent" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/Register.xslt"></asp:Xml>
<asp:Xml ID="xslresetpassword"  visible="false" runat="server" DocumentSource="~/StatData.xml" TransformSource="~/ResetPassword.xslt"></asp:Xml>


    </form>
</body>

</html>
