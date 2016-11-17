<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"AutoEventWireup="true" CodeFile="ktcanhasn.aspx.cs" Inherits="Admin_nhansu_in_khanttp" Title="KHEN THƯỞNG CÁ NHÂN" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>


<%@ Register src="../nhansu/UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <TABLE id="Table3" style="BORDER-COLLAPSE:  cellSpacing="0" 
                            cellPadding="5" width="100%" borderColor="#111111" 
        align="left" bgcolor="White"  >																					
							<tr>							    
							    <td bgColor="#e3e4ff">
							        <table cellpadding="5" cellspacing="5" class="style1" width="100%" 
                                        bgcolor="White">
                                        <tr>
                                            <td style="text-align: left">
                                                &nbsp;</td>
                                            <td style="text-align: center; color: #000000;" class="style4" colspan="6">
								                <uc2:WebUserControl ID="WebUserControl1" runat="server" />
                                            </td>
                                        </tr>                                  
                                        <tr>
                                            <td style="text-align: left">
                                                &nbsp;</td>
                                            <td style="text-align: center; color: #000000;" class="style4" colspan="6">
								                KHEN THƯỞNG CÁ NHÂN</td>
                                        </tr>                                  
                                        <tr>
                                            <td style="text-align: left">
                                                &nbsp;</td>
                                            <td style="text-align: right" class="style4" colspan="6">
								                &nbsp;</td>
                                        </tr>                                  
                                        <tr>
                                            <td style="text-align: left; color: #000000;">
                                                &nbsp;</td>
                                            <td style="text-align: left; color: #000000;" class="style4" colspan="6">
								                Ban đang xem thông tin của :<asp:Label ID="Label7" runat="server"></asp:Label>
                                            </td>
                                        </tr>                                  
                                        <tr>
                                            <td style="text-align: left">
                                                &nbsp;</td>
                                            <td style="text-align: left" class="style4" colspan="6">
								                <asp:label id="Label3" runat="server" Font-Size="Small" 
                                                    Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True" Width="128px">Chọn đơn vị:</asp:label>
								                    <asp:dropdownlist id="dlChuyende" runat="server" AutoPostBack="True" 
                                                    Width="238px" onselectedindexchanged="dlChuyende_SelectedIndexChanged"></asp:dropdownlist>
								            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="Label6" runat="server" style="color: #000000" 
                                                    Text="Chọn CBVC"></asp:Label>
&nbsp;:
                                                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="200px" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlNhanVien_SelectedIndexChanged">
                                                </asp:DropDownList>
								            </td>
                                        </tr>                                  
                                        <tr>
                                            <td style="text-align: left">
                                                &nbsp;</td>
                                            <td style="text-align: left; color: #000000;" class="style4">
                                                Hình thức</td>
                                            <td style="text-align: left">
                                                <asp:DropDownList ID="dlhinhthuc" runat="server" AutoPostBack="True" Width="160" 
                                                    style="text-align: left" onselectedindexchanged="dlhinhthuc_SelectedIndexChanged"> </asp:DropDownList>	</td>
                                            <td style="text-align: left">
                                                Được tặng</td>
                                            <td style="text-align: left">
                                                <asp:DropDownList ID="dlduoctang" runat="server" 
                                                    Width="250px" onselectedindexchanged="dlduoctang_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="text-align: left">
                                                Năm học</td>
                                            <td style="text-align: left">
                                                <asp:DropDownList ID="dlnamhoc" runat="server" Width="140" 
                                                    onselectedindexchanged="dlnamhoc_SelectedIndexChanged" > </asp:DropDownList>	</td>
                                        </tr>                                  
                                        <tr>
                                            <td style="text-align: left">
                                                &nbsp;</td>
                                            <td style="text-align: left; color: #000000;" class="style4">
                                                Nội dung</td>
                                            <td style="text-align: left" colspan="5">                                           
                                                <INPUT id="txtnoidung" style="WIDTH: 695px; " type="text" maxLength="300"
														name="txtnoidung" runat="server" language="javascript" ></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td class="style4" style="color: #000000">
                                                Quyết định số</td>
                                            <td style="text-align: left">
                                                <INPUT id="txtquyetdinhso" style="WIDTH: 153px; " type="text" maxLength="100"
														name="txtquyetdinhso" runat="server" language="javascript"></td>
                                            <td style="text-align: left">                                           
                                                Người ký</td>
                                            <td style="text-align: left">
                                                <INPUT id="txtnguoiky" style="WIDTH: 203px; " type="text" maxLength="100"
														name="txtnguoiky" runat="server" language="javascript" ></td>
                                            <td>
                                                Ngày ký</td>
                                            <td style="text-align: left">
                                                <asp:TextBox ID="txtngayky" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtngayky" Format="dd/MM/yyyy"
                                                    runat="server">
                                                </asp:CalendarExtender>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
							    </td>
							</tr>							
							<TR>
								<TD align="right" style="text-align: center; width: 100%"  bgColor="#e3e4ff" >
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" Width="100%" 
                                        AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging" 
                                        PageSize="5" ForeColor="#333333" GridLines="None">
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                                        oncheckedchanged="cbheader_CheckedChanged1" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbitem" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HOVATEN" HeaderText="Họ và tên" />
                                            <asp:BoundField DataField="CHUCDANH" HeaderText="Chức vụ" />
                                            <asp:BoundField DataField="DUOCTANG" HeaderText="Được tặng" />
                                            <asp:BoundField DataField="NAMHOC" HeaderText="Năm học" />
                                            <asp:TemplateField HeaderText="Xem">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtEdi" runat="server" onclick="lbtEdi_Click">Xem</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="IDTHONGTIN" runat="server" Text='<%# Eval("IDTHONGTIN") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <EmptyDataTemplate>
                                            Chưa có dữ liệu
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                    <asp:Button ID="btntaomoi" runat="server" onclick="btntaomoi_Click" 
                                        Text="Thêm Mới" />
                                    <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" 
                                        onclick="btnCapNhat_Click" style="width: 82px" />
                                    <asp:Button ID="btnXoa" runat="server" Text="Xóa" onclick="btnXoa_Click" />
                                    <br />
                                    <asp:Label ID="Label5" runat="server"></asp:Label>
                                    </TD>
							</TR>							
						</TABLE>
       
</asp:Content>

