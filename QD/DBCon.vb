Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml
Imports System.IO
Public Class DBCon
	Inherits System.Web.UI.Page
    Public oConn As SqlConnection
    Public oStrm As StreamReader
    Public oCmd As SqlCommand
    Private scmd, scmdTimeOut, sDatabasename, sDataserver, sErrMess, spassword, sText, sUsername, sUserpassword As String
    Private ncmdTimeOut As Integer
    Private isWindowsAuth As Boolean
    Private strstext As String

    Sub New(ByVal value As Boolean)
		isWindowsAuth = value
	End Sub

    Sub New()
		' TODO: Complete member initialization 
	End Sub
    Function ResetQDLitePassword(ByVal parm1 As String) As Boolean
        'sends an email to the user
        Dim srootname As String
        Session("registerloginname") = "QDLiteRegistration"
        Session("registerloginpwd") = "QDLiteRegistration"
        sText = ""
        If OpenDatabase() Then
            srootname = "pwd"
            scmd = "up_QDLitePwdResetRequest '" & parm1 & "'"
            sText = GetXML(1, srootname, scmd)
            If ErrorMessage > " " Then
                sText = "<errormessage>" & ErrorMessage & "</errormessage>"
            End If
        End If
        sText = "<page>" & sText & "</page>"

        Session("loginname") = ""
        Session("loginpwd") = ""
    End Function
    Public Property sXML() As String
        Get
            Return strstext
        End Get
        Set(ByVal value As String)
            strstext = value
        End Set
    End Property
    Public Function ParseXML(ByVal sthisxml As String, ByVal sthisstr As String) As String
        Dim nint As Integer, sthisvalue As String
        sthisvalue = ""
        If Mid(sthisstr, 1, 1) = "<" Then
            nint = InStr(sthisxml, sthisstr)
            If nint > 0 Then
                sthisvalue = Mid(sthisxml, nint + Len(sthisstr), 1000)
                nint = InStr(sthisvalue, "</")
                sthisvalue = Mid(sthisvalue, 1, nint - 1)
            End If
        Else
            nint = InStr(sthisxml, sthisstr + "=" + Chr(32))
            If nint > 0 Then
                sthisvalue = Mid(sthisxml, nint + Len(sthisstr) + 2, 1000)
                nint = InStr(sthisvalue, Chr(32))
                sthisvalue = Mid(sthisvalue, 1, nint - 1)
            End If
        End If
        Return sthisvalue
    End Function
    Public Function CloseDatabase() As Boolean
		Try
			If oConn.State = ConnectionState.Open Then
                oConn.Close()
                ' Session("oconn") = Nothing
            End If
			CloseDatabase = True
		Catch ex As Exception
			sErrMess = ex.Message
			CloseDatabase = False
		End Try
	End Function
	Function GetXMLAnswer(ByVal srequest As String, ByVal parm1 As String) As String
		If Not OpenDatabase() Then
			Return ""
		End If
		Dim srootname As String = "page"
		parm1 = "request:" & srequest & ";" & parm1
        Dim scmd As String = "up_qdxmlRequest '" & parm1 & "'"
        Dim sXML As String = GetXML(1, srootname, scmd)
		If ErrorMessage > " " Then
            sXML = "<errormessage>" & ErrorMessage & "</errormessage>"
        End If

		Return sXML
	End Function
    Public Function GetXML(ByVal nToken As Integer,
            ByVal xmlRoot As String,
            ByVal sCommand As String) As String
        Dim sbXML As New System.Text.StringBuilder()
        Dim lresult As Boolean, sconnstring As String
        sErrMess = ""
        GetXML = ""
        Try
            If Not OpenDatabase() Then
                Exit Function
            End If
            ' check for query type
            If InStr(1, LCase(sCommand), "insert") > 0 Or
                    InStr(1, LCase(sCommand), "update") > 0 Or
                    InStr(1, LCase(sCommand), "delete") > 0 Then
                sErrMess = "That type of query is not allowed."
                Exit Function
            End If
        Catch ex As Exception
            sErrMess = ex.Message
            Exit Function
        End Try

        ' remove spaces in the root
        xmlRoot = Replace(xmlRoot, " ", "")

        Dim sStr, sr, sn As String         ' Dim sStr As New cStringBuffer
        sStr = "<" + xmlRoot + ">"       'sStr.Append("<" + xmlRoot + ">")

        Try
            sconnstring = ConnString()
            If ConfigurationManager.AppSettings("SunUser") = "1" Then
                ' added impersonation section 4/18/2013
                Dim impersonationContext As System.Security.Principal.WindowsImpersonationContext
                Dim currentWindowsIdentity As System.Security.Principal.WindowsIdentity
                currentWindowsIdentity = CType(User.Identity, System.Security.Principal.WindowsIdentity)
                impersonationContext = currentWindowsIdentity.Impersonate()
            End If
            Using oconn As New SqlConnection(sconnstring)
                Session("oconn") = oconn
                oconn.Open()
                Using ocmd As New SqlCommand(sCommand, oconn)
                    ocmd.CommandType = CommandType.Text
                    ' Open the reader in sequential mode.
                    Dim result As IAsyncResult = ocmd.BeginExecuteReader()
                    Using reader As SqlDataReader = ocmd.EndExecuteReader(result)
                        Do While reader.HasRows
                            While reader.Read
                                sr = reader.Item(0)
                                sStr = sStr & sr
                            End While
                            While reader.NextResult()
                                While reader.Read
                                    sn = reader.Item(0)
                                    sStr = sStr & sn
                                End While
                            End While
                        Loop
                    End Using
                End Using
            End Using
            sStr = sStr + "</" + xmlRoot + ">"
            GetXML = sStr
        Catch ex As Exception

            sErrMess = ex.Message
            GetXML = "<qd><errormessage>" +
                deQuote(sErrMess) + "</errormessage></qd>"
        End Try


        Exit Function
        Try
            Dim xDoc As New XmlDocument()
            xDoc.LoadXml(sStr)
            GetXML = sStr           ''.Value
            sStr = ""
            xDoc = Nothing
        Catch ex As Exception
            GetXML = ""
            'Response.Write(sStr)
            sErrMess = ex.Message
        End Try
    End Function

    Public Function GetXML1(ByVal nToken As Integer,
            ByVal xmlRoot As String,
            ByVal sCommand As String) As String
        Dim sbXML As New System.Text.StringBuilder()
        sErrMess = ""
        GetXML1 = ""
        Try
            If Not OpenDatabase() Then
                Exit Function
            End If
            ' check for query type
            If InStr(1, LCase(sCommand), "insert") > 0 Or
                    InStr(1, LCase(sCommand), "update") > 0 Or
                    InStr(1, LCase(sCommand), "delete") > 0 Then
                sErrMess = "That type of query is not allowed."
                Exit Function
            End If
        Catch ex As Exception
            sErrMess = ex.Message
            Exit Function
        End Try

        ' remove spaces in the root
        xmlRoot = Replace(xmlRoot, " ", "")

        Dim sStr, sr, sn As String         ' Dim sStr As New cStringBuffer
        sStr = "<" + xmlRoot + ">"       'sStr.Append("<" + xmlRoot + ">")

        Try
            Using ocmd As New SqlCommand(sCommand, Session("oconn"))
                ocmd.CommandType = CommandType.Text
                ' Open the reader in sequential mode.
                Using reader As SqlDataReader = ocmd.ExecuteReader(CommandBehavior.SequentialAccess)
                    Do While reader.HasRows
                        While reader.Read
                            sr = reader.Item(0)
                            sStr = sStr & sr
                        End While
                        While reader.NextResult()
                            While reader.Read
                                sn = reader.Item(0)
                                sStr = sStr & sn
                            End While
                        End While
                    Loop
                End Using
            End Using
            sStr = sStr + "</" + xmlRoot + ">"

        Catch ex As Exception
            GetXML1 = ""
            sErrMess = ex.Message


        End Try

        Try
            'sStr.Append("</" + xmlRoot + ">")
            Dim xDoc As New XmlDocument()
            xDoc.LoadXml(sStr)
            GetXML1 = sStr           ''.Value
            sStr = ""
            xDoc = Nothing
        Catch ex As Exception
            GetXML1 = ""
            'Response.Write(sStr)
            sErrMess = ex.Message
        End Try
    End Function
    Public Function GetXML3(ByVal nToken As Integer,
            ByVal xmlRoot As String,
            ByVal sCommand As String) As String
        sErrMess = ""
        GetXML3 = ""
        Try
            If Not OpenDatabase() Then
                Exit Function
            End If
            ' check for query type
            If InStr(1, LCase(sCommand), "insert") > 0 Or
                    InStr(1, LCase(sCommand), "update") > 0 Or
                    InStr(1, LCase(sCommand), "delete") > 0 Then
                sErrMess = "That type of query is not allowed."
                Exit Function
            End If
        Catch ex As Exception
            sErrMess = ex.Message
            Exit Function
        End Try

        ' remove spaces in the root
        xmlRoot = Replace(xmlRoot, " ", "")

        Dim sStr, sthisreader As String         ' Dim sStr As New cStringBuffer
        sStr = "<" + xmlRoot + ">"       'sStr.Append("<" + xmlRoot + ">")
        Try
            Using ocmd As New SqlCommand(sCommand, Session("oconn"))
                ocmd.CommandType = CommandType.Text
                Using reader As SqlDataReader = ocmd.ExecuteReader(CommandBehavior.SequentialAccess)
                    Do While reader.HasRows
                        While reader.Read
                            sStr = sStr & reader.Item(0)
                        End While
                        reader.NextResult()
                        While reader.Read
                            sStr = sStr & reader.Item(0)
                        End While
                    Loop
                End Using
            End Using
            sStr = sStr + "</" + xmlRoot + ">"

        Catch ex As Exception
            GetXML3 = ""
            sErrMess = ex.Message


        End Try

        Try
            'sStr.Append("</" + xmlRoot + ">")
            GetXML3 = sStr           ''.Value
            sStr = ""
        Catch ex As Exception
            GetXML3 = ""
            sErrMess = ex.Message
        End Try

    End Function

	Friend Function ConnString() As String
		DataServer = ConfigurationManager.AppSettings("DefaultServer")
		DatabaseName = ConfigurationManager.AppSettings("DefaultDatabase")
		isWindowsAuth = False
		If ConfigurationManager.AppSettings("SunUser") = "1" Then
			isWindowsAuth = True
		End If

		Try
			If isWindowsAuth Then
				ConnString = "Asynchronous Processing=True; Integrated Security=SSPI;" +
								 "Initial Catalog=" + DatabaseName + ";" +
								 "Data Source=" + DataServer

			End If
			If Not isWindowsAuth And Session("registerloginname") <> "QDLiteRegistration" Then
				sUsername = Session("loginname")
				sUserpassword = Session("loginpwd")
				spassword = Session("loginname")
				spassword = LCase(spassword)
				spassword = Replace(spassword, Chr(64), Chr(50) & Chr(51))
				spassword = Replace(spassword, Chr(46), Chr(55))
				ConnString = "Asynchronous Processing=True; Initial Catalog=" + DatabaseName + ";" +
								 "Data Source=" + DataServer + sText + ";" +
								 "User Id=" + sUsername + ";" +
								 "Password=" + spassword
			End If
			If Not isWindowsAuth And Session("registerloginname") = "QDLiteRegistration" Then
				sUsername = Session("registerloginname")
				spassword = Session("registerloginpwd")
				ConnString = "Initial Catalog=" + DatabaseName + ";" +
								 "Data Source=" + DataServer + sText + ";" +
								 "User Id=" + sUsername + ";" +
								 "Password=" + spassword
			End If
		Catch ex As Exception

		End Try
	End Function
	Public Function OpenDatabase() As Boolean
        If ConfigurationManager.AppSettings("SunUser") = "1" _
                Or Session("registerloginname") = "QDLiteRegistration" Then
            OpenDatabase = True
            Exit Function
        End If
        ' this section verifies trust of non-sun user
        If Session("loggedin") = "1" _
                And Session("loginname") > " " _
                And Session("loginpwd") > " " Then
            OpenDatabase = True
            Exit Function
        End If
        If Session("loginname") = "" _
                Or Session("loginpwd") = "" Then
            OpenDatabase = False
            Exit Function
        End If
        Try
            Session("loggedin") = "1"
            sUsername = Session("loginname")
            sUserpassword = Session("loginpwd")
            scmd = "up_QDLiteConfirm '" + sUsername + "', '" + sUserpassword + "'"
            sText = GetXML(1, "logname", scmd)
            If InStr(sText, "1") = 0 Then
                Session.Abandon()
                Session("loggedin") = "0"
                Session("QDLiteLogin") = "-1"
                sErrMess = "Invalid password"
                OpenDatabase = False
                Exit Function
            End If
        Catch ex As Exception
            OpenDatabase = False
            Session("loggedin") = "0"
            sErrMess = ex.Message
            Exit Function
        End Try
        OpenDatabase = True


        'If oConn.State <> ConnectionState.Open _
        '    And oConn.ConnectionString > " " Then
        '    Try
        '        oConn.Open()
        '        Session("oconn") = oConn
        '    Catch ex As Exception
        '        Session("oconn") = Nothing
        '    End Try
        'End If
        'If oConn.State >= ConnectionState.Open Then
        '    OpenDatabase = True
        '    Session("oconn") = oConn
        '    Exit Function
        'End If








        'DataServer = ConfigurationManager.AppSettings("DefaultServer")
        'DatabaseName = ConfigurationManager.AppSettings("DefaultDatabase")
        'isWindowsAuth = False
        'If ConfigurationManager.AppSettings("SunUser") = "1" Then
        '    isWindowsAuth = True
        'End If

        'If DataServer = "" Then
        '    OpenDatabase = False
        '    sErrMess = "You must specify a data server name."
        '    Exit Function
        'End If
        'Try
        '    If isWindowsAuth Then
        '        oConn.ConnectionString = "Asynchronous Processing=True; Integrated Security=SSPI;" +
        '         "Initial Catalog=" + DatabaseName + ";" +
        '         "Data Source=" + DataServer
        '        ' added impersonation section 4/18/2013
        '        Dim impersonationContext As System.Security.Principal.WindowsImpersonationContext
        '        Dim currentWindowsIdentity As System.Security.Principal.WindowsIdentity
        '        currentWindowsIdentity = CType(User.Identity, System.Security.Principal.WindowsIdentity)
        '        impersonationContext = currentWindowsIdentity.Impersonate()
        '        oConn.Open()
        '        Session("oconn") = oConn
        '        Session("loggedin") = "1"
        '        impersonationContext.Undo()
        '        '  end
        '    End If
        '    If Not isWindowsAuth And Session("registerloginname") <> "QDLiteRegistration" Then
        '        sUsername = Session("loginname")
        '        sUserpassword = Session("loginpwd")
        '        spassword = Session("loginname")
        '        spassword = LCase(spassword)
        '        spassword = Replace(spassword, Chr(64), Chr(50) & Chr(51))
        '        spassword = Replace(spassword, Chr(46), Chr(55))
        '        oConn.ConnectionString = "Asynchronous Processing=True; Initial Catalog=" + DatabaseName + ";" +
        '         "Data Source=" + DataServer + sText + ";" +
        '         "User Id=" + sUsername + ";" +
        '         "Password=" + spassword
        '        oConn.Open()
        '        Session("oconn") = oConn

        '        scmd = "up_QDLiteConfirm '" + sUsername + "', '" + sUserpassword + "'"
        '        sText = GetXML(1, "logname", scmd)
        '        Session("loggedin") = "1"
        '        If InStr(sText, "1") = 0 Then
        '            Session.Abandon()
        '            Session("loggedin") = "false"
        '            Session("QDLiteLogin") = "-1"
        '            sErrMess = "Invalid password"
        '            OpenDatabase = False
        '            Exit Function
        '        End If
        '    End If
        '    If Not isWindowsAuth And Session("registerloginname") = "QDLiteRegistration" Then
        '        sUsername = Session("registerloginname")
        '        spassword = Session("registerloginpwd")
        '        oConn.ConnectionString = "Initial Catalog=" + DatabaseName + ";" +
        '         "Data Source=" + DataServer + sText + ";" +
        '         "User Id=" + sUsername + ";" +
        '         "Password=" + spassword
        '        oConn.Open()
        '        Session("oconn") = oConn
        '    End If
        '    OpenDatabase = True
        'Catch ex As Exception
        '    OpenDatabase = False
        '    Session("oconn") = Nothing
        '    sErrMess = ex.Message
        '    Exit Function
        'End Try
    End Function
    Public Function SendXML(ByVal sTableName As String, _
			ByVal nUpdateType As Integer, _
			ByVal sXML As String) As Boolean
		' Update types:
		' 1 = update, 2 = insert, 3 = delete
		SendXML = False
		sErrMess = ""
		If Not OpenDatabase() Then
			Exit Function
		End If
		Try
			sXML = "up_xmlupdate '" + sTableName + "', " + _
				 CStr(nUpdateType) + ", '" + sXML + "'"
            Dim command As New SqlCommand(sXML, Session("oconn"))
            command.ExecuteNonQuery()
			SendXML = True
		Catch ex As Exception
			sErrMess = ex.Message
			SendXML = False
		End Try
	End Function
	Private Function Setup() As Boolean
		sErrMess = ""

		If Not OpenDatabase() Then
			Setup = False
		Else
			Setup = True
		End If

	End Function
	Public Function UserLogin() As Boolean
		Try
			sUsername = LCase(sUsername)
			If sUserpassword = "" Then
				If sUsername = "pddproductnameuser" Then sUserpassword = "slick"
			End If
			If Not OpenDatabase() Then
				UserLogin = False
				Exit Function
			End If
			UserLogin = True
		Catch ex As Exception
			sErrMess = ex.Message
			UserLogin = False
		End Try
	End Function
	Function sQueryStringXML(ByVal opage As System.Collections.Specialized.NameValueCollection, _
		ByVal oformvar As System.Collections.Specialized.NameValueCollection) As String
		Dim sthisstr As String, sthisitem As String
		sthisstr = "<sql"
		Dim i As Integer, nint As Integer
		For i = 0 To opage.Count - 1
            If LCase(Mid(opage.Keys(i), 1, 5)) <> "data_" _
            And Mid(opage.Keys(i), 2) <> "__" Then
                sthisitem = deQuote(opage.Item(i))
                sthisstr = sthisstr & " " & opage.Keys(i) & "=" & Chr(34) & sthisitem & Chr(34)
            End If
        Next
		For i = 0 To oformvar.Count - 1
			sthisitem = deQuote(oformvar.Item(i))
			If oformvar.Keys(i) <> "__VIEWSTATE" _
						 And oformvar.Keys(i) <> "__VIEWSTATEGENERATOR" _
						 And Mid(oformvar.Keys(i), 2) <> "__" Then
				sthisstr = sthisstr & " " &
								 Replace(oformvar.Keys(i), "data_", "") & "=" & Chr(34) &
								 sthisitem & Chr(34)
			End If
		Next

        sthisstr = sthisstr & "/>"

        sQueryStringXML = sthisstr
	End Function
	Function deApos(ByVal sstr As String)
		sstr = Replace(sstr, "'", "''")
		deApos = Replace(sstr, "ó", "o")
	End Function

	Function deQuote(ByVal sstr As String)
		Dim nlen As Integer, ntemp As Integer, ntemp2 As Integer, isok As Boolean
		sstr = Replace(sstr, Chr(34), "&quot;")
		sstr = Replace(sstr, "& ", "&amp; ")
		'end if
		nlen = Len(sstr)
		For ntemp = 1 To nlen
			If Mid(sstr, ntemp, 1) = "&" Then
				isok = False
				For ntemp2 = ntemp To ntemp + 6
					If Mid(sstr, ntemp2, 1) = ";" Then
						isok = True
					End If
				Next
				If Not isok Then
					sstr = Mid(sstr, 1, ntemp - 1) + "&amp;" + Mid(sstr, ntemp + 1, Len(sstr))
					nlen = Len(sstr)
				End If
			End If
		Next

		sstr = Replace(sstr, "<", "&lt;")
		sstr = Replace(sstr, Chr(39), "&apos;")
		sstr = Replace(sstr, ">", "&gt;")
		sstr = Replace(sstr, "&nbsp;", "")

		deQuote = sstr
	End Function

	Public Property DataServer() As String
		Get
			Return sDataserver
		End Get
		Set(ByVal sData As String)
			sDataserver = sData
		End Set
	End Property
	Public Property DatabaseName() As String
		Get
			Return sDatabasename
		End Get
		Set(ByVal sData As String)
			sDatabasename = sData
		End Set
	End Property
	Public Property cmdTimeOut() As String
		Get
			Return scmdTimeOut
		End Get
		Set(ByVal sData As String)
			scmdTimeOut = sData
		End Set
	End Property
	Public Property UserName() As String
		Get
			Return sUsername
		End Get
		Set(ByVal sData As String)
			sUsername = sData
		End Set
	End Property
	Public Property UserPassword() As String
		Get
			Return sUserpassword
		End Get
		Set(ByVal sData As String)
			sUserpassword = sData
		End Set
	End Property
	Public Property ErrorMessage() As String
		Get
			Return sErrMess
		End Get
		Set(ByVal sData As String)
			sErrMess = sData
		End Set
	End Property


	Protected Overrides Sub Finalize()
		CloseDatabase()
	End Sub

