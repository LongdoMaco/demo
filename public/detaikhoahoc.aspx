<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterpagePublic.master" AutoEventWireup="true" CodeFile="detaikhoahoc.aspx.cs" Inherits="public_detaikhoahoc" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            width: 310px;
        }
        .style4
        {
            width: 44px;
        }
        .style5
        {
            color: #0000FF;
            }
        .style6
        {
        }
        #box
        {
       
         padding:1px;
        
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
            <table class="style1">
                <tr>
                    <td class="style2">
                        Danh Mục Đề Tài :</td>
                    <td class="style3">
                        <asp:DropDownList ID="ddlDmdetai" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddlDmdetai_SelectedIndexChanged" Width="300px">
                        </asp:DropDownList>
                    </td>
                    <td class="style4">
                        Năm :</td>
                    <td>
                        <asp:DropDownList ID="ddlNam" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddlNam_SelectedIndexChanged" Width="75px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2" colspan="4">
                        <asp:DataList ID="DataList1" runat="server" Width="100%">
                            <ItemTemplate>
                            <div id="box">&nbsp;<table class="style1" cellpadding="3" style="border: 1px solid #CCCCCC" 
                                    width="100%">
                                    <tr>
                                        <td class="style5" colspan="2">
                                            Tên đề tài :&nbsp;&nbsp;
                                            <asp:Label ID="Label1" runat="server" style="color: #000000" 
                                                Text='<%# Eval("TenDeTai") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6" colspan="2">
                                            <span class="style5">Mục Tiêu</span> :
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("MUCTIEU") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            Chủ nhiệm đề tài :<asp:Label ID="Label3" runat="server" style="color: #663300" 
                                                Text='<%# Eval("HoVaTen") %>'></asp:Label>
                                        </td>
                                        <td style="text-align: right">
                                            Mã số :<asp:Label ID="Label4" runat="server" style="color: #FF3300" 
                                                Text='<%# Eval("MADETAI") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

    
    


    </asp:Content>

