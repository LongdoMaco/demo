<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="nguoiungcu.aspx.cs" Inherits="Admin_bonhiem_nguoiungcu" Title="Danh sách ứng cử" %>

<%@ Register src="usercontrol/menu.ascx" tagname="menu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
*{margin:0; padding: 0}

      

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
        <tr>
            <td  colspan="4">
                <uc1:menu ID="menu1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="4">
                Danh sách những người ứng cử&nbsp; </td>
        </tr>
        <tr>
            <td style=" width:15%">
                Chọn đơn vị:</td>
            <td style=" width:30%">
								                    <asp:DropDownList ID="ddlDonVi" runat="server" Width="98%" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" >
                                                </asp:DropDownList>
								            </td>
            <td style=" width:15%">
                Chọn CBVC</td>
            <td style=" width:30%">
								                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="98%">
                                                </asp:DropDownList>
								            </td>
        </tr>
        <tr>
            <td>
                Phiếu bổ nhiệm :</td>
            <td colspan="3">
                <asp:DropDownList ID="ddlphieu" runat="server" Width="98%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Thêm" />
            &nbsp;
                <asp:Button ID="btnupdate" runat="server" onclick="Button2_Click" 
                    Text="Cập Nhật" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" 
                    BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="HOVATEN" HeaderText="Họ và tên" />
                        <asp:BoundField DataField="DONVI" HeaderText="Đơn vị" />
                        <asp:BoundField DataField="TENBONHIEM" HeaderText="Tên bổ nhiệm" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Sửa</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click" 
                                    onclientclick="return confirm(&quot;Bạn thực sự muốn xóa?&quot;);">Xóa</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
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

