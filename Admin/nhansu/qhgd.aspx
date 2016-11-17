<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="qhgd.aspx.cs" Inherits="Admin_nhansu_in_gd" Title="Quan hệ gia đình" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%" bgcolor="White" cellpadding="5">
        <tr>
            <td colspan="4" style="text-align: center">
								                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style=" width:15%">
								                <asp:label id="Label3" runat="server" Font-Size="Small" 
                                                    Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True" 
                                                    Width="100%">Chọn đơn vị:</asp:label>
								                    </td>
            <td style=" width:30%">
								                    <asp:DropDownList ID="ddlDonVi" runat="server" Width="100%" 
                                                    AutoPostBack="True" onselectedindexchanged="ddlDonVi_SelectedIndexChanged" 
                                                        CssClass="Dropdownlist">
                                                </asp:DropDownList>
								            </td>
            <td style=" width:15%">
								                <asp:label id="Label2" runat="server" Font-Size="Small" 
                                                    Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True" Width="100%">Chọn CBVC</asp:label>
								                </td>
            <td style=" width:30%">
								                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="100%" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlNhanVien_SelectedIndexChanged" 
                                                    CssClass="Dropdownlist">
                                                </asp:DropDownList>
								            </td>
        </tr>
        <tr>
            <td>
                                                            Họ và tên :</td>
            <td>
                                                            <asp:TextBox ID="txthoten" runat="server" Width="100%"></asp:TextBox>
                                                        </td>
            <td>
                                                            Ngày sinh :</td>
            <td>
                                                            <asp:TextBox ID="txtngaysinh" runat="server" Width="100%"></asp:TextBox><asp:CalendarExtender
                                                                ID="CalendarExtender1" runat="server" TargetControlID="txtngaysinh" Format="dd/MM/yyyy">
                                                            </asp:CalendarExtender>
                                                
                                                            </td>
        </tr>
        <tr>
            <td>
                                                            Quan hệ </td>
            <td colspan="3">
                                                            <asp:DropDownList ID="ddlquanhe" runat="server" Width="30%" 
                                                                CssClass="Dropdownlist">
                                                            </asp:DropDownList>
                                                        </td>
        </tr>
        <tr>
            <td>
                                                            Nghề nghiệp :</td>
            <td>
                                                            <asp:TextBox ID="txtNgheNghiep" runat="server" Width="100%"></asp:TextBox>
                                                        </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" class="style2">
                                                            Địa chỉ:</td>
        </tr>
        <tr>
            <td>
                                                                             Số nhà</td>
            <td>
                                                                             <asp:TextBox ID="txtSNHN" runat="server" Width="150px"></asp:TextBox>
                                                                         </td>
            <td>
                                                                             Đường/Tổ 
            </td>
            <td>
                                                                             <asp:TextBox ID="txtDuongHN" runat="server"></asp:TextBox>
                                                                         </td>
        </tr>
        <tr>
            <td style="height: 34px">
                                                                             Xã /Phường 
            </td>
            <td style="height: 34px">
                                                                             <asp:TextBox ID="txtXaHN" runat="server" Width="150px"></asp:TextBox>
                                                                         </td>
            <td style="height: 34px">
                                                                             Quận/Huyện:</td>
            <td style="height: 34px">
                                                                             <asp:TextBox ID="txtHuyenHN" runat="server"></asp:TextBox>
                                                                         </td>
        </tr>
        <tr>
            <td>
                                                                             Tĩnh/TP</td>
            <td>
                                                                             <asp:DropDownList ID="ddltphn" runat="server" Width="150px">
                                                                             </asp:DropDownList>
                                                                         </td>
            <td>
                                                                             &nbsp;</td>
            <td>
                                                                             &nbsp;</td>
        </tr>
        <tr>
            <td>
                                                                             Quốc gia</td>
            <td>
                                                                             <asp:DropDownList ID="DDLQGNQ" runat="server" Width="150px">
                                                                             </asp:DropDownList>
                                                                         </td>
            <td>
                                                                         Điện thoại
                                                                             </td>
            <td>
                                                                             <asp:TextBox ID="txtDTHN" runat="server"></asp:TextBox>
                                                                            </td>
        </tr>
        <tr>
            <td colspan="4" class="style2">
									<b>Danh sách những người có quan hệ với</b>&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label6" runat="server" style="font-weight: 700; color: #000066"></asp:Label>
                                    </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 24px">
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        onrowdatabound="GridView1_RowDataBound" AllowPaging="True" 
                                        onpageindexchanging="GridView1_PageIndexChanging" Width="100%" CssClass="Gridview" 
                                       >
                                        <Columns>
                                            <asp:TemplateField HeaderText="textbox">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                                        oncheckedchanged="cbheader_CheckedChanged" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbitem" runat="server" 
                                                        oncheckedchanged="cbitem_CheckedChanged" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HOVATEN" HeaderText="Họ và tên" />
                                            <asp:BoundField DataField="NGAYSINH" HeaderText="Ngày sinh" />
                                            <asp:BoundField DataField="QUANHE" HeaderText="Quan hệ" />
                                            <asp:BoundField DataField="NGHENGHIEP" HeaderText="Nghề nghiệp" />
                                            <asp:TemplateField HeaderText="danh" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Xem chi tiết">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click1">Chi tiết</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                         <FooterStyle BackColor="#21abfa" Font-Bold="True" ForeColor="#21abfa" />
                    <PagerStyle CssClass="headergrid" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#ffffff" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#21abfa" CssClass="headergrid" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#fffffff" />
                                        <EmptyDataTemplate>
                                            <span class="style6"><b>Chưa Có Dữ Liệu Nào Cả</b></span>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                        <asp:Button ID="btnThem" runat="server" onclick="btnThem_Click" 
                            Text="Thêm mới" CssClass="btn" />
                        <asp:Button ID="bntCapNhat" runat="server" onclick="bntCapNhat_Click" 
                            Text="Cập nhật" style="width: 82px" CssClass="btn" Width="101px" />
                        <asp:Button ID="btnXoa" runat="server" onclick="btnXoa_Click" 
                            onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" 
                            Text="Xóa" CssClass="btn" Width="82px" />
                        <br />
                        <asp:Label ID="Label5" runat="server" 
                            style="color: #FF0000; font-weight: 700; font-style: italic"></asp:Label>
                    </td>
        </tr>
    </table>
</asp:Content>



<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

   
    <style type="text/css">
        .style2
        {
            color: #800000;
            font-weight: bold;
        }
    </style>


</asp:Content>




