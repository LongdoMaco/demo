<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="xemcongvan.aspx.cs" Inherits="user.congvan.user_chitietcongvan" Title="Untitled Page" %>
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
                &nbsp;</td>
    </tr>
    <tr>
        <td valign="top" align="left" 
            style="border: 1px solid rgb(223, 223, 223); background-color: rgb(246, 246, 246);">
           
        
        
                <table cellpadding="0" cellspacing="10" class="style1" width="100%" 
                    bgcolor="White">
                  <TR>
							<td bgcolor="#f5f5f5" style="text-align: center">
								<TABLE id="Table3" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<TR>
								<TD style="HEIGHT: 24px">
						<asp:Label id="Label4" runat="server" Font-Size="Small" Font-Names="Times New Roman" ForeColor="Red"
							Width="306px" Visible="False">Chưa có chuyên đề nào được cập nhật</asp:Label></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 24px">
									<asp:label id="Label3" runat="server" Font-Size="Small" Font-Names="Times New Roman" ForeColor="Blue"
										Font-Bold="True">Chọn loại công văn đến :</asp:label>
									<asp:dropdownlist id="dlChuyende" runat="server" Font-Size="Small" Font-Names="Times New Roman" AutoPostBack="True"
										Width="181px" onselectedindexchanged="dlChuyende_SelectedIndexChanged"></asp:dropdownlist></TD>
							</TR>
							<TR>
								<TD style="HEIGHT: 24px">
									<asp:Label id="Label2" runat="server"></asp:Label></TD>
							</TR>
							<TR>
								<%--<TD align="right">
									<asp:datagrid id="DataGrid1" runat="server" Font-Size="Small" Font-Names="Times New Roman" Width="712px"
										AutoGenerateColumns="False" AllowPaging="True">
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
											<asp:TemplateColumn HeaderText="Ti&#234;u đề">
												<ItemTemplate>
													<asp:LinkButton id="LinkButton1" runat="server" ForeColor="Blue" CommandName="Detail">
														<%# DataBinder.Eval(Container.DataItem, "Trichyeunoidung") %>
													</asp:LinkButton>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="Ngaybanhanh" HeaderText="T&#225;c giả">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Ngayden" HeaderText="Ng&#224;y nhập">
												<HeaderStyle Width="25%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn Visible="False" HeaderText="Trangthai">
												<ItemTemplate>
													<asp:Label id="hinh" runat="server"></asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
										</Columns>
										<PagerStyle BackColor="#999999" Mode="NumericPages"></PagerStyle>
									</asp:datagrid>
									<asp:Button id="Button2" runat="server" Font-Size="X-Small" Font-Names="Tahoma" Width="64px"
										Text="Thêm" onclick="Button2_Click"></asp:Button>
									<asp:Button id="Button1" runat="server" Font-Size="X-Small" Font-Names="Tahoma" Width="53px"
										Text="Xóa" onclick="Button1_Click"></asp:Button></TD>--%>
							            <td align="center">
							            <asp:DataGrid id="DataGrid1" runat="server" Width="100%" 
                                                Font-Names="Times New Roman" CellPadding="2" AutoGenerateColumns="False"
								            AllowPaging="True" ForeColor="Black" GridLines="None" 
                                                OnSelectedIndexChanged="DataGrid1_SelectedIndexChanged" 
                                                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
								            <SelectedItemStyle ForeColor="GhostWhite" BackColor="DarkSlateBlue"></SelectedItemStyle>
								            <ItemStyle HorizontalAlign="Center"></ItemStyle>
								            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" BackColor="Tan"></HeaderStyle>
								            <FooterStyle BackColor="Tan"></FooterStyle>
								            <Columns>
									            <asp:TemplateColumn Visible="False" HeaderText="ID">
												<ItemTemplate>
													<asp:Label id="ID" runat="server" text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'>
													</asp:Label>
												</ItemTemplate>
											</asp:TemplateColumn>
									            <asp:BoundColumn DataField="MaCv" HeaderText="M&#227; CV">
										            <HeaderStyle Width="10%"></HeaderStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="SoKyhieu" HeaderText="Số K&#253; hiệu">
										            <HeaderStyle Width="20%"></HeaderStyle>
									            </asp:BoundColumn>
									            <asp:BoundColumn DataField="Trichyeunoidung" HeaderText="Tr&#237;ch yếu nội dung">
										            <HeaderStyle Width="60%"></HeaderStyle>
									            </asp:BoundColumn>
									            <asp:TemplateColumn HeaderText="Xem">
										            <HeaderStyle Width="15%"></HeaderStyle>
										            <ItemTemplate>
											            <asp:LinkButton id="LinkButton1" runat="server" CommandName="Detail">Chi tiÕt</asp:LinkButton>
										            </ItemTemplate>
									            </asp:TemplateColumn>
								            </Columns>
								            <PagerStyle HorizontalAlign="Center" ForeColor="DarkSlateBlue" BackColor="PaleGoldenrod"></PagerStyle>
                                            <AlternatingItemStyle BackColor="PaleGoldenrod" />
							            </asp:DataGrid>
						            </td>
							</TR>
						</TABLE>
								</td>
							</TR>
							<%--<TR>
								<TD style="HEIGHT: 24px">
									<asp:Label id="Label2" runat="server"></asp:Label></TD>
							</TR>--%>
                </table>
           
        
        
        </td>
    </tr>
</tbody></table>
</asp:Content>

