using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using UNI.Class;

public partial class user_xemcongvan : System.Web.UI.Page
{

    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/DangNhap.aspx");
        if (!IsPostBack)
        {
            InitData();
            InitData2();
            InitData3();
        }

    }
    private void InitData()
    {
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetAllLoaicvdi");
        ds = ConnectSQL.FillDataSet(sql_com);
        dlChuyende.DataSource = ds.Tables[0].DefaultView;
        dlChuyende.DataTextField = "Tenloai";
        dlChuyende.DataValueField = "Maloai";
        dlChuyende.DataBind();
        //dlChuyende.Items.Insert(0, "Chọn loại công văn đến");
        if (dlChuyende.Items.Count == 0)
        {
            Label4.Visible = true;
            //Button1.Visible = false;
            //Button2.Visible = false;
            dlChuyende.Visible = false;
            Label3.Visible = false;
        }
        else
            BindDataGridAll();
    }
    private void BindDataGridAll()
    {

        int manguoidung = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetCongvandi_User");
        sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = manguoidung;
        ds = ConnectSQL.FillDataSet(sql_com);
        BindData();

    }
    private void BindDataGrid()
    {
        DataSet lcv;
        int manguoidung = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetCongvanditheoLoaicongvan_User");
        sql_com.Parameters.Add(new SqlParameter("@Loai_ID", SqlDbType.TinyInt)).Value = Convert.ToByte(dlChuyende.SelectedValue);
        sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = manguoidung;
        //ds = ConnectSQL.FillDataSet(sql_com);
        //BindData();
        lcv = ConnectSQL.FillDataSet(sql_com);
        int counter = lcv.Tables[0].Rows.Count;
        if (counter == 0)
        {
            DataGridlcv.Visible = false;
          
        }
        else
        {
            DataGrid1.Visible = false;
            DataGridbpst.Visible = false;
            DataGridlcv.Visible = true;
            DataGridmcv.Visible = false;
            //
            DataGridlcv.DataSource = lcv.Tables[0].DefaultView;
            DataGridlcv.DataBind();
          
        }
    }
    private void InitData2()
    {
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetAllBophansoancvdi");
        ds = ConnectSQL.FillDataSet(sql_com);
        dlCoquanbanhanh.DataSource = ds.Tables[0].DefaultView;
        dlCoquanbanhanh.DataTextField = "TenBophan";
        dlCoquanbanhanh.DataValueField = "Mabophan";
        dlCoquanbanhanh.DataBind();
    }
    private void BindDataGrid2()
    {
        DataSet bpst;
        int manguoidung = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetCongvandtheobpst_User");
        sql_com.Parameters.Add(new SqlParameter("@BPST_ID", SqlDbType.TinyInt)).Value = Convert.ToByte(dlCoquanbanhanh.SelectedValue);
        sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = manguoidung;
        //ds = ConnectSQL.FillDataSet(sql_com);
        //BindData();
        bpst = ConnectSQL.FillDataSet(sql_com);
        int counter = bpst.Tables[0].Rows.Count;
        if (counter == 0)
        {
            DataGridbpst.Visible = false;
           
        }
        else
        {
            DataGrid1.Visible = false;
            DataGridbpst.Visible = true;
            DataGridlcv.Visible = false;
            DataGridmcv.Visible = false;
            //
            DataGridbpst.DataSource = bpst.Tables[0].DefaultView;
            DataGridbpst.DataBind();
           
        }
    }
    private void InitData3()
    {
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetAllMacongvandi");
        ds = ConnectSQL.FillDataSet(sql_com);
        dlMacv.DataSource = ds.Tables[0].DefaultView;
        dlMacv.DataTextField = "MaCongvandi";
        dlMacv.DataValueField = "ID";
        dlMacv.DataBind();
    }
    private void BindDataGrid3()
    {
        DataSet mcv;
        int manguoidung = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetCongvandtheomacongvanden_User");
        sql_com.Parameters.Add(new SqlParameter("@Macv_ID", SqlDbType.TinyInt)).Value = Convert.ToByte(dlMacv.SelectedValue);
        sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = manguoidung;
        //ds = ConnectSQL.FillDataSet(sql_com);
        // BindData();
        mcv = ConnectSQL.FillDataSet(sql_com);
        int counter = mcv.Tables[0].Rows.Count;
        if (counter == 0)
        {
            DataGridmcv.Visible = false;
            
        }
        else
        {
            DataGrid1.Visible = false;
            DataGridbpst.Visible = false;
            DataGridmcv.Visible = true;
            DataGridlcv.Visible = false;
            //
            DataGridmcv.DataSource = mcv.Tables[0].DefaultView;
            DataGridmcv.DataBind();
         
        }
    }
    private void BindData()
    {
        DataGrid1.DataSource = ds.Tables[0].DefaultView;
        DataGrid1.DataBind();
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.DataGrid1.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_ItemCommand);
        this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
        //Loai Cong van di
        this.DataGridlcv.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridlcv_ItemCommand);
        this.DataGridlcv.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridlcv_PageIndexChanged);
        //Bo phan soan thao cong van
        this.DataGridbpst.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridbpst_ItemCommand);
        this.DataGridbpst.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridbpst_PageIndexChanged);
        //Ma cong van di
        this.DataGridmcv.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGridmcv_ItemCommand);
        this.DataGridmcv.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridmcv_PageIndexChanged);

    }
    #endregion
    //Xem tat ca
    private void DataGrid1_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
    {
        int index = e.Item.ItemIndex;
        if (e.CommandName.Equals("Detail"))
        {
            Label ID = (Label)DataGrid1.Items[index].FindControl("ID");
            Session["Congvan_ID"] = ID.Text;
            Response.Redirect("chitietcongvandi.aspx");
        }
    }
    //Loai cong van di
    private void DataGridlcv_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
    {
        int index = e.Item.ItemIndex;
        if (e.CommandName.Equals("Detail"))
        {
            Label ID = (Label)DataGridlcv.Items[index].FindControl("ID");
            Session["Congvan_ID"] = ID.Text;
            Response.Redirect("chitietcongvandi.aspx");
        }
    }
    // Bo phan soan thao
    private void DataGridbpst_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
    {
        int index = e.Item.ItemIndex;
        if (e.CommandName.Equals("Detail"))
        {
            Label ID = (Label)DataGridbpst.Items[index].FindControl("ID");
            Session["Congvan_ID"] = ID.Text;
            Response.Redirect("chitietcongvandi.aspx");
        }
    }
    private void DataGridmcv_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
    {
        int index = e.Item.ItemIndex;
        if (e.CommandName.Equals("Detail"))
        {
            Label ID = (Label)DataGridmcv.Items[index].FindControl("ID");
            Session["Congvan_ID"] = ID.Text;
            Response.Redirect("chitietcongvandi.aspx");
        }
    }
    protected void Butxem_Click(object sender, System.EventArgs e)
    {

    }
    protected void Button2_Click(object sender, System.EventArgs e)
    {
        Response.Redirect("NhapTin.aspx");
    }
    // Xem tat ca
    private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        BindDataGridAll();
    }
    // Loai cong van
    private void DataGridlcv_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
    {
        DataGridlcv.CurrentPageIndex = e.NewPageIndex;
        BindDataGrid();
    }
    //Bo phan soan thao
    private void DataGridbpst_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
    {
        DataGridbpst.CurrentPageIndex = e.NewPageIndex;
        BindDataGrid2();
    }
    //Ma cong van
    private void DataGridmcv_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
    {
        DataGridmcv.CurrentPageIndex = e.NewPageIndex;
        BindDataGrid3();
    }
    protected void lkExit_Click(object sender, System.EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("../DangNhap.aspx");
    }

    protected void dlChuyende_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        DataGrid1.Visible = false;
        DataGridbpst.Visible = false;
        DataGridmcv.Visible = false;
        DataGridlcv.Visible = true;
        //
        DataGrid1.Enabled = false;
        DataGridbpst.Enabled = false;
        DataGridmcv.Enabled = false;
        DataGridlcv.Enabled = true;
        //
        BindDataGrid();
    }
    protected void dlCoquanbanhanh_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataGrid1.Visible = false;
        DataGridbpst.Visible = true;
        DataGridmcv.Visible = false;
        DataGridlcv.Visible = false;
        //
        DataGrid1.Enabled = false;
        DataGridbpst.Enabled = true;
        DataGridmcv.Enabled = false;
        DataGridlcv.Enabled = false;
        //
        BindDataGrid2();
    }
    protected void dlMacv_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataGrid1.Visible = false;
        DataGridbpst.Visible = false;
        DataGridmcv.Visible = true;
        DataGridlcv.Visible = false;
        //
        DataGrid1.Enabled = false;
        DataGridbpst.Enabled = false;
        DataGridmcv.Enabled = true;
        DataGridlcv.Enabled = false;
        //
        BindDataGrid3();
    }
    protected void butXem_Click(object sender, EventArgs e)
    {
        DataGrid1.Visible = true;
        DataGridbpst.Visible = false;
        DataGridmcv.Visible = false;
        DataGridlcv.Visible = false;
        //
        DataGrid1.Enabled = true;
        DataGridbpst.Enabled = false;
        DataGridmcv.Enabled = false;
        DataGridlcv.Enabled = false;
        //
        BindDataGridAll();
    }
    protected void btxemall_Click(object sender, EventArgs e)
    {
        string nt = tungay.Text.Trim();
        string ngaytruoc = Convert.ToInt32(Mid(nt, 3, 2)) + "/" + Convert.ToInt32(Left(nt, 2)) + "/" + Convert.ToInt32(Right(nt, 4));
        string ns = denngay.Text.Trim();
        string ngaysau = Convert.ToInt32(Mid(ns, 3, 2)) + "/" + Convert.ToInt32(Left(ns, 2)) + "/" + Convert.ToInt32(Right(ns, 4));
        int manguoidung = Convert.ToInt32(Session["nguoisudung_ID"].ToString());
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "TimCongvandiUsertungaydenngay");
        sql_com.Parameters.Add(new SqlParameter("@Tungay", SqlDbType.NVarChar)).Value = ngaytruoc;// tungay.Text.Trim(); //"1/28/2003";
        sql_com.Parameters.Add(new SqlParameter("@Denngay", SqlDbType.NVarChar)).Value = ngaysau;// denngay.Text.Trim(); ;
        sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.Int)).Value = manguoidung;
        ds = ConnectSQL.FillDataSet(sql_com);
        BindData();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("../Dangnhap.aspx");
    }
    protected void btThoat_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("../Dangnhap.aspx");
    }
    public static string Left(string param, int length)
    {
        //we start at 0 since we want to get the characters starting from the
        //left and with the specified lenght and assign it to a variable
        string result = param.Substring(0, length);
        //return the result of the operation
        return result;
    }
    public static string Right(string param, int length)
    {
        //start at the index based on the lenght of the sting minus
        //the specified lenght and assign it a variable
        string result = param.Substring(param.Length - length, length);
        //return the result of the operation
        return result;
    }

    public static string Mid(string param, int startIndex, int length)
    {
        //start at the specified index in the string ang get N number of
        //characters depending on the lenght and assign it to a variable
        string result = param.Substring(startIndex, length);
        //return the result of the operation
        return result;
    }

    public static string Mid(string param, int startIndex)
    {
        //start at the specified index and return all characters after it
        //and assign it to a variable
        string result = param.Substring(startIndex);
        //return the result of the operation
        return result;
    }
}
