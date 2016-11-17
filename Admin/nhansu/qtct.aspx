<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master"  AutoEventWireup="true" CodeFile="qtct.aspx.cs" Inherits="Admin_nhansu_in_qtct" Title="Quá trình công tác" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%" bgcolor="White">
        <tr>
            <td colspan="4" style="text-align: center">
								                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style=" width:15%">
								                <asp:label id="Label3" runat="server" Font-Size="Small" 
                                                    Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True" 
                                                    Width="100%">Chọn đơn vị:</asp:label>
								                    </td>
            <td style=" width:30%">
								                    <asp:DropDownList ID="ddlDonVi" runat="server" Width="100%" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" 
                                                        CssClass="Dropdownlist"  >
                                                </asp:DropDownList>
								            </td>
            <td style=" width:15%">
								                <asp:label id="Label7" runat="server" Font-Size="Small" 
                                                    Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True" 
                                                    Width="100%">Chọn CBVC:</asp:label>
								                    </td>
            <td style=" width:30%">
								                    <asp:DropDownList ID="ddlNhanVien" runat="server" AutoPostBack="True" 
                                                    Width="100%" onselectedindexchanged="ddlNhanVien_SelectedIndexChanged" 
                                                        CssClass="Dropdownlist">
                                                </asp:DropDownList>
                                            </td>
        </tr>
        <tr>
            <td>
                                                                        Từ&nbsp; :</td>
            <td>
                                                                             <asp:TextBox ID="txtbegin" runat="server" Width="100%"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegin" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                                                         </td>
            <td>
                                                                             Đến :</td>
            <td>
                                                                             <asp:TextBox ID="txtend" runat="server" Width="100%"></asp:TextBox>
                                                                             <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtend" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                                                                         </td>
        </tr>
        <tr>
            <td>
                                                                             Làm gì :</td>
            <td colspan="3">
                                                                             <asp:TextBox ID="txtlamgi" runat="server" Width="100%"></asp:TextBox>
                                                             </td>
        </tr>
        <tr>
            <td>
                                                                             Ở đâu :</td>
            <td colspan="3">
                                                                             <asp:TextBox ID="txtodau" runat="server" Width="100%"></asp:TextBox>
                                                             </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" CssClass="Gridview"
                                        
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Width="100%" AllowPaging="True"
                                        AutoGenerateColumns="False" 
                                        onpageindexchanging="GridView1_PageIndexChanging" PageSize="20" 
                                        AllowSorting="True" onsorting="GridView1_Sorting">
                                        <Columns>
                                            <asp:TemplateField HeaderText="STT">
                                            <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CheckBox">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbitem" runat="server" />
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                                        oncheckedchanged="cbheader_CheckedChanged" />
                                                </HeaderTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="BeginDate" HeaderText="Ngày bắt đầu" />
                                            <asp:BoundField DataField="EndDate" HeaderText="Ngày kết thúc" />
                                            <asp:BoundField DataField="LAMGI" HeaderText="Làm gì" />
                                            <asp:BoundField DataField="ODAU" HeaderText="Ở đâu" />
                                            <asp:TemplateField HeaderText="Xem">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" runat="server" onclick="lbEdit_Click">Xem</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ID" Visible="false">
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
            <td colspan="4">
									<b>Bạn Đã Xem Thông Tin Của&nbsp; </b>&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label6" runat="server" style="font-weight: 700; color: #000066"></asp:Label>
                                    </td>
        </tr>
        <tr>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                        <asp:Button ID="btnThem" runat="server" 
                            Text="Thêm Mới" onclick="btnThem_Click" CssClass="btn" />
                        <asp:Button ID="bntCapNhat" runat="server" 
                            Text="Cập Nhật" onclick="bntCapNhat_Click" CssClass="btn" />
                        <asp:Button ID="btnXoa" runat="server" 
                            onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" 
                            Text="Xóa" onclick="btnXoa_Click" CssClass="btn" />
                            <br />
                        <asp:Label ID="Label5" runat="server" 
                            style="color: #FF0000; font-weight: 700; font-style: italic"></asp:Label>
                        </td>
        </tr>
    </table>
</asp:Content>

