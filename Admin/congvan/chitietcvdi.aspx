<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="chitietcvdi.aspx.cs" Inherits="Admin_congvan_chitietcvdi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table cellpadding="0" cellspacing="10" class="style1" width="100%" 
                    bgcolor="White">
                  <TR>
							<td bgcolor="#f5f5f5" style="text-align: center">
								<div align="center">
									<table border="0" id="table11" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<TD style="WIDTH: 3.6%" height="240" rowspan="12"></TD>
											<TD align="right" height="2" colspan="3" 
                                                style="WIDTH: 546px; HEIGHT: 2px; text-align: center;" class="style2">
											    Chi Tiết Công Văn Đi<br />
											</TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%; height: 30px;" align="right">
                                                <asp:HyperLink ID="HyperLink6" runat="server" 
                                                    NavigateUrl="~/Admin/congvan/cvdi.aspx">Công văn đi</asp:HyperLink>
											</TD>
											<TD style="WIDTH: 4.08%; height: 30px;" align="right">&nbsp;</TD>
											<TD style="WIDTH: 439px; height: 30px;">&nbsp;</TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%; height: 30px;" align="right"><asp:label id="Label4" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Mã 
                                                công văn:</asp:label></TD>
											<TD style="WIDTH: 4.08%; height: 30px;" align="right">&nbsp;</TD>
											<TD style="WIDTH: 439px; height: 30px;"><asp:label id="lblMaCV" runat="server" Font-Names="Times New Roman" Width="408px" ForeColor="#804000" Font-Size="12pt"></asp:label></TD>
										</tr>
										<tr>
											<TD style="WIDTH: 22.53%" align="right" height="30"><asp:label id="Label3" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Ngày 
                                                đi:</asp:label></TD>
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
											<TD style="WIDTH: 22.53%; height: 23px;" align="right"><asp:label id="Label6" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Bộ 
                                                phận soạn thảo:</asp:label></TD>
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
											<TD style="WIDTH: 22.53%" align="right" height="30"><asp:label id="Label13" runat="server" ForeColor="DarkBlue" Font-Names="Tahoma" Font-Size="10pt">Người 
                                                ký:</asp:label></TD>
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
										</table>
								</div>
                                </td>
							</TR>
							<%--<TR>
								<TD style="HEIGHT: 24px">
									<asp:Label id="Label2" runat="server"></asp:Label></TD>
							</TR>--%>
                </table>
</asp:Content>

