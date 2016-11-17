<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="kyluatcanhan.aspx.cs" Inherits="Admin_nhann_klcn" Title="Kỉ luật cá nhân" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>

<%@ Register src="../nhansu/UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <table bgcolor="White" style="width: 100%" cellspacing="5px" >
            <tr>
                <td style="text-align: center;" colspan="4">
                    <uc2:WebUserControl ID="WebUserControl1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 204px">
                    Chọn đơn vị</td>
                <td>
								                    <asp:DropDownList ID="ddlDonVi" runat="server" Width="250px" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" Height="25px" 
                                                        CssClass="Dropdownlist"  >
                                                </asp:DropDownList>
								            </td>
                <td>
                                        Chọn&nbsp; CBVC</td>
                <td>
								                    <asp:DropDownList ID="ddlNhanVien" runat="server" 
                                                    Width="200px" Height="25px" CssClass="Dropdownlist" >
                                                </asp:DropDownList>
                                            </td>
            </tr>
            <tr>
                <td style="width: 204px">
                    Đơn vị</td>
                <td>
                                                                        <asp:DropDownList ID="ddldonvikl" runat="server" Height="25px" Width="250px" 
                                                                            CssClass="Dropdownlist">
                                                                        </asp:DropDownList>
                                                                    </td>
                <td>
                    Hình thức</td>
                <td>
                                                                        <asp:DropDownList ID="ddlhinhthuckl" runat="server" Width="200px" Height="25px" 
                                                                            CssClass="Dropdownlist">
                                                                        </asp:DropDownList >
                                                                    </td>
            </tr>
            <tr>
                <td style="width: 204px">
                    Năm học </td>
                <td>
                                                                        <asp:DropDownList ID="ddlnamhockl" runat="server" Width="250px" Height="25px" CssClass="Dropdownlist" 
                                                                           >
                                                                        </asp:DropDownList>
                                                                    </td>
                <td>
                    &nbsp;</td>
                <td>
                                                                        &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 204px">
                    Nội dung</td>
                <td colspan="3">
                                                                             <asp:TextBox ID="txtnoidung" runat="server" Height="110px" TextMode="MultiLine" 
                                                                                 Width="642px"></asp:TextBox>
                                                                         </td>
            </tr>
            <tr>
                <td style="width: 204px">
                    Quyết đinh số</td>
                <td>
                                                                             <asp:TextBox ID="txtquyetdinh" runat="server" Width="200px"></asp:TextBox>
                                                                         </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 204px">
                    Người&nbsp; ký</td>
                <td>
                    <asp:TextBox ID="txtnguoiki" runat="server" Width="200px"></asp:TextBox>
                                                                         </td>
                <td>
                    Ngày ký</td>
                <td>
                                                                             <asp:TextBox ID="txtngayki" runat="server"></asp:TextBox>
                                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                                 ControlToValidate="txtngayki" ErrorMessage="Không được trống"></asp:RequiredFieldValidator>
                                                                             </td>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID ="txtngayki" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </tr>
            <tr>
                <td colspan="4">
									<b>Bạn đang xem thông tin của &nbsp; </b>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label6" runat="server" style="font-weight: 700; color: #000066"></asp:Label>
                                    </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:GridView ID="GridView1" runat="server"
                                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        Width="100%" AllowPaging="True"
                                        AutoGenerateColumns="False" 
                                        onpageindexchanging="GridView1_PageIndexChanging" PageSize="5" 
                                        AllowSorting="True" onsorting="GridView1_Sorting" 
                        CssClass="Gridview">
                                       
                                        <Columns>
                                            <asp:TemplateField HeaderText="STT">
                                            <ItemTemplate>
                                          <%#Container.DataItemIndex+1 %>
                                           
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbitem" runat="server" />
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                                        oncheckedchanged="cbheader_CheckedChanged1" />
                                                </HeaderTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HOVATEN" HeaderText="Họ và tên" />
                                            <asp:BoundField DataField="HINHTHUC" HeaderText="Hình thức kỉ luật" />
                                            <asp:BoundField DataField="TENDONVI" HeaderText="Tên đơn vị kỉ luật" />
                                            <asp:BoundField DataField="NAMHOC" HeaderText="Năm học" />
                                            <asp:TemplateField HeaderText="Xem">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtEdit" runat="server" onclick="lbtEdit_Click">Xem</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                         <FooterStyle BackColor="#21abfa" Font-Bold="True" ForeColor="#21abfa" />
                    <PagerStyle CssClass="headergrid" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#ffffff" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#21abfa" CssClass="headergrid" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#fffffff" />
                                        <EmptyDataTemplate>
                                            <span class="style10"><b>Chưa Có Dữ Liệu</b></span>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                    </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center">
                        <asp:Button ID="btnThem" runat="server" 
                            Text="Thêm mới" onclick="btnThem_Click" CssClass="btn" />
                        <asp:Button ID="btnCapNhat" runat="server" 
                            Text="Cập nhật" onclick="bntCapNhat_Click" CssClass="btn" />
                        <asp:Button ID="btnXoa" runat="server" 
                            onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" 
                            Text="Xóa" onclick="btnXoa_Click" CssClass="btn" Width="77px" />
                            <br />
                        <asp:Label ID="Label5" runat="server" 
                            style="color: #FF0000; font-weight: 700; font-style: italic"></asp:Label>
                        </td>
            </tr>
        </table>
   
</asp:Content>

