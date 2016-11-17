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

public partial class Admin_nhansu_in_doan : System.Web.UI.Page
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
            Initializes();


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
    // Load Len Grid
    public void LoadGridView()
    {
        dtsv.LoadGridView(GridView1, "ns_get_doanthe", dtsv.CreateParameter("@IDDONVI", ddlDonVi.SelectedValue));

    }
    private void Initializes()
    {
        GetAllDonVi();
        GetNhanVien();
        LoadGridView();
        GetTen();
     
    }
    public void GetTen()
    {
        try
        {

            SqlParameter param = new SqlParameter("@IDNV", ddlNhanVien.SelectedValue);
            lblthongtin.Text = dtsv.ExcuteScalary("ns_gethoten", param).ToString();
        }
        catch
        {
            lblthongtin.Text = "Có Lỗi Xảy Ra";
        }

    }
    private void StatusConTrol(bool value, bool reset)
    {
        foreach (Control item in this.Form.Controls)
        {
            if (item is TextBox)
            {
                TextBox tb = (TextBox)item;
                if (reset)
                    tb.Text = "";
                if (value)
                    tb.Enabled = true;
                else
                    tb.Enabled = false;
            }



        }

    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void cbheader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox checkhead = (CheckBox)GridView1.HeaderRow.FindControl("cbheader");
        if (checkhead.Checked)
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
    protected void bltchitiet_Click(object sender, EventArgs e)
    {
        //status = 1;
        Label5.Text = "";
        StatusConTrol(true, false);
        bntCapNhat.Visible = true;
         

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int IDNV = int.Parse(lbl.Text);
            Session["NV_DT"] = IDNV;
          
            SqlParameter param = new SqlParameter("@IDNV", IDNV);
            DataTable dt = dtsv.ExcuteTable("ns_get_DoanDang_NV", param);

            if (dt.Rows.Count != 0)
            {

                btnThem.Visible = false;
                txtdoan.Text = dt.Rows[0]["NGAYVAODOAN"].ToString();
                txtdang.Text = dt.Rows[0]["NGAYVAODANG"].ToString();
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
                txtngaychuyen.Text = dt.Rows[0]["NGAYCHUYENCT"].ToString();


            }
            else
            {
              
                Label5.Text = "Không Thể Sửa Được ";
                txtdang.Text = "";
                txtdoan.Text = "";
                txtngaychuyen.Text = "";
               
                btnThem.Visible = true;
            }

        }
        catch 
        {
            Label5.Text = "Error";
        }
        GetTen();
       

    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {

            SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@NGAYVAODOAN ",txtdoan.Text),
                dtsv.CreateParameter("@NGAYVAODANG ",txtdang.Text),
                dtsv.CreateParameter("@NGAYCHUYENCT",txtngaychuyen.Text),             
                dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue)
            

            };
            tb = dtsv.ExecuteNonQuery("ns_insert_doandang", param);
            if (tb > 0)
                Label5.Text = "Thêm Thành Công";
            else
            {
                Label5.Text = "Thêm Không Thành Công";
            }

        }
        catch
        {
            Label5.Text = "Thêm Không Thành Công";
        }
        LoadGridView();

        

    }
    protected void bntCapNhat_Click(object sender, EventArgs e)
    {

        int tb = 0;
        // Chen vao 
       
            SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@NGAYVAODOAN ",txtdoan.Text),
                dtsv.CreateParameter("@NGAYVAODANG ",txtdang.Text),
                dtsv.CreateParameter("@NGAYCHUYENCT",txtngaychuyen.Text),             
                dtsv.CreateParameter("@ID",int.Parse(Session["NV_DT"].ToString()))
            

            };
            tb = dtsv.ExecuteNonQuery("ns_update_doandang", param);

        
      
        if (tb > 0)
            Label5.Text = "Cập Nhật Thành Công";
        else
        {
            Label5.Text = "Cập Nhật Không Thành Công";
        }
        //   GridView1.DataBind();
        LoadGridView();
        bntCapNhat.Visible = false;

    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                CheckBox cbitem = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                if (cbitem.Checked)
                {
                    Label lb = (Label)GridView1.Rows[i].FindControl("ID");
                    int ID = int.Parse(lb.Text);
                    SqlParameter param = new SqlParameter("@ID", ID);

                    tb = dtsv.ExecuteNonQuery("ns_del_doandang", param);
                }

            }
            if (tb > 0)
                Label5.Text = "Xoá Thành Công";
            else
            {
                Label5.Text = "Xóa Không Thành Công";
            }
        }
        catch
        {
            Label5.Text = "Xóa Không Thành Công";
        }
        LoadGridView();

    }





    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

       // StatusConTrol(false, true);

    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        LoadGridView();
        GetNhanVien();
        GetTen();
    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetTen();
    }
}