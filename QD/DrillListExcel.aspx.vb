Public Class DrillListExcel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim opage As New DBCon
        Dim nquote, soutput, scmd As String
        ' Dim noutput, spage, sstr, scmd, sagent, squoteid, surl As String
        nquote = Request.QueryString("quoteid")
        If nquote > "0" Then
            scmd = "primedata.dbo.up_xmlardrilllist 0, " + nquote + ",1"
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
            Response.ContentType = "application/vnd.ms-excel"

            ' Response.AddHeader("content-disposition", "attachment;  filename=drilllist.xlsx")

            Response.Write(soutput)
        End If


    End Sub

End Class