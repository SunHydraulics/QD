Public Class Register
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Redirect("sitedown.html")
        Response.Buffer = True
        Response.ExpiresAbsolute = Now()
        Response.Expires = 0
        Response.CacheControl = "no-cache"
        Dim omain As New DBCon
        Dim sstr, suseripaddress, nisreset, scmd, soutput As String

        nisreset = Request.Form("resetpwd")
        If nisreset = "" Then nisreset = Request.QueryString("resetpwd")
        suseripaddress = Request.ServerVariables("remote_addr")
        sstr = omain.sQueryStringXML(Request.QueryString, Request.Form)
        omain.CloseDatabase()
        Session("registerloginname") = "QDLiteRegistration"
        Session("registerloginpwd") = "QDLiteRegistration"
        If omain.OpenDatabase() Then
            If nisreset = "1" Then
                omain.ResetQDLitePassword(sstr)
                xslresetpassword.DocumentContent = omain.sXML
                If Request.Form("qdpw1") > " " Then
                    Session.Abandon()
                    Response.Redirect("login.aspx")
                End If
                xslresetpassword.Visible = True
            Else
                scmd = "up_xmlQD_Registration '" + sstr + "'"
                soutput = omain.GetXML(1, "qd", scmd)
                soutput = "<page>" & soutput & "</page>"
                xslcontent.DocumentContent = soutput
                xslcontent.Visible = True
            End If
        Else
            Response.Write("Could not open database.")
        End If
        Session.Abandon()
        If System.Net.Dns.GetHostName() = "McLeanWorks" Then
            nsgtm.InnerHtml = ""
        End If

    End Sub

End Class