End Class
Public Class cStringBuffer
	Private Const STRING_BUFFER_SIZE As Long = 4096
	Private m1BufPos As Long
	Private m1BufSize As Long
	Private msBuf As String

	Public Sub New()
		Clear()
	End Sub

	Protected Overrides Sub Finalize()

		On Error Resume Next
		msBuf = vbNullString
	End Sub
	Public Sub Append(ByVal TheText As Object)
		Try
			Dim BytesToAppend As Long
			Dim TargetSize As Long

			If VarType(TheText) = vbNull Then
				TheText = ""
			End If

			BytesToAppend = Len(TheText)
			TargetSize = m1BufPos + BytesToAppend

			If TargetSize < m1BufSize Then
				Mid$(msBuf, m1BufPos, BytesToAppend) = TheText
				m1BufPos = TargetSize
			Else
				msBuf = msBuf + Space$(STRING_BUFFER_SIZE)
				m1BufSize = m1BufSize + STRING_BUFFER_SIZE
				Append(TheText)
			End If

		Catch ex As Exception

		End Try

	End Sub
	Property Value() As String
		Get
			Return Left$(msBuf, m1BufPos - 1)
		End Get
		Set(ByVal NewValue As String)
			m1BufPos = 1
			Append(NewValue)

		End Set
	End Property


	Public Sub Clear()
		Try
			m1BufSize = m1BufSize + STRING_BUFFER_SIZE
			msBuf = Space$(m1BufSize)
			m1BufPos = 1
		Catch ex As Exception
		End Try

	End Sub
	Private Sub HandleError(ByVal ErrNumber As Long, ByVal sErrDesc As String, _
			ByVal sErrSource As String, ByVal sOccurredin As String)
		'App.LogEvent "Error in  " + sOccurredin + " Number: " + serrnumber + _
		'   vbCr + "Description: " + sErrDesc + vbCr + " Source:" + serrsourcesOccurredin

	End Sub

End Class