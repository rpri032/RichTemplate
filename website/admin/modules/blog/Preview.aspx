﻿<%@ Page Title="Rollback" Language="VB" MasterPageFile="~/MasterPages/RichTemplateMasterPage_OneColumn.master"
    AutoEventWireup="false" CodeFile="Preview.aspx.vb" Inherits="admin_modules_blog_preview" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/admin/usercontrols/header.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <uc:Header ID="ucHeader" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="/admin/css/RichTemplate.css" />

    <asp:Panel runat="server" ID="pnlPreview" Width="100%">
        <div style="padding: 10px">
            <table cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td>
                        <fieldset class="infoPanel">
                            <div id="divExpired" runat="server" visible="false" class="errorStyle fRight">
                                <h3 class="floatL">
                                    <%= Resources.Blog_Admin.Blog_Preview_Expired%></h3>
                                <div class="floatL leftPad">
                                    <img src='/admin/images/expired.png' />
                                </div>
                            </div>
                            <b>
                                <%= Resources.Blog_Admin.Blog_Preview_InformationBox_Version%></b>: <asp:Literal
                                    ID="litInformationBox_Version" runat="server" /><br />
                            <b>
                                <%= Resources.Blog_Admin.Blog_Preview_InformationBox_DateCreated%></b>: <asp:Literal
                                    ID="litInformationBox_DateCreated" runat="server" /><br />
                            <b>
                                <%= Resources.Blog_Admin.Blog_Preview_InformationBox_Author%></b>: <asp:Literal ID="litInformationBox_AuthorName"
                                    runat="server" /><br />
                            <b>
                                <%= Resources.Blog_Admin.Blog_Preview_InformationBox_Category%></b>: <asp:Literal
                                    ID="litInformationBox_Category" runat="server" /><br />
                            <b>
                                <%= Resources.Blog_Admin.Blog_Preview_InformationBox_Status%></b>: <asp:Literal ID="litInformationBox_Status"
                                    runat="server" /><br />
                            <div id="divInformationBox_PublicationDate" runat="server" visible="false">
                                <b>
                                    <%= Resources.Blog_Admin.Blog_Preview_InformationBox_PublicationDate%></b>:
                                <asp:Literal ID="litInformationBox_PublicationDate" runat="server" />
                            </div>
                            <div id="divInformationBox_ExpirationDate" runat="server" visible="false">
                                <b>
                                    <%= Resources.Blog_Admin.Blog_Preview_InformationBox_ExpirationDate%></b>: <asp:Literal
                                        ID="litInformationBox_ExpirationDate" runat="server" />
                            </div>
                            <div id="divInformationBox_Summary" runat="server" visible="false">
                                <b>
                                    <%= Resources.Blog_Admin.Blog_Preview_InformationBox_Summary%></b>:<br />
                                <asp:Literal ID="litInformationBox_Summary" runat="server" /></div>
                        </fieldset>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <hr />
                        <br />
                        <div class="divModuleDetail">
                            <div class="floatL moduleLargeTitle">
                                <asp:Literal ID="litTitle" runat="server" />
                            </div>
                            <br class="cBoth" />
                            <div class="Date">
                                <i><asp:Literal ID="litBlogDate" runat="server" /></i></div>
                            <br class="cBoth" />
                            <div class="item">
                                <asp:Literal ID="litBody" runat="server" /><br />
                            </div>
                            <br />
                            <div class="floatL">
                                <%=Resources.Blog_Admin.Blog_Preview_PostedBy%>:<asp:Literal ID="litPostedBy" runat="server" />
                                - <asp:Literal ID="litViewDate" runat="server" />
                                <%=Resources.Blog_Admin.Blog_Preview_PostedBy_DateTimeSeperator%>
                                <asp:Literal ID="litViewDateTime" runat="server" /></div>
                            <div id="divModuleSearchTagList" runat="server" class="divModuleSearchTagList" visible="false">
                                <br />
                                <%=Resources.Blog_Admin.Blog_Preview_SearchTagLabel%>:
                                <asp:Repeater ID="rptSearchTags" runat="server">
                                    <ItemTemplate>
                                        <a href='#'>
                                            <%# Eval("searchTagName") %></a>
                                    </ItemTemplate>
                                    <SeparatorTemplate>
                                        ,
                                    </SeparatorTemplate>
                                </asp:Repeater>
                            </div>
                            <br class="cBoth" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <hr />
                        <br />
                        <br />
                        <asp:Button ID="btnRollBack" runat="server" Text="<%$ Resources:Blog_Admin, Blog_Preview_ButtonRollback %>"
                            OnClick="btnRollBack_OnClick" />
                        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:Blog_Admin, Blog_Preview_ButtonCancel %>" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlConfirmation" Visible="false">
        <table>
            <tr>
                <td>
                    <span class="pageTitle">
                        <%=Resources.Blog_Admin.Blog_Preview_RollBackComplete_Heading%></span><br />
                    <span class="callout">
                        <%=Resources.Blog_Admin.Blog_Preview_RollBackComplete_Body%></span><br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnClose" runat="server" Text="<%$ Resources:Blog_Admin, Blog_Preview_ButtonClose %>" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
