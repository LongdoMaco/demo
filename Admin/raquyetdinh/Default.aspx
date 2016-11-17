<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_raquyetdinh_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
        <tr>
            <td>
                <a href="../bonhiem/Default.aspx">Hỗ trợ Bổ nhiệm Viên chức </a></td>
            <td>
               <a href = tuyendung.aspx >Hỗ trợ Tuyển dụng Viên chức</a></td>
        </tr>
    </table>
</asp:Content>

