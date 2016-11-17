<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="kh_nhiemvu.aspx.cs" Inherits="Admin_nckh_dvph" Title="Untitled Page" %>

<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<script runat="server">

   
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <TABLE id="Table1" style="BORDER-COLLAPSE: collapse" borderColor="#111111" cellSpacing="0" cellPadding="0" width="100%" >			
				
				<TR>
					<TD style="HEIGHT: 185px" align="center">
						<TABLE id="Table3" style="BORDER-COLLAPSE: collapse" cellSpacing="0" 
                            cellPadding="0" width="100%" borderColor="#111111" bgcolor="White">																					
							<TR>
								<TD style="HEIGHT: 100%"  align="right" bgColor="#FFFFFF">
								    <table width="100%">
								        <tr>
								            <TD style="text-align: center;" colspan="2">
								                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
                                            </TD>
									
								    </tr>
								        <tr>
								            <TD style="text-align: center;" colspan="2">
								                <b>KHOA HỌC NHIỆM VỤ</b></TD>
									
								    </tr>
								        <tr>
								            <TD style="width:250">
								                <b>Chọn Đơn Vị : 
                                                <asp:DropDownList ID="ddlDonVi" runat="server" Width="300px" 
                                                    AutoPostBack="True" onselectedindexchanged="ddlDonVi_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                </b></TD>
								            <td>
								                <b>&nbsp; Chọn Nhân Viên</b>:
                                                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="200px" 
                                                    AutoPostBack="True" onselectedindexchanged="ddlNhanVien_SelectedIndexChanged">
                                                </asp:DropDownList>
								               </td>
									
								    </tr>
								</table>
								</TD>																
							</TR>
							<tr>							    
							    <td bgColor="#e3e4ff">
							        <table cellpadding="0" cellspacing="0" class="style1" width="100%">
                                                                                    
                                        <tr>
                                            <td class="style5" valign="top">
                                                <table class="style9" width="100%" bgcolor="White" cellspacing="5">
                                                    <tr>
                                                        <td class="style15" style="font-weight: bold; color: #000000">
                                                            Mã Đề Tài :</td>
                                                        <td class="style19">
                                                            <b>
                                                            <asp:DropDownList ID="ddldetai" runat="server" Height="25px" Width="200px">
                                                            </asp:DropDownList>
                                                            </b>
                                                        </td>
                                                        <td class="style20" style="color: #000000">
                                                            <b>Đơn Vị Công Tác :</b></td>
                                                        <td class="style18">
                                                            <b><span style="color: #000000">
                                                            <asp:TextBox ID="txtdohvi" runat="server" Width="300px" TextMode="MultiLine"></asp:TextBox>
                                                            </span></b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style15" style="font-weight: bold; color: #000000">
                                                            Nhiệm Vụ:</td>
                                                        <td class="style19" colspan="3">
                                                            <b>
                                                            <asp:DropDownList ID="ddlNhiemVu" runat="server" Width="200px">
                                                            </asp:DropDownList>
                                                            </b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style14" colspan="4" style="color: #000000">
                                                            <b><span style="color: #000000">
                                                            <asp:Label ID="lblthongbao" runat="server" ForeColor="Red"></asp:Label>
                                                            </span></b>
                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                                DataKeyNames="ID" CellPadding="4" 
                                                                onselectedindexchanged="GridView1_SelectedIndexChanged" Width="100%" 
                                                                style="font-weight: bold; color: #000000" ForeColor="#333333" 
                                                                GridLines="None">
                                                                <RowStyle BackColor="#EFF3FB" />
                                                                <Columns>
                                                                    <asp:TemplateField ItemStyle-Width="20px">
                                                                        <HeaderTemplate>
                                                                            <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                                                                oncheckedchanged="cbheader_CheckedChanged" />
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="cbitem" runat="server" />
                                                                        </ItemTemplate>

<ItemStyle Width="20px"></ItemStyle>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="MADETAI" HeaderText="Mã Đề Tài" 
                                                                        SortExpression="MADETAI" />
                                                                    <asp:BoundField DataField="DONVICONGTAC" HeaderText="ĐơnVị Công Tác" 
                                                                        SortExpression="DONVICONGTAC" />
                                                                    <asp:BoundField DataField="NHIEMVU" HeaderText="Tên Nhiệm Vụ" 
                                                                        SortExpression="NHIEMVU" />
                                                                    <asp:TemplateField HeaderText="Edit">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lbtEdit" runat="server" onclick="lbtEdit_Click1">Edit</asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                <EmptyDataTemplate>
                                                                    Chưa có thông tin
                                                                </EmptyDataTemplate>
                                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditRowStyle BackColor="#2461BF" />
                                                                <AlternatingRowStyle BackColor="White" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style14" colspan="4">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10" colspan="4">
                                                            &nbsp;</td>
                                                    </tr>
                                                    </table>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        
                                        <tr>
                                            <td align="center">
                                                <asp:Button ID="bntTaoMoi" runat="server" Text="Tạo Mới" 
                                                    onclick="bntTaoMoi_Click" />
                                                <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" 
                                                    onclick="btnCapNhat_Click" />
                                                <asp:Button ID="bntXoa" runat="server" Text="Xóa" Width="59px" 
                                                    onclick="bntXoa_Click" 
                                                    onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" />
                                            </td>
                                        </tr>
                                        
                                        </tr>
                                    </table>
							    </td>
							</tr>							
							<TR>
								<TD align="right" style="text-align: center; width: 100%"  bgColor="#e3e4ff" >
									<asp:Label ID="Label5" runat="server" Font-Bold="True"></asp:Label>
                                </TD>
							</TR>							
						</TABLE>
    </table>
</asp:Content>

