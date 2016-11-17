<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="changepass.aspx.cs" Inherits="user_changepass" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="770" cellspacing="10" cellpadding="0" border="0" style="background-color: White;"> 
    <tbody>
    <tr>
        <td align="left" class="accoditionHeader" style="width: 100%;" colspan="2">
            <span id="ctl00_ContentPlaceHolder1_lblUser">Thay đổi thông tin cá nhân </span>&nbsp;</td>
    </tr>
    <tr>
        <td valign="top" align="left" style="border: 1px solid rgb(223, 223, 223); width: 50%; background-color: rgb(246, 246, 246);">
        <table width="100%" cellspacing="3" cellpadding="3" border="0">
            <tbody>
                <tr>
                    <td style="width: 30%;">Tên đăng nhâp:</td>
                    <td style="width: 70%;">&nbsp;<asp:textbox id="txtdangnhap" runat="server" width="171px"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%;">&nbsp;</td>
                    <td style="width: 70%;">&nbsp;<asp:button id="Button2" runat="server" onclick="Button2_Click"
                        text="Cập Nhật" enabled="False" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%;">Email:</td>
                    <td style="width: 70%;">
                        <asp:textbox id="txtemail" runat="server" width="171px"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%;">&nbsp;</td>
                    <td style="width: 70%;">
                        <asp:button id="Button3" runat="server" onclick="Button3_Click"
                            text="Cập Nhật" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 30%;">&nbsp;</td>
                    <td style="width: 70%;">
                        <asp:label id="lbltbdn" runat="server"></asp:label>
                    </td>
                </tr>
            </tbody>
        </table>
        
        
        </td>
        <td valign="top" align="left" style="border: 1px solid rgb(223, 223, 223); width: 50%; background-color: rgb(246, 246, 246);">
        <table width="100%" cellspacing="3" cellpadding="3" border="0">
            <tbody><tr>
                <td style="width: 30%;">Mật khẩu cũ</td>
                <td style="width: 70%;">
                    &nbsp;<asp:TextBox ID="txthientai" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 30%;">Mật khẩu mới:</td>
                <td style="width: 70%;">
                    &nbsp;<asp:TextBox ID="txtmoi" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">Nhập lại:</td>
                <td class="style10">
                    &nbsp;<asp:TextBox ID="txtnhaplai" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 30%;">&nbsp;</td>
                <td style="width: 70%;">
                    &nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Thay Đổi" />
                    <br />
                    <asp:Label ID="lbltb" runat="server" style="color: #FF0000"></asp:Label>
                </td>
            </tr>
        </tbody></table>
        </td>
    </tr>
    <td colspan="2" style=" height:180px" valign="top">
    
        <span class="style11">*</span>&nbsp; Lưu ý :nếu muốn thay đổi lại tên đăng nhập<br />
        &nbsp;Hãy liên hệ với admin để được cấp lại<br />
        <span class="style12">*</span> Nhập đúng định dạng email<br />
    
    </td>
</tbody></table>
    

</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

 
    <style type="text/css">
        .style9
        {
            width: 30%;
            height: 36px;
        }
        .style10
        {
            width: 70%;
            height: 36px;
        }
        .style11
        {
            color: #CC3300;
        }
        .style12
        {
            color: #FF3300;
        }
    </style>


</asp:Content>


