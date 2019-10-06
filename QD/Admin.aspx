<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Admin.aspx.vb" Inherits="QD.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sun QuickDesign Admin</title>
      <meta http-equiv="X-UA-Compatible" content="IE=100" />
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link runat="server" rel="icon" href="favicon.ico" type="image/ico"/>
  <!-- Styles -->
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="css/qd.css"/>
  <link rel="stylesheet" href="css/legalese.css"/>
  
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
     <script type="text/javascript" src="scripts/jslib.js"></script>
</head>
<body>
    <form id="frmmain" method="post" runat="server">

    <div>
           <asp:Xml ID="xslcontent" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/Admin.xslt"></asp:Xml>
    </div>
     <asp:Xml ID="xlsfooter" runat="server" Visible="true" DocumentSource="~/StatData.xml" TransformSource="~/Footer.xslt"></asp:Xml>
    </form>
</body>
</html>
