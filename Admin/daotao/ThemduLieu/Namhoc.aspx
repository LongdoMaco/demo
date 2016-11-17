<%@ Page Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="Namhoc.aspx.cs" Inherits="Admin_daotao_ThemduLieu_Namhoc" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <b>Danh sách&nbsp; năm học :<asp:GridView ID="GridView1" runat="server" 
            AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="ID" DataSourceID="Namhoc" ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Nam" HeaderText="Nam" SortExpression="Nam" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="Namhoc" runat="server" 
            ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
            DeleteCommand="DELETE FROM [DimNam] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [DimNam] ([Nam]) VALUES (@Nam)" 
            SelectCommand="SELECT * FROM [DimNam]" 
            UpdateCommand="UPDATE [DimNam] SET [Nam] = @Nam WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nam" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Nam" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        </b>
    </p>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" 
            DataSourceID="Namhoc">
            <EditItemTemplate>
                ID:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                Nam:
                <asp:TextBox ID="NamTextBox" runat="server" Text='<%# Bind("Nam") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Nam:
                <asp:TextBox ID="NamTextBox" runat="server" Text='<%# Bind("Nam") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                &nbsp;<br />
                &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="Thêm mới" />
            </ItemTemplate>
            <EmptyDataTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="Thêm mới" />
            </EmptyDataTemplate>
        </asp:FormView>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

