Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml
Imports System.IO
Public Class Main
	Inherits System.Web.UI.Page
	Dim shost, stext, nnamestart As String
	Function ConnectDB()
		session.Timeout = 900
        'shost = LCase(Request.ServerVariables("HTTP_HOST"))



        If Not (Session("ocon")) Or Session("ispublic") = "true" Then
			Session("ispublic") = "false"
			Session("ocon") = New DBCon			 'server.CreateObject("primedatacom.cpd")
			If (Session("ocon")) Then
				Session("ocon").dataserver = ConfigurationManager.AppSettings("DefaultServer")
				Session("ocon").DatabaseName = ConfigurationManager.AppSettings("DatabaseName")

				Session("ocon").cmdtimeout = ""
				stext = Session("ocon").getxml(1, "yourprofile", "up_xmlyourprofile")
				If InStr(1, LCase(stext), "pddistributor") > 1 Then
					Session("usertype") = "distributor"
				ElseIf InStr(1, LCase(stext), "pdlanguagetechdata") > 1 Then
					Session("usertype") = "languagetechdata"
				ElseIf InStr(1, LCase(stext), "quickquoteuser") > 1 Then
					Session("usertype") = "quickquoteuser"
				Else
					Session("usertype") = "user"
				End If
				nnamestart = InStr(1, stext, "shortname")
				If nnamestart > 0 Then
					Session("username") = Mid(stext, _
					 nnamestart + 11, _
					 InStr(nnamestart + 11, stext, Chr(34)) - nnamestart - 11)
				End If
			Else
				ConnectDB = False
				Exit Function
			End If
		End If
		session("ocon").cmdtimeout = "0"
		ConnectDB = True

	End Function

End Class
