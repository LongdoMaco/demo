using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using UNI.Class;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using DAL;

public partial class Admin_nhansu_in_qtct : System.Web.UI.Page
{

    DataServices dtsv = new DataServices();
    
 
   

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/DangNhap.aspx");
        string url = HttpContext.Current.Request.Url.AbsoluteUri;
        string[] MangTach = url.Split('/');
        if (!PhanQuyen.KiemTra(MangTach[MangTach.Length - 2].ToString(), int.Parse(Session["nguoisudung_ID"].ToString())))
        {
            Response.Redirect("~/public/UnauthorizedAccess.aspx");
        }
        if (IsPostBack == false)
        {
            GetAllDonVi();
            GetNhanVien();
            LoadGridView();          
            GetTen();
            


        }
        bntCapNhat.Visible = false;

    }
    public void GetAllDonVi()
    {
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        if (ddlDonVi.Items.Count < 0)
            Label5.Text = "Chưa có đơn vị nào cả";



    }
    public void GetNhanVien()
    {
        int IDDonVi = int.Parse(ddlDonVi.SelectedValue);
        SqlParameter param = new SqlParameter("@DONVI_ID", IDDonVi);
        ddlNhanVien.DataSource = dtsv.ExcuteTable("ns_Get_tt_theoDonvi", param);
        ddlNhanVien.DataTextField = "HOVATEN";
        ddlNhanVien.DataValueField = "ID";
        ddlNhanVien.DataBind();
        if (ddlNhanVien.Items.Count == 0)
            Label5.Text = "Chưa có nhân viên nào";

    }




    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    // LoadGridView
    private void LoadGridView()
    {
        try
        {
            SqlParameter param = new SqlParameter("@IDTHONGTIN", ddlNhanVien.SelectedValue);
            GridView1.DataSource = dtsv.ExcuteTable("ns_Get_all_qtct", param);
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }


    }


    private void ShowControl()
    {
        txtbegin.Enabled = true;
        txtend.Enabled = true;
      
    }
    private void HiddenControl()
    {
        txtbegin.Enabled = false;
        txtend.Enabled = false;
        

        ResetControl();
    }
    private void ResetControl()
    {
        txtbegin.Text = "";
        txtend.Text = "";
       
    }
    public void GetTen()
    {
        try
        {
            int IDNV = int.Parse(ddlNhanVien.SelectedValue);
            SqlParameter param = new SqlParameter("@IDNV", IDNV);
            Label6.Text = dtsv.ExcuteScalary("ns_gethoten", param).ToString();
        }
        catch
        {
            Label5.Text = "Chưa Có Nhân Viên Nào";
        }

    }
    // All Event 
    protected void cbheader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox cbheader = (CheckBox)GridView1.HeaderRow.FindControl("cbheader");
        if (cbheader.Checked)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                item.Checked = true;


            }
        }
        else
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                item.Checked = false;


            }

        }

    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        bntCapNhat.Visible = true;

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["QTCT"] = ID;
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_qtcc_ma", param);
            if (dt.Rows.Count != 0)
            {
                txtbegin.Text = dt.Rows[0]["BeginDate"].ToString();
                txtend.Text = dt.Rows[0]["EndDate"].ToString();
                txtlamgi.Text = dt.Rows[0]["LAMGI"].ToString();
               txtodau.Text= dt.Rows[0]["ODAU"].ToString();
            }
        }
        catch
        {
            Label5.Text = "Không Thể Sửa Được";
        }





    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        GetNhanVien();
        LoadGridView();
        
        GetTen();
    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        LoadGridView();
       
        GetTen();
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {

        int tb = 0;
            try
            {
                SqlParameter[] param = new SqlParameter[] 
            {
                dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
                dtsv.CreateParameter("@BeginDate",txtbegin.Text),
                dtsv.CreateParameter("@EndDate",txtend.Text),
                dtsv.CreateParameter("@LAMGI",txtlamgi.Text),
                 dtsv.CreateParameter("@ODAU",txtodau.Text),


            };
                tb = dtsv.ExecuteNonQuery("ns_insert_quatrinhcongtac", param);

            }
            catch
            {
                Label5.Text = "Thêm Không Thành Công";
            }
            if (tb > 0)
                Label5.Text = "Thêm Thành Công";
            else Label5.Text = "Thêm Không Thành Công";
            LoadGridView();


        

    }
    protected void bntCapNhat_Click(object sender, EventArgs e)
    {
        int tb = 0;
       
            try
            {
                SqlParameter[] param = new SqlParameter[]
                {
                    dtsv.CreateParameter("@BeginDate",txtbegin.Text),
                    dtsv.CreateParameter("@EndDate",txtend.Text),
                    dtsv.CreateParameter("@ODAU",txtodau.Text),
                     dtsv.CreateParameter("@LAMGI",txtlamgi.Text),
                    dtsv.CreateParameter("@ID",int.Parse(Session["QTCT"].ToString()))

                };
                tb = dtsv.ExecuteNonQuery("ns_update_qtct_ma", param);

            }
            catch
            {
                Label5.Text = "Thêm Không Thành Công";

            }

        
        
        if (tb > 0)
            Label5.Text = "Cập Nhật Thành Công";

        else Label5.Text = "Thêm Không Thành Công";
        LoadGridView();
        bntCapNhat.Visible = false;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.LoadGridView();
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {

        int tb = 0;
        try
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox remove = (CheckBox)GridView1.Rows[i].FindControl("cbitem");

                if (remove.Checked)
                {
                    Label lb = (Label)GridView1.Rows[i].FindControl("ID");
                    int ID = int.Parse(lb.Text);
                    SqlParameter param = new SqlParameter("@ID", ID);

                    tb = dtsv.ExecuteNonQuery("ns_del_qtct_ma", param);


                }

            }

        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }
        if (tb > 0)
            Label5.Text = "Xóa Thành Công";
        else Label5.Text = "Xóa Không Thành Công";
        LoadGridView();

    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {


        //DataView dv =(DataView) GridView1.DataSource;
        //if (ViewState["_Price"] == null)
        //{
        //ViewState["_Price"] = "DESC"; 
        //}

        //else
        //{
        //if (ViewState["_Price"].ToString() == "ASC")
        //{
        //ViewState["_Price"] = "DESC";
        //}
        //else
        //{

        //ViewState["_Price"] = "ASC";
        //}
        //}
        //string __Price = ViewState["_Price"].ToString();
        //dv.Sort = e.SortExpression + " " + __Price;
        //GridView1.DataSource = dv;
        //GridView1.DataBind();

    }
}



