<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="quantrinoidung.aspx.cs" Inherits="Admin_tintuc_quantrinoidung" Title="Untitled Page" ValidateRequest="false" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" cellpadding="5" cellspacing="3" style="width: 100%">
        <tr>
            <td colspan="2" style="text-align: center">
                <b>TRANG QUẢN TRỊ TIN TỨC</b></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; height: 169px;">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" Width="100%" AutoGenerateColumns="False" 
                    AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                    oncheckedchanged="cbheader_CheckedChanged" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbitem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TIEUDE" HeaderText="Tiêu Đề" />
                        <asp:BoundField DataField="TacGia" HeaderText="Tác Giả" />
                        <asp:BoundField DataField="NgayBanTin" HeaderText="Ngày Bản Tin" />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="btlEidt" runat="server" onclick="btlEidt_Click" Text="Sửa"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("BanTinID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <b>Chưa có bài nào cả</b>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Xóa" />
                <br />
                <asp:Label ID="btnthongbao" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Tiêu Đề             </td>
            <td>
                <asp:TextBox ID="txtTieuDe" runat="server" Width="500px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Trích Dẫn :</td>
            <td>
                <FTB:FreeTextBox ID="txttrichdan" runat="server" Height="150px" 
                    ImageGalleryPath="~/Image/imagetintuc/" 
                    ToolbarLayout="ToolbarLayout=&quot;ParagraphMenu, FontFacesMenu, FontSizesMenu, FontForeColorsMenu, bold,italic,underline, bulletedlist, numberedlist|;Superscript, Subscript, CreateLink, Unlink, RemoveFormat, JustifyLeft, JustifyRight, JustifyCenter, JustifyFull, Indent, Outdent, Cut, Copy|;Paste, Delete, Undo, Redo, Print, SymbolsMenu, InsertHtmlMenu, InsertRule, InsertDate,InsertImage, InsertTime, WordClean,; InsertTable, EditTable, InsertTableRowBefore, InsertTableRowAfter, DeleteTableRow, InsertTableColumnBefore, InsertTableColumnAfter,Delete, DeleteTableColumn, InsertForm, InsertForm, Preview;| InsertTextBox, InsertTextArea, InsertRadioButton, InsertCheckBox, InsertDropDownList, InsertButton, InsertDiv, InsertImageFromGallery, SelectAll, EditStyle&quot; SupportFolder=&quot;../aspnet_client/FreeTextBox/&quot; ImageGalleryPath=&quot;/Image/imagetintuc/&quot;" 
                    Width="100%">
                </FTB:FreeTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Ảnh Đại Diện :</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Nội Dung :</td>
            <td>
                <FTB:FreeTextBox ID="txtNoidung" runat="server" Height="220px" 
                    ImageGalleryPath="~/Image/imagetintuc/" 
                    ToolbarLayout="ToolbarLayout=&quot;ParagraphMenu, FontFacesMenu, FontSizesMenu, FontForeColorsMenu, bold,italic,underline, bulletedlist, numberedlist|;Superscript, Subscript, CreateLink, Unlink, RemoveFormat, JustifyLeft, JustifyRight, JustifyCenter, JustifyFull, Indent, Outdent, Cut, Copy|;Paste, Delete, Undo, Redo, Print, SymbolsMenu, InsertHtmlMenu, InsertRule, InsertDate,InsertImage, InsertTime, WordClean,; InsertTable, EditTable, InsertTableRowBefore, InsertTableRowAfter, DeleteTableRow, InsertTableColumnBefore, InsertTableColumnAfter,Delete, DeleteTableColumn, InsertForm, InsertForm, Preview;| InsertTextBox, InsertTextArea, InsertRadioButton, InsertCheckBox, InsertDropDownList, InsertButton, InsertDiv, InsertImageFromGallery, SelectAll, EditStyle&quot; SupportFolder=&quot;../aspnet_client/FreeTextBox/&quot; ImageGalleryPath=&quot;/Image/imagetintuc/&quot;" 
                    Width="100%">
                </FTB:FreeTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Tác Giả :</td>
            <td>
                <asp:TextBox ID="txttacgia" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Ngày Bản Tin :</td>
            
            <td>
              
                <asp:TextBox ID="NgayBanTin" runat="server" Width="300px"></asp:TextBox>
                
     
            </td>
        </tr>
      
        <tr>
            <td style="width: 163px">
                Nguồn Tin :</td>
            <td>
                <asp:TextBox ID="txtNguonTin" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Chuyên Đề :</td>
            <td>
                <asp:DropDownList ID="ddlchuyende" runat="server" Width="300px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Từ Khóa
            </td>
            <td>
                <asp:TextBox ID="txttukhoa" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="bntCapNhat" runat="server" 
                    Text="Cập Nhật" onclick="bntCapNhat_Click" />
                <asp:Button ID="btnxoa" runat="server" Text="Xóa" onclick="btnxoa_Click" 
                    onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" />
                <br />
                <asp:Label ID="Label1" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

