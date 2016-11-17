<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>        
        .image
        {
            height:74px;
            width :40px;
            
        }
        .tdpanel
        {
          	
          height :40px;
          text-align :left ;
        }
        .auto-style1 {
            width: 70px;
            height: 69px;
        }
    </style>    
   <table width="100%">
        <tr>
            <th colspan="3">
                Thông tin hệ thống</th>
            <th style="text-align:right  ">
               <a href ="" ><img alt="Help" src="../Image/Icons/help-small.png" 
                    style="width: 16px; height: 16px;border :0;" /></a> </th>
        </tr>
        <tr>
            <td style ="tdpanel" >
                <img alt="" src="../Image/lichtuan/lichtuan.gif" class="auto-style1" /><br />
                <asp:HyperLink ID="HyperLink2" 
                    runat="server" NavigateUrl="~/Admin/lichtuan/lichtuan.aspx">Lịch tuần</asp:HyperLink>
                <br />
            </td>
            <td style ="tdpanel">
                <br />
                <img alt="" src="../Image/Icons/help.png" 
                    style="width: 40px; height: 83px" /><asp:HyperLink ID="HyperLink3" 
                    runat="server" NavigateUrl="~/Admin/info.aspx">Giới thiệu hệ thống</asp:HyperLink>
            </td>
            <td  style ="tdpanel">
                <br />
                <img alt="" src="../Image/Icons/user.png" style="width: 29px; height: 81px" /><asp:HyperLink 
                    ID="HyperLink15" runat="server" NavigateUrl="~/Admin/nhansu/timkiem.aspx">Tìm 
                kiếm</asp:HyperLink>
            </td>
            <td style ="tdpanel">
                <br />
                <asp:HyperLink ID="HyperLink14" runat="server" 
                    NavigateUrl="~/Admin/contact.aspx">Liên hệ</asp:HyperLink>
                <img alt="" src="../Image/Icons/help.png" 
                    style="width: 40px; height: 83px" /></td>
        </tr>
        </table>
    <table width="100%">
        <tr>
            <th colspan="4">
                Dạnh mục các chức năng</th>
        </tr>
       
        <tr>
            <td>
                &nbsp;<img alt="" src="../Image/Icons/user.png" style="width: 29px; height: 81px" /><asp:HyperLink 
                    ID="HyperLink9" runat="server" NavigateUrl="~/Admin/nhansu/Default.aspx">Quản 
                lý nhân sự</asp:HyperLink>
            </td>
            <td>
                &nbsp;<img alt="" src="../Image/Icons/help.png" 
                    style="width: 40px; height: 83px" /><asp:HyperLink ID="HyperLink8" 
                    runat="server" NavigateUrl="~/Admin/Taichinh/Default.aspx">Quản lý tiền lương</asp:HyperLink>
            </td>
            <td>
                <img alt="" src="../Image/Icons/help.png" 
                    style="width: 40px; height: 83px" /><asp:HyperLink ID="HyperLink10" 
                    runat="server" NavigateUrl="~/Admin/nckh/kh_tm.aspx">Quản lý khoa học</asp:HyperLink>
&nbsp;</td>
            <td>
                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="~/Admin/khenthuong/kttapthe.aspx">Quản lý khen thưởng</asp:HyperLink>
                <img alt="" src="../Image/Icons/help.png" 
                    style="width: 40px; height: 83px" /></td>
        </tr>
        <tr>
            <td>
                &nbsp;<img alt="" src="../Image/Icons/contacts.png" style="width: 47px; height: 84px" />
                    <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/Admin/BaiDang/Default.aspx">Quản lý bài đăng</asp:HyperLink>
            </td>
            <td>
                <img alt="" src="../Image/Icons/help.png" 
                    style="width: 40px; height: 83px" />
                
                <asp:HyperLink ID="hplcongvan" runat="server" NavigateUrl="~/Admin/congvan/Default.aspx">Quản lý công văn</asp:HyperLink>
                </td>
            <td>
                &nbsp;<img alt="" src="../Image/Icons/help.png" 
                    style="width: 40px; height: 83px" />
            <asp:HyperLink ID="hotroquyetdinh" runat="server" NavigateUrl="~/Admin/raquyetdinh/Default.aspx">Hỗ trợ quyết định</asp:HyperLink>
            </td>
            <td>
                <img alt="" src="../Image/Icons/download.png" style="width: 48px; height: 73px" />
            <asp:HyperLink ID="HyperLink4" 
                    runat="server" NavigateUrl="~/Admin/member/Default.aspx">Quản lý người 
                dùng</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    
</asp:Content>
