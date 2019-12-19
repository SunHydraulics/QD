Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Redirect("sitedown.html")

        Dim squoteid, npage, nshowlog, sstr, sxml, serrmess As String
        Dim ismobile, nresult As Boolean
        Dim odbcon As New DBCon
        If ConfigurationManager.AppSettings("SunUser") = "1" Then
            Response.Redirect("default.aspx")
        End If
        ismobile = Request.Browser.IsMobileDevice
        'ismobile = sbrowser.IsMobileDevice()
        squoteid = Request.QueryString("quoteid")
        If squoteid > " " Then Session("quoteid") = squoteid
        If squoteid = "" Then squoteid = Session("quoteid")

        npage = Request.QueryString("page")
        If npage > " " Then Session("page") = npage
        If npage = "" Then npage = Session("page")
        If npage = "" Then Session("page") = "documents"

        nshowlog = Request.QueryString("showlog")
        If nshowlog = "1" Then Session("nshowlog") = "1"
        serrmess = ""
        sstr = "default.aspx"
        'If Session("nshowlog") = "1" Then sstr = "manage.aspx"

        If Session("quoteid") > "0" Then
            sstr = "default.aspx?page=" + Session("page") + "&quoteid=" + Session("quoteid")
        End If

        xsllogin.Visible = True

        'If Session("squoteid") > " " Or sqdkey > " " Then sstr = sstr + "?qdkey=" + sqdkey + "&quoteid=" + Session("squoteid") + "&phaseid=" + Session("sphaseid")
        'sremoteaddr = UCase(Request.ServerVariables("REMOTE_ADDR"))

        If Request.QueryString("resetpwd") = "1" And Request.QueryString("email") > " " Then
            sstr = odbcon.sQueryStringXML(Request.QueryString, Request.Form)

            odbcon.ResetQDLitePassword(sstr)

            Return
        End If

        If Session("loginname") = "QDLiteRegistration" Then
            Session.Abandon()
        End If

        nresult = odbcon.OpenDatabase()
        If Session("loginname") > " " Then
            If nresult Then
                Response.Redirect(sstr)
            Else
                serrmess = "Invalid user name or password."
            End If
        End If

        Session("loginname") = Request.Form("txtusername")
        Session("loginpwd") = Request.Form("txtpassword")

        If Session("loginpwd") > " " Then
            nresult = odbcon.OpenDatabase()
            If nresult Then
                Response.Redirect(sstr)
            End If
        End If

        If Session("QDLiteLogin") = "-1" And nresult = False Then
            'serrmess = "The password you entered is incorrect. You can use the link below to reset your password. If you continue to have trouble logging into your account, please email sunquickdesign@sunhydraulics.com."
            serrmess = "The password you entered is incorrect. " +
                "If you have forgotten your password, use the link below to reset it. " +
                "If you have not used QuickDesign in a while, contact sunquickdesign@sunhydraulics.com " +
                "and request that your account be activated.  " +
               "If you continue to have trouble logging into your account, " +
                "please email sunquickdesign@sunhydraulics.com."
            'serrmess = "That's not the correct password. "
            'serrmess += "If you've forgotten your password, see below for options. Sun Distributors: Please contact Sun if you have not requested to be upgraded to this version of QuickDesign."
        End If
        'Response.Cookies("username").Value = Session("loginname")
        'Response.Cookies("username").Value = DateTime.Now.AddDays(1)
        'Response.Write(Response.Cookies("username").Value)

        sxml = "<page>" +
     "<username>" + Session("loginname") + "</username>" +
     "<password>" + Session("loginpwd") + "</password>"

        If serrmess > " " Then
            sxml = sxml + "<errmess>" + serrmess + "</errmess>"
        End If
        sxml = sxml + "<ismobile>"
        If ismobile Then
            sxml = sxml + "true"
        Else
            sxml = sxml + "false"
        End If
        sxml = sxml + "</ismobile>"
        sxml = sxml + "</page>"
        xsllogin.DocumentContent = sxml


    End Sub

End Class