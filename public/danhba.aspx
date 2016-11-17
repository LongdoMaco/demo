<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterpagePublic.master" AutoEventWireup="true" CodeFile="danhba.aspx.cs" Inherits="public_danhba" Title="Trang danh bạ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" style="width: 100%">
        <tr>
            <td colspan="4" style="text-align: center">
                <b>DANH BẠ</b></td>
        </tr>
        <tr>
            <td style="width: 125px">
                Tìm
                theo họ tên</td>
            <td colspan="2">
                <asp:TextBox ID="txtnhapten" runat="server" Width="60%"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Tìm" onclick="Button1_Click" 
                    Width="67px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 125px">
                Tìm theo đơn vị :</td>
            <td>
                <asp:DropDownList ID="ddldonvi" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="300px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" 
                    onpageindexchanging="GridView1_PageIndexChanging" Width="100%" 
                    BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4">
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HOVATEN" HeaderText="Tên Nhân Viên" />
                        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" />
                        <asp:BoundField DataField="DIENTHOAI" HeaderText="SDT" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <EmptyDataTemplate>
                        Không có nhân viên nào
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 125px">
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

