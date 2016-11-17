<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="sudungmodule.aspx.cs" Inherits="Admin_quanlyuser_Default" %>

<%@ Register src="Usercontrol/menu.ascx" tagname="menu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    
        <table align="center" cellspacing="5" class="style1" 
            style="border: 1px solid #CCCCCC" width="600px">
            <tr>
                <td class="style3">
                    <span class="style4">Danh Mục Cấp Quyền :</span><br />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    
                        &nbsp;&nbsp;&nbsp;<uc1:menu ID="menu1" runat="server" />
                        <br />
                        &nbsp;&nbsp;
                    <asp:Label ID="lblthongbao" runat="server" 
                            style="color: #FF0000; font-weight: 700;"></asp:Label>
                   
                </td>
            </tr>
            <tr>
                <td class="style3">
                
                        &nbsp;<asp:Label ID="lblThuMuc" runat="server" Text="Danh Sách Thư Mục"></asp:Label>
&nbsp;
                        <asp:DropDownList ID="ddlDMmodule" runat="server" 
    Width="300px">
                            <asp:ListItem Value="2">Quản Lí Công Văn</asp:ListItem>
                            <asp:ListItem Value="3">Quản Lí Khen Thưởng</asp:ListItem>
                            <asp:ListItem Value="4">Quản Lí Khoa Học Công Nghệ</asp:ListItem>
                            <asp:ListItem Value="5">Quản Lí Nhân Sự</asp:ListItem>
                            <asp:ListItem Value="6">Quản Lí User</asp:ListItem>
                            <asp:ListItem Value="7">Quản Lí Tin Tức</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnthem" runat="server" Text="Thêm" Width="73px" 
                            onclick="Button2_Click" />
                    
                </td>
            </tr>
            <tr>
                <td class="style2" align="center">
                      <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        Width="100%" AutoGenerateColumns="False" 
                          onselectedindexchanged="GridView1_SelectedIndexChanged">
                        <RowStyle BackColor="White" ForeColor="#330099" />
                          <Columns>
                              <asp:TemplateField Visible="false">
                                  <ItemTemplate>
                                      <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:BoundField DataField="GHICHU" HeaderText="Tên Module" />
                              <asp:TemplateField HeaderText="Xóa">
                                  <ItemTemplate>
                                      <asp:LinkButton ID="bltxoa" runat="server" onclick="bltxoa_Click" 
                                          onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);">Xóa</asp:LinkButton>
                                  </ItemTemplate>
                              </asp:TemplateField>
                          </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    </asp:GridView></td>
            </tr>
            </table>
    
    </div>
   
   </asp:Content>
   
