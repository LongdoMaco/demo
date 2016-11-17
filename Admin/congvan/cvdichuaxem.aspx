<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"
    AutoEventWireup="true" CodeFile="cvdichuaxem.aspx.cs" Inherits="Admin_congvan_cvdichuaxem" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="usercontrol/Menu.ascx" TagName="Menu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style2">
        <tr>
            <td colspan="6">
                <uc1:Menu ID="Menu1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 16%">
                Chọn loại CV
            </td>
            <td style="width: 16%">
                <asp:DropDownList ID="ddlLoaiCV" runat="server" Font-Size="Small" Font-Names="Times New Roman"
                    AutoPostBack="True" Width="100%" OnSelectedIndexChanged="ddlLoaiCV_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="width: 16%">
                Chọn CQBH
            </td>
            <td style="width: 16%">
                <asp:DropDownList ID="ddlCQBH" runat="server" Font-Size="Small" Font-Names="Times New Roman"
                    AutoPostBack="True" Width="100%" OnSelectedIndexChanged="ddlCQBH_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="width: 16%">
                Chọn mã CV
            </td>
            <td style="width: 16%">
                <asp:DropDownList ID="dlMacv" runat="server" Font-Size="Small" Font-Names="Times New Roman"
                    AutoPostBack="True" Width="100%" OnSelectedIndexChanged="dlMacv_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 16%">
                &nbsp;
            </td>
            <td style="width: 16%">
                &nbsp;
            </td>
            <td style="width: 16%">
                &nbsp;
            </td>
            <td style="width: 16%">
                &nbsp;
            </td>
            <td style="width: 16%">
                &nbsp;
            </td>
            <td style="width: 16%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 32%">
                Danh sách công văn đến
            </td>
            <td style="width: 16%">
                Từ ngày
            </td>
            <td style="width: 16%">
                <asp:TextBox ID="txtTuNgay" runat="server" Width="100%"></asp:TextBox>
                <asp:CalendarExtender ID="txtTuNgay_CalendarExtender" runat="server" Enabled="True"
                    TargetControlID="txtTuNgay" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
            <td style="width: 16%">
                Đến ngày
            </td>
            <td style="width: 16%">
                <asp:TextBox ID="txtDenNgay" runat="server" Width="100%"></asp:TextBox>
                <asp:CalendarExtender ID="txtDenNgay_CalendarExtender" runat="server" Enabled="True"
                    TargetControlID="txtDenNgay" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 32%">
                &nbsp;
            </td>
            <td style="width: 16%">
                &nbsp;
            </td>
            <td style="width: 16%">
                &nbsp;
            </td>
            <td style="width: 16%">
                &nbsp;
            </td>
            <td style="width: 16%">
                <asp:Button ID="btnOK" runat="server" Text="OK" Width="50px" OnClick="btnOK_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="6" style="width: 100%">
                <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                    CellPadding="3" GridLines="Vertical">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" OnCheckedChanged="cbheader_CheckedChanged" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbitem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Trichyeunoidung" HeaderText="Trích yếu nội dung" />
                        <asp:BoundField DataField="Ngaydi" HeaderText="Ngày đi" />
                        <asp:BoundField DataField="HoVaTen" HeaderText="Người nhận" />
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("Ma_CVDI_ND") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sửa" Visible="False">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Ma_CVDI_ND","~/Admin/congvan/updatecvdi.aspx?IDDEN={0}") %>'>Sửa</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        Chưa có dữ liệu
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="Gainsboro" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:Button ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" Width="66px"
                    Style="height: 26px" />
                <asp:Button ID="btnXoa" runat="server" Text="Xoá" OnClick="btnXoa_Click" Width="67px" />
                <asp:ConfirmButtonExtender ID="btnXoa_ConfirmButtonExtender" runat="server" ConfirmText="Bạn có muốn xóa nó không ?"
                    Enabled="True" TargetControlID="btnXoa">
                </asp:ConfirmButtonExtender>
                <br />
                <asp:Label ID="lblThongBao" runat="server" Style="color: #FF0000"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
