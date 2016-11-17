<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="tienluong.aspx.cs" Inherits="user_tienluong" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="Menu">
 Chi tiết lương tháng <asp:DropDownList ID="dlThang" runat="server" Height="22px" 
         Width="67px">
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
                            &nbsp;&nbsp;
&nbsp; Chọn Năm :<asp:DropDownList ID="dlNam" runat="server" Width="100px">
                                    <asp:ListItem>2009</asp:ListItem>
                                    <asp:ListItem>2010</asp:ListItem>
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2015</asp:ListItem>
                                    <asp:ListItem>2016</asp:ListItem>
                                    <asp:ListItem>2017</asp:ListItem>
                                </asp:DropDownList>
                            &nbsp;&nbsp; <asp:Button ID="Button1" runat="server" 
         onclick="Button1_Click" Text="Xem" 
            Width="71px" />
 </div>
 <div id="LuongThan">
 <asp:GridView ID="GridView1" runat="server" Width="100%" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:BoundField DataField="HOVATEN" HeaderText="Họ Và Tên"  
                    ControlStyle-Width="14%" HeaderStyle-Width="14%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="MAVIENCHUC" HeaderText="Mã Ngạch"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="BACTRONGNGACH" HeaderText="Bậc Trong Ngạch"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="HESOLUONG" HeaderText="Hệ Số Lương"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="HESOTNVUOTKHUNG" HeaderText="Thêm Niên Vương Khung"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="HESO" HeaderText="Hệ Số"  ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="PHUCAPCHUCVU" HeaderText="Phụ Cấp Chức Vụ"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="TONGHESO" HeaderText="Tổng Hệ Số"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="TIENLUONGHUONG" HeaderText="Tổng tiền hưởng"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="PHUCAPGD" HeaderText="Phục cấp giảng dạy"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="LUONGTANGTHEM" HeaderText="Lương tăng thêm"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="HOTROKHAC" HeaderText="Hổ trợ khác"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="BHYT" HeaderText="BHYT"  ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="BHXH" HeaderText="BHXH"  ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="BHTN" HeaderText="BHTN"  ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
                <asp:BoundField DataField="TAMUNG" HeaderText="TẠM Ứng"  ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="TONGTRU" HeaderText="Tổng Trừ"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="CONHAN" HeaderText="Còn Nhận"  
                    ControlStyle-Width="6%">
<ControlStyle Width="6%"></ControlStyle>
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
 
 </div>
</asp:Content>

