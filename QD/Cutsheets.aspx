<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Cutsheets.aspx.vb" Inherits="QD.Cutsheets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cut Sheets</title>
  <meta http-equiv="X-UA-Compatible" content="IE=100" />
	<link href="css/cutsheets.css" rel="stylesheet" type="text/css" />
	<meta name="viewport" content="width=400" />
  <script type="text/javascript" src="scripts/qrcode.js"></script>
</head>
<body>
    <form id="form1" runat="server">
  			<asp:Xml ID="xslcutsheets" runat="server" DocumentSource="~/Menucode.xml" TransformSource="~/cutsheets.xslt"></asp:Xml>  
    </form>
</body>
</html>
