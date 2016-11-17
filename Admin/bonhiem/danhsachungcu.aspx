<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="danhsachungcu.aspx.cs" Inherits="Admin_bonhiem_danhsachungcu" Title="Dan sách ứng cử" %>

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
            <td colspan="2" style="text-align:left; color:Navy"  >
                <uc1:menu ID="menu1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center; color:Navy" class="style3" >
                Thông tin hổ trợ ra quyết định</td>
        </tr>
        <tr>
            <td style="width:15%">
                Chọn phiếu :</td>
            <td>
                <asp:DropDownList ID="ddlphieu" runat="server" Width="98%" AutoPostBack="True" 
                    onselectedindexchanged="ddlphieu_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    onrowdatabound="GridView1_RowDataBound" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="ID" Visible="False" />
                        <asp:BoundField DataField="MANHANVIEN" HeaderText="Mã CBVC" />
                        <asp:TemplateField HeaderText="Họ và tên">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HOVATEN") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("ID","~/Admin/nhansu/chitietnv.aspx?IDNV={0}") %>' 
                                    Text='<%# Eval("HOVATEN") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="NGAYSINH" HeaderText="Ngày Sinh" />
                        <asp:BoundField DataField="NGAYVAODANG" HeaderText="Ngày vào Đảng" />
                        <asp:BoundField DataField="ID" HeaderText="Tổng ĐTNK" />
                        <asp:BoundField DataField="ID" HeaderText="Số lượng TC" />
                        <asp:BoundField DataField="ID" HeaderText="Số lượng GT" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
        <td colspan="2">
        
            ĐTNK:Đề tài nghiên cứu |&nbsp;&nbsp;&nbsp; TC: Tạp chí&nbsp;&nbsp;&nbsp; | 
            GT:Giáo trình&nbsp;</td>
        </tr>
        </table>
</asp:Content>

