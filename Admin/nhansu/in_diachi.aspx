<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="in_diachi.aspx.cs" Inherits="Admin_nhansu_in_diachi" Title="THÔNG TIN VỀ ĐỊA CHỈ NHÂN VIÊN" %>



<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%" bgcolor="White" cellpadding="5px">
        <tr>
            <td colspan="4" style="text-align: center">
								                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
								                <b>THÔNG TIN VỀ ĐỊA CHỈ NHÂN VIÊN</b></td>
        </tr>
        <tr>
            <td>
								                <asp:label id="Label3" runat="server" Font-Size="Small" 
                                                    Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True" 
                                                    Width="138px">CHỌN ĐƠN VỊ:</asp:label>
								                    </td>
            <td colspan="3">
								                    <asp:DropDownList ID="ddlDonVi" runat="server" Width="300px" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" >
                                                </asp:DropDownList>
								            &nbsp;&nbsp;&nbsp;&nbsp; Chọn Nhân Viên :<asp:DropDownList ID="ddlNhanVien" 
                                                        runat="server" Width="200px">
                                                    </asp:DropDownList>
								            </td>
        </tr>
        <tr>
            <td colspan="4">
                                                                        <span class="style16">Bạn Đang Xem Thông Tin Của&nbsp; </span>&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label6" runat="server" style="font-weight: 700; color: #000066"></asp:Label>
                                                                    </td>
        </tr>
        <tr>
            <td colspan="4" bgcolor="#CCCCCC" style="color: #FFFFFF">
                                                                        <b>Quê Quán
                                                                    </b>
                                                                    </td>
        </tr>
        <tr>
            <td>
                                                                        Xã/ Phường :</td>
            <td>
                                                                             <asp:TextBox ID="txtXaNQ" runat="server"></asp:TextBox>
                                                                    </td>
            <td>
                                                                             Quận/Huyện:</td>
            <td>
                                                                             <asp:TextBox ID="txtQuanNQ" runat="server"></asp:TextBox>
                                                                    </td>
        </tr>
        <tr>
            <td>
                                                                             Tĩnh /Thành Phố</td>
            <td>
                                                                             <asp:DropDownList ID="ddltpqn" runat="server" Width="150px">
                                                                             </asp:DropDownList>
                                                                         </td>
            <td>
                                                                             Quốc Gia</td>
            <td>
                                                                             <asp:DropDownList ID="DDLQGNQ" runat="server" Height="25px" Width="150px">
                                                                             </asp:DropDownList>
                                                                         </td>
        </tr>
        <tr>
            <td>
                Điện Thoại</td>
            <td>
                                                                             <asp:TextBox ID="txtDTNQ" runat="server"></asp:TextBox>
                                                                         </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" bgcolor="#CCCCCC" style="color: #FFFFFF">
                                                                             <b>Nơi Ở Hiện Nay</b></td>
        </tr>
        <tr>
            <td>
                                                                             Số Nhà</td>
            <td>
                                                                             <asp:TextBox ID="txtSNHN" runat="server"></asp:TextBox>
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
                                                                             <asp:TextBox ID="txtXaHN" runat="server"></asp:TextBox>
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
                                                                             Quốc Gia</td>
            <td>
                                                                             <asp:DropDownList ID="ddlquocgiahn" runat="server" Width="150px" 
                                                                                 onselectedindexchanged="ddlquocgiahn_SelectedIndexChanged">
                                                                             </asp:DropDownList>
                                                                         </td>
            <td>
                                                                         Điện Thoại
                                                                             </td>
            <td>
                                                                             <asp:TextBox ID="txtDTHN" runat="server"></asp:TextBox>
                                                                            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                                <asp:Label ID="Label1" runat="server" 
                    style="color: #FF0000; font-weight: 700; text-align: center;"></asp:Label>
							</td>
        </tr>
        <tr>
            <td colspan="4">
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
                                        AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging" 
                                        PageSize="7" AllowSorting="True">
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                                        oncheckedchanged="cbheader_CheckedChanged" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbitem" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HOVATEN" HeaderText="Họ Và Tên" />
                                            <asp:BoundField DataField="NGAYSINH" HeaderText="Ngày Sinh" />
                                            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" />
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
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <EmptyDataTemplate>
                                            <span class="style17"><b>Chưa Có Nhân Viên Nào Cả</b></span>
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
									</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                        <asp:Button ID="btnThem" runat="server" 
                            Text="Thêm Mới" onclick="btnThem_Click" />
                        <asp:Button ID="bntCapNhat" runat="server" 
                            Text="Cập Nhật" onclick="bntCapNhat_Click" />
                        <asp:Button ID="btnXoa" runat="server" 
                            onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" 
                            Text="Xóa" onclick="btnXoa_Click" />
                            <br />
                            
                        <asp:Label ID="Label5" runat="server" 
                            style="color: #FF0000; font-weight: 700; font-style: italic"></asp:Label>
                    </td>
        </tr>
    </table>
</asp:Content>

