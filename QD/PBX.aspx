<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PBX.aspx.vb" Inherits="QD.PBX" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QD Orders</title>
    <meta http-equiv="X-UA-Compatible" content="IE=100" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link runat="server" rel="icon" href="favicon.ico" type="image/ico"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/qd.css"/>
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
		<link rel="stylesheet" href="/resources/demos/style.css"/>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
		$( function() {
			$( "#datepicker" ).datepicker();
		} );
		</script>
</head>
<body>
    <form id="form1" runat="server">

    <div>
 	  <asp:Xml ID="xslpbx" runat="server" DocumentSource="~/StatData.xml" TransformSource="~/pbxorder.xslt"></asp:Xml>  
   
    </div>
        <table border="0" id="table2">

		<tr>
			<td	class="errortext">
				<div id="divmessage" runat="server"/> 
			</td>
		</tr>
		<tr>
			<td>
				<div id="divpbxlink" runat="server"></div>
			</td>
		</tr>
		<tr>
			<td>	
			<div id="divxml" runat="server" style="display:none;"/>	
	
			</td>
		</tr>
	</table>	
    </form>
</body>
</html>
