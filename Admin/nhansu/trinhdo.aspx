<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="trinhdo.aspx.cs" Inherits="Admin_nhansu_in_trinhdo" Title="Quá trình đào tạo" %>



<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>



<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

.pnl{
font-weight: bold;
background-color: #eeeeee;
padding: 5px;
cursor: pointer;
border: solid 1px #c0c0c0
}

  

    .style2
    {
        width: 100%;
    }

  

</style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width: 100%" bgcolor="White">
        <tr>
            <td colspan="4" style="text-align: center">
								                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
            <tr>
            <td>
								                Chọn đơn vị</td>
            <td>
								                    <asp:DropDownList ID="ddlDonVi" runat="server" Width="260px" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" 
                                                        CssClass="Dropdownlist" >
                                                </asp:DropDownList>
								            </td>
            <td>
								                Chọn CBVC</td>
            <td>
                <asp:DropDownList ID="ddlNhanVien" 
                                                    runat="server" AutoPostBack="True" Width="260px" 
                                                    
                    onselectedindexchanged="ddlNhanVien_SelectedIndexChanged" 
                    CssClass="Dropdownlist">
                                                </asp:DropDownList>
        </tr>
        <tr>
            <td colspan="4">
									Bạn đang xem thông tin &nbsp;<b> </b>&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label6" runat="server" style="font-weight: 700; color: #000066"></asp:Label>
                                                        </td>
        </tr>

        <tr>
            <td colspan="4">
                                                                                                                                                                                               <asp:Panel ID="Panel3" runat="server" CssClass="pnl">
<div style="float:left;">
    Trình&nbsp; độ :
</div>
<div style="float:right;">
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel4" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <table class="style2" width="100%">
               <tr>
            <td style=" width:15%" >
                                                                                                Trình độ:</td>
            <td  style=" width:30%" >
                                                                                                     <asp:DropDownList ID="ddlTrinhDo" runat="server" Width="100%">
                                                                                                     </asp:DropDownList>
                                                                                                 </td>
            <td  style=" width:15%" >
                                                                                                     Chuyên ngành :</td>
            <td  style=" width:30%" >
                                                                                                <asp:TextBox ID="txtchuyenmon" runat="server" Width="100%"></asp:TextBox>
                                                                                            </td>
        </tr>
        <tr>
            <td  style=" width:15%" >
                                                                                                Cơ sở ĐT</td>
            <td  style=" width:30%" >
                                                                                                <asp:TextBox ID="txtcsdt" runat="server" Width="100%"></asp:TextBox>
                                                                                            </td>
            <td  style=" width:15%" >
                                                                                                Nước ĐT:</td>
            <td  style=" width:30%" >
                                                                                                     <asp:DropDownList ID="ddlquocgia" runat="server" Width="100%">
                                                                                                     </asp:DropDownList>
                                                                                                 </td>
        </tr>
        <tr>
            <td  style=" width:15%" >
                                                                                                Năm tốt nghiệp </td>
            <td  style=" width:30%" >
                                                                                                <asp:TextBox ID="txtnam" runat="server" Width="260px"></asp:TextBox>
                                                                                                </td>
            <td  style=" width:15%" >
                                                                                                <br />
                                                                                                </td>
            <td  style=" width:30%" >
                                                                                                     &nbsp;</td>
        </tr>
        <tr style="width:100%">
            <td colspan="4" style="width:100%">
									<asp:GridView ID="GridView1" runat="server"  CssClass="Gridview" 
                                        AllowPaging="True" AllowSorting="True" 
                                        AutoGenerateColumns="False" DataKeyNames="ID" 
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                                        oncheckedchanged="cbheader_CheckedChanged1" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbitem" runat="server" />
                                                </ItemTemplate>
                                                <ControlStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HOCVI" HeaderText="Trình độ" >
                                                <ControlStyle Width="15%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="COSODAOTAO" HeaderText="Cơ sở đào tạo" >
                                                <ControlStyle Width="15%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="CHUYENMON" HeaderText="Chuyên môn" >
                                                <ControlStyle Width="15%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="TENQUOCGIA" HeaderText="Tên quốc gia" >
                                                <ControlStyle Width="15%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NAM" HeaderText="Năm tốt nghiệp" >
                                                <ControlStyle Width="15%" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Xem">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtEdit" runat="server" onclick="lbtEdit_Click">Xem</asp:LinkButton>
                                                </ItemTemplate>
                                                <ControlStyle Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle CssClass="headergrid" />
                                        <HeaderStyle CssClass="headergrid" />
                                    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                        <asp:Button ID="btnThem" runat="server" 
                            Text="Thêm Mới" onclick="btnThem_Click"  Width="100px" CssClass="btn"/>
                        <asp:Button ID="bntCapNhat" runat="server" 
                            Text="Cập Nhật" onclick="bntCapNhat_Click"  Width="100px" CssClass="btn"/>
                        <asp:Button ID="btnXoa" runat="server" 
                            onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" 
                            Text="Xóa" onclick="btnXoa_Click"  Width="100px" CssClass="btn"/>
                                                                                                </td>
        </tr>
        <tr>
            <td>
                                                                                                &nbsp;</td>
            <td>
                            
                        <asp:Label ID="Label5" runat="server" 
                            style="color: #FF0000; font-weight: 700; font-style: italic"></asp:Label>
                                                                                                </td>
            <td>
                                                                                                &nbsp;</td>
            <td>
                                                                                                     &nbsp;</td>
        </tr>
    </table>


