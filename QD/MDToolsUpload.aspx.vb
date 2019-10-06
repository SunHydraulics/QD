Imports System.Data.SqlClient
Imports System.Text
Imports System.IO
Public Class MDToolsUpload
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		GetAnalysisXML("load")

	End Sub
	Sub GetAnalysisXML(ByVal stype As String)
		Dim opage As New DBCon
		Dim soutput, sstr, scmd, squoteid, sthisdate As String, sthisxml As String


		sthisdate = DateTime.Now.ToString("dd MMMM yyyy,  hh:mmtt")


		sdate.InnerText = sthisdate
		squoteid = Request.QueryString("quoteid")
		quoteid.Value = squoteid
		sstr = opage.sQueryStringXML(Request.QueryString, Request.Form)
		soutput = ""
		'divupload.Visible = False
		scmd = "up_MDToolsAnalysis '" + sstr + "'"

		soutput = opage.GetXML(1, "qd", scmd)

		If InStr(soutput, "<submitted/>") > "0" Then
			Response.Redirect("processcomplete.html")
		End If
		If InStr(soutput, "<mayupload/>") > "0" Then
			divupload.Visible = True
		End If
		soutput = "<page>" & soutput & "</page>"

		xslcontent.DocumentContent = soutput
		xslcontent.TransformSource = "MDToolsUpload.xslt"
		xslcontent.Visible = True
		xslresults.DocumentContent = soutput
		xslresults.TransformSource = "MDToolsResult.xslt"
		xslresults.Visible = True
	End Sub
	Sub UploadButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
		'Dim savePath As String = "c:\sun\"

		UploadStatusLabel.Text = ""
		divstep3.Visible = False
		LengthLabel.Text = ""
		If (FileUpload1.HasFile) Then
			'savePath += FileUpload1.FileName
			'FileUpload1.SaveAs(savePath)

			DisplayFileContents(FileUpload1.PostedFile)
		Else
			UploadStatusLabel.Text = "You did not specify a file to upload."
		End If

	End Sub
	Sub DisplayFileContents(ByVal file As HttpPostedFile)
		Dim opage As New DBCon
		Dim soutput, sstr, scmd, filename As String
		Dim myStream As System.IO.Stream
		Dim fileLen As Integer
		Dim displayString As New StringBuilder()
		Dim loop1 As Integer
		Dim sthisstr As String, scode As String, sstart As Integer

		' Get the length of the file.
		fileLen = FileUpload1.PostedFile.ContentLength
		filename = FileUpload1.FileName
		' Display the length of the file in a label.
		LengthLabel.Text = filename '"File size: " + fileLen.ToString + " bytes."

		' Create a byte array to hold the contents of the file.
		Dim Input(fileLen) As Byte

		' Initialize the stream to read the uploaded file.
		myStream = FileUpload1.FileContent

		' Read the file into the byte array.
		myStream.Read(Input, 0, fileLen)

		' Copy the byte array to a string.
		For loop1 = 0 To 10 ''fileLen - 1
			displayString.Append(Input(loop1).ToString())
		Next loop1
		scode = displayString.ToString.Substring(0, 4)
		sstart = 0
		' check for binary code
		If scode = "2391" Then
			sstart = 1
		End If
		sthisstr = System.Text.Encoding.UTF8.GetString(Input)
		'sthisstr = ReadFromBuffer(myStream)

		'sthisstr = System.Text.Encoding.UTF8.GetString(Input)
		'sthisstr = String(Input, "US-ASCII")
		'sthisstr = Server.HtmlEncode(sthisstr)
		If Not (sthisstr.Contains("Port_Information")) Then
			UploadStatusLabel.Text = "This doesn't appear to be a valid MDTools file--port information is missing."
			sthisstr = ""
		End If

		If sthisstr > " " Then
			Try
				Dim xDoc As New System.Xml.XmlDocument()
				xDoc.LoadXml(sthisstr.Substring(sstart))
				xDoc = Nothing

				UploadStatusLabel.Text = "Valid XML. Appears to be valid MDTools file."
				divstep3.Visible = True

				Dim sconnstring As String, sthisquote As String
				sconnstring = opage.ConnString()
				'sconnstring = sconnstring + ";connection timeout=60"
				sthisquote = quoteid.Value
				Using con As New SqlConnection(sconnstring)
					Using cmd As New SqlCommand("up_MDToolsUpload")
						cmd.Connection = con
						cmd.CommandTimeout = 300
						cmd.CommandType = CommandType.StoredProcedure
						'cmd.Parameters.AddWithValue("@sxml", sthisstr)
						cmd.Parameters.Add("@sxml", SqlDbType.NVarChar).Value = sthisstr
						cmd.Parameters.AddWithValue("@nquoteid", sthisquote)
						cmd.Parameters.AddWithValue("@saddon", "")
						con.Open()
						cmd.ExecuteNonQuery()
						con.Close()
					End Using
				End Using
				GetAnalysisXML("load")
			Catch ex As Exception
				'mdtoolsxml.Text = sthisstr
				'sthisstr = ""
				UploadStatusLabel.Text = "Problem: " + ex.Message
			End Try
			'mdtoolsxml.Text = sthisstr
		End If
	End Sub

End Class