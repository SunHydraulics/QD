Public Class Cutsheets
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim opage As New DBCon
		Dim spage, squoteid, slanguageid, scmd, sparm1, soutput As String

		spage = Request.QueryString("page")
		squoteid = Request.QueryString("quoteid")
		slanguageid = Request.QueryString("languageid")
		If slanguageid = "" Then
			slanguageid = "1"
		End If

		sparm1 = "<sql quoteid=""" + squoteid + """, languageid=""" + slanguageid + """/>"
		scmd = "up_xmlQQ_Cutsheets '" + sparm1 + "'"

        'sstr = omain.sQueryStringXML(Request.QueryString, Request.Form)
        soutput = opage.GetXML(1, "qd", scmd)
        soutput = "<page>" & soutput & "</page>"
        xslcutsheets.DocumentContent = soutput


    End Sub

End Class