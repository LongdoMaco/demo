<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="phonghocham.aspx.cs" Inherits="Admin_nhansu_phonghocham" Title="Phong học hàm" %>

<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" style="width: 100%">
        <tr>
            <td style="height: 30px; text-align: center;" colspan="2">
                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="height: 30px; text-align: center;" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 30px; width: 438px">
                CHỌN ĐƠN VỊ :<asp:DropDownList ID="ddlDonVi" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" Width="300px">
                </asp:DropDownList>
                                </td>
                                <td style="height: 30px">
                                    Chọn Nhân Viên :<asp:DropDownList ID="ddlNhanVien" runat="server" 
                    AutoPostBack="True" Width="300px" onselectedindexchanged="ddlNhanVien_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 438px">
                Danh Hiệu :</td>
            <td>
                <asp:DropDownList ID="ddlDanhHieu" runat="server" Width="300px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 438px">
                Năm :</td>
            <td>
                <asp:TextBox ID="txtNam" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 438px">
                Quốc Gia Phòng Danh Hiệu :</td>
            <td>
                                    <asp:DropDownList ID="ddlquocgia" runat="server" Width="300px">
                                    </asp:DropDownList>
            </td>
        </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;Bạn Đang Xem Thông Tin Của :&nbsp;
                <asp:Label ID="lblThongTin" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    Width="100%" AutoGenerateColumns="False" style="text-align: center">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbitem" runat="server" />
                            </ItemTemplate>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                    oncheckedchanged="cbheader_CheckedChanged" />
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HOVATEN" HeaderText="Họ và Tên" />
                        <asp:BoundField DataField="HAMDANHHIEU" HeaderText="Danh Học Hàm" />
                        <asp:BoundField DataField="TENQUOCGIA" HeaderText="Tên Quốc Gia Phong" />
                        <asp:BoundField DataField="NAM" HeaderText="Năm Được Phong" />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtEdit" runat="server" onclick="lbtEdit_Click" Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#21abfa" Font-Bold="True" ForeColor="#21abfa" />
                    <PagerStyle CssClass="headergrid" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#ffffff" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#21abfa" CssClass="headergrid" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#fffffff" />
                    <EmptyDataTemplate>
                        <b>Chưa Có Dữ Liệu </b>
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnThemMoi" runat="server" Text="Thêm Mới" 
                    onclick="btnThemMoi_Click" />
                <asp:Button ID="btnluusua" runat="server" Text="Lưu Sửa" 
                    onclick="btnluusua_Click" />
                <asp:Button ID="bntXoa" runat="server" Text="Xóa" onclick="bntXoa_Click" 
                    onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" />
                <br />
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

