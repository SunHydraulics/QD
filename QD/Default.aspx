<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/QDSite.Master" CodeBehind="Default.aspx.vb" Inherits="QD._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="scripts/jslib.js"></script>
    <!--<script type="text/javascript" src="scripts/jquery-2.1.4.min.js"></script>-->
		 <link rel="stylesheet" href="css/legalese.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <asp:Xml ID="xslhomepage" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/Homepage.xslt"></asp:Xml>
   <asp:Xml ID="xslprojectsearch" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/ProjectSearch.xslt"></asp:Xml>
   <asp:Xml ID="xsldocuments" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/Documents.xslt"></asp:Xml>
   <asp:Xml ID="xslsettings" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/Settings.xslt"></asp:Xml>
   <asp:Xml ID="xsllayout" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/Layout.xslt"></asp:Xml>
   <asp:Xml ID="xslsetup" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/Setup.xslt"></asp:Xml>
   <asp:Xml ID="xslcontent" runat="server" Visible="false" DocumentSource="~/StatData.xml" TransformSource="~/Homepage.xslt"></asp:Xml>
    <span id="aspxmessage" runat="server" style="padding-left:100px;" />
</asp:Content>
