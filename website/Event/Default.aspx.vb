Imports System.Data

Partial Class Event_Default_EventTree
    Inherits RichTemplateLanguagePage

    Dim ModuleTypeID As Integer = 5

    Dim intSiteID As Integer = Integer.MinValue
    Dim intMemberID As Integer = Integer.MinValue

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        'First we set the SiteID and current MemberID
        intSiteID = SiteDAL.GetCurrentSiteID_FrontEnd()
        intMemberID = MemberDAL.GetCurrentMemberID()

        If Not Page.IsPostBack Then

            'Set the Page Title
            Page.Header.Title = SiteDAL.GetCompanyName() + " | " + Resources.Event_FrontEnd.Event_DefaultTree_HeaderTitle
            CommonWeb.SetMasterPageBannerText(Me.Master, Resources.Event_FrontEnd.Event_DefaultTree_Heading)

            If Request.QueryString("id") Is Nothing Then
                'Get module information, to check if we will show its introduction
                Dim dtModule As DataTable = ModuleDAL.GetModule_ByModuleTypeIDAndSiteID_FrontEnd(ModuleTypeID, intSiteID)
                If dtModule.Rows.Count > 0 Then
                    Dim drModule As DataRow = dtModule.Rows(0)
                    If Not drModule("ModuleContentHTML") Is DBNull.Value Then
                        Dim strModuleContentHTML As String = drModule("ModuleContentHTML")

                        litModuleDynamicContent.Text = strModuleContentHTML
                        divModuleDynamicContent.Visible = True
                    End If
                Else
                    'We do not have an Active Event Module For the Front-End, so redirect to the homepage
                    Response.Redirect("/")
                End If
            End If

            'Check we need to show the comments, captcha and comment approval
            Dim boolAllowArchive As Boolean = False

            Dim dtModuleConfig As DataTable = ModuleDAL.GetModuleConfigList_ByModuleTypeIDAndSiteID(ModuleTypeID, intSiteID)
            For Each drModuleConfig As DataRow In dtModuleConfig.Rows()

                If drModuleConfig("fieldName").ToString().ToLower() = "show_archive" Then
                    boolAllowArchive = True

                ElseIf drModuleConfig("fieldName").ToString().ToLower() = "allow_online_submissions" Then
                    If intMemberID > 0 Then
                        divAddEvent.Visible = True
                    End If
                End If
            Next

            If boolAllowArchive Then
                ' Code to hide archive if we decide to add archive events to this display
                divActiveArchive.Visible = True

                If Request.QueryString("archive") = 1 Then
                    aEvent_Active.Visible = True
                    litEvent_Active.Visible = False

                    aEvent_Archive.Visible = False
                    litEvent_Archive.Visible = True

                Else
                    aEvent_Active.Visible = False
                    litEvent_Active.Visible = True

                    aEvent_Archive.Visible = True
                    litEvent_Archive.Visible = False
                End If
            Else
                If Request.QueryString("archive") = 1 Then
                    ucEventTree.Visible = False
                    ucEventTreeRepeater.Visible = False
                    ucEventDetail.Visible = False
                End If
            End If

            If Not Request.QueryString("id") Is Nothing Then
                ucEventTreeRepeater.Visible = False
                ucEventDetail.Visible = True
            End If
        End If

    End Sub

End Class
