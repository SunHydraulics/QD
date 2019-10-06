Public Class XMLDownload
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim sid, scmd, soutput, spartno, sheadervar, ssaveas As String
		Dim opage As New DBCon
		sid = Request.QueryString("id")
		spartno = Request.QueryString("partno")
		ssaveas = "1"
		scmd = "primedata..up_SmartConnectRawData '" + sid + "'"
		If spartno = "" Then
			spartno = "SmartConnect"
		End If
		sheadervar = "attachment;filename=" + spartno + ".xml"
		soutput = opage.GetXML(1, "qd", scmd)
		If InStr(soutput, "<errormessage>") > 0 Then
			ssaveas = "0"
		End If
		soutput = Replace(soutput, "<qd>", "")
		soutput = Replace(soutput, "</qd>", "")

		If soutput = "" Then
			ssaveas = "0"
			soutput = "<system>Unable to download the file. No content found.</system>"
		End If
		Response.ContentType = "text/xml"
		Response.Write(soutput)

		If ssaveas = "1" Then
			Response.AddHeader("Content-Disposition", sheadervar)    '"attachment;filename=yourfile.xml")
		End If

	End Sub

End Class