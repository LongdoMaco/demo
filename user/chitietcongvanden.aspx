<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="chitietcongvanden.aspx.cs" Inherits="user.congvan.user_chitietcongvanden" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="../Script/popcalendar.js" type="text/javascript"></script>
    	

    <style type="text/css">
        .style8
        {
            text-align: left;
        }
    </style>
    	

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table width="100%" cellspacing="10" cellpadding="0" border="0" 
        style="background-color: White; font-weight: 700;"> 
 
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
                &nbsp;|</td>
    </tr>
    <tr>
        <td valign="top" align="left" 
            style="border: 1px solid rgb(223, 223, 223); background-color: rgb(246, 246, 246);">
           
        
        
                <table cellpadding="0" cellspacing="10" class="style1" width="100%" 
                    bgcolor="White">
                  <TR>
							<td bgcolor="#f5f5f5" style="text-align: center">
								<div align="center">
									<TABLE id="table10" cellSpacing="0" borderColorDark="#c0c0c0" cellPadding="0" 
                                        width="100%" bgColor="#ffffff" borderColorLight="#e6e6e6" border="0" 
                                        style="text-align: center;">
						<tr>
							<td bgcolor="#f5f5f5" style="text-align: center">
								<div align="center">
									<table border="0" id="table11" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<TD style="WIDTH: 3.6%" height="240" rowspan="12"></TD>
											<TD height="2" colspan="3" style="WIDTH: 546px; HEIGHT: 2px" class="style8">
											    <asp:Label ID="Label11" runat="server" ForeColor="#FF3300"></asp:Label>
                                            </TD>
										</tr>
										<tr>
											<TD height="2" colspan="3" style="WIDTH: 546px; HEIGHT: 2px" class="style8">
											    <b>Chi tiết công văn đến</b></TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%; height: 30px;" align="right"><asp:label id="Label4" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Mã 
                                                công văn:</asp:label></TD>
											<TD style="WIDTH: 4.08%; height: 30px;" align="right">&nbsp;</TD>
											<TD style="WIDTH: 439px; height: 30px;"><asp:label id="lblMaCV" runat="server" Font-Names="Times New Roman" Width="408px" ForeColor="#804000" Font-Size="12pt"></asp:label></TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%" align="right" height="30"><asp:label id="Label3" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Ngày 
                                                đến:</asp:label></TD>
											<TD style="WIDTH: 4.08%" align="right" height="30">&nbsp;</TD>
											<TD height="30" style="WIDTH: 439px"><asp:label id="lblNgayden" runat="server" Font-Names="Times New Roman" Width="416px" ForeColor="#804000"></asp:label></TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%" align="right" height="30"><asp:label id="Label2" runat="server" Font-Names="Tahoma" ForeColor="DarkBlue" Font-Size="10pt">Số/ký 
                                                hiệu:</asp:label></TD>
											<TD style="WIDTH: 4.08%" align="right" height="30">&nbsp;</TD>
											<TD height="30" style="WIDTH: 439px"><asp:label id="lblSoKyhieu" runat="server" Font-Names="Times New Roman" Width="408px" ForeColor="#804000"></asp:label></TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%; height: 23px;" align="right"><asp:label id="Label6" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Cơ 
                                                quan ban hành:</asp:label></TD>
											<TD style="WIDTH: 4.08%; height: 23px;" align="right">&nbsp;</TD>
											<TD style="WIDTH: 439px; height: 23px;"><asp:label id="lblCoquan" runat="server" Font-Names="Times New Roman" Width="416px" ForeColor="#804000"></asp:label></TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%; height: 30px;" align="right"><asp:label id="Label7" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt"> 
                                                Loại công văn:</asp:label></TD>
											<TD style="WIDTH: 4.08%; height: 30px;" align="right">&nbsp;</TD>
											<TD style="WIDTH: 439px; height: 30px;"><asp:label id="lblLoai" runat="server" Font-Names="Times New Roman" Width="408px" ForeColor="#804000"></asp:label></TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%" align="right" height="30"><asp:label id="Label1" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Ngày 
                                                ban hành:</asp:label></TD>
											<TD style="WIDTH: 4.08%" align="right" height="30">&nbsp;</TD>
											<TD height="30" style="WIDTH: 439px"><asp:label id="lblNgaybanhanh" runat="server" Font-Names="Times New Roman" Width="408px" ForeColor="#804000"></asp:label></TD>
										</tr>										
										<tr>
											<TD style="WIDTH: 22.53%" align="right" height="30"><asp:label id="Label5" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Trích 
                                                yếu:</asp:label></TD>
											<TD style="WIDTH: 4.08%" align="right" height="30">&nbsp;</TD>
											<TD height="30" style="WIDTH: 439px">
												<TABLE id="table12" style="WIDTH: 320px; HEIGHT: 19px" cellSpacing="0" cellPadding="0"
													width="320" border="0">
													<TR>
														<TD><asp:label id="lblTrichyeu" runat="server" Font-Names="Times New Roman" Width="416px" ForeColor="#804000"></asp:label></TD>
													</TR>
												</TABLE>
											</TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%" align="right" height="30"><asp:label id="Label13" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Số 
                                                lưu công văn:</asp:label></TD>
											<TD style="WIDTH: 4.08%" align="right" height="30">&nbsp;</TD>
											<TD height="30" style="WIDTH: 439px"><asp:label id="lblSoluu" runat="server" Font-Names="Times New Roman" Width="408px" ForeColor="#804000"></asp:label></TD>
										</tr>										
										<tr>
											<TD style="WIDTH: 22.53%" align="right" height="30"><asp:label id="Label8" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Nơi 
                                                nhận công văn:</asp:label></TD>
											<TD style="WIDTH: 4.08%" align="right" height="30">&nbsp;</TD>
											<TD height="30" style="WIDTH: 439px"><asp:label id="lblNoinhan" runat="server" Font-Names="Times New Roman" Width="408px" ForeColor="#804000"></asp:label></TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%" align="right" height="30"><asp:label id="Label9" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt" Visible="False">Nơi 
                                                lưu công văn:</asp:label></TD>
											<TD style="WIDTH: 4.08%" align="right" height="30">&nbsp;</TD>
											<TD height="30" style="WIDTH: 439px"><asp:label id="lblNoiluu" runat="server" Font-Names="Times New Roman" Width="416px" ForeColor="#804000" Visible="False"></asp:label></TD>
										</tr>
										<tr>
											<TD style="WIDTH: 103.74%; HEIGHT: 23px" colSpan="4" height="23">
												<HR align="center" width="100%" color="#cccccc" SIZE="1">
											</TD>
										</tr>
										<tr>
											<TD style="WIDTH: 3.6%; height: 9px;"></TD>
											<TD style="WIDTH: 20.49%; height: 9px;" align="right" colspan="2"><asp:label id="Label10" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Width="113px"
													Font-Size="10pt">Nội dung công văn:</asp:label></TD>
											<TD vAlign="middle" style="WIDTH: 439px; height: 9px;">
												<TABLE id="table13" style="WIDTH: 418px; HEIGHT: 26px" cellSpacing="0" cellPadding="0" width="418" border="0">
													<TR>
														<TD style="height: 69px; text-align: center;">
															<asp:Panel id="Panel1" runat="server" Width="416px" HorizontalAlign="Center">
                                                                &nbsp;<asp:HyperLink ID="HyperLink5" runat="server" Font-Italic="True" Font-Names="Tahoma" Font-Size="11pt" ForeColor="#FF0099" Width="255px"></asp:HyperLink></asp:Panel>
                                                            <asp:Label ID="lblNgaynhap" runat="server" Font-Italic="True" Font-Names="Tahoma"
                                                                Font-Size="10pt" ForeColor="DarkBlue" Width="113px"></asp:Label></TD>
													</TR>
												</TABLE>
											</TD>
										</tr>
										<tr>
											<TD style="WIDTH: 3.6%; height: 9px;">&nbsp;</TD>
											<TD style="height: 9px;" align="right" colspan="3">
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <Columns>
                                                        <asp:TemplateField Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="ID" runat="server" Text='<%# Eval("NguoiSuDungID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="cbitem" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Họ Và Tên" DataField="HOVATEN" />
                                                        <asp:BoundField HeaderText="Ngày Sinh" DataField="NGAYSINH" />
                                                        <asp:BoundField HeaderText="Email" DataField="EMAIL" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                </asp:GridView>
                                            </TD>
										</tr>
										<tr>
											<TD style="WIDTH: 3.6%; height: 9px;">&nbsp;</TD>
											<TD style="height: 9px; text-align: center;" align="right" colspan="3">
                                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Forward" 
                                                    Visible="False" />
                                                <asp:Label ID="Label14" runat="server"></asp:Label>
                                            </TD>
										</tr>
									</table>
								</div>
                                </td>
						</tr>
					</TABLE>
           
        
        
        </td>
    </tr>
</tbody></table>
</asp:Content>

