<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="cvdenchuaxem.aspx.cs" Inherits="Admin_congvan_cvdenchuaxem" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="usercontrol/Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
        <tr>
            <td colspan="6" >
                <uc1:Menu ID="Menu1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style=" width:16%" >
                Chọn loại CV</td>
            <td  style=" width:16%"> 
									<asp:dropdownlist id="ddlLoaiCV" runat="server" 
                    Font-Size="Small" Font-Names="Times New Roman" AutoPostBack="True" Width="100%" 
                                        onselectedindexchanged="ddlLoaiCV_SelectedIndexChanged"></asp:dropdownlist>
								    </td>
            <td  style=" width:16%">
                Chọn CQBH</td>
            <td  style=" width:16%">
									<asp:dropdownlist id="ddlCQBH" runat="server" 
                    Font-Size="Small" Font-Names="Times New Roman" AutoPostBack="True" Width="100%" 
                                        onselectedindexchanged="ddlCQBH_SelectedIndexChanged"></asp:dropdownlist>
								    </td>
            <td  style=" width:16%">
                Chọn mã CV</td>
            <td  style=" width:16%">
									<asp:dropdownlist id="dlMacv" runat="server" 
                    Font-Size="Small" Font-Names="Times New Roman" AutoPostBack="True" Width="100%" 
                                        onselectedindexchanged="dlMacv_SelectedIndexChanged"></asp:dropdownlist>
								</td>
        </tr>
        <tr>
            <td style=" width:16%" >
                &nbsp;</td>
            <td  style=" width:16%"> 
									&nbsp;</td>
            <td  style=" width:16%">
                &nbsp;</td>
            <td  style=" width:16%">
									&nbsp;</td>
            <td  style=" width:16%">
                &nbsp;</td>
            <td  style=" width:16%">
									&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style=" width:32%" >
                Danh sách công văn đến</td>
            <td  style=" width:16%">
                Từ ngày </td>
            <td  style=" width:16%">
                <asp:TextBox ID="txtTuNgay" runat="server" Width="100%"></asp:TextBox>
                <asp:CalendarExtender ID="txtTuNgay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtTuNgay" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
            <td  style=" width:16%">
                Đến ngày </td>
            <td  style=" width:16%">
                <asp:TextBox ID="txtDenNgay" runat="server" Width="100%"></asp:TextBox>
                <asp:CalendarExtender ID="txtDenNgay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtDenNgay" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td colspan="2" style=" width:32%" >
                &nbsp;</td>
            <td  style=" width:16%">
                &nbsp;</td>
            <td  style=" width:16%">
                &nbsp;</td>
            <td  style=" width:16%">
                &nbsp;</td>
            <td  style=" width:16%">
                <asp:Button ID="btnOK" runat="server" Text="OK" Width="50px" 
                    onclick="btnOK_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="6" style=" width:100%" >
                <asp:GridView ID="GridView1" runat="server" 
                    Width="100%" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Vertical">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
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
                        <asp:BoundField DataField="Trichyeunoidung" HeaderText="Trích yếu nội dung" />
                        <asp:BoundField DataField="Ngayden" HeaderText="Ngày đến" />
                        <asp:BoundField DataField="HoVaTen" HeaderText="Người nhận" />
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("Ma_CV_ND") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sửa" Visible="False">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("Ma_CV_ND","~/Admin/congvan/updatecvden.aspx?IDDEN={0}") %>'>Sửa</asp:HyperLink>
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
            <td colspan="6" >
                <asp:Button ID="btnThem" runat="server" Text="Thêm" onclick="btnThem_Click" 
                    Width="66px" style="height: 26px" />
                <asp:Button ID="btnXoa" runat="server" Text="Xoá" onclick="btnXoa_Click" 
                    Width="67px" />
                <asp:ConfirmButtonExtender ID="btnXoa_ConfirmButtonExtender" runat="server" 
                    ConfirmText="Bạn có muốn xóa nó không ?" Enabled="True" TargetControlID="btnXoa">
                </asp:ConfirmButtonExtender>
                <br />
                <asp:Label ID="lblThongBao" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

