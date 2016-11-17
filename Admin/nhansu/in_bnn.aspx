<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="in_bnn.aspx.cs" Inherits="Admin_nhansu_in_nnn" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<!--
return document_onclick()
//-->

    <table id="Table3"  width="100%" >																					
							<tr>							    
							    <td >
							        <table cellpadding="0" cellspacing="0" class="style1" width="100%" 
                                        bgcolor="White">
                                        <tr>
                                            
                                            <td class="style1" colspan="4">
                                                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td >
								               
								                Đơn vị</td>
                                            <td >
								                    <asp:dropdownlist id="dlChuyende" runat="server" AutoPostBack="True" 
                                                    Width="238px" onselectedindexchanged="dlChuyende_SelectedIndexChanged"></asp:dropdownlist>
								            </td>
                                            <td style="text-align: left">
								                Nhân viên CBVC</td>
                                            <td>
								                <asp:DropDownList ID="dlthongtin" runat="server" Width="238px" ></asp:DropDownList>
								            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; width: 200px;">Ngày bắt đầu làm</td>
                                            <td style="width: 390px">
                                                <asp:TextBox ID="txtngaybatdau" runat="server" Width="238px"></asp:TextBox>
                                                 <asp:CalendarExtender ID="txttungay_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtngaybatdau" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
                                            <td style="text-align: left">Ngày tuyển dụng</td>
                                            <td>
                                                <asp:TextBox ID="txtngaytuyendung" runat="server"></asp:TextBox>
                                                 <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Enabled="True" TargetControlID="txtngaytuyendung" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; width: 250px;">Loại hợp đồng</td>
                                            <td style="width: 390px">
                            <asp:DropDownList ID="dlloaihopdong" runat="server" Width="238px">
                            </asp:DropDownList>
                                            </td>
                                            <td style="text-align: left">Ngày hết tập sự </td>
                                            <td>
                                                <asp:TextBox ID="txtngayhettapsu" runat="server"></asp:TextBox>
                                                 <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Enabled="True" TargetControlID="txtngayhettapsu" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; width: 250px;">Tăng lương trước thời hạn</td>
                                            <td style="width: 390px">
                                                <asp:TextBox ID="txttangluong" runat="server" Width="238px"></asp:TextBox>
                                                 <asp:CalendarExtender ID="CalendarExtender3" runat="server" 
                    Enabled="True" TargetControlID="txttangluong" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
                                            <td style="text-align: left">&nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; width: 250px;">Ngày Bổ Nhiệm :</td>
                                            <td style="width: 390px" width="128">
                                                <asp:TextBox ID="txtngaybonhiem" runat="server" Width="238px"></asp:TextBox>
                                                          <asp:CalendarExtender ID="CalendarExtender5" runat="server" 
                    Enabled="True" TargetControlID="txtngaybonhiem" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
                                            <td style="text-align: left">Bậc trong ngạch</td>
                                            <td>
                                                <asp:TextBox ID="txtbactrongngach" runat="server" Width="128px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; width: 250px;">
                                                Mã viên chức</td>
                                            <td style="width: 390px">
                                                <asp:DropDownList ID="dlmavienchuc" runat="server" Width="238px" 
                                                    style="text-align: left"> </asp:DropDownList>	</td>
                                            <td style="text-align: left">
                                                Hệ số lương</td>
                                            <td>
                                                <asp:DropDownList ID="dlhesoluong" runat="server" Width="128px" > </asp:DropDownList>	</td>
                                           
                                        </tr>
                                        
                                        <tr>
                                            <td style="text-align: left; width: 250px;">  Hưởng từ ngày :</td>
                                            <td style="width: 390px">
                                                <asp:TextBox ID="txtngayhuongluong" runat="server" Width="238px"></asp:TextBox>
                                                 <asp:CalendarExtender ID="CalendarExtender4" runat="server" 
                    Enabled="True" TargetControlID="txtngayhuongluong" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                            </td>
                                            <td style="text-align: left">Hệ số thâm niên </td>
                                            <td>
									            <asp:TextBox ID="txthesothamnien" runat="server" Width="128px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; width: 250px;">
                                                Công việc đang làm</td>
                                            <td colspan="3">                                           
                                                <INPUT id="txtdanglam" style="WIDTH: 314px; HEIGHT: 24px; text-align: left;" 
                                                    type="text" maxLength="100"
														name="txtdanglam" runat="server" language="javascript" ></td>
                                        </tr>
                                        </table>
							    </td>
							</tr>							
							<TR>
								<TD align="right" style="text-align: center"  bgColor="#e3e4ff">
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
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
                                            <asp:BoundField DataField="MAVIENCHUC" HeaderText="Mã Ngạch" />
                                            <asp:BoundField DataField="HOVATEN" HeaderText="Họ Và Tên" />
                                            <asp:BoundField DataField="NGAYBATDAU" HeaderText="Ngày Bắt Đầu" />
                                            <asp:BoundField DataField="NGAYTUYENDUNG" HeaderText="Ngày TD" />
                                            <asp:BoundField DataField="NGAYBONHIEM" HeaderText="Ngày Bổ Nhiệm" />
                                            <asp:BoundField DataField="HESOLUONG" HeaderText="HS Lương" />
                                            <asp:BoundField DataField="NGAYHUONGLUONG" HeaderText="Ngày Hưởng" />
                                            <asp:BoundField DataField="CONGVIECBONHIEM" HeaderText="Công Việc Đang Làm" />
                                            <asp:TemplateField HeaderText="Xem">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtedit" runat="server" onclick="lbtedit_Click">Xem</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <EmptyDataTemplate>
                                            Chưa Có Dữ Liệu
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                    <asp:Button ID="btnThemMoi" runat="server" onclick="btnThemMoi_Click" 
                                        Text="Thêm Mới" />
                                    <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" 
                                        onclick="btnCapNhat_Click" />
                                    <asp:Button ID="btnXoa" runat="server" Text="Xóa" onclick="btnXoa_Click" />
                                    <br />
                                    <br />
                                    <asp:Label ID="Label5" runat="server" style="color: #FF0000"></asp:Label>
                                    </TD>
							</TR>							
						</table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

   
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>


</asp:Content>


