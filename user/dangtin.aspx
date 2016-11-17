<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="dangtin.aspx.cs" Inherits="Admin_tintuc_dangtin" Title="Untitled Page" ValidateRequest="false" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" cellpadding="5" cellspacing="3" style="border: 1px dotted #CCCCCC; width: 100%" 
        width="100%">
        <tr>
            <td style="border: 1px solid #CCCCCC; text-align: center;" colspan="2">
                <b>Đăng Tin Tức &nbsp;</b></td>
        </tr>
        <tr>
            <td style="width: 509px">
                Tiêu Đề
            </td>
            <td>
                <asp:TextBox ID="txtTieuDe" runat="server" Width="600px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 509px">
                Tác giả :</td>
            <td>
                <asp:TextBox ID="txttacgia" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 509px">
                Ngày bản tin :</td>
            <td>
                <asp:TextBox ID="NgayBanTin" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 509px">
                Nguồn tin :</td>
            <td>
                <asp:TextBox ID="txtNguonTin" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 509px">
                Chuyên đề :</td>
            <td>
                <asp:DropDownList ID="ddlchuyende" runat="server" Width="300px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 509px">
                Từ khóa
            </td>
            <td>
                <asp:TextBox ID="txtTuKhoa" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 509px">
                Ảnh Đại Diện</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 509px">
                Trích Dẫn :</td>
            <td>
                <asp:TextBox ID="txttrichdan" runat="server" Height="110px" 
                    TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 509px">
                Nội Dung :</td>
            <td>
        <FCKeditorV2:FCKeditor ID="txtNoidung" runat="server" BasePath="~/fckeditor/" 
                    Height="300px"  >
        </FCKeditorV2:FCKeditor>
    
       
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnDang" runat="server" onclick="btnDang_Click" 
                    Text="Đăng Bài" />
                <asp:Button ID="btreset" runat="server" Text="Làm Lại" />
                <br />
                <asp:Label ID="Label1" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

