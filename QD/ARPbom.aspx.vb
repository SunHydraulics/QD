Public Class ARPbom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sfilename, spartno, sxml As String
        Dim oxml, oxsl As Object
        sfilename = "arpbom.xml" ' Request.QueryString("filename")
        spartno = ""
        If sfilename > " " Then
            sfilename = Server.MapPath(sfilename)
            Dim f As New IO.FileInfo(sfilename)
            If f.Exists Then

                oxml = Server.CreateObject("Microsoft.XMLDOM")
                oxml.async = False
                oxml.Load(sfilename)
                spartno = oxml.documentElement.getAttribute("Manifold_Name")

                oxsl = Server.CreateObject("Microsoft.XMLDOM")
                oxsl.async = False
                oxsl.load(Server.MapPath("arpbom.xslt"))

                sxml = oxml.transformNode(oxsl)
                divxml.InnerText = sxml
                divpbomlink.InnerText = spartno
                'If sxml > " " Then
                '	If omain.ConnectDB() Then
                '		stext = Session("ocon").getxml(1, "pbomxml", "exec primedata.dbo.up_PBOMCreateFromAR '" + sxml + "'")
                '		serr = Session("ocon").errormessage
                '		If serr > " " Then
                '			divmessage.InnerText = serr
                '		Else
                '			divmessage.InnerText = "The pbom was imported. Return to the project manager and click on the link."
                '		End If
                '	End If
                'End If
            Else
                divmessage.InnerText = "File not found."
            End If
        End If

    End Sub

End Class