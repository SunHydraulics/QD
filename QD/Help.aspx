<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Help.aspx.vb" Inherits="QD.Help" %>

<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en" xmlns="http://www.w3.org/1999/xhtml"> <!--<![endif]-->

<head runat="server">
    <title>Sun QuickDesign</title>
      <meta http-equiv="X-UA-Compatible" content="IE=100" />
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link runat="server" rel="icon" href="favicon.ico" type="image/ico"/>
  <!-- Styles -->
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="css/qd.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
     <script type="text/javascript" src="scripts/jslib.js"></script>
</head>
<body>
    <form id="frmmain" method="post" runat="server">

    <div>
           <asp:Xml ID="xslcontent" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/Help.xslt"></asp:Xml>
    </div>
     <asp:Xml ID="xlsfooter" runat="server" Visible="true" DocumentSource="~/StatData.xml" TransformSource="~/Footer.xslt"></asp:Xml>
    </form>
</body>
</html>