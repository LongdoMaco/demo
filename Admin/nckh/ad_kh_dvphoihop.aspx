<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"   AutoEventWireup="true" CodeFile="ad_kh_dvphoihop.aspx.cs" Inherits="Admin_nckh_dvph" ValidateRequest="false" Title="ĐƠN VỊ PHỐI HỢP ĐỀ TÀI" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>


            
<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>


            
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                       
			<TABLE id="Table1" style="BORDER-COLLAPSE: collapse" borderColor="#111111" 
                cellSpacing="3" cellPadding="0" width="100%" >			
				
				<TR>
					<TD style="HEIGHT: 185px" align="center">
						<TABLE id="Table3" style="BORDER-COLLAPSE: collapse" cellSpacing="3" 
                            cellPadding="0" width="100%" borderColor="#111111">																					
							<tr>							    
							    <td bgColor="#e3e4ff">
							        <table cellpadding="0" cellspacing="0" class="style1" width="100%">
                                                                                    
                                        <tr>
                                            <td class="style5" valign="top">
                                                <table class="style9" width="100%" bgcolor="White" 
                                                    style="border-left-style: solid; border-left-width: 1px; border-left-color: #CCCCCC">
                                                    <tr>
                                                        <td style="font-weight: bold; color: #000000; text-align: center;" colspan="4">
                                                            <uc1:WebUserControl ID="WebUserControl1" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-weight: bold; color: #000000; text-align: center;" colspan="4">
                                                            ĐƠN VỊ PHỐI HỢP ĐỀ TÀI</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-weight: bold; color: #000000; text-align: left;">
                                                            Chọn Đơn&nbsp; Vị </td>
                                                        <td class="style19" style="text-align: left; width: 215px">
                                                            <asp:DropDownList ID="ddlDonVi" runat="server" AutoPostBack="True" 
                                                                onselectedindexchanged="ddlDonVi_SelectedIndexChanged1" Width="300px">
                                                            </asp:DropDownList>
&nbsp;</td>
                                                        <td class="style20" style="color: #000000; text-align: left;">
                                                            <b>Chọn Nhân Viên </b>:</td>
                                                        <td class="style18" style="text-align: left">
                                                            <asp:DropDownList ID="ddlNhanVien" runat="server" AutoPostBack="True" 
                                                                onselectedindexchanged="ddlNhanVien_SelectedIndexChanged1" Width="300px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-weight: bold; color: #000000; text-align: left;">
                                                            Mã Đề Tài :</td>
                                                        <td class="style19" style="width: 215px">
                                                            <b>
                                                            <asp:DropDownList ID="ddldetai" runat="server" Height="25px" Width="300px">
                                                            </asp:DropDownList>
                                                            </b>
                                                        </td>
                                                        <td class="style20" style="color: #000000">
                                                            <b>Đơn Vị Phối Hợp</b></td>
                                                        <td class="style18" style="text-align: left">
                                                            <asp:TextBox ID="txtdohvi" runat="server" Width="300px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-weight: bold; color: #000000; text-align: left;">
                                                            Họ Và Tên:</td>
                                                        <td class="style19" style="width: 215px">
                                                            <b>
                                                            <asp:TextBox ID="txthoten" runat="server" Width="300px"></asp:TextBox>
                                                            </b>
                                                        </td>
                                                        <td class="style20" style="font-weight: bold; color: #000000">
                                                            &nbsp;</td>
                                                        <td class="style18">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style14" colspan="4" style="font-weight: bold">
                                                            <span style="color: #000000">
                                                            <asp:Label ID="lblthongbao" runat="server" ForeColor="Red"></asp:Label>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style14" colspan="4" style="font-weight: bold; text-align: left;" 
                                                            align="center">
                                                            <span style="color: #000000">Nội Dung&nbsp; </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                                            <asp:TextBox ID="txtnoidung" runat="server" TextMode="MultiLine" Width="500px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" Width="100%" 
                                                    onrowdatabound="GridView1_RowDataBound" ForeColor="#333333" 
                                                    GridLines="None">
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="20px">
                                                            <HeaderTemplate>
                                                                <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                                                    oncheckedchanged="cbheader_CheckedChanged2"  TextAlign="Left" a />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="cbitem" runat="server" />
                                                            </ItemTemplate>

<ItemStyle Width="20px"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="MADETAI" HeaderText="Mã Đề Tài" />
                                                        <asp:BoundField DataField="TENDONVI" HeaderText="Tên Đơn Vị " />
                                                        <asp:BoundField DataField="HOTEN" HeaderText="Họ Và Tên" />
                                                        <asp:TemplateField HeaderText="Edit">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lblEdit" runat="server" onclick="lblEdit_Click">Edit</asp:LinkButton>
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
                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td align="center" bgcolor="White">
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
					</TD>
				</TR>								
				<TR>
					<TD style="text-align: center">
                        &nbsp;</TD>
				</TR>				
			</TABLE>		
			</asp:Content>	
		
	

