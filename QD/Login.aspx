<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="QD.Login" %>
<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en" xmlns="http://www.w3.org/1999/xhtml"> <!--<![endif]-->

<head runat="server">
  <!-- Meta snippet -->
  <meta charset="utf-8"/>
  <title>Login</title>
  <meta http-equiv="X-UA-Compatible" content="IE=100" />
  <link rel="shortcut icon" href="favicon.ico"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <!-- Styles -->
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="css/accordion.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  <script type="text/javascript" language="JavaScript" src="scripts/qdpwenc.js"></script>
  <script type="text/javascript" language="JavaScript" src="scripts/jslib.js"></script>
</head>
<body>

<form action="login.aspx" id="frmmain" method="post" runat="server">
   <div>
   <asp:Xml ID="xsllogin" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/Login.xslt"></asp:Xml>

   </div>

 </form>

</body>
</html>
