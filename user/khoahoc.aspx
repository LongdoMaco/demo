<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="khoahoc.aspx.cs" Inherits="user_KhoaHoc" Title="Untitled Page" ValidateRequest="false" %>
<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" style="width: 100%" cellspacing="5">
        <tr>
            <td style="text-align: center;" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center;" colspan="4">
                <b>KHOA HỌC THUYẾT MINH</b></td>
        </tr>
        <tr>
            <td style="width: 165px">
                Mã Đề Tài </td>
            <td class="style8">
                <asp:TextBox ID="txtMaDeTai" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style9">
                Tên Đề Tài :</td>
            <td style="text-align: left">
                <asp:TextBox ID="txttendetai" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 165px">
                Lĩnh Vực :</td>
            <td class="style8">
								                <asp:DropDownList ID="dllinhvuc" runat="server" 
                    Width="200px" ></asp:DropDownList>
								                </td>
            <td class="style9">
                Loại Hình :</td>
            <td style="text-align: left">
								                <asp:DropDownList ID="dlloaihinh" runat="server" Width="169px" ></asp:DropDownList>
								                </td>
        </tr>
        <tr>
            <td style="width: 165px">
                Cơ Quản Chủ Trì :</td>
            <td class="style8">
								                <asp:DropDownList ID="dlchutri" runat="server" Width="200px" 
                                                    style="text-align: left" ></asp:DropDownList>
								                </td>
            <td class="style9">
                Cấp Đề Tài :</td>
            <td style="text-align: left">
                                                <asp:DropDownList ID="dlcapdetai" runat="server" Width="169" style="text-align: left"> </asp:DropDownList>	
                                                </td>
        </tr>
        <tr>
            <td style="width: 165px">
                Tên Sản Phầm&nbsp;
            </td>
            <td class="style8">
                                                <INPUT id="txttensanpham" 
                    style="WIDTH: 200px; " type="text" name="txttensanpham" runat="server" 
                    language="javascript" ></td>
            <td class="style9">
                Địa Chỉ Áp Dụng
            </td>
            <td style="text-align: left">
                                                <INPUT id="txtdiachiapdung" style="WIDTH: 163px; " type="text" name="txtdiachiapdung" runat="server" language="javascript" ></td>
        </tr>
        <tr>
            <td style="width: 165px">
                Từ Ngày :</td>
            <td class="style8">
                                                   
                                                    <asp:TextBox ID="txttungay" runat="server" 
                    Width="200px"></asp:TextBox>
                                                </td>
            <td class="style9">
                Đến Ngày :</td>
            <td style="text-align: left">
                                                <asp:TextBox ID="txtdenngay" runat="server"></asp:TextBox>
                                            </td>
        </tr>
        <tr>
            <td style="width: 165px">
                Kinh Phí
            </td>
            <td class="style8">
                                                <INPUT id="txtbangso" style="WIDTH: 200px; " 
                    type="text" name="txtbangso" runat="server" language="javascript" ></td>
            <td class="style9">
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
        <FCKeditorV2:FCKeditor ID="txtcapthiet" runat="server" BasePath="~/fckeditor/" 
                    Height="300px"  >
        </FCKeditorV2:FCKeditor>
    
       
                                            </td>
        </tr>
        <tr>
            <td colspan="4">
                                                <b>Mục tiêu của đề tài</b></td>
        </tr>
        <tr>
            <td colspan="4">
        <FCKeditorV2:FCKeditor ID="txtmuctieu" runat="server" BasePath="~/fckeditor/" 
                    Height="300px"  >
        </FCKeditorV2:FCKeditor>
    
       
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
        <FCKeditorV2:FCKeditor ID="txtketqua" runat="server" BasePath="~/fckeditor/" 
                    Height="300px"  >
        </FCKeditorV2:FCKeditor>
    
       
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

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

 
    <style type="text/css">
        .style8
        {
            width: 285px;
        }
        .style9
        {
            width: 145px;
        }
    </style>


</asp:Content>


