<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpager/MasterPagesBasic.master" AutoEventWireup="true" CodeFile="nhaplieucvden.aspx.cs" Inherits="Admin_congvan_nhaplieucvden" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="usercontrol/Menu.ascx" tagname="Menu" tagprefix="uc1" %>

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

        <uc1:Menu ID="Menu1" runat="server" />

</div>
<div>
<p>Nhập thông tin cơ bản cho công văn đến</p>
<br/>
 <asp:Panel ID="Panel1" runat="server" CssClass="pnl">
<div style="float:left;">
    Loại công văn đến
</div>
<div style="float:right;">
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource1" Width="40%">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Tenloaicv" HeaderText="Tenloaicv" 
                SortExpression="Tenloaicv" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [Loaicongvanden] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [Loaicongvanden] ([Tenloaicv]) VALUES (@Tenloaicv)" 
        SelectCommand="SELECT * FROM [Loaicongvanden]" 
        UpdateCommand="UPDATE [Loaicongvanden] SET [Tenloaicv] = @Tenloaicv WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tenloaicv" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Tenloaicv" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView6" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Tenloaicv:
            <asp:TextBox ID="TenloaicvTextBox" runat="server" 
                Text='<%# Bind("Tenloaicv") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Tenloaicv:
            <asp:TextBox ID="TenloaicvTextBox" runat="server" 
                Text='<%# Bind("Tenloaicv") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm " />
        </ItemTemplate>
    </asp:FormView>
    <br />
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
 <asp:Panel ID="Panel3" runat="server" CssClass="pnl">
<div style="float:left;">
    Cơ quan ban hành
</div>
<div style="float:right;">
<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel4" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <br />
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="TenCoquanbanhanh" HeaderText="TenCoquanbanhanh" 
                SortExpression="TenCoquanbanhanh" />
        </Columns>
    </asp:GridView>
    <asp:FormView ID="FormView7" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            TenCoquanbanhanh:
            <asp:TextBox ID="TenCoquanbanhanhTextBox" runat="server" 
                Text='<%# Bind("TenCoquanbanhanh") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            TenCoquanbanhanh:
            <asp:TextBox ID="TenCoquanbanhanhTextBox" runat="server" 
                Text='<%# Bind("TenCoquanbanhanh") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm" />
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [Coquanbanhanhcv] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [Coquanbanhanhcv] ([TenCoquanbanhanh]) VALUES (@TenCoquanbanhanh)" 
        SelectCommand="SELECT * FROM [Coquanbanhanhcv]" 
        UpdateCommand="UPDATE [Coquanbanhanhcv] SET [TenCoquanbanhanh] = @TenCoquanbanhanh WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenCoquanbanhanh" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="TenCoquanbanhanh" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender1"
    runat="server"
    CollapseControlID="Panel3"
    Collapsed="true"
    ExpandControlID="Panel3"
    TextLabelID="Label2"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel4"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>
 <asp:Panel ID="Panel5" runat="server" CssClass="pnl">
<div style="float:left;">
    Mã công văn</div>
<div style="float:right;">
<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</div>
<div style="clear:both"></div>
</asp:Panel>
<asp:Panel ID="Panel6" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="TenMacongvan" HeaderText="TenMacongvan" 
                SortExpression="TenMacongvan" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UNI_PORTALS %>" 
        DeleteCommand="DELETE FROM [MaCongvanden] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [MaCongvanden] ([TenMacongvan]) VALUES (@TenMacongvan)" 
        SelectCommand="SELECT * FROM [MaCongvanden]" 
        UpdateCommand="UPDATE [MaCongvanden] SET [TenMacongvan] = @TenMacongvan WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenMacongvan" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="TenMacongvan" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView8" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlDataSource3">
        <EditItemTemplate>
            ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            TenMacongvan:
            <asp:TextBox ID="TenMacongvanTextBox" runat="server" 
                Text='<%# Bind("TenMacongvan") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            TenMacongvan:
            <asp:TextBox ID="TenMacongvanTextBox" runat="server" 
                Text='<%# Bind("TenMacongvan") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <br />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Thêm " />
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Panel>
<asp:collapsiblepanelextender
    ID="CollapsiblePanelExtender3"
    runat="server"
    CollapseControlID="Panel5"
    Collapsed="true"
    ExpandControlID="Panel5"
    TextLabelID="Label3"
    CollapsedText="Hiện"
    ExpandedText="Ẩn"
    ExpandDirection="Vertical"
    TargetControlID="Panel6"
    ScrollContents="false"
   
    >
</asp:collapsiblepanelextender>

</div>
</asp:Content>

