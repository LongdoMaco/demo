<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="dmbaidang.aspx.cs" Inherits="Admin_tintuc_quantrinoidung" Title="Untitled Page" ValidateRequest="false" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<%@ Register src="UserControl/menu.ascx" tagname="WebUserControl" tagprefix="uc1" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table bgcolor="White" cellpadding="5" cellspacing="3" style="width: 100%">
        <tr>
            <td colspan="2" style="text-align: left" bgcolor="White">
                <uc1:WebUserControl ID="WebUserControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" bgcolor="White">
                <b>DANH MỤC BÀI ĐĂNG </b></td>
        </tr>
        <tr>
            <td style="width: 163px">
                Tiêu Đề
            </td>
            <td>
                <asp:TextBox ID="txtTieuDe" runat="server" Width="500px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Trích Dẫn :</td>
            <td>
                <asp:TextBox ID="txttrichdan" runat="server" Height="89px" TextMode="MultiLine" 
                    Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Ảnh Đại Diện :</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Nội Dung :</td>
            <td>
        <FCKeditorV2:FCKeditor ID="txtNoidung" runat="server" BasePath="~/fckeditor/" 
                    Height="300px"  >
        </FCKeditorV2:FCKeditor>
    
       
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Tác Giả :</td>
            <td>
                <asp:TextBox ID="txttacgia" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Ngày Bản Tin :</td>
            
            <td>
              
                <asp:TextBox ID="NgayBanTin" runat="server" Width="300px"></asp:TextBox>
                
     
            </td>
        </tr>
      
        <tr>
            <td style="width: 163px">
                Nguồn Tin :</td>
            <td>
                <asp:TextBox ID="txtNguonTin" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Chuyên Đề :</td>
            <td>
                <asp:DropDownList ID="ddlchuyende" runat="server" Width="300px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 163px">
                Từ Khóa
            </td>
            <td>
                <asp:TextBox ID="txttukhoa" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <b>
                <asp:GridView ID="GridView1" runat="server" 
                    CellPadding="4" Width="100%"  
                    AutoGenerateColumns="False" AllowPaging="True" BackColor="White"
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                    HorizontalAlign="Left" onpageindexchanging="GridView1_PageIndexChanging" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    onrowdatabound="GridView1_RowDataBound">
                    <RowStyle BackColor="White" ForeColor="#003399"   />
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" 
                                    oncheckedchanged="cbheader_CheckedChanged" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbitem" runat="server" style="text-align: left" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TIEUDE" HeaderText="Tiêu Đề" 
                            ItemStyle-HorizontalAlign="Left"  >
                         
                
<ItemStyle HorizontalAlign="Left">
                </ItemStyle>
                
<ItemStyle HorizontalAlign="Left">
               </ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="HOVATEN" HeaderText="Người Đăng" />
                        <asp:BoundField DataField="NgayBanTin" HeaderText="Ngày Bản Tin" 
                            ItemStyle-HorizontalAlign="Left"> 
                
<ItemStyle HorizontalAlign="Left">
                </ItemStyle>
                
<ItemStyle HorizontalAlign="Left">
                </ItemStyle>
                        </asp:BoundField>
                         <asp:TemplateField HeaderText="Trang Thái">
                            <ItemTemplate>
                                <asp:CheckBox ID="trangthai" runat="server" AutoPostBack="True" 
                                    Checked='<%# Eval("TrangThai") %>' 
                                    oncheckedchanged="trangthai_CheckedChanged" />
                            </ItemTemplate>
                        </asp:TemplateField>                       
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="btlEidt" runat="server" onclick="btlEidt_Click">Sửa</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Xem">
                               <ItemTemplate>
                                   <asp:HyperLink ID="HyperLink1" runat="server" 
                                       NavigateUrl='<%# Eval("BanTinID","~/public/chitiet.aspx?ID={0}") %>'  Target="_search">Xem</asp:HyperLink>
                               </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="ID" runat="server" Text='<%# Eval("BanTinID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <EmptyDataTemplate>
                        <b>Chưa có bài nào cả</b>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                </asp:GridView>
                </b></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Xóa" />
                </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="bntCapNhat" runat="server" 
                    Text="Cập Nhật" onclick="bntCapNhat_Click" />
                <asp:Button ID="btnxoa" runat="server" Text="Xóa" onclick="btnxoa_Click" 
                    onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" />
                <br />
                <asp:Label ID="Label1" runat="server" style="font-weight: 700"></asp:Label>
                <br />
                <asp:Label ID="btnthongbao" runat="server"></asp:Label>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

