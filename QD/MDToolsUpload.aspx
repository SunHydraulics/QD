<%@ Page Title="" Language="vb" ValidateRequest="false" AutoEventWireup="false" CodeBehind="MDToolsUpload.aspx.vb" Inherits="QD.MDToolsUpload" %>
<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en" xmlns="http://www.w3.org/1999/xhtml"> <!--<![endif]-->


<head runat="server">
    <title>MDTools</title>
      <meta http-equiv="X-UA-Compatible" content="IE=100" />
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
	

  <link runat="server" rel="icon" href="favicon.ico" type="image/ico"/>
  <!-- Styles -->
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="css/qd.css"/>
  <link rel="stylesheet" href="css/reports.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="scripts/jslib.js"></script>

</head>
<body>
	<header class="site--header container">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1 " />
		<div class="logo-wrapper">
			<img src="images/QuickDesign-Logo.svg" alt="" class="logo" 
				onerror="this.src=images/QuickDesign-Logo.png;this.onerror=null;"/>
				<span class="reportdate" id="sdate" runat="server" />
		</div>
	</header>
	<form id="frmmain" method="post" runat="server">
		<input type="hidden" id="quoteid" runat="server" />
		<input type="hidden" id="parthistid" runat="server" />
		<input type="hidden" id="txtaction" runat="server" />


		<div class="site--wrapper">

			<div class="container bg--white pad content--wrapper">
				<div class="container">
					<a href="#" style="" onclick="window.close();return false;">
						Close
					</a>
				</div>
				<section class="bg--light-grey pad block bottom-space grid lightborder ">
					<div>
						<asp:Xml ID="xslcontent" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource=""></asp:Xml>
					</div>
					<div id="divupload" runat="server" visible="false">
						<div class="divuploadstep"><span>Step 1: </span>
							Select a file to upload:
							<asp:FileUpload id="FileUpload1" runat="server" CssClass="fileuploadbutton" accept=".xml,.mbxml"></asp:FileUpload>
							
							<script type="text/javascript">
								$(document).ready(function(){
									$("#FileUpload1").on('click', function () {
										$("#UploadStatusLabel").html("");
										$("#LengthLabel").html("");
										$("#divstep2").hide();
										$("#divstep3").hide();
									});
									$("#FileUpload1").on('change', function () {
										$("#divstep2").show();
										//$("#divstep3").show();
									});

								});

								</script>
							
						</div>

						<div id="divstep2" class="divuploadstep" runat="server">
							<span>Step 2: </span>Validate the design:
							<asp:Button id="MDToolsUploadButton" Text="Go" OnClick="UploadButton_Click"
								onclientclick="$('#UploadStatusLabel').html('Please wait...')"
								runat="server" ></asp:Button>
							<div style="margin-left:15px;">
								<asp:Label id="LengthLabel" runat="server"> </asp:Label><br />
								<asp:Label id="UploadStatusLabel" runat="server"> </asp:Label>
								<asp:Label id="ContentsLabel" runat="server"> </asp:Label>
								<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
							</div>
						</div>

						<!--
						<asp:TextBox runat="server" ID="mdtoolsxml"></asp:TextBox>
					-->
					<div id="divstep3" runat="server" visible="false" class="divuploadstep"><span>Step 3: </span> Analysis:
						<asp:Xml ID="xslresults" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource=""></asp:Xml>
					</div>
					</div>
				</section>
			</div>
		</div>
	</form>
</body>
</html>