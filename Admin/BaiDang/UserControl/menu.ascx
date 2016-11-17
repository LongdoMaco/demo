<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu.ascx.cs" Inherits="Admin_BaiDang_UserControl_menu" %>
<div id="Main">
<div id="menu">
    <asp:Menu ID="Menu1" runat="server" DataSourceID="SiteMapDataSource1" 
        Orientation="Horizontal">
    </asp:Menu>
</div>
<div id="sitemap">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server" SiteMapProvider="w4">
    </asp:SiteMapPath>
</div>
<div style=" clear:both"/>
</div>
<asp:SiteMapDataSource ID="SiteMapDataSource1" SiteMapProvider="W4" runat="server" 
        ShowStartingNode="False" />
