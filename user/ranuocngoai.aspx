<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPageuser.master" AutoEventWireup="true" CodeFile="ranuocngoai.aspx.cs" Inherits="user_ranuocngoai" EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%" bgcolor="White" cellspacing="10">
        <!--
        <tr>
            <td style=" width:15%">
								                <asp:label id="Label3" runat="server" Font-Size="Small" 
                                                    Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True" 
                                                    Width="98%">Chọn đơn vị:</asp:label>
								                    </td>
            <td style=" width:30%">
								                    <asp:DropDownList ID="ddlDonVi" runat="server" Width="98%" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlDonVi_SelectedIndexChanged" 
                                                        CssClass="Dropdownlist" >
                                                </asp:DropDownList>
								            </td>
            <td style=" width:15%">
								                <asp:label id="Label2" runat="server" Font-Size="Small" 
                                                    Font-Names="Times New Roman" ForeColor="Blue" Font-Bold="True" Width="98%">Chọn CBVC:</asp:label>
								                </td>
            <td style=" width:30%">
								                <asp:DropDownList ID="ddlNhanVien" runat="server" Width="98%" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="ddlNhanVien_SelectedIndexChanged" 
                                                    CssClass="Dropdownlist">
                                                </asp:DropDownList>
								            </td>
        </tr>
        -->
        <tr>
            <td>
                                                            Tên nước đến :</td>
            <td>
                                                            <asp:DropDownList ID="ddlquocgia" runat="server" Width="98%" 
                                                                CssClass="Dropdownlist">
                                                            </asp:DropDownList>
                                                        </td>
            <td>
                Lí do đi</td>
            <td>
                                                            <asp:DropDownList ID="ddlLiDoDi" runat="server" Width="98%" 
                                                                CssClass="Dropdownlist">
                                                            </asp:DropDownList>
                                                        </td>
        </tr>

        <tr>
            <td>
                                                            Nơi đến:</td>
            <td>
                                                            <asp:TextBox ID="txtnoiden" runat="server" Width="98%"></asp:TextBox>
                
                                                        </td>
            <td>
                                                            Mục đích :</td>
            <td>
                                                            <asp:TextBox ID="txtmucdich" runat="server" Width="98%"></asp:TextBox>
                                                            
                                                        </td>
        </tr>

        <tr>
            <td>
                                                            Từ ngày:</td>
            <td>
                                                            <asp:TextBox ID="txtTuNgay" runat="server" Width="98%"></asp:TextBox>
                
                                                        </td>
            <td>
                                                            Đến ngày :</td>
            <td>
                                                            <asp:TextBox ID="txtDenNgay" runat="server" Width="98%"></asp:TextBox>
                                                            
                                                        </td>
        </tr>
        <tr>
            <td>
                Nguồn kinh phí
            </td>
            <td>
                                                            
                                                        <asp:TextBox ID="txtkinhphi" runat="server" Width="98%"></asp:TextBox>
                                                            
                                                        </td>
            <td>
                Số quyết định
            </td>
            <td>
                                                            <asp:TextBox ID="txtsoquyetdinh" runat="server" Width="98%"></asp:TextBox>
                                                            
                                                        </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
									<b>Danh sách những nước mà </b>&nbsp;
                                    <asp:Label runat="server" style="font-weight: 700; color: #000066" ID="Lable6"></asp:Label>
                                    <b>đã đến</b></td>
        </tr>
        <tr>
            <td colspan="4">
									<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="Gridview" Font-Size="Small" >
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbitem" runat="server" />
                                                </ItemTemplate>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbheader" runat="server" AutoPostBack="True" oncheckedchanged="cbheader_CheckedChanged" />
                                                </HeaderTemplate>
                                            </asp:TemplateField>
                                           
                                              
                                            <asp:BoundField DataField="NOIDEN" HeaderText="Nơi đến" />
                                            <asp:BoundField DataField="TENQUOCGIA" HeaderText="Quốc gia" />
                                            <asp:BoundField DataField="TUNGAY" HeaderText="Từ ngày" />
                                            <asp:BoundField DataField="DENNGAY" HeaderText="Đến ngày" />
                                            <asp:BoundField DataField="MUCDICH" HeaderText="Mục đích" />
                                            <asp:BoundField DataField="KINHPHI" HeaderText="Kinh phí" />
                                            <asp:BoundField DataField="SOQUYETDINH" HeaderText="Số QĐ" />
                                            <asp:TemplateField HeaderText="Trạng thái">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbTrangthai" runat="server"></asp:LinkButton>
                                                </ItemTemplate>                                                                                                
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Chức năng">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" runat="server" onclick="lbEdit_Click">Sửa</asp:LinkButton>
                                                    <asp:LinkButton ID="lbGiahan" runat="server" >In đơn</asp:LinkButton>
                                                    <asp:LinkButton ID="lbBCve" runat="server">BC về</asp:LinkButton>
                                                </ItemTemplate>
                                                                                                
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="False">
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
                                            <span ><b>Chưa có dữ liệu nào</b></span>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
									</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                        <asp:Button ID="btnThem" runat="server"  
                            Text="Thêm Mới" onclick="btnThem_Click" />
                        <asp:Button ID="bntCapNhat" runat="server" 
                            Text="Cập Nhật" onclick="bntCapNhat_Click" />
                        <asp:Button ID="btnXoa" runat="server" onclientclick="return confirm(&quot;Ban Có Muốn Xóa Nó Không&quot;);" Text="Xóa" onclick="btnXoa_Click" />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Button" />
                        <br />
                        <asp:Label ID="Label5" runat="server" 
                            style="color: #FF0000; font-weight: 700; font-style: italic"></asp:Label>
                    </td>
        </tr>
    </table>
</asp:Content>



