<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="bncvdoanthe.aspx.cs" Inherits="Admin_nhansu_bncvdoanthe" Title="Bổ nhiệm chức vụ đoàn thể" %>

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
            <td style="width: 145px">
                &nbsp;<span class="style3">Chọn đơn Vị :</span></td>
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
            <td style="width: 145px" class="style3">
                Chọn CBVC :</td>
            <td style="width: 273px">
                <asp:DropDownList ID="ddlNhanVien" runat="server" 
                    onselectedindexchanged="ddlNhanVien_SelectedIndexChanged" Width="300px" 
                    AutoPostBack="True" CssClass="Dropdownlist">
                </asp:DropDownList>
            </td>
            <td style="width: 156px">
                <span class="style2"></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px">
                <b><span class="style2">Chức Vụ&nbsp;</span> :</b></span></td>
            <td style="width: 273px">
                <asp:DropDownList ID="ddlDVDang" runat="server" Width="300px" 
                    CssClass="Dropdownlist">
                </asp:DropDownList>
            </td>
            <td style="width: 156px">
                <span class="style2"></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 145px">
                <b><span class="style2">Ngày bổ nhiệm</span> :</b></td>
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
            <td style="width: 145px">
                <b><span class="style2">Hệ số lương</span> :</b></td>
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
            <td style="width: 145px" class="style3">
                Nhiệm kỳ :</td>
            <td style="width: 273px">
                &nbsp;</td>
            <td style="width: 156px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </span>
        <tr>
            <td style="width: 145px; height: 23px">
                Từ </td>
            <td colspan="3" style="height: 23px">
                <asp:TextBox ID="txttungay" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txttungay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txttungay" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td style="width: 145px; height: 23px">
                Đến</td>
            <td colspan="3" style="height: 23px">
                <asp:TextBox ID="txtdenngay" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="txtdenngay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtdenngay" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                Bạn đang xem thông tin của nhân viên :<asp:Label ID="Label1" runat="server" 
                    style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" 
                    AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging" 
                    CssClass="Gridview">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                        
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbitem" runat="server" />
                            </ItemTemplate>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                    oncheckedchanged="cbheader_CheckedChanged" />
                            </HeaderTemplate>
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
                    CssClass="btn" Width="66px" />
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
        }
        .style3
        {
            color: #000000;
            font-weight: bold;
        }
    </style>


</asp:Content>


