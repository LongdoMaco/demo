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

public partial class Admin_nhansu_in_taikhoan : System.Web.UI.Page
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
            GetTen();
            LoadGridView();
          


        }
        bntCapNhat.Visible = false;

    }
    public void GetAllDonVi()
    {
        dtsv.LoadDropDownList(ddlDonVi, "ns_getAll_donvi", "DONVI", "ID");



    }
    // Load Len Grid
    public void LoadGridView()
    {
        SqlParameter param = new SqlParameter("@IDTHONGTIN", ddlNhanVien.SelectedValue);
        GridView1.DataSource = dtsv.ExcuteTable("ns_get_all_taikhoan", param);
        GridView1.DataBind();


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
            Label5.Text = "Chưa tồn tại nhân viên";
        }

    }





    protected void TextBox11_TextChanged(object sender, EventArgs e)
    {
    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        LoadGridView();
        GetTen();
       


    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    private void ShowControl()
    {
        txtTaiKhoan.Enabled = true;
        txtTenNganHang.Enabled = true;

    }
    private void HiddentControl()
    {
        txtTaiKhoan.Enabled = false;
        txtTenNganHang.Enabled = false;
        ResetControl();
    }
    private void ResetControl()
    {
        txtTaiKhoan.Text = "";
        txtTenNganHang.Text = "";
    }


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
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void btnThem_Click(object sender, EventArgs e)
    {

        int tb = 0;
        
            try
            {
                SqlParameter[] param = new SqlParameter[] 
                {
                    dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
                    dtsv.CreateParameter("@MATAIKHOAN",txtTaiKhoan.Text),
                    dtsv.CreateParameter("@TENNGANHANG",txtTenNganHang.Text)
                };
                tb = dtsv.ExecuteNonQuery("ns_insert_taikhoan", param);

            }
            catch (Exception)
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
                    dtsv.CreateParameter("@MATAIKHOAN",txtTaiKhoan.Text),
                    dtsv.CreateParameter("@TENNGANHANG",txtTenNganHang.Text),
                    dtsv.CreateParameter("ID",int.Parse( Session["MaTK"].ToString()))
                };
                tb = dtsv.ExecuteNonQuery("ns_update_taikhoan", param);

            }
            catch 
            {
                Label5.Text = "Cập Nhật Không Thành Công";
               
            }
        
        
        if (tb > 0)
            Label5.Text = "Cập Nhật Thành Công";
        else
        {
            Label5.Text = "Cập Nhật Không Thành Công";
        }
        LoadGridView();
        bntCapNhat.Visible = false;

    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {

        bntCapNhat.Visible = true;
        ShowControl();

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["MaTK"] = ID;
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_all_taikhoan_ma", param);
            if (dt.Rows.Count != 0)
            {
                txtTaiKhoan.Text = dt.Rows[0]["MATAIKHOAN"].ToString();
                txtTenNganHang.Text = dt.Rows[0]["TENNGANHANG"].ToString();


            }
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }


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

                    tb = dtsv.ExecuteNonQuery("ns_del_TaiKhoan", param);
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
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        GetNhanVien();
        GetTen();
        LoadGridView();
        
    }
}