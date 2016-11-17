<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="cvdenchuaxem.aspx.cs" Inherits="user_xemcongvan" Title="Untitled Page" %>

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
                    <tr>
                        <td class="style2" style="text-align: center">
									<asp:datagrid id="DataGrid1" runat="server" Font-Size="Small" 
                                Font-Names="Times New Roman" Width="100%"
										AutoGenerateColumns="False" AllowPaging="True" BackColor="White" BorderColor="#CC9966" 
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" PageSize="20">
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
										<PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center"></PagerStyle>
                                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                        <ItemStyle BackColor="White" ForeColor="#330099" />
									</asp:datagrid>
                        </td>
                    </tr>
                </table>
           
        
        
        </td>
    </tr>
</tbody></table>
</asp:Content>

