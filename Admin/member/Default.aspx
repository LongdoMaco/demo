<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_member_Default" Title="Quản lí thành viên" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
     
     
   <table width="100%">
        <tr>
            <th colspan="3">
                Chức năng chính</th>
            <th style="text-align:right  ">
               &nbsp;</th>
        </tr>
        <tr>
            <td  >
                <img alt="" src="../../Image/Icons/user.png" 
                    style="width: 40px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink2" 
                    runat="server" NavigateUrl="~/Admin/member/them.aspx">Thêm người dùng</asp:HyperLink>
                <br />
            </td>
            <td >
                <img alt="" src="../../Image/Icons/bonhiemngach.png" 
                    style="width: 66px; height: 76px" /><br />
                <asp:HyperLink ID="HyperLink3" 
                    runat="server" NavigateUrl="~/Admin/member/dsmodule.aspx">Thêm module</asp:HyperLink>
            </td>
            <td  >
                <br />
                <img alt="" src="../../Image/Icons/daotao.png" 
                    style="width: 84px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink4" 
                    runat="server" NavigateUrl="~/Admin/member/dsquyen.aspx">Thêm quyền hạn</asp:HyperLink>
            </td>
            <td >
                <br />
                <img alt="" src="../../Image/Icons/congtac.png" 
                    style="width: 105px; height: 83px" /><br />
                <asp:HyperLink ID="HyperLink13" 
                    runat="server" NavigateUrl="~/Admin/member/help.aspx">Hướng dẫn sử dụng</asp:HyperLink>
            </td>
        </tr>
        </table>
        
</asp:Content>
