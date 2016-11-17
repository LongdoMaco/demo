<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="kh_tm.aspx.cs" Inherits="Admin_nckh_Default2" Title="Untitled Page"  ValidateRequest="false"%>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" style="width: 100%" cellspacing="5">
        <tr>
            <td style="text-align: center;" colspan="4">
                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center;" colspan="4">
                <b>KHOA HỌC THUYẾT MINH</b></td>
        </tr>
        <tr>
            <td style="width: 165px">
                Chọn Đợn Vị :</td>
            <td style="width: 148px">
                <asp:DropDownList ID="ddlDonVi" runat="server" Width="300px" 
                    AutoPostBack="True" onselectedindexchanged="ddlDonVi_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td style="width: 219px">
                Chọn Nhân Viên:</td>
            <td>
                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="300px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 165px">
                Mã Đề Tài :</td>
            <td style="width: 148px">
                <asp:TextBox ID="txtMaDeTai" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="width: 219px">
                Tên Đề Tài :</td>
            <td>
                <asp:TextBox ID="txttendetai" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 165px">
                Lĩnh Vực :</td>
            <td style="width: 148px">
								                <asp:DropDownList ID="dllinhvuc" runat="server" 
                    Width="200px" ></asp:DropDownList>
								                </td>
            <td style="width: 219px">
                Loại Hình :</td>
            <td>
								                <asp:DropDownList ID="dlloaihinh" runat="server" Width="169px" ></asp:DropDownList>
								                </td>
        </tr>
        <tr>
            <td style="width: 165px">
                Cơ Quản Chủ Trì :</td>
            <td style="width: 148px">
								                <asp:DropDownList ID="dlchutri" runat="server" Width="200px" 
                                                    style="text-align: left" ></asp:DropDownList>
								                </td>
            <td style="width: 219px">
                Cấp Đề Tài :</td>
            <td>
                                                <asp:DropDownList ID="dlcapdetai" runat="server" Width="169" style="text-align: left"> </asp:DropDownList>	
                                                </td>
        </tr>
        <tr>
            <td style="width: 165px">
                Tên Sản Phầm&nbsp;
            </td>
            <td style="width: 148px">
                                                <INPUT id="txttensanpham" 
                    style="WIDTH: 200px; " type="text" name="txttensanpham" runat="server" 
                    language="javascript" ></td>
            <td style="width: 219px">
                Địa Chỉ Áp Dụng
            </td>
            <td>
                                                <INPUT id="txtdiachiapdung" style="WIDTH: 163px; " type="text" name="txtdiachiapdung" runat="server" language="javascript" ></td>
        </tr>
        <tr>
            <td style="width: 165px">
                Từ Ngày :</td>
            <td style="width: 148px">
                                                   
                                                    <asp:TextBox ID="txttungay" runat="server" 
                    Width="200px"></asp:TextBox>
                                                </td>
            <td style="width: 219px">
                Đến Ngày :</td>
            <td>
                                                <asp:TextBox ID="txtdenngay" runat="server"></asp:TextBox>
                                            </td>
        </tr>
        <tr>
            <td style="width: 165px">
                Kinh Phí
            </td>
            <td style="width: 148px">
                                                <INPUT id="txtbangso" style="WIDTH: 200px; " 
                    type="text" name="txtbangso" runat="server" language="javascript" ></td>
            <td style="width: 219px">
                Bằng Chữ
            </td>
            <td>
                                                <INPUT id="txtbangchu" style="WIDTH: 340px; " type="text" 
														name="txtbangchu" runat="server" language="javascript" ></td>
        </tr>
        <tr>
            <td colspan="4">
                <b>Tình cấp thiết của đề tài</b></td>
        </tr>
        <tr>
            <td colspan="4">
                                                <FTB:FreeTextBox ID="txtcapthiet" runat="server" Height="150" Width="100%" 
                                                    
                                                    ToolbarLayout='runat="Server" Width="600px" ImageGalleryUrl="ftb.imagegallery.aspx?rif=/imagespath/&amp;cif=~/images/' >
                                                </FTB:FreeTextBox>
                                            </td>
        </tr>
        <tr>
            <td colspan="4">
                                                <b>Mục tiêu của đề tài</b></td>
        </tr>
        <tr>
            <td colspan="4">
                                                <FTB:FreeTextBox ID="txtmuctieu" runat="server" Width="100%" Height="150" 
                                                    ToolbarLayout="runat=&quot;Server&quot; Width=&quot;600px&quot; ImageGalleryUrl=&quot;ftb.imagegallery.aspx?rif=/imagespath/&amp;cif=~/images/">
                                                </FTB:FreeTextBox>
                                            </td>
        </tr>
        <tr>
            <td colspan="4">
                                                <b>Kết quả nghiên cứu và sản phẩm trong,&nbsp; ngoài nước liên quan đến đề tài 
                                                </b> 
            </td>
        </tr>
        <tr>
            <td colspan="4">
                                                    <FTB:FreeTextBox ID="txtketqua" runat="server" Width="100%" Height="150" 
                                                        ToolbarLayout="runat=&quot;Server&quot; Width=&quot;600px&quot; ImageGalleryUrl=&quot;ftb.imagegallery.aspx?rif=/imagespath/&amp;cif=~/images/">
                                                    </FTB:FreeTextBox>
                                                </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" Width="100%" AutoGenerateColumns="False" 
                    AllowPaging="True" AllowSorting="True" 
                    onpageindexchanging="GridView1_PageIndexChanging" PageSize="3" 
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbheader" runat="server" 
                                    oncheckedchanged="cbheader_CheckedChanged" AutoPostBack="true" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbitem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TENDETAI" HeaderText="Tên Đề Tài" />
                        <asp:BoundField DataField="MADETAI" HeaderText="Mã Đề Tài " />
                        <asp:BoundField DataField="TUNGAY" HeaderText="Từ Ngày" />
                        <asp:BoundField DataField="DENNGAY" HeaderText="Đến Ngày" />
                        <asp:BoundField DataField="HOVATEN" HeaderText="Chủ Nhiệm" />
                        <asp:TemplateField HeaderText="Sửa">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtsua" runat="server" onclick="lbtsua_Click">Sửa</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("MADETAI") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <span style="color: #CC3300"><b>Chưa Có Thông Tin</b></span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Button ID="btnthemmoi" runat="server" onclick="btnthemmoi_Click" 
                    Text="Thêm Mới" />
                <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" 
                    onclick="btnCapNhat_Click" />
                <asp:Button ID="btnXoa" runat="server" Text="Xóa" onclick="btnXoa_Click" />
                <br />
                <asp:Label ID="Label5" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

