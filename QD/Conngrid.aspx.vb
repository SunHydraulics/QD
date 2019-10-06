Public Class Conngrid
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim opage As New DBCon
        Dim spage, squoteid, sstr, showplain, showheader, scmd, sunuser, soutput As String

        sunuser = ConfigurationManager.AppSettings("SunUser")
        If Not opage.OpenDatabase() Then
            If sunuser = "0" Then
                Response.Redirect("Login.aspx")
            End If
        End If

        spage = Request.QueryString("page")
        squoteid = Request.QueryString("quoteid")
        showplain = Request.QueryString("showplain")
        showheader = Request.QueryString("showheader")
        sstr = "quoteid='" & squoteid & "'"
        If showplain = "" Then showplain = "0"

        scmd = "up_xmlQQ_Conngrid '" + squoteid + "'"
        soutput = opage.GetXML(1, "qd", scmd)
        soutput = "<page>" & soutput & "</page>"


        If showplain = "0" Then
            xslconngrid.DocumentContent = soutput
            xslconngrid.Visible = True
        End If
        If showplain = "1" Then
            xslconngridplain.DocumentContent = soutput
            xslconngridplain.Visible = True
        End If

        If showheader = "0" Then
            'xslheader.Visible = False
            xslfooter.Visible = False
            divheaderline.Visible = False
        End If
    End Sub

End Class