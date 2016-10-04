﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register TagPrefix="uc" TagName="LoginControl" Src="~/UserController/LoginControl.ascx" %>
<%@ Register TagPrefix="uc" TagName="BreadCrumbsControl" Src="~/UserController/BreadCrumbsControl.ascx" %>
<%@ Register Assembly="UltimateSearch" Namespace="Karamasoft.WebControls.UltimateSearch"
    TagPrefix="cc" %>
<%@ Register TagPrefix="uc" TagName="EventRepeaterShort" Src="~/Event/EventRepeaterShort.ascx" %>
<%@ Register TagPrefix="uc" TagName="PressReleaseRepeaterShort" Src="~/PressRelease/PressReleaseRepeaterShort.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="/css/siteStyleHome.css" rel="stylesheet" type="text/css" />
    <link href="/css/richtemplate_core.css" rel="stylesheet" type="text/css" />
    <link href="/css/RichTemplate_Module.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/scripts/iepngfix_tilebg.js"></script>
    <script language="JavaScript" src="/js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <!--[if IE 6]>
<link href="/css/IE6.css" rel="stylesheet" type="text/css" />
<link href="/Skins/RichTemplate/Menu.RichTemplate.IE6.css" rel="stylesheet" type="text/css" />
<![endif]-->
    <!--[if IE 7]>
<link href="/css/IE7.css" rel="stylesheet" type="text/css" />
<![endif]-->
    <!--[if IE 8]>
<link href="/css/IE8.css" rel="stylesheet" type="text/css" />
<![endif]-->
    <!--IE PNG Fixer-->
    <!--[if lt IE 7.]>
<script defer type="text/javascript" src="/scripts/pngfix.js"></script>
<![endif]-->
    <link href="/Skins/RichTemplate/Menu.RichTemplate.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        var pageLoaded = false;
        var isSearch = false;
        function itemOpening(sender, args) {
            if (!pageLoaded)
                args.set_cancel(true);
        }
        window.onload = function () {
            pageLoaded = true;
        }

        function SearchSite() {
            //alert('page here');

            if (isSearch == false) {
                return false;
            }
            else {
                isSearch = false;
                if (document.getElementById('q').value != '') {
                    document.location.href = '/Search.aspx?usterms=' + document.getElementById('q').value;
                }
                return false;
            }
        }

        $(document).ready(function () {
            var rdThreeColumnMenuExist = $('.ThreeColumnMenu');
            if ($(rdThreeColumnMenuExist.length) > 0) {
                var rdThreeColumnMenu = $(rdThreeColumnMenuExist).get(0);
                var listRmSlide = $(rdThreeColumnMenu).find('div.rmSlide');
                $(listRmSlide).each(function (index) {
                    var prevSiblingATag = $(this).prev();
                    if (prevSiblingATag.hasClass('1_col')) {
                        //$(this).css('cssText','left:-30px !Important;');
                        $(this).addClass('rmCol1');
                    }
                    else if (prevSiblingATag.hasClass('2_col')) {
                        //$(this).css('cssText','left:-140px !Important;');
                        $(this).addClass('rmCol2');
                    }
                    else {
                        //$(this).css('left','-220px'); $(this).css('cssText','left:-220px !Important;');
                        $(this).addClass('rmCol3');
                    }
                });
                var listRmGroupColumn = $(rdThreeColumnMenu).find('li.rmGroupColumn');
                $(listRmGroupColumn).each(function (index) {
                    var rmBlankSize = $(this).find('a.rmBlank').size();
                    if (rmBlankSize > 0) {
                        $(this).css('cssText', 'display:none !Important;');
                    }
                });
            }
        });
    </script>
</head>
<body id="body">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div id="topBanner">
            <div id="logo">
                <a href="<%= CommonWeb.GetCorporateUrl()%>">
                    <img height="39" border="0" width="187" alt="Logo" src="/images/SiteSpecificImages/siteLOGO.png" />
                </a>
            </div>
            <div id="topNav" runat="server" visible="false">
                <ul>
                    <asp:Repeater ID="rptHeader" runat="server">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <a id="aHeaderLink" runat="server">
                                    <asp:Literal ID="litHeaderLink" runat="server" /></a></li>
                        </ItemTemplate>
                        <SeparatorTemplate>
                            <li>|</li>
                        </SeparatorTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <uc:BreadCrumbsControl ID="ucBreadCrumbsControl" runat="server" Visible="false" />
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
        <div id="navigation">
            <div id="mainNav">
                <telerik:RadMenu ID="rmNavMenu" runat="server" OnItemDataBound="rmNavMenu_ItemBound"
                    Skin="RichTemplate" DataFieldID="ID" DataFieldParentID="ParentID" CausesValidation="false"
                    Visible="true" EnableEmbeddedSkins="false" Flow="horizontal">
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </telerik:RadMenu>
                <uc:LoginControl ID="ucLoginControl" runat="server" UseImages="false" Visible="false" />
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
        <div id="divHeaderHomeBanner" runat="server" class="headerHomeBanner" visible="false">
            <telerik:RadBinaryImage ID="radBannerImage" runat="server" Width="958px" Height="218px"
                AutoAdjustImageControlSize="false" Visible="false" />
        </div>
        <div id="divHeaderHomeText" runat="server" class="headerHomeTextLeft" visible="false">
            <asp:Literal ID="litBannerText" runat="server" />
        </div>
        <div id="mainContent" class="no_bg">
            <div id="homeContent" class="no_bg">
                <div id="homeColumnLeft">
                    <asp:Literal ID="litMainContent" runat="server" />
                </div>
                <div id="homeColumnRight">
                    <uc:PressReleaseRepeaterShort ID="ucPressReleaseRepeaterShort" runat="server" />
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div id="bottomRule">
            <img src="images/common/bottomPageRule.jpg" alt="null" width="100%" height="11" />
        </div>
        <div id="footer">
            <div id="footerContent">
                <br />
                <asp:Repeater ID="rptFooter" runat="server" Visible="false">
                    <ItemTemplate>
                        <a id="aFooterLink" runat="server">
                            <asp:Literal ID="litFooterLink" runat="server" /></a>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <%# If(Not Container.ItemIndex = 1, "&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;", "</p><p>")%>
                    </SeparatorTemplate>
                </asp:Repeater>
                <hr />
                <div class="copyright">
                    <p>
                        <%=Resources.WebInfo_FrontEnd.HomePage_Footer_Copyright_AllRightsReserved%>
                    |
                    <%= SiteDAL.GetCompanyName()%>
                    &copy;
                    <%=year(now)%>
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>