Imports System.Data.SqlClient

Public Class Report
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim opage As New DBCon
		Dim soutput, spage, sstr, scmd, squoteid, surl, sthisdate, saction, sarid As String
		sthisdate = DateTime.Now.ToString("dd MMMM yyyy,  hh:mmtt")
		sdate.InnerText = sthisdate
		squoteid = Request.QueryString("quoteid")
		sstr = opage.sQueryStringXML(Request.QueryString, Request.Form)
		soutput = ""
		scmd = ""
		spage = Request.QueryString("page")
		saction = Request.Form("data_action")

		' for validation of non-geometry, allow for extra time
		If spage = "nongeosubmittal" And
				InStr(sstr, "validate") > 0 Then
			sarid = Request.Form("data_versionlist")
			Dim sconnstring As String
			sconnstring = opage.ConnString()
			Using con As New SqlConnection(sconnstring)
				Using cmd As New SqlCommand("up_MDToolsUploadnongeo")
					cmd.Connection = con
					cmd.CommandTimeout = 100
					cmd.CommandType = CommandType.StoredProcedure
					'cmd.Parameters.AddWithValue("@sxml", sthisstr)
					cmd.Parameters.AddWithValue("@nquoteid", squoteid)
					cmd.Parameters.AddWithValue("@narid", sarid)
					con.Open()
					cmd.ExecuteNonQuery()
					con.Close()
				End Using
			End Using
		End If

		Select Case spage
			Case "shortlist"
				scmd = "up_xmlQDReport_" & spage & " '" & sstr & "'"
			Case "weeklyreport"
				scmd = "up_xmlQQ_WeeklyReport '" + sstr + "'"
			Case "drilllist"
				scmd = "up_xmlQQ_DrillList '" + sstr + "'"
			Case "servermonitor"
				scmd = "up_xmlQQ_ServerMonitor '" + sstr + "'"
			Case "sundetail"
				scmd = "up_xmlQD_SunDetail '" + sstr + "'"
			Case "sundetailcosting"
				scmd = "up_xmlQD_SunDetailCosting '" + sstr + "'"
			Case "mlaborcosts"
				scmd = "primedata.dbo.up_MLaborCosts '" + sstr + "'"
			Case "schematicdupe"
				scmd = "up_xmlQDSchematicDupe '" + sstr + "'"
			Case "sdjustification"
				scmd = "primedata..up_xmlSDJustification '" + sstr + "'"
			Case "sunuseractivity"
				scmd = "primedata..up_sunuseractivity '" + sstr + "'"
			Case "intpackreport"
				scmd = "up_xmlQD_IntPackReport '" + sstr + "'"
			Case "qdordersreport"
				scmd = "up_xmlQD_OrdersReport '" + sstr + "'"
			Case "nongeosubmittal"
				scmd = "up_xmlQD_NonGeoSubmittal '" + sstr + "'"
			Case "cfpreport"
				scmd = "up_CFPReport '" + sstr + "'"
			Case "tandc"
				scmd = "up_xmlQQ_TermsConditions "
		End Select

		If scmd > "" And spage <> "sundetail" And spage <> "sundetailcosting" And spage <> "cfpreport" Then
			soutput = opage.GetXML(1, "qd", scmd)
			soutput = "<page>" & soutput & "</page>"
			xslcontent.DocumentContent = soutput
			xslcontent.TransformSource = "~/" & spage & ".xslt"
			xslcontent.Visible = True
		End If
		If spage = "sundetail" Or spage = "sundetailcosting" Then
			soutput = opage.GetXML(1, "qd", scmd)
			soutput = "<page>" & soutput & "</page>"
			soutput = Server.HtmlDecode(soutput)
			divhtmlinsert.InnerHtml = soutput
		End If
		If spage = "cfpreport" Then
			divlogowrapper.InnerHtml = ""
			Header.Title = ""
			soutput = opage.GetXML(1, "qd", scmd)
			soutput = "<page>" & soutput & "</page>"
			soutput = Server.HtmlDecode(soutput)
			soutput = Replace(soutput, "<page><qd>", "")
			soutput = Replace(soutput, "</qd></page>", "")
			Response.Clear()
			Response.ContentType = "text/plain"
			Response.Write(soutput)
			Response.End()
		End If
		If spage = "nongeosubmittal" Then
			If InStr(soutput, "<submitted/>") > "0" Then
				Response.Redirect("processcomplete.html")
			End If

		End If
	End Sub

End Class