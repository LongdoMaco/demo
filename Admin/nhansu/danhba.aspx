<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="danhba.aspx.cs" Inherits="Admin_nhansu_Default" Title="Untitled Page" %>



<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" style="width: 100%">
        <tr>
            <td colspan="4" style="text-align: center">
                <uc2:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 125px">
                Tìm
                theo họ tên</td>
            <td colspan="2">
                <asp:TextBox ID="txtnhapten" runat="server" Width="400px"></asp:TextBox>
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
                    onpageindexchanging="GridView1_PageIndexChanging" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HOVATEN" HeaderText="Tên Nhân Viên" />
                        <asp:BoundField DataField="NGAYSINH" HeaderText="NGÀY SINH" />
                        <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" />
                        <asp:BoundField DataField="DIENTHOAI" HeaderText="SDT" />
                        <asp:BoundField DataField="DONVI" HeaderText="ĐƠN VỊ" />
                    </Columns>
                    <EmptyDataTemplate>
                        Không có nhân viên nào
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 125px">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Xuất Ra Exel" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

