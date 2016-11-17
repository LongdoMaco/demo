<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="TamUng.aspx.cs" Inherits="Admin_Taichinh_TamUng" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                Chọn Đợn Vị
            </td>
            <td>
                <asp:DropDownList ID="ddlDonVi" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" Width="300px">
                </asp:DropDownList>
            </td>
            <td>
                Chọn Nhân Viên
            </td>
            <td>
                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="300px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Số tiền ứng</td>
            <td>
                <asp:TextBox ID="txttienung" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Trả mỗi tháng</td>
            <td>
                <asp:TextBox ID="txttramoithang" runat="server" Width="300px"></asp:TextBox>
            &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Ngày ứng</td>
            <td>
            
                <asp:TextBox ID="txtngayung" runat="server" Width="300px" MaxLength="10"></asp:TextBox>
            &nbsp;*</td>
            <td>
                (01/01/1990)</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Tạm Ứng" 
                    Width="60px" />
                <asp:Label ID="lblThongBao" runat="server"></asp:Label>
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Cập Nhật" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" Width="100%" AutoGenerateColumns="False">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="HOVATEN" HeaderText="Họ Và Tên" />
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DONVI" HeaderText="Đơn Vị" />
                        <asp:BoundField DataField="TONGTIEN" HeaderText="Tổng Tiền" />
                        <asp:BoundField DataField="SOTIENTRA" HeaderText="Trả Mỗi Tháng" />
                        <asp:BoundField DataField="NGAYTAMUNG" HeaderText="Ngày Tạm Ứng" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Sửa</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtxoa" runat="server" onclick="lbtxoa_Click">Xóa</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

