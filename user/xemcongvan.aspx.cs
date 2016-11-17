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
namespace user.congvan
{
    public partial class user_chitietcongvan : System.Web.UI.Page
    {

        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nguoisudung_ID"] == null)
                Response.Redirect("~/DangNhap.aspx");
            if (!IsPostBack)
            {
                InitData();
            }

        }
        private void InitData()
        {
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetAllLoaicongvanden");
            ds = ConnectSQL.FillDataSet(sql_com);
            dlChuyende.DataSource = ds.Tables[0].DefaultView;
            dlChuyende.DataTextField = "TenLoaicv";
            dlChuyende.DataValueField = "ID";
            dlChuyende.DataBind();
            if (dlChuyende.Items.Count == 0)
            {
                Label4.Visible = true;
                //Button1.Visible = false;
                //Button2.Visible = false;
                dlChuyende.Visible = false;
                Label3.Visible = false;
            }
            else
                BindDataGrid();
        }

        private void BindDataGrid()
        {
            SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "GetCongvandentheoLoaicongvan");
            sql_com.Parameters.Add(new SqlParameter("@Loai_ID", SqlDbType.TinyInt)).Value = Convert.ToByte(dlChuyende.SelectedValue);
            sql_com.Parameters.Add(new SqlParameter("@nguoisudung_ID", SqlDbType.TinyInt)).Value = int.Parse(Session["nguoisudung_ID"].ToString());
            ds = ConnectSQL.FillDataSet(sql_com);
            BindData();
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

        }
        #endregion

        private void DataGrid1_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            int index = e.Item.ItemIndex;
            if (e.CommandName.Equals("Detail"))
            {
                Label ID = (Label)DataGrid1.Items[index].FindControl("ID");
                Session["Congvan_ID"] = ID.Text;
                //Session["MaCV"] = dataSet.Tables[0].Rows[index]["MaCV"].ToString();
                //Session["Ngayden"] = dataSet.Tables[0].Rows[index]["Ngayden"];
                //Session["SoKyhieu"] = dataSet.Tables[0].Rows[index]["SoKyhieu"];                
                //Session["Ngaybanhanh"] = dataSet.Tables[0].Rows[index]["Ngaybanhanh"];
                //Session["Trichyeunoidung"] = dataSet.Tables[0].Rows[index]["Trichyeunoidung"];
                //Session["Soluu"] = dataSet.Tables[0].Rows[index]["Soluu"];
                //Session["NoiNhan"] = dataSet.Tables[0].Rows[index]["Noinhan"];
                //Session["Noiluu"] = dataSet.Tables[0].Rows[index]["Noiluu"];
                //Session["Ngaynhap"] = dataSet.Tables[0].Rows[index]["Ngaynhap"];
                //Session["Fileupload"] = dataSet.Tables[0].Rows[index]["Fileupload"];
                //Session["ID"] = dataSet.Tables[0].Rows[index]["ID"];             
                Response.Redirect("chitietcongvanden.aspx");
            }
        }

  

        protected void Button2_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("NhapTin.aspx");
        }

        private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            DataGrid1.CurrentPageIndex = e.NewPageIndex;
            BindDataGrid();
        }

        protected void lkExit_Click(object sender, System.EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("DangNhap.aspx");
        }

        protected void dlChuyende_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindDataGrid();
        }
        protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
}
}
