<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="congvanden.aspx.cs" Inherits="user_xemcongvan" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="770" cellspacing="10" cellpadding="0" border="0" style="background-color: White;"> 
    <tbody><tr>
        <td align="left" class="accoditionHeader" style="width: 100%;"> 
            &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="~/user/xemcongvan.aspx">Công văn đến chưa xem</asp:HyperLink>
            &nbsp;|
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="~/user/cvdichuaxem.aspx">Công văn đi chưa xem</asp:HyperLink>
            &nbsp;|
            <asp:HyperLink ID="HyperLink3" runat="server" 
                NavigateUrl="~/user/congvandi.aspx">Công văn đi
            </asp:HyperLink>
            &nbsp;|
            <asp:HyperLink ID="HyperLink4" runat="server" 
                NavigateUrl="~/user/congvanden.aspx">Công văn đến</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" 
            style="border: 1px solid rgb(223, 223, 223); background-color: rgb(246, 246, 246);">
           
        
        
                <table cellpadding="0" cellspacing="10" class="style1" width="100%" 
                    bgcolor="White">
                    <TR>
								<TD style="HEIGHT: 24px" align="right">
									<asp:label id="Labelcd" runat="server" Font-Size="Small" Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True">Chọn 
                                    loại CV :</asp:label>
									<asp:dropdownlist id="dlChuyende" runat="server" Font-Size="Small" Font-Names="Times New Roman" AutoPostBack="True" Width="169px" onselectedindexchanged="dlChuyende_SelectedIndexChanged"></asp:dropdownlist>
								    <asp:label id="Labelcq" runat="server" Font-Size="Small" Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True">Chọn 
                                    CQBH :</asp:label>
									<asp:dropdownlist id="dlCoquanbanhanh" runat="server" Font-Size="Small" Font-Names="Times New Roman" AutoPostBack="True" Width="175px" onselectedindexchanged="dlCoquanbanhanh_SelectedIndexChanged"></asp:dropdownlist>
								    <asp:label id="Label2" runat="server" Font-Size="Small" Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True">Chọn 
                                    Mã CV :</asp:label>
									<asp:dropdownlist id="dlMacv" runat="server" Font-Size="Small" Font-Names="Times New Roman" AutoPostBack="True" Width="103px" onselectedindexchanged="dlMacv_SelectedIndexChanged"></asp:dropdownlist>
								</TD>
							</TR>	
							<TR>
                                  <TD bgColor="#e3e4e6">
                                    <TABLE style="BORDER-COLLAPSE: collapse" borderColor="#111111" cellSpacing="0" cellPadding="0" width="100%" border="0">
                                      <TBODY>
                                      <TR>
                                        <TD class=tdTa8_black width=80 style="height: 32px">&nbsp;<strong><span style="color: #0000cc">&nbsp;<span style="font-size: 10pt"> 
                                            từ ngày:</span>
                                            </span></strong>
                                        </TD>
                                        <TD class="st2" style="height: 32px">
                                            <asp:TextBox ID="tungay" runat="server" CssClass="HopVanBan2" Width="84px"></asp:TextBox>
                                            <IMG class="Button_cal" onclick="popUpCalendar(document.Form1.tungay, document.Form1.tungay, 'dd/mm/yyyy')" alt="Chọn ngày" src="../Image/gif/calendar.gif"align="Middle"> 
                                            &nbsp;&nbsp; <strong><span style="color: #0000cc">đến ngày:
                                            <asp:TextBox ID="denngay" runat="server" CssClass="HopVanBan2" Width="97px"></asp:TextBox></span></strong>
                                         <IMG class="Button_cal" onclick="popUpCalendar(document.Form1.tungay, document.Form1.denngay, 'dd/mm/yyyy')" alt="Chọn ngày" src="../Image/gif/calendar.gif "align="Middle">
                                            <asp:Button ID="btxemall" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="OK" Width="40px" OnClick="btxemall_Click" /></TD>
                                       </TR>
                                      <TR>
                                        <TD width=25 style="height: 32px" colspan="2">
                                            <asp:Label ID="Label4" runat="server" style="font-weight: 700; color: #CC3300"></asp:Label>
                                          </TD>
                                       </TR>
                                      </TBODY>
                                     </TABLE>
                                </TD>
                            </TR>
							<%--<TR>
								<TD style="HEIGHT: 24px">
									<asp:Label id="Label2" runat="server"></asp:Label></TD>
							</TR>--%>
							<TR>
								<TD align="center" style="text-align: right">
									<asp:datagrid id="DataGrid1" runat="server" Font-Size="Small" 
                                        Font-Names="Times New Roman" Width="100%"
										AutoGenerateColumns="False" AllowPaging="True" BackColor="White" BorderColor="#CC9966" 
                                        BorderStyle="None" BorderWidth="1px" CellPadding="4">
										<HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></HeaderStyle>
										<FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>
										<Columns>
											<asp:TemplateColumn Visible="False" HeaderText="ID">
												<ItemTemplate>
													<asp:Label id="ID" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>											
											<asp:BoundColumn DataField="denngay" HeaderText="Ng&#224;y đến">												
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Sokyhieu" HeaderText="Số k&#253; hiệu">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Tr&#237;ch yếu nội dung">
												<ItemTemplate>
													<asp:LinkButton Width="300" id="LinkButton1" runat="server" ForeColor="Blue" CommandName="Detail">
														<%# DataBinder.Eval(Container.DataItem, "Trichyeunoidung") %>
													</asp:LinkButton>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="banhanhngay" HeaderText="Ng&#224;y BH">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											
											<asp:BoundColumn DataField="Noinhan" HeaderText="Nơi nhận">
												<HeaderStyle Width="25%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn Visible="False" HeaderText="Trangthai">
												<ItemTemplate>
													<asp:Label id="hinh" runat="server"></asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center"></PagerStyle>
                                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                        <ItemStyle BackColor="White" ForeColor="#330099" />
									</asp:datagrid>
									<asp:datagrid id="DataGridcd" runat="server" Font-Size="Small" 
                                        Font-Names="Times New Roman" Width="100%"
										AutoGenerateColumns="False" AllowPaging="True" PageSize="30">
										<HeaderStyle Font-Bold="True" ForeColor="#000099" BackColor="#999999"></HeaderStyle>
										<FooterStyle BackColor="#999999"></FooterStyle>
										<Columns>
											<asp:TemplateColumn Visible="False" HeaderText="ID">
												<ItemTemplate>
													<asp:Label id="ID" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn>
												<HeaderStyle Width="3%"></HeaderStyle>
												<HeaderTemplate>
													<INPUT id="checkall" type="checkbox" language="javascript" onclick="return checkall_onclick()">
												</HeaderTemplate>
												<ItemTemplate>
													<asp:CheckBox id="CheckBox1" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="denngay" HeaderText="Ng&#224;y &#273;&#7871;n">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Tr&#237;ch y&#7871;u n&#7897;i dung">
												<ItemTemplate>
													<asp:LinkButton Width="300" id="LinkButton1" runat="server" ForeColor="Blue" CommandName="Detail">
														<%# DataBinder.Eval(Container.DataItem, "Trichyeunoidung") %>
													</asp:LinkButton>
													<asp:HyperLink ID="HyperLink1" runat="server"  Width="70px" Height="18px"></asp:HyperLink>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="banhanhngay" HeaderText="Ng&#224;y ban h&#224;nh">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Sokyhieu" HeaderText="S&#7889; k&#253; hi&#7879;u">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Noinhan" HeaderText="N&#417;i nh&#7853;n">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn Visible="False" HeaderText="fileupload">
												<ItemTemplate>
													<asp:Label id="Fileupload" runat="server"></asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>	
										
										</Columns>
										<PagerStyle BackColor="#999999" Mode="NumericPages"></PagerStyle>
									</asp:datagrid>
									<asp:datagrid id="DataGridcq" runat="server" Font-Size="Small" 
                                        Font-Names="Times New Roman" Width="100%"
										AutoGenerateColumns="False" AllowPaging="True" PageSize="30">
										<HeaderStyle Font-Bold="True" ForeColor="#000099" BackColor="#999999"></HeaderStyle>
										<FooterStyle BackColor="#999999"></FooterStyle>
										<Columns>
											<asp:TemplateColumn Visible="False" HeaderText="ID">
												<ItemTemplate>
													<asp:Label id="ID" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn>
												<HeaderStyle Width="3%"></HeaderStyle>
												<HeaderTemplate>
													<INPUT id="Checkbox2" type="checkbox" language="javascript" onclick="return checkall_onclick()">
												</HeaderTemplate>
												<ItemTemplate>
													<asp:CheckBox id="CheckBox1" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="denngay" HeaderText="Ng&#224;y &#273;&#7871;n">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Tr&#237;ch y&#7871;u n&#7897;i dung">
												<ItemTemplate>
													<asp:LinkButton Width="300" id="LinkButton1" runat="server" ForeColor="Blue" CommandName="Detail">
														<%# DataBinder.Eval(Container.DataItem, "Trichyeunoidung") %>
													</asp:LinkButton>
													<asp:HyperLink ID="HyperLink1" runat="server"  Width="70px" Height="18px"></asp:HyperLink>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="banhanhngay" HeaderText="Ng&#224;y ban h&#224;nh">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Sokyhieu" HeaderText="S&#7889; k&#253; hi&#7879;u">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Noinhan" HeaderText="N&#417;i nh&#7853;n">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn Visible="False" HeaderText="fileupload">
												<ItemTemplate>
													<asp:Label id="Fileupload" runat="server"></asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>											
										
										</Columns>
										<PagerStyle BackColor="#999999" Mode="NumericPages"></PagerStyle>
									</asp:datagrid>
									<asp:datagrid id="DataGridmcv" runat="server" Font-Size="Small" 
                                        Font-Names="Times New Roman" Width="100%"
										AutoGenerateColumns="False" AllowPaging="True" PageSize="30">
										<HeaderStyle Font-Bold="True" ForeColor="#000099" BackColor="#999999"></HeaderStyle>
										<FooterStyle BackColor="#999999"></FooterStyle>
										<Columns>
											<asp:TemplateColumn Visible="False" HeaderText="ID">
												<ItemTemplate>
													<asp:Label id="ID" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn>
												<HeaderStyle Width="3%"></HeaderStyle>
												<HeaderTemplate>
													<INPUT id="Checkbox3" type="checkbox" language="javascript" onclick="return checkall_onclick()">
												</HeaderTemplate>
												<ItemTemplate>
													<asp:CheckBox id="CheckBox1" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="denngay" HeaderText="Ng&#224;y &#273;&#7871;n">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Tr&#237;ch y&#7871;u n&#7897;i dung">
												<ItemTemplate>
													<asp:LinkButton Width="300" id="LinkButton1" runat="server" ForeColor="Blue" CommandName="Detail">
														<%# DataBinder.Eval(Container.DataItem, "Trichyeunoidung") %>
													</asp:LinkButton>
													<asp:HyperLink ID="HyperLink1" runat="server" Width="70px" Height="18px"></asp:HyperLink>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="banhanhngay" HeaderText="Ng&#224;y ban h&#224;nh">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Sokyhieu" HeaderText="S&#7889; k&#253; hi&#7879;u">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Noinhan" HeaderText="N&#417;i nh&#7853;n">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn Visible="False" HeaderText="fileupload">
												<ItemTemplate>
													<asp:Label id="Fileupload" runat="server"></asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>											
										</Columns>
										<PagerStyle BackColor="#999999" Mode="NumericPages"></PagerStyle>
									</asp:datagrid>
                                    </TD>
							</TR>
							<TR>
		                        <TD width="770" align="center" colSpan="2" vAlign="top" height="10" bgColor="#e3e4e6">
			                        <p align="right">
			                        <asp:Button ID="butXem" runat="server" ForeColor="Blue" OnClick="butXem_Click" Text="Xem tất cả"
                                        Width="83px" /><asp:Button ID="btThoat" runat="server" OnClick="btThoat_Click" Text="Thoát" />
		                        </TD>
	                        </TR>
                </table>
           
        
        
        </td>
    </tr>
</tbody></table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
 
<style type="text/css">
    .style8
    {
        height: 32px;
        width: 219px;
    }
</style>




</asp:Content>


