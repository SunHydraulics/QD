<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ARPbom.aspx.vb" Inherits="QD.ARPbom" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
  <title>Quick Quote/PBBOM</title>
	<link href="qq.css" rel="stylesheet" type="text/css" />
	<meta name="viewport" content="width=400" />
</head>
<body>

	<table border="0" cellpadding="4" cellspacing="0" width="100%" id="table2">
		<tr>
			<td class="tableheader">
				PBOM import status
			</td>
		</tr>
		<tr>
			<td	class="errortext">
				<div id="divmessage" runat="server"/> 
			</td>
		</tr>
		<tr>
			<td>
				<div id="divpbomlink" runat="server"></div>
			</td>
		</tr>
		<tr>
			<td><b>Output:</b><br />			
			<div id="divxml" runat="server"/>		
			</td>
		</tr>
	</table>	

</body>
</html>