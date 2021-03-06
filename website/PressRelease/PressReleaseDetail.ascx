<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PressReleaseDetail.ascx.vb"
    Inherits="PressRelease_PressReleaseDetail" %>
<%@ Register TagPrefix="uc" TagName="CommentsModule" Src="~/UserController/CommentsModule.ascx" %>
<div class="divModuleDetail">
    <div class="floatL moduleLargeTitle">
        <asp:Literal ID="litTitle" runat="server" />
    </div>
    <div id="divEditPressRelease" runat="server" class="leftPad floatL" visible="false">
        <a class="aModuleEdit" href="SavePressRelease.aspx?id=<%= Request.Params("id") %>">
            <img src="/images/icon_edit.gif" alt="edit" /></a>
    </div>
    <br class="cBoth" />
    <div class="Date">
        <i><asp:Literal ID="litPressReleaseDate" runat="server" /> </i>
    </div>
    <div class="item">
        <asp:Literal ID="litBody" runat="server" />
        <br />
        <br />
        <div class="floatL">
            <%=Resources.PressRelease_FrontEnd.PressRelease_PressReleaseDetail_PostedBy%>: <asp:Literal
                ID="litPostedBy" runat="server" /> - <asp:Literal ID="litViewDate" runat="server" />
            <%=Resources.PressRelease_FrontEnd.PressRelease_PressReleaseDetail_PostedBy_DateTimeSeperator%>
            <asp:Literal ID="litViewDateTime" runat="server" /></div>
        <div id="divModuleSearchTagList" runat="server" class="divModuleSearchTagList" visible="false">
            <br />
            <%=Resources.PressRelease_FrontEnd.PressRelease_PressReleaseDetail_SearchTagLabel%>:
            <asp:Repeater ID="rptSearchTags" runat="server">
                <ItemTemplate>
                    <a href='<%# "Default.aspx?sTag=" & Eval("searchTagName") & If(request.querystring("archive") = 1, "&archive=1","") %>'>
                        <%# Eval("searchTagName") %></a>
                </ItemTemplate>
                <SeparatorTemplate>
                    ,
                </SeparatorTemplate>
            </asp:Repeater>
        </div>
        <br />
        <br />
        <uc:CommentsModule ID="ucCommentsModule" runat="server" />
        <asp:PlaceHolder ID="plcAddThis" runat="server" Visible="false">
            <br />
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style">
                <a href="http://www.addthis.com/bookmark.php" class="addthis_button" style="text-decoration: none"
                    addthis:url="http://<%=Request.ServerVariables("http_host") %><%=Request.Path.toString() %>?id=<%# Request.Params("id") %>">
                    <img src="http://s7.addthis.com/static/btn/v2/lg-bookmark-en.gif" width="125" height="16"
                        border="0" alt="Share" /></a>
            </div>
            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4bbf57a32e8aa403"></script>
            <!-- AddThis Button END -->
        </asp:PlaceHolder>
    </div>
    <br class="cBoth" />
</div>
