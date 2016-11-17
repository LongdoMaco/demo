<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="khoitao.aspx.cs" Inherits="Admin_Taichinh_khoitaoluong" Title="Untitled Page" %>

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
            <td colspan="4">
                Khỏi tạo lương tháng :</td>
        </tr>
        <tr>
            <td>
                Chọn Tháng :</td>
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
                                Chọn Năm
                            </td>
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
                                % Phụ Cấp Giáo Dục</td>
            <td>
                <asp:TextBox ID="txtphucapgd" runat="server"></asp:TextBox>
&nbsp;%</td>
            <td>
                Đơn giá lương tăng thêm
            </td>
            <td>
                <asp:TextBox ID="txtDonGiaTangThem" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                % Bổ hiểm y tế :</td>
            <td>
                <asp:TextBox ID="txtBhyt" runat="server"></asp:TextBox>
            </td>
            <td>
                % Bảo hiểm xã hội
            </td>
            <td>
                <asp:TextBox ID="txtbhxh" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                %Bổ hiểm TN</td>
            <td>
                <asp:TextBox ID="txtbhtn" runat="server"></asp:TextBox>
            </td>
            <td>
                Lương cơ bản :</td>
            <td>
                <asp:TextBox ID="txtluongcoban" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Khởi Tạo" />
&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Cập Nhật" />
&nbsp;<asp:Label ID="lblThongBao" runat="server"></asp:Label>
            &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/Admin/Taichinh/chitietluongthang.aspx" Target="_blank">Xem Chi Tiết</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="THANG" HeaderText="Tháng" />
                        <asp:BoundField DataField="NAM" HeaderText="Năm" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtXem" runat="server" onclick="lbtXem_Click">Xem và sửa</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lblXoa" runat="server" onclick="lblXoa_Click">Xóa</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                Phụ cấp khác | Tạm ứng | Chi tiết lương</td>
        </tr>
        </table>
</asp:Content>