</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender2"
    runat="server"
    CollapseControlID="Panel3"
    Collapsed="true"
    ExpandControlID="Panel3"
    TextLabelID="Label2"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel4"
    ScrollContents="false" >
</asp:collapsiblepanelextender></td>
        </tr>
        <tr>
            <td colspan="4">
                                                                                              
 <asp:Panel ID="Panel1" runat="server" CssClass="pnl">
<div style="float:left;">
    Phong học hàm
</div>
<div style="float:right;">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <table class="style2">
        <tr>
            <td style=" width:15%">
                Danh Hiệu :</td>
            <td style=" width:30%">
                <asp:DropDownList ID="ddlDanhHieu" runat="server" Width="100%">
                </asp:DropDownList>
            </td>
            <td style=" width:15%">
                Năm :</td>
            <td style=" width:30%">
                <asp:TextBox ID="txtNamPhong" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style=" width:15%">
                Quốc Gia Phòng Danh Hiệu :</td>
            <td style=" width:30%">
                <asp:DropDownList ID="ddlquocgiaphong" runat="server" Width="100%">
                </asp:DropDownList>
            </td>
            <td style=" width:15%">
                &nbsp;</td>
            <td style=" width:30%">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"  CssClass="Gridview" 
                
                    style="text-align: center" Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbitem0" runat="server" />
                            </ItemTemplate>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbheader0" runat="server" />
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="HOVATEN" HeaderText="Họ và Tên" />
                        <asp:BoundField DataField="HAMDANHHIEU" HeaderText="Danh Học Hàm" />
                        <asp:BoundField DataField="TENQUOCGIA" HeaderText="Tên Quốc Gia Phong" />
                        <asp:BoundField DataField="NAM" HeaderText="Năm Được Phong" />
                        <asp:TemplateField HeaderText="Xem">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtEdit0" runat="server" onclick="lbtEdit0_Click" 
                                    Text="Xem"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="ID0" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                    <p>Chưa có dữ liệu</p>
                    </EmptyDataTemplate>
                    <PagerStyle CssClass="headergrid" />
                    <HeaderStyle CssClass="headergrid" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Thêm" 
                    CssClass="btn" />
                <asp:Button ID="btnupdate" runat="server" onclick="Button3_Click" 
                    Text="Cập Nhật" CssClass="btn" />
                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Xóa" 
                    Width="68px" CssClass="btn" />
                <asp:ConfirmButtonExtender ID="Button4_ConfirmButtonExtender" runat="server" 
                    ConfirmText="Bạn có muốn xóa nó không!" Enabled="True" 
                    TargetControlID="Button4">
                </asp:ConfirmButtonExtender>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label7" runat="server" style="color: #FF0000"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender1"
    runat="server"
    CollapseControlID="Panel1"
    Collapsed="true"
    ExpandControlID="Panel1"
    TextLabelID="Label1"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel2"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
</td>
        </tr>
        <tr>
            <td colspan="4">
									&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                                <br />
                            <br />
                            
                    </td>
        </tr>
    </table>
</asp:Content>

