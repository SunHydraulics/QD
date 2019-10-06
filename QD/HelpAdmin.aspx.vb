Public Class HelpAdmin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim omain As New DBCon
		Dim sstr, scmd, soutput, spage As String
		spage = Request.QueryString("page")
		sstr = omain.sQueryStringXML(Request.QueryString, Request.Form)
		scmd = "up_xmlQD_HelpAdmin N'" + sstr + "'"
		If omain.OpenDatabase() Then
			Select Case spage
				Case "helpadmin"
					scmd = "up_xmlQD_HelpAdmin N'" + sstr + "'"
				Case "whatsnewadmin"
					scmd = "up_xmlQD_WhatsNewAdmin N'" + sstr + "'"
					xslcontent.TransformSource = "WhatsNewAdmin.xslt"
			End Select
			soutput = omain.GetXML(1, "qd", scmd)
			soutput = "<page>" & soutput & "</page>"
			xslcontent.DocumentContent = soutput
			xslcontent.Visible = True
		Else
			Response.Write("Could not open database.")
		End If

	End Sub

End Class