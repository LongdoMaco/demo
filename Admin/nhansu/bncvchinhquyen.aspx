<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="bncvchinhquyen.aspx.cs" Inherits="Admin_nhansu_bncvchinhquyen" Title="Bổ nhiệm chức vụ chính quyền" %>

<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table bgcolor="White" style="width: 100%">
        <tr>
            <td colspan="4" style="text-align: center">
                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 145px" class="style2">
                Chọn đơn vị :</td>
            <td style="width: 273px">
                <asp:DropDownList ID="ddlDonVi" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" Width="300px" 
                    CssClass="Dropdownlist">
                </asp:DropDownList>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px" class="style2">
                Chọn CBVC:</td>
            <td style="width: 273px">
                <asp:DropDownList ID="ddlNhanVien" runat="server" 
                    onselectedindexchanged="ddlNhanVien_SelectedIndexChanged" Width="300px" 
                    CssClass="Dropdownlist">
                </asp:DropDownList>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px" class="style2">
                Chức vụ&nbsp; :</td>
            <td style="width: 273px">
                <asp:DropDownList ID="ddlChinhQuyen" runat="server" Width="300px" 
                    CssClass="Dropdownlist">
                </asp:DropDownList>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px" class="style2">
                Ngày bổ nhiệm:</td>
            <td style="width: 273px">
                <asp:TextBox ID="txtngaybonhiem" runat="server" Width="300px"></asp:TextBox>
                <asp:CalendarExtender ID="txtngaybonhiem_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtngaybonhiem"  Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px" class="style2">
                Hệ số PCCV :</td>
            <td style="width: 273px">
                <asp:DropDownList ID="ddlhesoluong" runat="server" Width="300px" 
                    CssClass="Dropdownlist">
                </asp:DropDownList>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px" class="style2">
                <span class="style2">Nhiệm kỳ&nbsp;:&nbsp;</span></td>
            <td style="width: 273px">
                &nbsp;</td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px" class="style3">
                Từ</td>
            <td style="width: 273px">
                <asp:TextBox ID="txttungay" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txttungay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txttungay" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px" class="style3">
                Đến</td>
            <td style="width: 273px">
                <asp:TextBox ID="txtdengay" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txtdengay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtdengay" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                Bạn đang xem thông tin của&nbsp; :<asp:Label ID="Label1" runat="server" 
                    style="font-weight: 700; color: #0000FF;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Width="100%" CssClass="Gridview">
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
                        <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HOVATEN" HeaderText="Họ và tên" />
                        <asp:BoundField DataField="CHUCVU" HeaderText="Chức vụ" />
                        <asp:BoundField DataField="TUNGAY" HeaderText="Từ ngày" />
                        <asp:BoundField DataField="DENNGAY" HeaderText="Đến ngày" />
                        <asp:TemplateField HeaderText="Sửa">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbl" runat="server" onclick="lbl_Click">Chi tiết</asp:LinkButton>
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
                        <span style="color: #FF0000"><b>Chưa Có Dữ Liệu</b></span>
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Button ID="btnthemmoi" runat="server" onclick="btnthemmoi_Click" 
                    Text="Thêm Mới" CssClass="btn" />
                <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" 
                    onclick="btnCapNhat_Click" CssClass="btn" />
                <asp:Button ID="btnxoa" runat="server" Text="Xóa" onclick="btnxoa_Click" 
                    onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" 
                    CssClass="btn" Width="80px" />
                <br />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

   
    

    <style type="text/css">
        .style2
        {
            color: #000000;
            font-weight: bold;
        }
        .style3
        {
            color: #000000;
        }
    </style>

   
    

</asp:Content>


