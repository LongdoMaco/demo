<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="tapchi.aspx.cs" Inherits="user_tapchi" Title="Untitled Page" ValidateRequest="false" %>
<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="770" cellspacing="10" cellpadding="0" border="0" style="background-color: White;"> 
    <tbody><tr>
        <td align="left" class="accoditionHeader" style="width: 100%;"> 
            &nbsp;<asp:HyperLink ID="HyperLink1" runat="server">Đăng Tạp Chí</asp:HyperLink>
            &nbsp;|<asp:HyperLink ID="HyperLink2" runat="server">Danh Sách Tạp Chí Đã Đăng</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" 
            style="border: 1px solid rgb(223, 223, 223); background-color: rgb(246, 246, 246);">
           
        
        
                <table bgcolor="White" style="width: 100%; " cellspacing="10">
    <tr>
        <td style="height: 23px; width: 155px">
            <b>Tiêu đề :</b></td>
        <td style="height: 23px">
            <asp:TextBox ID="txtTieude" runat="server" Width="500px" MaxLength="100"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 155px">
            <b>Thuộc loại :</b></td>
        <td>
            <asp:DropDownList ID="ddlLoai" runat="server" Width="300px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style12">
            <b>Nước :</b></td>
        <td>
            <asp:DropDownList ID="ddlQuocTich" runat="server" Width="300px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style8">
            Đăng tải :</td>
        <td class="style11">
            <asp:TextBox ID="txtDangTai" runat="server" Width="500px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style9">
            <b>Tóm tắt</b></td>
        <td class="style10">
                <ftb:freetextbox ID="txttrichdan" runat="server" Height="150px" 
                    ImageGalleryPath="~/Image/imagetapchi/" 
                    ToolbarLayout="ToolbarLayout=&quot; EditStyle&quot; SupportFolder=&quot;../aspnet_client/FreeTextBox/&quot; ImageGalleryPath=&quot;/Image/imagetapchi/&quot;" 
                    Width="500px">
                </ftb:freetextbox>
            </td>
    </tr>
    <tr>
        <td style="width: 155px">
            <b>Nội dung:</b></td>
        <td>
                <ftb:freetextbox ID="txtNoidung" runat="server" Height="220px" 
                    ImageGalleryPath="~/Image/imagetapchi/" 
                    ToolbarLayout="ToolbarLayout=&quot;ParagraphMenu, FontFacesMenu, FontSizesMenu, FontForeColorsMenu, bold,italic,underline, bulletedlist, numberedlist|;Superscript, Subscript, CreateLink, Unlink, RemoveFormat, JustifyLeft, JustifyRight, JustifyCenter, JustifyFull, Indent, Outdent, Cut, Copy|;Paste, Delete, Undo, Redo, Print, SymbolsMenu, InsertHtmlMenu, InsertRule, InsertDate,InsertImage, InsertTime, WordClean,; InsertTable, EditTable, InsertTableRowBefore, InsertTableRowAfter, DeleteTableRow, InsertTableColumnBefore, InsertTableColumnAfter,Delete, DeleteTableColumn, InsertForm, InsertForm, Preview;| InsertTextBox, InsertTextArea, InsertRadioButton, InsertCheckBox, InsertDropDownList, InsertButton, InsertDiv, InsertImageFromGallery, SelectAll, EditStyle&quot; SupportFolder=&quot;../aspnet_client/FreeTextBox/&quot; ImageGalleryPath=&quot;/Image/imagetapchic/&quot;" 
                    Width="500px">
                </ftb:freetextbox>
            </td>
    </tr>
    <tr>
        <td style="width: 155px">
            <b>Ảnh Bìa</b></td>
        <td>
            <asp:FileUpload ID="AnhBia" runat="server" Width="217px" />
        </td>
    </tr>
    <tr>
        <td style="width: 155px">
            <b>File đính kèm</b></td>
        <td>
            <asp:FileUpload ID="fuldinhkem" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 155px">
            &nbsp;</td>
        <td>
            <asp:Button ID="btnDang" runat="server" Text="Đăng" onclick="btnDang_Click" />
            &nbsp;
            <asp:Button ID="Button2" runat="server" Text="Cập Nhật" 
                onclick="Button2_Click" />
            &nbsp;<br />
            <asp:Label ID="Label1" runat="server" style="color: #FF3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" Width="100%" AllowPaging="True" 
                onpageindexchanging="GridView1_PageIndexChanging">
                <RowStyle BackColor="White" ForeColor="#330099" />
                <Columns>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="TIEUDE" HeaderText="Tiêu Đề" />
                    <asp:BoundField DataField="LOAI" HeaderText="LOẠI" />
                    <asp:BoundField DataField="NGAYDANG" HeaderText="Ngày Đăng" />
                    <asp:TemplateField HeaderText="Xóa">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                                onclientclick="return confirm(&quot;Bạn có muốn xóa nó không ?&quot;);">Xóa</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sửa">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Sửa</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    <b>Chưa có tạp chí nào cả</b>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            </asp:GridView>
        </td>
    </tr>
</table>
           
        
        
        </td>
    </tr>
</tbody></table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

 
    <style type="text/css">
        .style8
        {
            width: 155px;
            font-weight: bold;
            height: 31px;
        }
        .style9
        {
            width: 155px;
            height: 44px;
        }
        .style10
        {
            height: 44px;
        }
        .style11
        {
            height: 31px;
        }
        .style12
        {
            width: 155px;
        }
    </style>


</asp:Content>


