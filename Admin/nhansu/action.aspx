<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="action.aspx.cs" Inherits="Admin_nhansu_action" Title="TRẠNG THÁI LÀM VIÊC CỦA NHÂN VIÊN" %>

<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" style="width: 100%">
        <tr>
            <td colspan="4" style="text-align: center">
                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <b>TRẠNG THÁI LÀM VIÊC CỦA NHÂN VIÊN </b>
            </td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b>Chọn đơn vị:</b></td>
            <td style="width: 253px">
                <asp:DropDownList ID="ddlDonVi" runat="server" AutoPostBack="True" 
                    Height="25px" onselectedindexchanged="ddlDonVi_SelectedIndexChanged" 
                    Width="300px">
                </asp:DropDownList>
            </td>
            <td style="width: 124px">
                Chọn nhân viên :</td>
            <td>
                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b>Trang thái :</b></td>
            <td style="width: 253px">
                <asp:DropDownList ID="ddlTrangThai" runat="server" Width="300px">
                </asp:DropDownList>
            </td>
            <td style="width: 124px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b>Ngày bắt đầu :</b></td>
            <td style="width: 253px">
                <asp:TextBox ID="txtngaybatdau" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td style="width: 124px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px" valign="top">
                <b>Ghi Chú :</b></td>
            <td colspan="3">
                <asp:TextBox ID="txtghichu" runat="server" Height="69px" TextMode="MultiLine" 
                    Width="636px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                Bạn đang xem thông tin nhân viên
                <asp:Label ID="lblnhanvien" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                         <asp:TemplateField HeaderText="Stt">
                            <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                        <asp:BoundField DataField="HOVATEN" HeaderText="Họ Và Tên " />
                        <asp:BoundField DataField="TRANGTHAI" HeaderText="Trạng Thái" />
                        <asp:BoundField DataField="NGAYBATDAU" HeaderText="Ngày Bắt Đầu " />
                        <asp:BoundField DataField="GHICHU" HeaderText="Ghi Chú" />
                        <asp:BoundField />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblEdit" runat="server" Text="Edit" onclick="lblEdit_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbitem" runat="server" />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("IDTHONGTIN") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        Chưa Có Thông Tin
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Button ID="bntCapNhat" runat="server" Text="Cập Nhật " 
                    onclick="bntCapNhat_Click" />
                <asp:Button ID="bntXoa" runat="server" Text="Xóa " Width="39px" OnClick="bntXoa_Click" />
                <br />
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

