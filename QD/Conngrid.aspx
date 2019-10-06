<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Conngrid.aspx.vb" Inherits="QD.Conngrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta http-equiv="X-UA-Compatible" content="IE=100" />
	<link href="css/conngrid.css" rel="stylesheet" type="text/css" />
  			

</head>
<body>
    <form id="form1" runat="server">
    <div>
			
		<img src="images\quickdesign-logo.png" />
			<div id="divheaderline" runat="server"><hr /></div>
    </div>
    <div>
 
    			<asp:Xml ID="xslconngrid" runat="server" DocumentSource="~/Menucode.xml" TransformSource="~/conngrid.xslt" Visible="false"></asp:Xml>  
    			<asp:Xml ID="xslconngridplain" runat="server" DocumentSource="~/Menucode.xml" TransformSource="~/conngridplain.xslt" Visible="false"></asp:Xml>  
  
    </div>
		<asp:Xml ID="xslfooter" runat="server" DocumentSource="~/StatData.xml" TransformSource="~/Footer.xslt"></asp:Xml>

    </form>
</body>
</html>

