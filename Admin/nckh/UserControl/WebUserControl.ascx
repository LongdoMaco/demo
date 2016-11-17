<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="Admin_nhansu_UserControl_WebUserControl" %>
<style type="text/css">
    .style1
    {
width: 100%;
background: #fff url(../../../App_Themes/usertheme/images/Title_bg.jpg);
line-height:inherit
height:auto
border: 1px solid #CCC;
margin: 0px 0px 0px 0px;

font-weight:bold;
 
    }
    A:link {text-decoration: none; color: blue }
A:visited {text-decoration: none; color: blue }
A:hover { text-decoration: none; color: blue }

</style>
<table class="style1">
    <tr>
        <td>
            <asp:HyperLink  ID="HyperLink1" runat="server" 
                NavigateUrl="~/Admin/nckh/kh_tm.aspx">Đề Tài Thuyết Minh</asp:HyperLink>
&nbsp;|
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="~/Admin/nckh/ad_kh_dvphoihop.aspx">Đơn Vị Phối Hợp</asp:HyperLink>
&nbsp;|
            <asp:HyperLink ID="HyperLink3" runat="server" 
                NavigateUrl="~/Admin/nckh/kh_nhiemvu.aspx">Nhiệm Vụ</asp:HyperLink>
            &nbsp;&nbsp;<br />
        </td>
    </tr>
    </table>

