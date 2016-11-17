<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="in_baohiem.aspx.cs" Inherits="Admin_nhansu_in_baohiem" Title="Thông Tin Về Bảo Hiểm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
						<TABLE id="Table3" style="BORDER-COLLAPSE: collapse" cellSpacing="0" 
                            cellPadding="5px" width="1024px" borderColor="#111111" bgcolor="White">																					
							<tr>							    
							    <td bgColor="#e3e4ff">
							        <table cellpadding="0" cellspacing="0" class="style1" width="100%" 
                                        bgcolor="White">
                                        <tr valign="top">
                                            
                                            <td style="text-align: left">
                                                <table class="style3">
                                                    <tr>
                                                        <td class="style6" bgcolor="#EFEFEF" valign="top" 
                                                            style="font-weight: bold; text-align: center">
									                        <uc1:WebUserControl ID="WebUserControl1" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style6" bgcolor="#EFEFEF" valign="top" 
                                                            style="font-weight: bold; text-align: center">
									                        THÔNG TIN BẢO HIỂM</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style6" bgcolor="#EFEFEF" valign="top">
									                        Chọn Đơn Vị :<asp:DropDownList ID="ddlDonVi" runat="server" Width="300px" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" >
                                                </asp:DropDownList>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                            Chọn Nhân Viên :<asp:DropDownList ID="ddlNhanVien" runat="server" Width="300px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style6" bgcolor="#EFEFEF" valign="top">
									<b>Bạn Đang Xem Thông Tin Của&nbsp; </b>&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblThongTin" runat="server" style="font-weight: 700; color: #000066"></asp:Label>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10" valign="top">
                                                            <table class="style12">
                                                                <tr>
                                                                    <td class="style17">
                                                                        Số BHXH:</td>
                                                                         <td class="style19">
                                                                             <asp:TextBox ID="txtsobhxh" runat="server" Width="150px"></asp:TextBox>
                                                                         </td>
                                                                         <td class="style18">
                                                                             &nbsp;</td>
                                                                         <td>
                                                                             &nbsp;</td>
                                                                     </tr>
                                                                     <tr>
                                                                         <td class="style17">
                                                                             Cơ quan cấp:                                                                     </td>
                                                                    <td class="style19">
                                                                        <asp:TextBox ID="txtcoquancap" runat="server" Width="150px"></asp:TextBox>
                                                                    </td>
                                                                    <td class="style18">
                                                                        Ngày cấp&nbsp; sổ:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtngaycap" runat="server" Width="200px"></asp:TextBox>
                                                                        <asp:CalendarExtender
                                                                            ID="CalendarExtender4" runat="server" TargetControlID="txtngaycap" Format="dd/MM/yyyy">
                                                                        </asp:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style17">
                                                                        TTừ gian từ:</td>
                                                                         <td class="style19">
                                                                             <asp:TextBox ID="txtthoigiantu" runat="server" Width="150px"></asp:TextBox><asp:CalendarExtender
                                                                                 ID="CalendarExtender1" runat="server" TargetControlID="txtthoigiantu" Format="dd/MM/yyyy">
                                                                             </asp:CalendarExtender>
                                                                             
                                                                         </td>
                                                                         <td class="style18">
                                                                             Đến                                                                     </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtden" runat="server" Width="200px"></asp:TextBox><asp:CalendarExtender
                                                                            ID="CalendarExtender2" runat="server" TargetControlID="txtden" Format="dd/MM/yyyy">
                                                                        </asp:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style13" colspan="4">
                                                                        Mức BHXH:</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style20">
                                                                        Lương cơ bản:</td>
                                                                    <td class="style21">
                                                                        <asp:TextBox ID="txtluongcoban" runat="server" Width="150px"></asp:TextBox>
                                                                    </td>
                                                                    <td class="style22">
                                                                        Các Khoản Phụ Cấp:</td>
                                                                    <td class="style23">
                                                                        <asp:TextBox ID="txtphucap" runat="server" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style16" colspan="4" style="border-bottom:1px solid #FFFFFF">
                                                                        <span class="style24">Tỷ Lệ Đóng BHXH </span>:</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style17">
                                                                        Nhà trường:</td>
                                                                    <td class="style19">
                                                                        <asp:TextBox ID="txtnhatruong" runat="server" Width="50px"></asp:TextBox>
                                                                    &nbsp;(%)</td>
                                                                    <td class="style18">
                                                                        Cán bộ :</td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtcanbo" runat="server" Width="40px"></asp:TextBox>
                                                                    &nbsp;(%)</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style17">
                                                                        Ghi chú :</td>
                                                                    <td class="style19">
                                                                        <asp:TextBox ID="txtghichu" runat="server" Width="150px"></asp:TextBox>
                                                                    </td>
                                                                    <td class="style18">
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                     </tr>
                                                                <tr>
                                                                    <td class="style17" colspan="4" style="text-align: left">
                            
                        <asp:Label ID="Label5" runat="server" 
                            style="color: #000000; font-weight: 700; font-style: italic; text-align: center;"></asp:Label>
                                                                    </td>
                                                                     </tr>
                                                                 </table>
                                                        </td>
                                                    </tr>
                                                     </table>
                                                 </td>
                                        </tr>                                  
                                        </table>
							    </td>
							</tr>							
							<TR>
								<TD align="right" style="text-align: center; width: 100%"  bgColor="#e3e4ff" >
									<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                        DataKeyNames="ID" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                                        Width="100%" ForeColor="#333333" GridLines="None" 
                                        onpageindexchanging="GridView1_PageIndexChanging">
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
                                            <asp:BoundField DataField="HOVATEN" HeaderText="HOVATEN" 
                                                SortExpression="HOVATEN" />
                                            <asp:BoundField DataField="NGAYSINH" HeaderText="NGAYSINH" 
                                                SortExpression="NGAYSINH" />
                                            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                                            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID" 
                                                Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Chi Tiết">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtchitiet" runat="server" onclick="lbtchitiet_Click">Chi 
                                                    Tiết</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <EmptyDataTemplate>
                                            Dữ Liệu Trống
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
									&nbsp;&nbsp;
									</TD>
							</TR>	
							<TR>
					<TD style="text-align: center">
                        <asp:Button ID="btnThem" runat="server" 
                            Text="Thêm Mới" onclick="btnThem_Click" />
                        <asp:Button ID="bntCapNhat" runat="server" 
                            Text="Cập Nhật" onclick="bntCapNhat_Click" />
                        <asp:Button ID="btnXoa" runat="server" 
                            onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" 
                            Text="Xóa" onclick="btnXoa_Click" />
                            <br />
                            
                        <br />
                    </TD>
				</TR>	
													
							</TABLE>

</asp:Content>

