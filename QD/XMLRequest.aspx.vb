Public Class XMLRequest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim opage As New DBCon
        Dim sstr As String, srequest As String, sparm1 As String
        srequest = Request.QueryString("request")
        sparm1 = Request.QueryString("parm1")
        If srequest > " " And sparm1 > " " Then
            sstr = opage.GetXMLAnswer(srequest, sparm1)
            sstr = Replace(sstr, "<page>", "")
            sstr = Replace(sstr, "</page>", "")
            sstr = Replace(sstr, "<answer>", "")
            sstr = Replace(sstr, "</answer>", "")
            Response.Output.Write(sstr)
        End If
    End Sub

End Class