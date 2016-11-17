<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="nhapktkl.aspx.cs" Inherits="Admin_nhansu_nhaplieu" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register src="UserControl/WebUserControl.ascx" tagname="WebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

.pnl{
font-weight: bold;
background-color: #eeeeee;
padding: 5px;
cursor: pointer;
border: solid 1px #c0c0c0
}

  

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="menu">   

    <uc1:WebUserControl ID="WebUserControl1" runat="server" />
    
</div>
<div>
<p>...</p>
<br/>
 <asp:Panel ID="Panel1" runat="server" CssClass="pnl">
<div style="float:left;">
    Khen thưởng
</div>
<div style="float:right;">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
        Width="668px">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
            ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="HINHTHUC" HeaderText="HINHTHUC" 
                SortExpression="HINHTHUC" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
    SelectCommand="SELECT * FROM [KT_HINHTHUC]" 
        DeleteCommand="DELETE FROM [KT_HINHTHUC] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [KT_HINHTHUC] ([HINHTHUC]) VALUES (@HINHTHUC)" 
        
        UpdateCommand="UPDATE [KT_HINHTHUC] SET [HINHTHUC] = @HINHTHUC WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="HINHTHUC" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="HINHTHUC" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            HINHTHUC:
            <asp:TextBox ID="HINHTHUCTextBox" runat="server" 
                Text='<%# Bind("HINHTHUC") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Hình thức:
            <asp:TextBox ID="HINHTHUCTextBox" runat="server" 
                Text='<%# Bind("HINHTHUC") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm mới" />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender2"
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
<%--kết thúc hệ số lương chính quyền--%>
</div>
</asp:Content>

