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

public partial class Admin_nckh_dvph : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    private static int index;
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
        if (!IsPostBack)
        {
            //LoadMAdeTai();
            GetAllDonVi();
            GetNhanVien();
            LoadMAdeTai();
            LoadNhiemVu();
            LoadGridView();
            btnCapNhat.Visible = false;
           
        }

    }
    private void LoadGridView()
    {
        dtsv.LoadGridView(GridView1, "kh_get_thamgia_detai", dtsv.CreateParameter("@IDTHONGTIN", ddlNhanVien.SelectedValue));
    }
    private void LoadMAdeTai()
    {

        try
        {
            SqlParameter param = new SqlParameter("@IDTHONGTIN", ddlNhanVien.SelectedValue);

            dtsv.LoadDropDownList(ddldetai, "kh_get_madetai", "MADETAI", "MADETAI", param);
            if (ddldetai.Items.Count == 0)
            {
                lblthongbao.Text = "Nhân viên này chưa có đề tài nghiên cứu";
            }
        }
        catch
        {
            lblthongbao.Text = "Nhân viên này chưa có đề tài nghiên cứu";
        }


    }
    public void GetAllDonVi()
    {
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        if (ddlDonVi.Items.Count < 0)
            lblthongbao.Text = "Chưa có nhân viên  nào cả";



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
            lblthongbao.Text = "Chưa có đơn vị nào cả";

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       

    }

    private void LoadNhiemVu()
    {
        dtsv.LoadDropDownList(ddlNhiemVu, "kh_get_nhiemvu", "NHIEMVU", "ID");
    }

    protected void lbtEdit_Click(object sender, EventArgs e)
    {

        //LinkButton lbt = (LinkButton)sender;
        //Label lbl = (Label)lbt.Parent.FindControl("ID");
        //int ID = int.Parse(lbl.Text);
        //index = ID;
        //SqlParameter param = new SqlParameter("@ID", ID);
        //DataTable dt = dtsv.ExcuteTable("kh_get_dv_ma", param);
        //if (dt.Rows.Count != 0)
        //{
        //    ddldetai.SelectedValue = dt.Rows[0]["IDDETAI"].ToString();
        //    txtdohvi.Text = dt.Rows[0]["DONVI"].ToString();
        //    txthoten.Text = dt.Rows[0]["HOVATEN"].ToString();
        //    txtNoiDung.Value = dt.Rows[0]["NOIDUNG"].ToString();
        //}
        //else Label5.Text = "Không Thể Edit Được";
        //index = ID;
        //btnLUU.Visible = false;
        //btnCapNhat.Visible = true;


    }
    protected void btnCapNhat_Click(object sender, EventArgs e)
    {

        int tb = 0;
        try
        {
            SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@MADETAI",ddldetai.SelectedValue),
                dtsv.CreateParameter("@DONVICONGTAC",txtdohvi.Text),                
                dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
                dtsv.CreateParameter("@IDNHIEMVU",ddlNhiemVu.SelectedValue),
                dtsv.CreateParameter("@ID",index)
            };
            tb = dtsv.ExecuteNonQuery("kh_update_thamgia", param);

        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();


        }
        if (tb > 0)
            Label5.Text = "Cập Nhật Thành Công";
        else Label5.Text = "Cập Nhật Không Thành Công";
        LoadGridView();


    }
    protected void bntXoa_Click(object sender, EventArgs e)
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

                    tb = dtsv.ExecuteNonQuery("kh_del_thamgia", param);


                }

            }
        }


        catch
        {
            Label5.Text = "Xóa Không Thành Công";
        }
        if (tb > 0)
            Label5.Text = "Xoá Thành Công";
        else Label5.Text = "Vui Lòng Chọn Mục Trước Khi Xóa";
        LoadGridView();
    }

    protected void bntTaoMoi_Click(object sender, EventArgs e)
    {
        btnCapNhat.Visible = false;
        txtdohvi.Text = "";
        int tb = 0;
        try
        {
            SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@MADETAI",ddldetai.SelectedValue),
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@DONVICONGTAC",txtdohvi.Text),
            dtsv.CreateParameter("@IDNHIEMVU",ddlNhiemVu.SelectedValue)
           
        };
            tb = dtsv.ExecuteNonQuery("kh_insert_kh_th", param);
        }
        catch
        {
            Label5.Text = "Lưu Không Thành Công";
        }
        if (tb > 0)
            Label5.Text = "Lưu Thành Công";
        else Label5.Text = "Kiểm tra lại mã đề tài đã tồn tại";
        LoadGridView();
      


    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.DataItem != null)
        //e.Row.Cells[1].Text = dtsv.ExcuteScalary("kh_get_tendetai", dtsv.CreateParameter("@ID", int.Parse(e.Row.Cells[1].Text))).ToString();
    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        lblthongbao.Text = "";
        GetNhanVien();
        LoadGridView();

    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        lblthongbao.Text = "";
        LoadMAdeTai();
        LoadGridView();

    }


    protected void lblEdit_Click(object sender, EventArgs e)
    {
        //    btnLUU.Visible = false;
        //    btnCapNhat.Visible = true;
        //    try
        //    {
        //        LinkButton lbt = (LinkButton)sender;
        //        Label lbl = (Label)lbt.Parent.FindControl("ID");
        //        int ID = int.Parse(lbl.Text);
        //        index = ID;
        //        SqlParameter param = new SqlParameter("@ID", ID);
        //        DataTable dt = dtsv.ExcuteTable("kh_get_dvtg_ma", param);
        //        if (dt.Rows.Count != 0)
        //        {
        //            ddldetai.SelectedValue = dt.Rows[0]["MADETAI"].ToString();
        //            txtdohvi.Text = dt.Rows[0]["TENDONVI"].ToString();
        //            txthoten.Text = dt.Rows[0]["HOTEN"].ToString();
        //            txtNhiemVu.Text = dt.Rows[0]["NOIDUNG"].ToString();

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Label5.Text = "Edit Không Thành Công"; ;
        //    }

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
    protected void lbtEdit_Click1(object sender, EventArgs e)
    {
        
        btnCapNhat.Visible = true;
        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            index = ID;
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("kh_get_tgdt_ma", param);
            if (dt.Rows.Count != 0)
            {
                ddldetai.SelectedValue = dt.Rows[0]["MADETAI"].ToString();
                txtdohvi.Text = dt.Rows[0]["DONVICONGTAC"].ToString();
                ddlNhiemVu.SelectedValue = dt.Rows[0]["IDNHIEMVU"].ToString();



            }
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

