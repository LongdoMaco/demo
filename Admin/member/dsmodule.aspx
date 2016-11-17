<%@ Page Language="C#"  MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="dsmodule.aspx.cs" Inherits="Admin_quanlyuser_QuanLyModule" %>

<%@ Register src="Usercontrol/menu.ascx" tagname="menu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
#style1
{
	 text-align:center;
	 float:inherit;
}
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="style1">   
               <table align="center" class="style1" style="border: 1px Solid #CCCCCC" 
            border="1px">
            <tr>
                <td valign="top">
                    <uc1:menu ID="menu1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>DANH SÁCH CÁC MODULE</b></td>
            </tr>
            <tr>
                <td align="center" bgcolor="White" valign="top">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
                        Width="100%" GridLines="Horizontal">
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" 
                                SortExpression="ID" InsertVisible="False" ReadOnly="True" 
                                Visible="False" />
                            <asp:BoundField DataField="Module" HeaderText="Module" 
                                SortExpression="Module" />
                            <asp:BoundField DataField="GhiChu" HeaderText="GhiChu" 
                                SortExpression="GhiChu" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    </asp:GridView>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" 
                        DataSourceID="SqlDataSource1">
                        <EditItemTemplate>
                            ID:
                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                            <br />
                            Module:
                            <asp:TextBox ID="ModuleTextBox" runat="server" Text='<%# Bind("Module") %>' />
                            <br />
                            GhiChu:
                            <asp:TextBox ID="GhiChuTextBox" runat="server" Text='<%# Bind("GhiChu") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            Module:
                            <asp:TextBox ID="ModuleTextBox" runat="server" Text='<%# Bind("Module") %>' />
                            <br />
                            GhiChu:
                            <asp:TextBox ID="GhiChuTextBox" runat="server" Text='<%# Bind("GhiChu") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <br />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:FormView>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
                        DeleteCommand="DELETE FROM [DMModule] WHERE [ID] = @ID" 
                        InsertCommand="INSERT INTO [DMModule] ([Module], [GhiChu]) VALUES (@Module, @GhiChu)" 
                        SelectCommand="SELECT * FROM [DMModule]" 
                        
                        UpdateCommand="UPDATE [DMModule] SET [Module] = @Module, [GhiChu] = @GhiChu WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Module" Type="String" />
                            <asp:Parameter Name="GhiChu" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Module" Type="String" />
                            <asp:Parameter Name="GhiChu" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
    
    </div>
</asp:Content>