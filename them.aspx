<%@ Page Language="C#"  MasterPageFile="~/Masterpager/MasterPagesBasic.master"   AutoEventWireup="true" CodeFile="them.aspx.cs" Inherits="Admin_congvan_member_them" %>
<%@ Register src="admin/member/Usercontrol/menu.ascx" tagname="menu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            text-align: left;
        }
       
        .style4
        {
            text-align: center;
          
            color: #0066FF;
        }
        .style5
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div>
    
        <table class="style1" border="0" 
            style="border-width: 1px; border-color: #CCCCCC; width: 100%;" 
            width="100%">
            <tr>
                <td colspan="2" class="style4">
                    <uc1:menu ID="menu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style4">
                    Thêm Người Sử Dụng
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Chọn Đơn Vị :</td>
                <td>
                    <asp:DropDownList ID="ddlDonVi" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlDonVi_SelectedIndexChanged" Width="300px" 
                        CssClass="Dropdownlist">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Chọn Nhân Viên :</td>
                <td>
                    <asp:DropDownList ID="ddlNhanVien" runat="server" AutoPostBack="True" 
                        Width="300px" CssClass="Dropdownlist">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Tên Đăng Nhập :</td>
                <td>
                    <asp:TextBox ID="txtDangNhap" runat="server" Width="298px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Mật Khẩu :</td>
                <td>
                    <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password" Width="298px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Nhập Lại Mật Khẩu :</td>
                <td>
                    <asp:TextBox ID="txtNhapLaiMatKhau" runat="server" TextMode="Password" 
                        Width="298px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3" colspan="2">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Thêm " 
                        Width="88px" CssClass="btn" />
                    <asp:Button ID="Button3" runat="server" Text="Cập Nhật" 
                        onclick="Button3_Click" Width="97px" CssClass="btn" />
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        onrowdatabound="GridView1_RowDataBound" Width="100%" CssClass="Gridview">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                        oncheckedchanged="cbheader_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbitem" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="HOVATEN" HeaderText="Họ Và Tên" />
                            <asp:BoundField DataField="TENDANGNHAP" HeaderText="Tên Đăng Nhập" />
                            <asp:TemplateField HeaderText="Sửa">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Sửa</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Trạng Thái">
                                <ItemTemplate>
                                    <asp:CheckBox ID="trangthai" runat="server" AutoPostBack="True" 
                                        Checked='<%# Eval("TrangThai") %>' 
                                        oncheckedchanged="trangthai_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("NguoiSuDungID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Module được vào">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                        
                                        NavigateUrl='<%# Eval("NguoiSuDungID","~/Admin/member/sudungmodule.aspx?Ma={0}") %>'>Quản 
                                    Lí Module</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cấp quyền">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink3" runat="server" 
                                        NavigateUrl='<%# Eval("NguoiSuDungID","~/Admin/member/themquyentruycap.aspx?Ma={0}") %>'>Quyền 
                                    Truy Cập</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                         <FooterStyle BackColor="#21abfa" Font-Bold="True" ForeColor="#21abfa" />
                    <PagerStyle CssClass="headergrid" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#ffffff" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#21abfa" CssClass="headergrid" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#fffffff" />
                        <EmptyDataTemplate>
                            Chưa có thông tin
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Button ID="Button4" runat="server" Text="Xóa" onclick="Button4_Click" 
                        Width="70px" CssClass="btn" />
                </td>
            </tr>
        </table>
    
    </div>
 </asp:Content>
