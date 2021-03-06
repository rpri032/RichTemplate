﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPages/AdminRichTemplateMasterPage.master"
    AutoEventWireup="false" CodeFile="editAdd.aspx.vb" Inherits="admin_modules_contactus_editAdd"
    ValidateRequest="false" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/admin/usercontrols/header.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <uc:Header ID="ucHeader" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxLoadingPanel ID="ralContactUs" runat="server" />
    <telerik:RadScriptBlock runat="server" ID="radScriptBlockContactUs">
        <script type="text/javascript">
            function valContactUsImage(source, arguments) {
                arguments.IsValid = getRadUpload('<%= radUploadContactUsImage.ClientID %>').validateExtensions();
            }

        </script>
    </telerik:RadScriptBlock>
    <span class="callout">
        <%= Resources.ContactUs_Admin.ContactUs_AddEdit_BodyHeading%></span>
    <br />
    <br />
    <telerik:RadTabStrip ID="rtsContactUs" runat="server" MultiPageID="rmpContactUs"
        CausesValidation="true" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_Content %>"
                PageViewID="rpvContactUs" Value="0">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_SEO %>"
                PageViewID="rpvSEO" Value="1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_SearchTags %>"
                PageViewID="rpvSearchTags" Value="2">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_UserGroups %>"
                PageViewID="rpvUserAndGroups" Value="3" Visible="false">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_History %>"
                PageViewID="rpvHistory" Value="4">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="rmpContactUs" runat="server" SelectedIndex="0" CssClass="Windows7_MultipageBorder">
        <telerik:RadPageView ID="rpvContactUs" runat="server">
            <span class="callout">
                <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_Content_Heading%></span><br />
            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_Content_SubHeading%><br />
            <br />
            <div id="MainContent">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <label for="Status">
                                <span class="moduleLabel">
                                    <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Status%>:</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="Status" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="True" Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_StatusActive %>" />
                                <asp:ListItem Value="False" Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_StatusArchive %>" />
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <span class="moduleLabel">
                                            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_PublicationDate%>:</span>
                                    </td>
                                    <td class="leftPad">
                                        <span class="moduleLabel">
                                            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_ExpirationDate%>:</span>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <telerik:RadDatePicker ID="PublicationDate" runat="server"><DateInput DateFormat="d"></DateInput></telerik:RadDatePicker>
                                    </td>
                                    <td class="leftPad">
                                        <telerik:RadDatePicker ID="ExpirationDate" runat="server"><DateInput DateFormat="d"></DateInput></telerik:RadDatePicker>
                                    </td>
                                    <td>
                                        <span id="spanExpired" runat="server" class="errorStyle spanExpired" visible="false">
                                            <span>
                                                <img src='/admin/images/expired.png' />
                                            </span><span>
                                                <%= Resources.ContactUs_Admin.ContactUs_AddEdit_ExpirationDateExpired%></span>
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="trSiteAccess" runat="server" visible="false">
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <label for="rblSite">
                                            <span class="moduleLabel">
                                                <%=Resources.ContactUs_Admin.ContactUs_AddEdit_AssociateWithSite%>:</span></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="divAssociateWithSite" runat="server">
                                            <asp:RadioButtonList ID="rblSite" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                <asp:ListItem Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_AssociateWithSite_ThisSiteOnly %>"
                                                    Value="false" Selected="True" />
                                                <asp:ListItem Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_AssociateWithSite_AllSites %>"
                                                    Value="true" />
                                            </asp:RadioButtonList>
                                        </div>
                                        <div id="divAssociateWithSite_PublicMessage" runat="server" class="divAssociateWithSite_PublicMessage"
                                            visible="false">
                                            <span>
                                                <img src='/admin/images/available_to_all.png' />
                                            </span><span class="spanPublicModuleRecord">
                                                <%=Resources.ContactUs_Admin.ContactUs_AddEdit_AssociateWithSite_PublicMessage%>:
                                                <asp:Literal ID="litSiteName" runat="server" /></span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtMemberID">
                                <span class="moduleLabel">
                                    <%= Resources.ContactUs_Admin.ContactUs_AddEdit_MemberID%>:</span></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtMemberID" runat="server" CssClass="tb100" />
                            <asp:CustomValidator ID="customValMemberExist" runat="server" Display="Dynamic" OnServerValidate="customValMemberExist_Validate"
                                CssClass="errorStyle">
                        &nbsp;<br /><b><%= Resources.ContactUs_Admin.ContactUs_AddEdit_MemberID_DoesNotExist%></b>
                            </asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <label for="Category">
                                            <span class="moduleLabel">
                                                <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Category%>:</span></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <telerik:RadComboBox ID="rcbCategoryID" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtEmailAddress">
                                <span class="moduleLabel">
                                    <%= Resources.ContactUs_Admin.ContactUs_AddEdit_EmailAddress%>:</span></label>
                            <asp:RegularExpressionValidator ID="valRegEx" runat="server" ControlToValidate="txtEmailAddress"
                                CssClass="smallText" Display="dynamic" SetFocusOnError="True" ValidationExpression=".*@.*\..*"
                                ErrorMessage="  <%$ Resources:ContactUs_Admin, ContactUs_AddEdit_EmailAddress_Invalid %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="tb400" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtContactUsMessage">
                                <span class="moduleLabel">
                                    <%= Resources.ContactUs_Admin.ContactUs_AddEdit_ContactUsMessage%>:</span></label><span
                                        class="requiredStar">*</span>
                            <asp:RequiredFieldValidator ID="reqContactUsMessage" runat="server" ErrorMessage=" <%$ Resources:ContactUs_Admin, ContactUs_AddEdit_RequiredMessage %>"
                                ControlToValidate="txtContactUsMessage" CssClass="errorStyle" Display="Dynamic" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtContactUsMessage" runat="server" CssClass="tb400" TextMode="MultiLine"
                                Rows="3" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <span class="moduleLabel">
                                            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_UploadImage%>:</span>
                                        <br />
                                        <span class="graySubText">
                                            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_UploadImage_Message%><br />
                                            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_UploadImage_Requirements%></span>
                                        <asp:CustomValidator ID="customVaContactUsImage" runat="server" Display="Dynamic"
                                            ClientValidationFunction="valContactUsImage" CssClass="errorStyle">
                    &nbsp;<br /><b><%= Resources.ContactUs_Admin.ContactUs_AddEdit_UploadImage_InvalidFileType%></b>
                                        </asp:CustomValidator>
                                        <asp:CustomValidator ID="customValContactUsSizeExceeded" runat="server" Display="Dynamic"
                                            OnServerValidate="customValContactUsImageSizeExceeded_Validate" CssClass="errorStyle">
                        &nbsp;<br /><b><%= Resources.ContactUs_Admin.ContactUs_AddEdit_UploadImage_MaxFileSizeExceeded%></b>
                                        </asp:CustomValidator>
                                        <br />
                                        <br />
                                        <telerik:RadUpload ID="radUploadContactUsImage" runat="server" AllowedFileExtensions=".jpg,.gif,.png"
                                            ControlObjectsVisibility="None" InitialFileInputsCount="1" />
                                        <telerik:RadProgressManager ID="rpManagerContactUs" runat="server" />
                                        <telerik:RadProgressArea ID="rpAreaContactUs" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <telerik:RadBinaryImage ID="contactUsImage" runat="server" CssClass="rightPad" Visible="false" /><br />
                                        <asp:LinkButton ID="lnkDeleteImage" runat="server" Visible="false" OnClick="lnkDeleteImage_Click"
                                            CausesValidation="false"><b><%= Resources.ContactUs_Admin.ContactUs_AddEdit_UploadImage_Delete%></b></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
                <asp:TextBox ID="txtVersion" runat="server" Width="35px" Visible="false" />
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvSEO" runat="server">
            <span class="callout">
                <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_SEO_Heading%></span><br />
            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_SEO_SubHeading%>
            <div>
                <p>
                    <label for="metaTitle">
                        <span class="moduleLabel">
                            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_SEO_MetaTitle%>:</span>
                    </label>
                    <br />
                    <asp:TextBox ID="metaTitle" runat="server" TextMode="MultiLine" Rows="3" CssClass="tb400" />
                </p>
                <p>
                    <label for="metaKeywords">
                        <span class="moduleLabel">
                            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_SEO_MetaKeywords%>:</span>
                    </label>
                    <br />
                    <asp:TextBox ID="metaKeywords" runat="server" TextMode="MultiLine" Rows="5" CssClass="tb400" /></p>
                <p>
                    <label for="metaDescription">
                        <span class="moduleLabel">
                            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_SEO_MetaDescription%>:</span>
                    </label>
                    <br />
                    <asp:TextBox ID="metaDescription" runat="server" TextMode="MultiLine" Rows="5" CssClass="tb400" /></p>
                <p>
                    &nbsp;</p>
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvSearchTags" runat="server">
            <span class="callout">
                <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_SearchTags_Heading%></span><br />
            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_SearchTags_SubHeading%><br />
            <div id="divAddSearchTags" runat="server" visible="false">
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <img src="/admin/images/search_page.png" />
                        </td>
                        <td>
                            <asp:LinkButton ID="lnkAddSearchTags" runat="server" OnClick="lnkAddSearchTags_Click"><%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_SearchTags_AddSearchTags%></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <asp:CheckBoxList ID="cblSearchTags" runat="server">
            </asp:CheckBoxList>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvUserAndGroups" runat="server">
            <span class="callout">
                <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_UserGroups_Heading%></span><br />
            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_UserGroups_SubHeading%><br />
            <br />
            <span class="moduleLabel">
                <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_UserGroups_Groups%></span>
            <asp:CheckBoxList ID="cblGroupList" runat="server">
            </asp:CheckBoxList>
            <br />
            <div id="divUserGroups_Members" runat="server" visible="false">
            <span class="moduleLabel">
                <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_UserGroups_Users%></span>
            <asp:CheckBoxList ID="cblMemberList" runat="server">
            </asp:CheckBoxList>
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvHistory" runat="server">
            <span class="callout">
                <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_History_Heading%></span><br />
            <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_History_SubHeading%><br />
            <br />
            <telerik:RadGrid ID="rgHistory" runat="server" PageSize="20">
                <MasterTableView DataKeyNames="archiveID">
                    <RowIndicatorColumn>
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn>
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="archiveID" DataType="System.Int32" ReadOnly="True"
                            SortExpression="archiveID" UniqueName="archiveID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dateTimeStamp" DataType="System.DateTime" HeaderText="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_History_GridRevisionDate %>"
                            SortExpression="dateTimeStamp" UniqueName="dateTimeStamp" ItemStyle-Width="120px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Version" HeaderText="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_History_GridVersion %>"
                            SortExpression="Version" UniqueName="Version" ItemStyle-Width="100px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ContactUs" HeaderText="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_History_GridContactUsMessage %>"
                            SortExpression="ContactUs" UniqueName="ContactUs">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" ItemStyle-Width="50px"
                            ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderText="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_History_GridView %>">
                            <ItemTemplate>
                                <a id="aPreview" runat="server">
                                    <%= Resources.ContactUs_Admin.ContactUs_AddEdit_Tab_History_GridView%></a>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                            HeaderText="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_History_GridDelete %>"
                            ItemStyle-Width="60px">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="dsContactUsHistory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="ss_ContactUsArchive_SelectList_ByID" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div id="order" class="divFooterHistory orderText">
                <div class="fRight">
                    <asp:Button ID="btnDeleteHistory" runat="server" Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_History_DeleteButton %>"
                        OnClick="btnDeleteHistory_Click" /></div>
                <br class="cBoth" />
                <telerik:RadWindowManager ID="rwmContactUsHistory" runat="server">
                    <Windows>
                        <telerik:RadWindow ID="UserListDialog" runat="server" Title="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_Tab_History_EditingRecord %>"
                            Height="600px" Width="1000px" Left="10px" ReloadOnShow="true" ShowContentDuringLoad="false"
                            Modal="true" />
                    </Windows>
                </telerik:RadWindowManager>
            </div>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <br />
    <asp:Button ID="btnAddEdit" runat="server" CausesValidation="true" />
    <asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:ContactUs_Admin, ContactUs_AddEdit_ButtonCancel %>"
        CausesValidation="false" />
    <br />
    <span class="requiredStar">*</span>
    <%= Resources.ContactUs_Admin.ContactUs_AddEdit_DenotesRequired%><br />
</asp:Content>
