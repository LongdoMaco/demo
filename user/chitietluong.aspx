<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="chitietluong.aspx.cs" Inherits="user_chitietluong" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="border: 1px solid #006600" >
    <p style="text-align: center"> Chi tiết lương tháng&nbsp;&nbsp;
        <asp:TextBox ID="txtthang" runat="server"></asp:TextBox>
&nbsp; Chọn Năm :
        <asp:TextBox ID="txtnam" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="butxemluong" runat="server" onclick="butxemluong_Click" Text="Xem" 
            Width="49px" Height="26px" />
            </p>
    </div>
    <div style=" overflow:auto;">
 
        <asp:GridView ID="GridView1" runat="server" 
             Width="100%" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333">
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:BoundField DataField="HOVATEN" HeaderText="Họ Và Tên"  
                    ControlStyle-Width="14%" HeaderStyle-Width="14%">
<ControlStyle Width="7%"></ControlStyle>

<HeaderStyle Width="14%"></HeaderStyle>
                </asp:BoundField>
               <asp:BoundField DataField="MAVIENCHUC" HeaderText="Mã Ngạch"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="BACTRONGNGACH" HeaderText="Bậc Trong Ngạch"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="HESOLUONG" HeaderText="Hệ Số Lương"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="HESOTNVUOTKHUNG" HeaderText="Thêm Niên Vương Khung"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="HESO" HeaderText="Hệ Số"  ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="PHUCAPCHUCVU" HeaderText="Phụ Cấp Chức Vụ"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="TONGHESO" HeaderText="Tổng Hệ Số"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="TIENLUONGHUONG" HeaderText="Tổng tiền hưởng"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="PHUCAPGD" HeaderText="Phục cấp giảng dạy"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="LUONGTANGTHEM" HeaderText="Lương tăng thêm"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="HOTROKHAC" HeaderText="Hổ trợ khác"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="BHYT" HeaderText="BHYT"  ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="BHXH" HeaderText="BHXH"  ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="BHTN" HeaderText="BHTN"  ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="TONGTRU" HeaderText="Tổng Trừ"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
               <asp:BoundField DataField="CONHAN" HeaderText="Còn Nhận"  
                    ControlStyle-Width="7%">
<ControlStyle Width="7%"></ControlStyle>
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                <b>Chưa có chi tiết lương tháng này</b>
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
 
    </div>
</asp:Content>

