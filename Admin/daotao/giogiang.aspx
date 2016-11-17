<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="giogiang.aspx.cs" Inherits="Admin_daotao_giogiang" Title="Thêm giờ giảng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 15%;
            height: 30px;
        }
        .style4
        {
            height: 30px;
        }
        .style5
        {
            width: 15%;
            height: 50px;
        }
        .style6
        {
            width: 35%;
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
        <tr>
            <td style="width:15%">
                &nbsp;</td>
            <td style="width:35%">
                &nbsp;</td>
            <td style="width:15%">
                &nbsp;</td>
            <td style="width:35%">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width:15%">
                Chọn đơn vị :</td>
            <td style="width:35%">
                <asp:DropDownList ID="ddlDonVi" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" Width="80%">
                </asp:DropDownList>
            </td>
            <td style="width:15%">
                &nbsp;</td>
            <td style="width:35%">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                Nhân viên :</td>
            <td class="style6">
                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="80%" 
                    AutoPostBack="True" onselectedindexchanged="ddlNhanVien_SelectedIndexChanged">
                </asp:DropDownList>
&nbsp;<asp:LinkButton ID="lbtNhanVien" runat="server" onclick="lbtNhanVien_Click">New</asp:LinkButton>
            </td>
            <td class="style5">
                Năm học :</td>
            <td class="style6">
                <asp:DropDownList ID="ddlNamHoc" runat="server" Width="80%">
                </asp:DropDownList>
                <asp:LinkButton ID="lbtNamHoc" runat="server" onclick="lbtNamHoc_Click">New</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td style="width:15%">
                Môn học :</td>
            <td style="width:35%">
                <asp:DropDownList ID="ddlMonHoc" runat="server" Width="80%">
                </asp:DropDownList>
                <asp:LinkButton ID="lbtMonHoc" runat="server" onclick="lbtMonHoc_Click">New</asp:LinkButton>
            </td>
            <td style="width:15%">
                Học kỳ :</td>
            <td style="width:35%">
                <asp:DropDownList ID="ddHocKy" runat="server" Width="80%">
                </asp:DropDownList>
                <asp:LinkButton ID="lbtHocKy" runat="server" onclick="lbtHocKy_Click">New</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Giờ giảng :</td>
            <td class="style4" colspan="3">
                <asp:TextBox ID="txtGioGiang" runat="server" Width="50%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width:15%">
                <asp:Button ID="btnThemMoi" runat="server" onclick="btnThemMoi_Click" 
                    Text="Thêm Mới" />
            </td>
            <td style="width:35%">
                <asp:Label ID="lblMess" runat="server"></asp:Label>
            </td>
            <td style="width:15%">
                &nbsp;</td>
            <td style="width:35%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="gvDanhSach" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Left" 
                    Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nam" HeaderText="Năm học " />
                        <asp:BoundField DataField="HocKy" HeaderText="Học Kỳ" />
                        <asp:BoundField DataField="MonHoc" HeaderText="Môn Học" />
                        <asp:BoundField DataField="GioGiang" HeaderText="Giờ Giảng" />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtsua" runat="server" onclick="lbtsua_Click">Edit</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblXoa" runat="server" onclick="lblXoa_Click" 
                                    onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        Chưa có dữ liệu
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="btnSua" runat="server" Text="Lưu Sửa" onclick="btnSua_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

