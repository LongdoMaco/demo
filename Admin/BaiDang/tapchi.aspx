<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="tapchi.aspx.cs" Inherits="Admin_BaiDang_TapChi" Title="Untitled Page"  ValidateRequest="false"%>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>



<%@ Register src="UserControl/menu.ascx" tagname="menu" tagprefix="uc2" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" style="width: 100%; " cellspacing="10">
    <tr>
        <td style="height: 23px; " colspan="2">
            <uc2:menu ID="menu1" runat="server" />
        </td>
    </tr>
    <tr>
        <td style="height: 23px; width: 155px">
            <b>Tiêu đề :</b></td>
        <td style="height: 23px">
            <asp:TextBox ID="txtTieude" runat="server" Width="500px"></asp:TextBox>
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
                <asp:TextBox ID="txttrichdan" runat="server" Height="111px" 
                    TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
    </tr>
    <tr>
        <td style="width: 155px">
            <b>Nội dung:</b></td>
        <td>
        <FCKeditorV2:FCKeditor ID="txtNoidung" runat="server" BasePath="~/fckeditor/" 
                Height="300px"  >
        </FCKeditorV2:FCKeditor>
    
       
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
            <asp:Button ID="btnDang" runat="server" Text="Đăng" onclick="btnDang_Click" 
                Visible="False" />
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
                CellPadding="4" Width="100%" AllowPaging="True" 
                onpageindexchanging="GridView1_PageIndexChanging" 
                onrowdatabound="GridView1_RowDataBound" ForeColor="#333333" 
                GridLines="None">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="15px" >
<ItemStyle Width="15px"></ItemStyle>
                    </asp:BoundField>
                       <asp:BoundField DataField="TENDANGNHAP" HeaderText="Người Đăng" />
                    <asp:BoundField DataField="TIEUDE" HeaderText="Tiêu Đề" />
                    <asp:BoundField DataField="LOAI" HeaderText="LOẠI" />
                    <asp:BoundField DataField="NGAYDANG" HeaderText="Ngày Đăng" 
                        ItemStyle-Width="30px" >
<ItemStyle Width="30px"></ItemStyle>
                    </asp:BoundField>
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
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    <b>Chưa có tạp chí nào cả</b>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </td>
    </tr>
</table>
    </asp:Content>

