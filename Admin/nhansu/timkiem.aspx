<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="timkiem.aspx.cs" Inherits="Admin_nhansu_TimKiem" Title="Tìm kiếm thông tin" EnableEventValidation="false" %>

<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; background-color: #FFFFFF; border:solid 1px #CCCCCC">
        <tr>
            <td style="text-align: center; " colspan="6">
                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: left">
                Nhập Tên :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="25%"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Tìm Kiếm" 
                    onclick="Button1_Click" Height="30px" />
                                &nbsp;</td>
                            </tr>
        <tr>
            <td colspan="6">
                <b>Tim kiếm theo năm</b></td>
                            </tr>
        <tr>
            <td colspan="6">
                Sinh năm từ&nbsp; :
                <asp:TextBox ID="txtTuNam" runat="server" Width="56px"></asp:TextBox>
&nbsp;&nbsp; Đến năm&nbsp; :
                <asp:TextBox ID="txtDenNam" runat="server" Width="56px"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Button ID="btnTheoNam" runat="server" CssClass="btn" 
                    onclick="btnTheoNam_Click" Text="Tìm " Width="72px" />
            &nbsp; (bạn có thể kết hợp với chức năng tìm kiếm tùy chọn)</td>
                            </tr>
        <tr>
            <td colspan="6">
                &nbsp;</td>
                            </tr>
        <tr>
            <td colspan="6">
                <b>Tìm kiếm theo tùy chọn </b> </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 20%">
                                    <asp:CheckBox ID="hd4" runat="server" />
                                    Đơn vị :</td>
            <td  style="width: 30%">
                <asp:DropDownList ID="ddldonvi" runat="server" Width="100%" 
                   >
                </asp:DropDownList>
            </td>
            <td colspan="2" style="width:20%">
                <asp:CheckBox ID="hd" runat="server" 
                   />
                Loại hợp đồng :</td>
                                <td  style="width: 33%">
                                    <asp:DropDownList ID="ddlloaihopdong" runat="server" Width="100%" 
                                      >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="hd5" runat="server" />
                                    Chức danh:</td>
            <td style="width: 30%">
                <asp:DropDownList ID="ddlchucdanh" runat="server" Width="100%" 
                    >
                </asp:DropDownList>
            </td>
            <td colspan="2">
                <asp:CheckBox ID="hd0" runat="server" 
                     />
                Học Hàm :</td>
                                <td>
                                    <asp:DropDownList ID="ddlhocham" runat="server" Width="100%" 
                                      >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="hd6" runat="server" 
                                        />
                                    Trình Độ :</td>
            <td style="width: 33%">
                <asp:DropDownList ID="ddltrinhdo" runat="server" Width="100%" 
                   >
                </asp:DropDownList>
            </td>
            <td colspan="2">
                <asp:CheckBox ID="hd1" runat="server" 
                    />
                Giới Tính :</td>
                                <td>
                                    <asp:DropDownList ID="ddlgioitinh" runat="server" Width="100%" 
                                      >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="hd7" runat="server" 
                                        />
                                    Tôn giáo:</td>
            <td style="width: 33%">
                <asp:DropDownList ID="ddltongiao" runat="server" Width="100%" 
                   >
                </asp:DropDownList>
            </td>
            <td colspan="2">
                <asp:CheckBox ID="hd2" runat="server" 
                    />
                                Quốc Tịch 
            </td>
                                <td>
                                    <asp:DropDownList ID="ddlquoctich" runat="server" Width="100%" 
                                        >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="hd8" runat="server" 
                                        />
                                    TTKết Hôn:</td>
            <td style="width: 33%">
                <asp:DropDownList ID="ddlkethon" runat="server" Width="100%" 
                   >
                </asp:DropDownList>
            </td>
            <td colspan="2">
                <asp:CheckBox ID="hd3" runat="server" 
                     />
                TĐ Chính Trị :</td>
            <td>
                <asp:DropDownList ID="ddltdct" runat="server" Width="100%" 
                    >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="height: 42px;" colspan="2">
                                    <asp:CheckBox ID="hd9" runat="server" 
                                        />
                Đảng viên :</td>
            <td style="width: 33%; height: 42px;">
                </td>
            <td style="height: 42px;" colspan="2">
                <asp:CheckBox ID="hd10" runat="server" 
                   />
                Chức vụ Đảng :</td>
            <td style="height: 42px">
                <asp:DropDownList ID="ddlchucvudang" runat="server" Width="100%" 
                   >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="height: 26px;" colspan="2">
                <asp:CheckBox ID="hd12" runat="server" 
                   />
                Chức vụ ĐT</td>
            <td style="width: 33%; height: 26px;">
                <asp:DropDownList ID="ddlcvdoanthe" runat="server" Width="100%" 
                    >
                </asp:DropDownList>
            </td>
            <td style="height: 26px;" colspan="2">
                <asp:CheckBox ID="hd11" runat="server" 
                     />
                Chức vụ CQ:</td>
            <td style="height: 26px">
                <asp:DropDownList ID="ddlcvcq" runat="server" Width="100%" 
                    >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:CheckBox ID="hd13" runat="server" 
                     />
                Đi Nước Ngoài</td>
            <td style="width: 33%">
                <asp:DropDownList ID="ddldinuocngoai" runat="server" Width="100%" 
                   >
                </asp:DropDownList>
            </td>
            <td colspan="2">
                <asp:CheckBox ID="hd14" runat="server" 
                    />
                Hệ số lương</td>
            <td>
                <asp:DropDownList ID="ddlhesoluong" runat="server" 
                    Width="100%">
                </asp:DropDownList>
                                </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:CheckBox ID="hd15" runat="server" 
                   />
                Mã Viên Chức</td>
            <td style="width: 33%">
                <asp:DropDownList ID="ddlMaVienChuc" runat="server" 
                     Width="100%">
                </asp:DropDownList>
            </td>
            <td style="width: 70px">
                &nbsp;</td>
            <td style="width: 110px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center;" colspan="6">
                <asp:Button ID="Button3" runat="server" Text="Xem" onclick="Button3_Click" 
                    CssClass="btn" Width="139px" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Width="100%" AllowPaging="True" PageSize="100" 
                    onpageindexchanging="GridView1_PageIndexChanging" CssClass="Gridview">
                    <Columns>
                        <asp:TemplateField HeaderText="STT">
                        <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                        </asp:TemplateField>
                      <asp:BoundField DataField="MANHANVIEN" HeaderText="Mã Nhân Viên" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("ID","~/Admin/nhansu/chitietnv.aspx?IDNV={0}") %>' 
                                    Text='<%# Eval("HOVATEN") %>' Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:BoundField DataField="NGAYSINH" HeaderText="Ngày Sinh" />
                         <asp:BoundField DataField="DIENTHOAI" HeaderText="Điện Thoại" />
                           <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" />
                    </Columns>
                       <FooterStyle BackColor="#21abfa" Font-Bold="True" ForeColor="#21abfa" />
                    <PagerStyle CssClass="headergrid" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#ffffff" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#21abfa" CssClass="headergrid" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#fffffff" />
                    <EmptyDataTemplate>
                        <span style="color: #CC3300"><b>Không Tìm Thấy Nhân Viên Nào Cả </b></span>
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Button ID="Button2" runat="server" Text="Xuất Ra Excel" 
                    onclick="Button2_Click" />
            </td>
        <td>
            &nbsp;</td>
        </tr>
    </table>
</asp:Content>

