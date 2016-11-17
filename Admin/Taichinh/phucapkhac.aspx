<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="phucapkhac.aspx.cs" Inherits="Admin_Taichinh_phucapkhac" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                Chọn Đơn Vị :</td>
            <td>
                <asp:DropDownList ID="ddlDonVi" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" Width="300px">
                </asp:DropDownList>
            </td>
            <td>
                Chon Nhân Viên</td>
            <td>
                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="300px" 
                    AutoPostBack="True" onselectedindexchanged="ddlNhanVien_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Chọn Tháng
            </td>
            <td>
                                <asp:DropDownList ID="ddlThang" runat="server" Height="22px" Width="67px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                            </td>
            <td>
                Chọn Năm</td>
            <td>
                                <asp:DropDownList ID="ddlNam" runat="server" Width="100px">
                                    <asp:ListItem>2009</asp:ListItem>
                                    <asp:ListItem>2010</asp:ListItem>
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2015</asp:ListItem>
                                </asp:DropDownList>
                            </td>
        </tr>
        <tr>
            <td>
                Số Tiền :</td>
            <td>
                <asp:TextBox ID="txtSoTien" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Ghi Chú</td>
            <td colspan="3">
                <asp:TextBox ID="txtGhiChu" runat="server" Height="93px" TextMode="MultiLine" 
                    Width="469px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnPhuCap" runat="server" onclick="btnPhuCap_Click" 
                    Text="Phụ Cấp" />
&nbsp;&nbsp;
                <asp:Button ID="btnCapNhat" runat="server" Text="Cập Nhật" 
                    onclick="btnCapNhat_Click" />
&nbsp;&nbsp;
                <asp:Label ID="lblthongbao" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:TemplateField Visible="false"> 
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="THANG" HeaderText="Tháng" />
                        <asp:BoundField DataField="NAM" HeaderText="Năm" />
                        <asp:BoundField DataField="TONGTIEN" HeaderText="Số Tiền" />
                        <asp:BoundField DataField="GHICHU" HeaderText="Ghi Chú" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lblSua" runat="server" onclick="lblSua_Click">Xem Và Sửa</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtxoa" runat="server" onclick="lbtxoa_Click">Xóa</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

