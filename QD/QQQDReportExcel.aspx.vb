Public Class QQQDReportExcel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim opage As New DBCon
        Dim soutput, scmd As String

        scmd = "up_qqqdreportexcel"
        soutput = opage.GetXML(1, "qd", scmd)
        If soutput > " " Then
            soutput = Replace(soutput, "<page>", "")
            soutput = Replace(soutput, "<qd>", "")
            soutput = Replace(soutput, "</page>", "")
            soutput = Replace(soutput, "</qd>", "")
        Else
            Response.Write("Design not found")
        End If
        Response.Clear()
        'Response.Buffer = True
        Response.AddHeader(
                    "content-disposition", String.Format("attachment; filename={0}", "QQQDReport.xls"))
        Response.ContentType = "application/vnd.ms-excel"

        ' Response.AddHeader("content-disposition", "attachment;  filename=drilllist.xlsx")

        Response.Write(soutput)

    End Sub

End Class