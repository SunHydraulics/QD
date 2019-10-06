Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim opage As New DBCon
        Dim soutput, spage, sstr, scmd, sagent, squoteid, surl, svars As String
        Dim sreferer As String


        sstr = opage.sQueryStringXML(Request.QueryString, Request.Form)
        sreferer = "blank"
        If Not Request.ServerVariables("HTTP_REFERER") = Nothing Then
            sreferer = Request.ServerVariables("HTTP_REFERER")
        End If

        soutput = ""
        If InStr(sstr, "/>") > 0 Then
            sagent = Request.UserAgent
            If sagent > " " Then
                sstr = Replace(sstr, "/>", "")
                sstr = sstr & " useragent=" & Chr(34) & opage.deQuote(sagent) & Chr(34) & "/>"

            End If
        End If
        spage = Request.QueryString("page")
        svars = Request.QueryString("vars")
        'test for schematic import
        If spage = "layout" Or spage = "documents" Or spage = "summary" Then
            squoteid = Request.QueryString("quoteid")
            If squoteid > " " Then
                scmd = "up_schematicimport '" & squoteid & "'"
                soutput = opage.GetXML(1, "qd", scmd)
                scmd = ""
            End If
        End If

        If spage = "" Then spage = "home"
        If spage = "help" Then
            Response.Redirect("help.aspx")
        End If

        If spage = "home" Then
            scmd = "up_xmlQD_homepage '" & sstr & "'"
            soutput = opage.GetXML(1, "qd", scmd)
            soutput = "<page>" & soutput & "</page>"
            xslhomepage.DocumentContent = soutput
            xslhomepage.Visible = True
        End If
        If spage = "projects" Then
            Page.ClientScript.RegisterClientScriptInclude("basicjs", "scripts\projectsearch.js")
            scmd = "up_xmlQD_projectsearch" & " '" & sstr & "'"
            soutput = opage.GetXML(1, "qd", scmd)
            soutput = "<page>" & soutput & "</page>"
            xslprojectsearch.DocumentContent = soutput
            xslprojectsearch.Visible = True
        End If
        If spage = "config" Then
            Page.ClientScript.RegisterClientScriptInclude("basicjs", "scripts\config.js")
        End If
        Select Case spage
            Case "documents", "layout", "settings", "setup", "summary", "schematic", "config", "tracking"
                scmd = "up_xmlQD_" & spage & " '" & sstr & "'"
                soutput = opage.GetXML(1, "qd", scmd)
                If spage = "summary" _
                            And sreferer.Contains("smartconnect") Then
                    soutput = "<qe/>" & soutput
                End If

                soutput = "<page>" & soutput & "</page>"
                If spage = "schematic" Then
                    surl = opage.ParseXML(soutput, "<surl>")
                    surl = Replace(surl, "&amp;", "&")
                    If surl > " " Then
                        ''Response.Write(surl)
                        Response.Redirect(surl)
                    End If
                End If
                xslcontent.DocumentContent = soutput
                xslcontent.TransformSource = "~/" & spage & ".xslt"
                xslcontent.Visible = True

        End Select

        If spage = "setup" Then
            If InStr(soutput, "newquote") > 0 _
             And InStr(soutput, "success") > 0 Then
                squoteid = opage.ParseXML(soutput, "<quoteid>")
                If squoteid > " " Then
                    sstr = "default.aspx?shownavigate=true&page=setup&quoteid=" + squoteid
                    Response.Redirect(sstr)
                End If
            End If
        End If


        'If spage = "documents" Then
        '    scmd = "up_xmlQD_documents " & " '" & sstr & "'"
        '    soutput = opage.GetXML(1, "qd", scmd)
        '    soutput = "<page>" & soutput & "</page>"
        '    xsldocuments.DocumentContent = soutput
        '    xsldocuments.Visible = True

        'End If
        'If spage = "layout" Then
        '    scmd = "up_xmlQD_layout " & " '" & sstr & "'"
        '    soutput = opage.GetXML(1, "qd", scmd)
        '    soutput = "<page>" & soutput & "</page>"
        '    xsllayout.DocumentContent = soutput
        '    xsllayout.Visible = True
        'End If
        'If spage = "settings" Then
        '    scmd = "up_xmlQD_settings " & " '" & sstr & "'"
        '    soutput = opage.GetXML(1, "qd", scmd)
        '    soutput = "<page>" & soutput & "</page>"
        '    xslsettings.DocumentContent = soutput
        '    xslsettings.Visible = True
        'End If
        If spage = "newproject" Then
            xslsetup.Visible = True
        End If

        opage.CloseDatabase()
    End Sub

End Class