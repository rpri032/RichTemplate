﻿Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class StaffDAL

#Region "Staff"
    Public Shared Function GetStaff_ByStaffID(ByVal StaffID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_Select_ByStaffID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@StaffID", SqlDbType.Int).Value = StaffID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaff_ByStaffIDAndSiteID(ByVal StaffID As Integer, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_Select_ByStaffIDAndSiteID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@StaffID", SqlDbType.Int).Value = StaffID
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaff_ByStatusAndSiteID(ByVal Status As Boolean, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_SelectList_ByStatusAndSiteID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@Status", SqlDbType.Int).Value = Status
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaff_ByStaffIDAndStatus_FrontEnd(ByVal StaffID As Integer, ByVal status As Boolean, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_Select_ByStaffIDAndStatus_FrontEnd"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@StaffID", SqlDbType.Int).Value = StaffID
            sqlComm.Parameters.Add("@status", SqlDbType.Bit).Value = status
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaff_ByStaffIDAndStatusAndAccess_FrontEnd(ByVal StaffID As Integer, ByVal status As Boolean, ByVal GroupIDs As String, ByVal MemberID As Integer, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_Select_ByStaffIDAndStatusAndAccess_FrontEnd"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@StaffID", SqlDbType.Int).Value = StaffID
            sqlComm.Parameters.Add("@status", SqlDbType.Bit).Value = status
            sqlComm.Parameters.Add("@groupIDs", SqlDbType.NVarChar).Value = GroupIDs
            sqlComm.Parameters.Add("@memberID", SqlDbType.Int).Value = MemberID
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaff_ByStatus_FrontEnd(ByVal Status As Boolean, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_SelectList_ByStatus_FrontEnd"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@Status", SqlDbType.Int).Value = Status
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaff_ByStatusAndAccess_FrontEnd(ByVal Status As Boolean, ByVal GroupIDs As String, ByVal MemberID As Integer, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_SelectList_ByStatusAndAccess_FrontEnd"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@Status", SqlDbType.Int).Value = Status
            sqlComm.Parameters.Add("@groupIDs", SqlDbType.NVarChar).Value = GroupIDs
            sqlComm.Parameters.Add("@memberID", SqlDbType.Int).Value = MemberID
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaff_ByCategoryIDNullAndStatus_FrontEnd(ByVal Status As Boolean, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.Connection = sqlConn

            sqlComm.CommandText = "ss_Staff_SelectList_ByCategoryIDNullAndStatus_FrontEnd"
            sqlComm.Parameters.Add("@Status", SqlDbType.Bit).Value = Status
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaff_ByCategoryIDNullAndStatusAndAccess_FrontEnd(ByVal Status As Boolean, ByVal GroupIDs As String, ByVal MemberID As Integer, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.Connection = sqlConn

            sqlComm.CommandText = "ss_Staff_SelectList_ByCategoryIDNullAndStatusAndAccess_FrontEnd"
            sqlComm.Parameters.Add("@Status", SqlDbType.Bit).Value = Status
            sqlComm.Parameters.Add("@groupIDs", SqlDbType.NVarChar).Value = GroupIDs
            sqlComm.Parameters.Add("@memberID", SqlDbType.Int).Value = MemberID
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaff_ByCategoryIDAndStatus_FrontEnd(ByVal categoryID As Integer, ByVal Status As Boolean, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.Connection = sqlConn

            sqlComm.CommandText = "ss_Staff_SelectList_ByCategoryIDAndStatus_FrontEnd"
            sqlComm.Parameters.Add("@categoryID", SqlDbType.Int).Value = categoryID
            sqlComm.Parameters.Add("@Status", SqlDbType.Bit).Value = Status
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaff_ByCategoryIDAndStatusAndAccess_FrontEnd(ByVal categoryID As Integer, ByVal Status As Boolean, ByVal GroupIDs As String, ByVal MemberID As Integer, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.Connection = sqlConn

            sqlComm.CommandText = "ss_Staff_SelectList_ByCategoryIDAndStatusAndAccess_FrontEnd"
            sqlComm.Parameters.Add("@categoryID", SqlDbType.Int).Value = categoryID
            sqlComm.Parameters.Add("@Status", SqlDbType.Bit).Value = Status
            sqlComm.Parameters.Add("@groupIDs", SqlDbType.NVarChar).Value = GroupIDs
            sqlComm.Parameters.Add("@memberID", SqlDbType.Int).Value = MemberID
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaffList_ByMultipleColumns_FrontEnd(ByVal status As Boolean, ByVal FirstName As String, ByVal LastName As String, ByVal Company As String, ByVal StateID As Integer, ByVal listStaffPositionIDs As List(Of Integer), ByVal SiteID As Integer) As DataTable
        Dim sbWhereClause As New StringBuilder()


        'Add the first name to the where clause if it has been set
        If FirstName.Length > 0 Then
            If sbWhereClause.Length > 0 Then
                sbWhereClause.Append(" AND ")
            End If
            sbWhereClause.Append("FirstName Like '" + FirstName + "%'")
        End If

        'Add the last name to the where clause if it has been set
        If LastName.Length > 0 Then
            If sbWhereClause.Length > 0 Then
                sbWhereClause.Append(" AND ")
            End If
            sbWhereClause.Append("LastName Like '" + LastName + "%'")
        End If

        'Add the Organization to the where clause if it has been set
        If Company.Length > 0 Then
            If sbWhereClause.Length > 0 Then
                sbWhereClause.Append(" AND ")
            End If
            sbWhereClause.Append("Company Like '" + Company + "%'")
        End If

        'Add the State to the where clause if it has been set
        If StateID > 0 Then
            If sbWhereClause.Length > 0 Then
                sbWhereClause.Append(" AND ")
            End If
            sbWhereClause.Append("StateID = " & StateID)
        End If

        'Add the Staff Position list to the where clause if it has been set, in the Where StaffPositionID in (x, y, z) syntax
        Dim sbStaffPositionIDs As New StringBuilder()
        For Each staffPositionID As Integer In listStaffPositionIDs
            If sbStaffPositionIDs.Length > 0 Then
                sbStaffPositionIDs.Append(", ")
            End If
            sbStaffPositionIDs.Append(staffPositionID)
        Next
        If sbStaffPositionIDs.Length > 0 Then
            If sbWhereClause.Length > 0 Then
                sbWhereClause.Append(" AND ")
            End If
            sbWhereClause.Append("sp.StaffPositionID in (" & sbStaffPositionIDs.ToString() & ")")
        End If

        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_SelectStaffList_ByMultipleColumns_FrontEnd"
            sqlComm.Parameters.Add("@Status", SqlDbType.Bit).Value = status.ToString()
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            sqlComm.Parameters.Add("@WhereClause", SqlDbType.NVarChar).Value = sbWhereClause.ToString()

            sqlComm.Connection = sqlConn

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaffList_ByMultipleColumnsAndAccess_FrontEnd(ByVal status As Boolean, ByVal FirstName As String, ByVal LastName As String, ByVal Company As String, ByVal StateID As Integer, ByVal listStaffPositionIDs As List(Of Integer), ByVal GroupIDs As String, ByVal MemberID As Integer, ByVal SiteID As Integer) As DataTable
        Dim sbWhereClause As New StringBuilder()


        'Add the first name to the where clause if it has been set
        If FirstName.Length > 0 Then
            If sbWhereClause.Length > 0 Then
                sbWhereClause.Append(" AND ")
            End If
            sbWhereClause.Append("FirstName Like '" + FirstName + "%'")
        End If

        'Add the last name to the where clause if it has been set
        If LastName.Length > 0 Then
            If sbWhereClause.Length > 0 Then
                sbWhereClause.Append(" AND ")
            End If
            sbWhereClause.Append("LastName Like '" + LastName + "%'")
        End If

        'Add the Organization to the where clause if it has been set
        If Company.Length > 0 Then
            If sbWhereClause.Length > 0 Then
                sbWhereClause.Append(" AND ")
            End If
            sbWhereClause.Append("Company Like '" + Company + "%'")
        End If

        'Add the State to the where clause if it has been set
        If StateID > 0 Then
            If sbWhereClause.Length > 0 Then
                sbWhereClause.Append(" AND ")
            End If
            sbWhereClause.Append("StateID = " & StateID)
        End If

        'Add the Staff Position list to the where clause if it has been set, in the Where StaffPositionID in (x, y, z) syntax
        Dim sbStaffPositionIDs As New StringBuilder()
        For Each staffPositionID As Integer In listStaffPositionIDs
            If sbStaffPositionIDs.Length > 0 Then
                sbStaffPositionIDs.Append(", ")
            End If
            sbStaffPositionIDs.Append(staffPositionID)
        Next
        If sbStaffPositionIDs.Length > 0 Then
            If sbWhereClause.Length > 0 Then
                sbWhereClause.Append(" AND ")
            End If
            sbWhereClause.Append("sp.StaffPositionID in (" & sbStaffPositionIDs.ToString() & ")")
        End If

        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_SelectStaffList_ByMultipleColumnsAndAccess_FrontEnd"
            sqlComm.Parameters.Add("@Status", SqlDbType.Bit).Value = status.ToString()
            sqlComm.Parameters.Add("@groupIDs", SqlDbType.NVarChar).Value = GroupIDs
            sqlComm.Parameters.Add("@memberID", SqlDbType.Int).Value = MemberID
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            sqlComm.Parameters.Add("@WhereClause", SqlDbType.NVarChar).Value = sbWhereClause.ToString()

            sqlComm.Connection = sqlConn

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Sub DownloadVCard_ByStaffIDAndSiteID(ByVal intStaffID As Integer, ByVal SiteID As Integer)
        Dim dtStaff As DataTable = StaffDAL.GetStaff_ByStaffIDAndSiteID(intStaffID, SiteID)
        If dtStaff.Rows.Count > 0 Then
            Dim drStaff As DataRow = dtStaff.Rows(0)

            Dim strWriter As New StringWriter()
            Dim htmlWriter As New HtmlTextWriter(strWriter)

            strWriter.WriteLine("BEGIN:VCARD")
            strWriter.WriteLine("VERSION:2.1")

            Dim strSalutation_LangaugeSpecific As String = String.Empty
            If Not drStaff("Salutation_LanguageProperty") Is DBNull.Value Then
                Dim strSalutation_LanguageProperty As String = drStaff("Salutation_LanguageProperty").ToString()
                strSalutation_LangaugeSpecific = LanguageDAL.GetResourceValueForCurrentLanuage("DropDownList", strSalutation_LanguageProperty)
            End If

            strWriter.WriteLine("N:" & drStaff("LastName") & ";" & drStaff("FirstName") & ";;" & strSalutation_LangaugeSpecific)
            strWriter.WriteLine("FN:" & drStaff("Firstname") & " " & drStaff("LastName"))

            If Not drStaff("EmailAddress") Is DBNull.Value Then
                If Not drStaff("EmailAddress") = "" Then
                    strWriter.WriteLine("EMAIL;PREF;INTERNET:" & drStaff("EmailAddress"))
                End If
            End If

            If Not drStaff("Company") Is DBNull.Value Then
                If Not drStaff("Company") = "" Then
                    strWriter.WriteLine("ORG:" & drStaff("Company"))
                End If
            End If

            If Not drStaff("OfficePhone") Is DBNull.Value Then
                If Not drStaff("OfficePhone") = "" Then
                    strWriter.WriteLine("TEL;WORK;VOICE:" & drStaff("OfficePhone"))
                End If
            End If

            If Not drStaff("MobilePhone") Is DBNull.Value Then
                If Not drStaff("MobilePhone") = "" Then
                    strWriter.WriteLine("TEL;CELL;VOICE:" & drStaff("MobilePhone"))
                End If
            End If

            If Not drStaff("personalURL") Is DBNull.Value Then
                If Not drStaff("personalURL") = "" Then
                    strWriter.WriteLine("URL;WORK:" & drStaff("personalURL"))
                End If
            End If

            If Not drStaff("StaffPosition") Is DBNull.Value Then
                If Not drStaff("StaffPosition") = "" Then
                    strWriter.WriteLine("TITLE:" & drStaff("StaffPosition"))
                    strWriter.WriteLine("ROLE:" & drStaff("StaffPosition"))
                End If
            End If


            Dim locationOffice As String = ";"
            If Not drStaff("addressOfficeNumber") Is DBNull.Value Then
                If Not drStaff("addressOfficeNumber") = "" Then
                    locationOffice = drStaff("addressOfficeNumber") & ";"
                End If
            End If

            Dim locationStreet As String = ";"
            If Not drStaff("address") Is DBNull.Value Then
                If Not drStaff("address") = "" Then
                    locationStreet = drStaff("address") & ";"
                End If
            End If

            Dim locationCity As String = ";"
            If Not drStaff("city") Is DBNull.Value Then
                If Not drStaff("city") = "" Then
                    locationCity = drStaff("city") & ";"
                End If
            End If

            Dim locationState As String = ";"
            If Not drStaff("stateName") Is DBNull.Value Then
                If Not drStaff("stateName") = "" Then
                    locationState = drStaff("stateName") & ";"
                End If
            End If

            Dim locationZip As String = ";"
            If Not drStaff("zipCode") Is DBNull.Value Then
                If Not drStaff("zipCode") = "" Then
                    locationZip = drStaff("zipCode") & ";"
                End If
            End If


            Dim locationCountry As String = ";"
            If Not drStaff("countryName") Is DBNull.Value Then
                If Not drStaff("countryName") = "" Then
                    locationCountry = drStaff("countryName") & ";"
                End If
            End If
            strWriter.WriteLine("ADR;WORK;ENCODING=QUOTED-PRINTABLE:" & ";" & locationOffice & locationStreet & locationCity & locationState & locationZip & locationCountry)

            strWriter.WriteLine("END:VCARD")


            Dim strStaffFullName As String = StrConv(strSalutation_LangaugeSpecific, vbProperCase) & StrConv(drStaff("FirstName"), vbProperCase) & StrConv(drStaff("LastName"), vbProperCase)

            'Setup the vCard response
            HttpContext.Current.Response.Clear()
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + strStaffFullName & ".vcf")
            HttpContext.Current.Response.ContentType = "text/x-vCard; charset=utf-8; name=" & strStaffFullName + ".vcf"
            HttpContext.Current.Response.Write(strWriter.ToString())
            HttpContext.Current.Response.End()

        End If
    End Sub

    Public Shared Function InsertStaff(ByVal SiteID As Integer, ByVal AvailableToAllSites As Boolean, ByVal SalutationID As Integer, ByVal FirstName As String, ByVal LastName As String, ByVal EmailAddress As String, ByVal Company As String, ByVal StaffPositionID As Integer, ByVal Body As String, ByVal PersonalURL As String, ByVal FavouriteURL As String, ByVal OfficePhone As String, ByVal MobilePhone As String, ByVal AddressOfficeNumber As String, ByVal Address As String, ByVal City As String, ByVal StateID As Integer, ByVal ZipCode As String, ByVal CountryID As Integer, ByVal locationLatitude As String, ByVal locationLongitude As String, ByVal geoLocation As Boolean, ByVal categoryID As Integer, ByVal StartDate As DateTime, ByVal EndDate As DateTime, ByVal Status As Boolean, ByVal metaTitle As String, ByVal metaKeywords As String, ByVal metaDescription As String, ByVal metaOther As String, ByVal groupID As String, ByVal userID As String, ByVal searchTagID As String, ByVal Version As Integer, ByVal dateTimeStamp As DateTime, ByVal authorID_member As Integer, ByVal authorID_admin As Integer, ByVal modifiedID_member As Integer, ByVal modifiedID_admin As Integer) As Integer
        Dim StaffID As Integer = 0
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_InsertStaff"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID
            sqlComm.Parameters.Add("@AvailableToAllSites", SqlDbType.Bit).Value = AvailableToAllSites

            If SalutationID = Integer.MinValue Then
                sqlComm.Parameters.Add("@SalutationID", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@SalutationID", SqlDbType.Int).Value = SalutationID
            End If
            sqlComm.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = FirstName
            sqlComm.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = LastName
            sqlComm.Parameters.Add("@EmailAddress", SqlDbType.NVarChar).Value = EmailAddress
            sqlComm.Parameters.Add("@company", SqlDbType.NVarChar).Value = Company
            If StaffPositionID = Integer.MinValue Then
                sqlComm.Parameters.Add("@StaffPositionID", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@StaffPositionID", SqlDbType.Int).Value = StaffPositionID
            End If


            sqlComm.Parameters.Add("@Body", SqlDbType.NVarChar).Value = Body
            sqlComm.Parameters.Add("@PersonalURL", SqlDbType.NVarChar).Value = PersonalURL
            sqlComm.Parameters.Add("@FavouriteURL", SqlDbType.NVarChar).Value = FavouriteURL

            sqlComm.Parameters.Add("@OfficePhone", SqlDbType.NVarChar).Value = OfficePhone
            sqlComm.Parameters.Add("@MobilePhone", SqlDbType.NVarChar).Value = MobilePhone

            If AddressOfficeNumber.Length = 0 Then
                sqlComm.Parameters.Add("@AddressOfficeNumber", SqlDbType.NVarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@AddressOfficeNumber", SqlDbType.NVarChar).Value = AddressOfficeNumber
            End If

            If Address.Length = 0 Then
                sqlComm.Parameters.Add("@Address", SqlDbType.NVarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@Address", SqlDbType.NVarChar).Value = Address
            End If

            If City.Length = 0 Then
                sqlComm.Parameters.Add("@City", SqlDbType.NVarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@City", SqlDbType.NVarChar).Value = City
            End If

            If ZipCode.Length = 0 Then
                sqlComm.Parameters.Add("@ZipCode", SqlDbType.NVarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@ZipCode", SqlDbType.NVarChar).Value = ZipCode
            End If

            If StateID = Integer.MinValue Then
                sqlComm.Parameters.Add("@StateID", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@StateID", SqlDbType.Int).Value = StateID
            End If

            If CountryID = Integer.MinValue Then
                sqlComm.Parameters.Add("@CountryID", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@CountryID", SqlDbType.Int).Value = CountryID
            End If

            If locationLatitude.Length = 0 Then
                sqlComm.Parameters.Add("@locationLatitude", SqlDbType.VarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@locationLatitude", SqlDbType.VarChar).Value = locationLatitude
            End If

            If locationLongitude.Length = 0 Then
                sqlComm.Parameters.Add("@locationLongitude", SqlDbType.VarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@locationLongitude", SqlDbType.VarChar).Value = locationLongitude
            End If
            sqlComm.Parameters.Add("@geoLocation", SqlDbType.Bit).Value = geoLocation


            If categoryID = Integer.MinValue Then
                sqlComm.Parameters.Add("@CategoryID", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@CategoryID", SqlDbType.Int).Value = categoryID
            End If

            If StartDate = DateTime.MinValue Then
                sqlComm.Parameters.Add("@StartDate", SqlDbType.SmallDateTime).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@StartDate", SqlDbType.SmallDateTime).Value = StartDate
            End If

            If EndDate = DateTime.MinValue Then
                sqlComm.Parameters.Add("@EndDate", SqlDbType.SmallDateTime).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@EndDate", SqlDbType.SmallDateTime).Value = EndDate
            End If

            sqlComm.Parameters.Add("@Status", SqlDbType.Bit).Value = Status
            sqlComm.Parameters.Add("@metaTitle", SqlDbType.NVarChar).Value = metaTitle
            sqlComm.Parameters.Add("@metaKeywords", SqlDbType.NVarChar).Value = metaKeywords
            sqlComm.Parameters.Add("@metaDescription", SqlDbType.NVarChar).Value = metaDescription
            sqlComm.Parameters.Add("@metaOther", SqlDbType.NVarChar).Value = metaOther

            If groupID.Length = 0 Then
                sqlComm.Parameters.Add("@groupID", SqlDbType.VarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@groupID", SqlDbType.VarChar).Value = groupID
            End If

            If userID.Length = 0 Then
                sqlComm.Parameters.Add("@userID", SqlDbType.VarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@userID", SqlDbType.VarChar).Value = userID
            End If

            If searchTagID.Length = 0 Then
                sqlComm.Parameters.Add("@searchTagID", SqlDbType.VarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@searchTagID", SqlDbType.VarChar).Value = searchTagID
            End If

            sqlComm.Parameters.Add("@Version", SqlDbType.Int).Value = Version
            sqlComm.Parameters.Add("@dateTimeStamp", SqlDbType.SmallDateTime).Value = dateTimeStamp

            If authorID_member = Integer.MinValue Then
                sqlComm.Parameters.Add("@authorID_member", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@authorID_member", SqlDbType.Int).Value = authorID_member
            End If

            If authorID_admin = Integer.MinValue Then
                sqlComm.Parameters.Add("@authorID_admin", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@authorID_admin", SqlDbType.Int).Value = authorID_admin
            End If

            If modifiedID_member = Integer.MinValue Then
                sqlComm.Parameters.Add("@modifiedID_member", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@modifiedID_member", SqlDbType.Int).Value = modifiedID_member
            End If

            If modifiedID_admin = Integer.MinValue Then
                sqlComm.Parameters.Add("@modifiedID_admin", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@modifiedID_admin", SqlDbType.Int).Value = modifiedID_admin
            End If


            sqlConn.Open()
            StaffID = sqlComm.ExecuteScalar()

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return StaffID
    End Function

    Public Shared Function UpdateStaff_ByStaffID(ByVal staffID As Integer, ByVal SiteID As Integer, ByVal AvailableToAllSites As Boolean, ByVal SalutationID As Integer, ByVal FirstName As String, ByVal LastName As String, ByVal EmailAddress As String, ByVal Company As String, ByVal StaffPositionID As Integer, ByVal Body As String, ByVal PersonalURL As String, ByVal FavouriteURL As String, ByVal OfficePhone As String, ByVal MobilePhone As String, ByVal AddressOfficeNumber As String, ByVal Address As String, ByVal City As String, ByVal StateID As Integer, ByVal ZipCode As String, ByVal CountryID As Integer, ByVal locationLatitude As String, ByVal locationLongitude As String, ByVal geoLocation As Boolean, ByVal categoryID As Integer, ByVal StartDate As DateTime, ByVal EndDate As DateTime, ByVal Status As Boolean, ByVal metaTitle As String, ByVal metaKeywords As String, ByVal metaDescription As String, ByVal metaOther As String, ByVal groupID As String, ByVal userID As String, ByVal searchTagID As String, ByVal Version As Integer, ByVal modifiedID_member As Integer, ByVal modifiedID_admin As Integer) As Integer
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_UpdateStaff_ByStaffID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@StaffID", SqlDbType.Int).Value = staffID

            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID
            sqlComm.Parameters.Add("@AvailableToAllSites", SqlDbType.Bit).Value = AvailableToAllSites

            If SalutationID = Integer.MinValue Then
                sqlComm.Parameters.Add("@SalutationID", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@SalutationID", SqlDbType.Int).Value = SalutationID
            End If
            sqlComm.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = FirstName
            sqlComm.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = LastName
            sqlComm.Parameters.Add("@EmailAddress", SqlDbType.NVarChar).Value = EmailAddress
            sqlComm.Parameters.Add("@company", SqlDbType.NVarChar).Value = Company

            If StaffPositionID = Integer.MinValue Then
                sqlComm.Parameters.Add("@StaffPositionID", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@StaffPositionID", SqlDbType.Int).Value = StaffPositionID
            End If

            sqlComm.Parameters.Add("@Body", SqlDbType.NVarChar).Value = Body
            sqlComm.Parameters.Add("@PersonalURL", SqlDbType.NVarChar).Value = PersonalURL
            sqlComm.Parameters.Add("@FavouriteURL", SqlDbType.NVarChar).Value = FavouriteURL

            sqlComm.Parameters.Add("@OfficePhone", SqlDbType.NVarChar).Value = OfficePhone
            sqlComm.Parameters.Add("@MobilePhone", SqlDbType.NVarChar).Value = MobilePhone

            If AddressOfficeNumber.Length = 0 Then
                sqlComm.Parameters.Add("@AddressOfficeNumber", SqlDbType.NVarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@AddressOfficeNumber", SqlDbType.NVarChar).Value = AddressOfficeNumber
            End If

            If Address.Length = 0 Then
                sqlComm.Parameters.Add("@Address", SqlDbType.NVarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@Address", SqlDbType.NVarChar).Value = Address
            End If

            If City.Length = 0 Then
                sqlComm.Parameters.Add("@City", SqlDbType.NVarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@City", SqlDbType.NVarChar).Value = City
            End If

            If ZipCode.Length = 0 Then
                sqlComm.Parameters.Add("@ZipCode", SqlDbType.NVarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@ZipCode", SqlDbType.NVarChar).Value = ZipCode
            End If

            If StateID = Integer.MinValue Then
                sqlComm.Parameters.Add("@StateID", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@StateID", SqlDbType.Int).Value = StateID
            End If

            If CountryID = Integer.MinValue Then
                sqlComm.Parameters.Add("@CountryID", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@CountryID", SqlDbType.Int).Value = CountryID
            End If

            If locationLatitude.Length = 0 Then
                sqlComm.Parameters.Add("@locationLatitude", SqlDbType.VarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@locationLatitude", SqlDbType.VarChar).Value = locationLatitude
            End If

            If locationLongitude.Length = 0 Then
                sqlComm.Parameters.Add("@locationLongitude", SqlDbType.VarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@locationLongitude", SqlDbType.VarChar).Value = locationLongitude
            End If
            sqlComm.Parameters.Add("@geoLocation", SqlDbType.Bit).Value = geoLocation


            If categoryID = Integer.MinValue Then
                sqlComm.Parameters.Add("@CategoryID", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@CategoryID", SqlDbType.Int).Value = categoryID
            End If

            If StartDate = DateTime.MinValue Then
                sqlComm.Parameters.Add("@StartDate", SqlDbType.SmallDateTime).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@StartDate", SqlDbType.SmallDateTime).Value = StartDate
            End If

            If EndDate = DateTime.MinValue Then
                sqlComm.Parameters.Add("@EndDate", SqlDbType.SmallDateTime).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@EndDate", SqlDbType.SmallDateTime).Value = EndDate
            End If

            sqlComm.Parameters.Add("@Status", SqlDbType.Bit).Value = Status
            sqlComm.Parameters.Add("@metaTitle", SqlDbType.NVarChar).Value = metaTitle
            sqlComm.Parameters.Add("@metaKeywords", SqlDbType.NVarChar).Value = metaKeywords
            sqlComm.Parameters.Add("@metaDescription", SqlDbType.NVarChar).Value = metaDescription
            sqlComm.Parameters.Add("@metaOther", SqlDbType.NVarChar).Value = metaOther

            If groupID.Length = 0 Then
                sqlComm.Parameters.Add("@groupID", SqlDbType.VarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@groupID", SqlDbType.VarChar).Value = groupID
            End If

            If userID.Length = 0 Then
                sqlComm.Parameters.Add("@userID", SqlDbType.VarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@userID", SqlDbType.VarChar).Value = userID
            End If

            If searchTagID.Length = 0 Then
                sqlComm.Parameters.Add("@searchTagID", SqlDbType.VarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@searchTagID", SqlDbType.VarChar).Value = searchTagID
            End If

            sqlComm.Parameters.Add("@Version", SqlDbType.Int).Value = Version


            If modifiedID_member = Integer.MinValue Then
                sqlComm.Parameters.Add("@modifiedID_member", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@modifiedID_member", SqlDbType.Int).Value = modifiedID_member
            End If

            If modifiedID_admin = Integer.MinValue Then
                sqlComm.Parameters.Add("@modifiedID_admin", SqlDbType.Int).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@modifiedID_admin", SqlDbType.Int).Value = modifiedID_admin
            End If

            sqlConn.Open()
            sqlComm.ExecuteScalar()

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return staffID
    End Function

    Public Shared Sub UpdateStaff_StaffImage_ByStaffID(ByVal staffID As Integer, ByVal ThumbnailName As String, ByVal Thumbnail As Byte())

        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_UpdateStaff_StaffImage_ByStaffID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@staffID", SqlDbType.Int).Value = staffID

            If ThumbnailName.Length = 0 Then
                sqlComm.Parameters.Add("@ThumbnailName", SqlDbType.NVarChar).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@ThumbnailName", SqlDbType.NVarChar).Value = ThumbnailName
            End If

            If Thumbnail Is Nothing Then
                sqlComm.Parameters.Add("@Thumbnail", SqlDbType.Binary).Value = DBNull.Value
            Else
                sqlComm.Parameters.Add("@Thumbnail", SqlDbType.Binary).Value = Thumbnail
            End If

            sqlConn.Open()
            sqlComm.ExecuteScalar()

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
    End Sub

    Public Shared Sub DeleteStaff_ByStaffID(ByVal StaffID As Integer)

        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_Delete_ByStaffID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@StaffID", SqlDbType.Int).Value = StaffID

            sqlConn.Open()
            sqlComm.ExecuteNonQuery()

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
    End Sub

    Public Shared Sub RollbackStaff(ByVal archiveID As Integer)
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_Staff_RollBackStaff"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@ArchiveID", SqlDbType.Int).Value = archiveID

            sqlConn.Open()
            sqlComm.ExecuteNonQuery()

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
    End Sub
#End Region

#Region "Staff Archive"
    Public Shared Function GetStaffArchive_ByArchiveIDAndSiteID(ByVal ArchiveID As Integer, ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_StaffArchive_Select_ByArchiveIDAndSiteID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@ArchiveID", SqlDbType.Int).Value = ArchiveID
            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function GetStaffArchive_ByStaffID(ByVal StaffID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_StaffArchive_SelectList_ByStaffID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@StaffID", SqlDbType.Int).Value = StaffID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Sub DeleteStaffArchive_ByArchiveID(ByVal ArchiveID As Integer)

        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_StaffArchive_Delete_ByArchiveID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@ArchiveID", SqlDbType.Int).Value = ArchiveID

            sqlConn.Open()
            sqlComm.ExecuteNonQuery()

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
    End Sub

    Public Shared Sub DeleteStaffArchive_ByStaffID(ByVal StaffID As Integer)

        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_StaffArchive_Delete_ByStaffID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@StaffID", SqlDbType.Int).Value = StaffID

            sqlConn.Open()
            sqlComm.ExecuteNonQuery()

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
    End Sub
#End Region

#Region "Staff Position"
    Public Shared Function GetStaffPositionList_BySiteID(ByVal SiteID As Integer) As DataTable
        Dim dt As New DataTable()
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_StaffPosition_SelectList_BySiteID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@SiteID", SqlDbType.Int).Value = SiteID

            Dim da As New SqlDataAdapter(sqlComm)
            sqlConn.Open()
            da.Fill(dt)

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return dt
    End Function

    Public Shared Function InsertStaffPosition(ByVal StaffPosition As String, ByVal Description As String) As Integer
        Dim StaffPositionID As Integer = 0
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_StaffPosition_InsertStaffPosition"
            sqlComm.Connection = sqlConn


            sqlComm.Parameters.Add("@StaffPosition", SqlDbType.NVarChar).Value = StaffPosition
            sqlComm.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description


            sqlConn.Open()
            StaffPositionID = sqlComm.ExecuteScalar()

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return StaffPositionID
    End Function

    Public Shared Function UpdateStaffPosition_ByStaffPositionID(ByVal StaffPositionID As Integer, ByVal StaffPosition As String, ByVal Description As String) As Integer
        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_StaffPosition_UpdateStaffPosition_ByStaffPositionID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@StaffPositionID", SqlDbType.Int).Value = StaffPositionID
            sqlComm.Parameters.Add("@StaffPosition", SqlDbType.NVarChar).Value = StaffPosition
            sqlComm.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Description

            sqlConn.Open()
            sqlComm.ExecuteScalar()

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
        Return StaffPositionID
    End Function

    Public Shared Sub DeleteStaffPosition_ByStaffPositionID(ByVal StaffPositionID As Integer)

        Dim sqlConn As SqlConnection = Nothing
        Try
            sqlConn = New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim sqlComm As New SqlCommand()
            sqlComm.CommandType = CommandType.StoredProcedure
            sqlComm.CommandText = "ss_StaffPosition_Delete_ByStaffPositionID"
            sqlComm.Connection = sqlConn

            sqlComm.Parameters.Add("@StaffPositionID", SqlDbType.Int).Value = StaffPositionID

            sqlConn.Open()
            sqlComm.ExecuteNonQuery()

        Finally
            If Not sqlConn Is Nothing Then
                sqlConn.Close()
            End If
        End Try
    End Sub
#End Region

End Class



