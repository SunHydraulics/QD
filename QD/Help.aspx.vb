Public Class Help
    Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim omain As New DBCon
		Dim sstr, scmd, soutput As String
		Dim nisuser As Integer
		sstr = omain.sQueryStringXML(Request.QueryString, Request.Form)
		nisuser = 1
		If Session("oconn") Is Nothing Or Request.QueryString("user") = "guest" Then
			Session.Abandon()
			Session("registerloginname") = "QDLiteRegistration"
			Session("registerloginpwd") = "QDLiteRegistration"
			nisuser = 0
		End If
		If omain.OpenDatabase() Then
			scmd = "up_xmlQD_Help N'" + sstr + "'"
			soutput = omain.GetXML(1, "qd", scmd)
			soutput = "<page>" & soutput & "</page>"
			xslcontent.DocumentContent = soutput
			xslcontent.Visible = True
		Else
			Response.Write("Could not open database.")
		End If
		If nisuser = 0 Or Session("registerloginname") = "QDLiteRegistration" Then
			Session.Abandon()
		End If

	End Sub

End Class