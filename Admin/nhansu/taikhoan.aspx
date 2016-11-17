<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="taikhoan.aspx.cs" Inherits="Admin_nhansu_in_taikhoan" Title="Tài Khoản" %>



<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" style="width: 100%">
        <tr>
            <td colspan="4">
								                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
								                    </td>
        </tr>
        <tr>
            <td>
								                <asp:label id="Label3" runat="server" Font-Size="Small" 
                                                    Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True" 
                                                    Width="138px">CHỌN ĐƠN VỊ:</asp:label>
								                    </td>
            <td>
								                    <asp:DropDownList ID="ddlDonVi" runat="server" AutoPostBack="True" 
                                                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" Width="300px" 
                                                        CssClass="Dropdownlist">
                                                </asp:DropDownList>
								            </td>
            <td>
								                CHỌN NHÂN VIÊN</td>
            <td>
                <asp:DropDownList ID="ddlNhanVien" runat="server" 
                                                    AutoPostBack="True" Width="200px" 
                                                    
                    onselectedindexchanged="ddlNhanVien_SelectedIndexChanged" 
                    CssClass="Dropdownlist">
                                                </asp:DropDownList>
                                            </td>
        </tr>
        <tr>
            <td colspan="4">
									<b>Bạn Đang Xem Thông Tin Về Tài Khoản Của &nbsp; </b>&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label6" runat="server" style="font-weight: 700; color: #000066"></asp:Label>
                                                        </td>
        </tr>
        <tr>
            <td>
                                                            Số Tài Khoản :</td>
            <td>
                                                            <asp:TextBox ID="txtTaiKhoan" runat="server" Width="250px" CssClass="btn"></asp:TextBox>
                                                        </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                                                            Tên Ngân Hàng :</td>
            <td>
                                                            <asp:TextBox ID="txtTenNganHang" runat="server" Width="400px"></asp:TextBox>
                                                        </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  
                                        Width="100%">
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
                                            <asp:BoundField DataField="MaTaiKhoan" HeaderText="Số Tài Khoản" />
                                            <asp:BoundField DataField="TenNganHang" HeaderText="Tên Ngân Hàng" />
                                            <asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" runat="server" onclick="lbEdit_Click">Edit</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                    <PagerStyle CssClass="headergrid" />
                    <HeaderStyle CssClass="headergrid" />
                                        <EmptyDataTemplate>
                                            <span class="style12"><b>Chưa có dữ liệu</b></span>
                                        </EmptyDataTemplate>
                                      
                                    </asp:GridView>
                                </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                        <asp:Button ID="btnThem" runat="server" 
                            Text="Thêm Mới" onclick="btnThem_Click" CssClass="btn" />
                        <asp:Button ID="bntCapNhat" runat="server" 
                            Text="Cập Nhật" onclick="bntCapNhat_Click" CssClass="btn" />
                        <asp:Button ID="btnXoa" runat="server" 
                            onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" 
                            Text="Xóa" onclick="btnXoa_Click" CssClass="btn" Width="61px" />
                            <br />
                        <asp:Label ID="Label5" runat="server" 
                            style="color: #FF0000; font-weight: 700; font-style: italic"></asp:Label>
                    </td>
        </tr>
    </table>
</asp:Content>

