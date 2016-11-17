<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="bncvdang.aspx.cs" Inherits="Admin_nhansu_bncvdang" Title="Bổ nhiệm chức vụ đảng" %>

<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" style="width: 100%">
        <tr>
            <td class="style1" colspan="4">
                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 145px" class="style1">
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
            <td style="width: 145px" class="style1">
                Chọn nhân viên:</td>
            <td style="width: 273px">
                <asp:DropDownList ID="ddlNhanVien" runat="server" 
                    onselectedindexchanged="ddlNhanVien_SelectedIndexChanged" Width="300px" 
                    CssClass="Dropdownlist" AutoPostBack="True">
                </asp:DropDownList>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px" class="style1">
                Chức vụ đảng :</td>
            <td style="width: 273px">
                <asp:DropDownList ID="ddlDVDang" runat="server" Width="300px" 
                    CssClass="Dropdownlist">
                </asp:DropDownList>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px" class="style1">
                Ngày bổ nhiệm</td>
            <td style="width: 273px">
                <asp:TextBox ID="txtngaybonhiem" runat="server" Width="300px"></asp:TextBox>
                <asp:CalendarExtender ID="txtngaybonhiem_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtngaybonhiem" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px" class="style1">
                Hệ số PCCV :</td>
            <td style="width: 273px">
                <asp:DropDownList ID="ddlHeSoLuong" runat="server" Width="300px" 
                    CssClass="Dropdownlist">
                </asp:DropDownList>
            </td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" class="style1">
                Nhiệm kỳ </td>
        </tr>
        <tr>
            <td style="width: 145px">
                Từ :</td>
            <td>
                <asp:TextBox ID="txtTuNgay" runat="server" Width="150px"></asp:TextBox>
                <asp:CalendarExtender ID="txtTuNgay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtTuNgay" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
            <td style="width: 273px">
                &nbsp;</td>
            <td style="width: 156px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px">
                Đến :</td>
            <td>
                <asp:TextBox ID="txtDenNgay" runat="server" style="height: 22px; width: 150px" 
                    Width="150px"></asp:TextBox>
                <asp:CalendarExtender ID="txtDenNgay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtDenNgay" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
            <td style="width: 273px">
                &nbsp;</td>
            <td style="width: 156px">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                Bạn đang xem thông tin của nhân viên :<asp:Label ID="Label1" runat="server" 
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
                        <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HOVATEN" HeaderText="Họ và tên" />
                        <asp:BoundField DataField="CHUCVU" HeaderText="Chức vụ" />
                        <asp:BoundField DataField="TUNGAY" HeaderText="Từ ngày" />
                        <asp:BoundField DataField="DENNGAY" HeaderText="Đến ngày" />
                        <asp:TemplateField HeaderText="Chi Tiết">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbl" runat="server" onclick="lbl_Click">Chi Tiết</asp:LinkButton>
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
                    Text="Thêm mới" CssClass="btn" />
                <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" 
                    onclick="btnCapNhat_Click" CssClass="btn" />
                <asp:Button ID="btnxoa" runat="server" Text="Xóa" onclick="btnxoa_Click" 
                    onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" 
                    CssClass="btn" Width="67px" />
                <br />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

   
    <style type="text/css">
        .style1
        {
            color: #000000;
            font-weight: bold;
        }
    </style>


</asp:Content>


