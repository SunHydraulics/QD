Public Class QDSite
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim opage As New DBCon
        Dim soutput, sstr, scmd, spage, sunuser, squoteid, npage As String
        sunuser = ConfigurationManager.AppSettings("SunUser")
        If Not opage.OpenDatabase() Then
            If sunuser = "0" Then
                squoteid = Request.QueryString("quoteid")
                If squoteid > " " Then Session("quoteid") = squoteid

                npage = Request.QueryString("page")
                If npage > " " Then Session("page") = npage
                Response.Redirect("Login.aspx")
            End If
        End If
        If Request.QueryString("logout") = "1" And sunuser = "0" Then
            Session.Abandon()
            Response.Redirect("login.aspx")
        End If

        sstr = opage.sQueryStringXML(Request.QueryString, Request.Form)
        spage = Request.QueryString("page")
        If spage = "" Then spage = "home"
        scmd = "up_xmlQD_Header '" + sstr + "'"
        soutput = opage.GetXML(1, "qd", scmd)
        soutput = "<page>" + soutput + "</page>"
        xslheader.DocumentContent = soutput
    End Sub

End Class