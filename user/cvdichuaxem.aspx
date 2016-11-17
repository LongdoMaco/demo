<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="cvdichuaxem.aspx.cs" Inherits="user.congvan.user_cvdichuaxem" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="../Script/popcalendar.js" type="text/javascript"></script>
    	

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
								<TD style="HEIGHT: 24px; text-align: left;" align="right">
									<asp:Label ID="Label4" runat="server" style="color: #FF0000"></asp:Label>
								</TD>
							</TR>
                  <TR>
								<TD style="HEIGHT: 24px" align="right">
									<asp:label id="Label3" runat="server" Font-Size="Small" Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True">Chọn 
                                    loại CV :</asp:label>
									<asp:dropdownlist id="dlChuyende" runat="server" Font-Size="Small" Font-Names="Times New Roman" AutoPostBack="True" Width="169px" onselectedindexchanged="dlChuyende_SelectedIndexChanged"></asp:dropdownlist>
								    <asp:label id="Label1" runat="server" Font-Size="Small" Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True">Chọn 
                                    BPST :</asp:label>
									<asp:dropdownlist id="dlCoquanbanhanh" runat="server" Font-Size="Small" Font-Names="Times New Roman" AutoPostBack="True" Width="175px" onselectedindexchanged="dlCoquanbanhanh_SelectedIndexChanged"></asp:dropdownlist>
								    <asp:label id="Label2" runat="server" Font-Size="Small" Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True">Chọn 
                                    Mã CV :</asp:label>
									<asp:dropdownlist id="dlMacv" runat="server" Font-Size="Small" Font-Names="Times New Roman" AutoPostBack="True" Width="103px" onselectedindexchanged="dlMacv_SelectedIndexChanged"></asp:dropdownlist>
								</TD>
							</TR>
							<%--<TR>
								<TD style="HEIGHT: 24px">
									<asp:Label id="Label2" runat="server"></asp:Label></TD>
							</TR>--%>
							
							<TR>
                                  <TD align="right" bgColor="#e3e4e6">
                                        <TABLE style="BORDER-COLLAPSE: collapse" borderColor="#111111" cellSpacing="0" cellPadding="0" width="100%" border="0">
                                          <TBODY>
                                          <TR>
                                            <TD width=25 style="height: 12px"><IMG height=15 src="../Image/gif/vuong.gif"></TD>
                                            <TD class=tdTa8_black style="height: 12px; width: 225px;">
                                                <asp:label id="Label5" 
                                                    runat="server" Font-Size="Small" Font-Names="Arial" ForeColor="OrangeRed"
										    Font-Bold="True" Width="222px" Height="16px" style="font-size: x-small">Danh sách công văn đi chưa xem</asp:label></TD>
                                            <TD class=tdTa8_black width=80 style="height: 12px; text-align: right;">&nbsp;<strong><span style="color: #0000cc">&nbsp;<span style="font-size: 10pt"> 
                                                từ ngày:</span>
                                                </span></strong>
                                            </TD>
                                            <TD class="st2" style="height: 12px; text-align: right;">
                                                <asp:TextBox ID="tungay" runat="server" Width="87px" Font-Size="X-Small"></asp:TextBox>
                                                <IMG class="Button_cal" onclick="popUpCalendar(document.Content2.tungay, document.Content2.tungay, 'dd/mm/yyyy')" alt="Chọn ngày" src="../Image/gif/calendar.gif"align="Middle"> 
                                                &nbsp;&nbsp; <strong><span style="color: #0000cc">đến ngày:&nbsp;</span></strong>
                                                <asp:TextBox ID="denngay" runat="server" Font-Size="X-Small" Width="86px"></asp:TextBox>
                                                <IMG class="Button_cal" onclick="popUpCalendar(document.Form1.Content2.tungay, document.Form1.Content2.denngay, 'dd/mm/yyyy')" alt="Chọn ngày" src="../Image/gif/calendar.gif" align="Middle">
                                                <asp:Button ID="btxemall" runat="server" Font-Bold="True" ForeColor="#FF0066" Text="OK"
                                                    Width="40px" OnClick="btxemall_Click" /></TD>
                                           </TR>
                                          </TBODY>
                                         </TABLE>
                                  </TD>
                            </TR>
							<TR>
								<TD align="right" style="text-align: right"  bgColor="#e3e4ff">
									<asp:datagrid id="DataGrid1" runat="server" Font-Size="Small" 
                                        Font-Names="Times New Roman" Width="100%"
										AutoGenerateColumns="False" AllowPaging="True" PageSize="20" CellPadding="4" ForeColor="#333333" 
                                        GridLines="None">
										<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#990000"></HeaderStyle>
										<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>
										<AlternatingItemStyle BackColor="White" />
                                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
										<Columns>
											<asp:TemplateColumn Visible="False" HeaderText="ID">
												<ItemTemplate>
													<asp:Label id="ID" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn Visible="false">
												<HeaderStyle Width="3%"></HeaderStyle>
												<HeaderTemplate>
													<INPUT id="checkall" type="checkbox" language="javascript" onclick="return checkall_onclick()">
												</HeaderTemplate>
												<ItemTemplate>
													<asp:CheckBox id="CheckBox1" runat="server"></asp:CheckBox>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="dingay" HeaderText="Ng&#224;y đến">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Tr&#237;ch yếu nội dung">
												<ItemTemplate>
													<asp:LinkButton Width="300" id="LinkButton1" runat="server" ForeColor="Blue" CommandName="Detail">
														<%# DataBinder.Eval(Container.DataItem, "Trichyeunoidung") %>
													</asp:LinkButton>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="banhanhngay" HeaderText="Ng&#224;y ban h&#224;nh">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Sokyhieu" HeaderText="Số k&#253; hiệu">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Noinhan" HeaderText="Nơi nhận">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn Visible="False" HeaderText="Trangthai">
												<ItemTemplate>
													<asp:Label id="hinh" runat="server"></asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
										<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center"></PagerStyle>
									</asp:datagrid>
                                    </TD>
							</TR>
							<TR>
								<TD align="right" style="text-align: right"  bgColor="#e3e4ff">
                                    <asp:Button ID="butXem" runat="server" OnClick="butXem_Click" Text="Xem tất cả" Width="83px" ForeColor="Blue" />
                                    </TD>
							</TR>
                </table>
           
        
        
        </td>
    </tr>
</tbody></table>
</asp:Content>

