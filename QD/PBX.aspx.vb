Imports System.Net
Imports System.IO
Public Class PBX
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim opage As New DBCon
        Dim sarid, sfilename, spartno, sstr, s, squoteid, sparm, stext, serr, sbasicurl As String
        Dim fo
		Page.Server.ScriptTimeout = 300

		squoteid = Request.QueryString("quoteid")

        sparm = opage.sQueryStringXML(Request.QueryString, Request.Form)
        sarid = Request.QueryString("arid")

        sbasicurl = System.Web.HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) +
      HttpContext.Current.Request.Path()
        sbasicurl = LCase(sbasicurl)
        sbasicurl = Replace(sbasicurl, "pbx.aspx", "") + "autorouterfiles/"

        sfilename = Request.QueryString("filename")
        sfilename = sbasicurl + Mid(sfilename, 1, 4) + "/" + sfilename + "/" + sfilename + ".pbx"
        spartno = ""
        sstr = ""
        'divmessage.InnerText = sfilename
        'Return
        sstr = readweb(sfilename)
        divxml.InnerText = sstr
        sstr = Replace(sstr, "'", "''")
		If sstr > " " Or sarid = 34589 Then

			stext = opage.GetXML(1, "qd", "exec primedata.dbo.up_ARPBXUpload " + sarid + ", '" + sstr + "'")
			serr = opage.ErrorMessage
			If serr > " " Then
				divmessage.InnerText = serr
			Else
				divmessage.InnerText = "The version was updated."
			End If
			stext = opage.GetXML(1, "qd", "exec up_xmlQD_PBXOrder '" + sparm + "'")
			stext = "<page>" & stext & "</page>"
			xslpbx.DocumentContent = stext
			divmessage.Visible = False
		Else
			divmessage.InnerHtml = "Unable to process the order at this time (missing pbx). Contact Sun for more information. <a class='abuttonul' href='javascript: history.go(-1)'>Back to Documents page</a> "
        End If

    End Sub
    Public Function readweb(ByVal surl As String) As String
        Try
            Dim stext As String
            Dim request As WebRequest = WebRequest.Create(surl)
            request.Credentials = CredentialCache.DefaultCredentials
            Dim response As HttpWebResponse = CType(request.GetResponse(), HttpWebResponse)
            divmessage.InnerHtml = response.StatusDescription
            Dim dataStream As Stream = response.GetResponseStream()
            Dim reader As New StreamReader(dataStream)
            Dim responseFromServer As String = reader.ReadToEnd()
            stext = responseFromServer
            reader.Close()
            dataStream.Close()
            response.Close()
            Return stext

        Catch Exc As Exception

            Return ""
        End Try


    End Function
End Class