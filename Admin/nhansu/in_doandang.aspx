<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="in_doandang.aspx.cs" Inherits="Admin_nhansu_in_doan" Title="Quản lí thông tin về ngày vào đoàn và ngày vào đảng " %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
&nbsp;<table style="width: 100%" bgcolor="#EFEFEF">
        <tr>
            <td colspan="2">
                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
								            </td>
        </tr>
        <tr>
            <td colspan="2">
                Chọn đơn Vị :
								                    <asp:DropDownList ID="ddlDonVi" runat="server" Width="300px" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" >
                                                </asp:DropDownList>
								            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chọn CBVC :<asp:DropDownList 
                    ID="ddlNhanVien" runat="server" Width="300px" AutoPostBack="True" 
                    onselectedindexchanged="ddlNhanVien_SelectedIndexChanged">
                </asp:DropDownList>
								            </td>
        </tr>
        <tr>
            <td colspan="2">
                                                            Bạn đang xem thông tin về&nbsp; :                                                             <asp:Label ID="lblthongtin" runat="server" style="color: #000066"></asp:Label>
                                                             </td>
        </tr>
        <tr>
            <td style="width: 180px">
                                                            Ngày vào đoàn&nbsp; :</td>
            <td>
                                                            <asp:TextBox ID="txtdoan" runat="server" Width="200px"></asp:TextBox><asp:CalendarExtender
                                                                ID="CalendarExtender1" runat="server" TargetControlID="txtdoan" Format="dd/MM/yyyy">
                                                            </asp:CalendarExtender>
                                                            &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 132px">
                                                            Ngày vào đảng :</td>
            <td>
                                                            <asp:TextBox ID="txtdang" runat="server" Width="200px"></asp:TextBox>
                                                            <asp:CalendarExtender
                                                                ID="CalendarExtender2" runat="server" TargetControlID="txtdang" Format="dd/MM/yyyy">
                                                            </asp:CalendarExtender>
                                                            
                                                            </td>
        </tr>
        <tr>
            <td style="width: 132px; height: 49px;">
                                                            Ngày chuyển chính thức :</td>
            <td style="height: 49px">
                                                            <asp:TextBox ID="txtngaychuyen" runat="server" Width="200px"></asp:TextBox>
                                                             </td>
                                                             <asp:CalendarExtender
                                                                ID="CalendarExtender3" runat="server" TargetControlID="txtngaychuyen" Format="dd/MM/yyyy">
                                                            </asp:CalendarExtender>
        </tr>
        <tr>
            <td colspan="2">
									<asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                                        ForeColor="#333333" GridLines="None" 
                                        onselectedindexchanged="GridView1_SelectedIndexChanged" Width="100%" 
                                        AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging" >
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbheader" runat="server" 
                                                        oncheckedchanged="cbheader_CheckedChanged" AutoPostBack="true"/>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbitem" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HOVATEN" HeaderText="Họ và tên" />
                                            <asp:BoundField DataField="NGAYVAODOAN" HeaderText="Ngày Vào Đoàn" />
                                            <asp:BoundField DataField="NGAYVAODANG" HeaderText="Ngày Vào Đảng" />
                                            <asp:BoundField DataField="EMAIL" HeaderText="Email" />
                                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="ID" Visible="False" />
                                            <asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="bltchitiet" runat="server" onclick="bltchitiet_Click">Chi 
                                                    Tiết</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <EmptyDataTemplate>
                                            <b>Chưa Có Nhân Viên</b>
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                    </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnThem" runat="server" 
                            Text="Thêm Mới" onclick="btnThem_Click" />
                        <asp:Button ID="bntCapNhat" runat="server" 
                            Text="Cập Nhật" onclick="bntCapNhat_Click" />
                        <asp:Button ID="btnXoa" runat="server" 
                            onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" 
                            Text="Xóa" onclick="btnXoa_Click" />
                            <br />
                            
                        <asp:Label ID="Label5" runat="server" 
                            style="color: #000000; font-weight: 700; font-style: italic"></asp:Label>
                    </td>
        </tr>
        <tr>
            <td colspan="2">
                                    &nbsp;</td>
        </tr>
    </table>
</asp:Content>

