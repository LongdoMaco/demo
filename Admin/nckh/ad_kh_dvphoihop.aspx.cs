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
    DataServices dtsv=new DataServices ();
  
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
            btnCapNhat.Visible = false;
            LoadGridView();
          
        }
       
    }
    private void LoadGridView()
    {
        dtsv.LoadGridView(GridView1, "kh_get_dv_ma", dtsv.CreateParameter("@IDTHONGTIN", ddlNhanVien.SelectedValue));
    }
    private void LoadMAdeTai()
    {

        try
        {
            SqlParameter param = new SqlParameter("@IDTHONGTIN", ddlNhanVien.SelectedValue);

            dtsv.LoadDropDownList(ddldetai, "kh_get_madetai", "MADETAI", "MADETAI", param);
            if (ddldetai.Items.Count == 0)
            {
                lblthongbao.Text= "Nhân viên này chưa có đề tài nghiên cứu";
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

 

    protected void cbheader_CheckedChanged(object sender, EventArgs e)
    {

        //CheckBox cbheader = (CheckBox)GridView1.HeaderRow.FindControl("cbheader");
        //if (cbheader.Checked)
        //{
        //    for (int i = 0; i < GridView1.Rows.Count; i++)
        //    {
        //        CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
        //        item.Checked = true;


        //    }
        //}
        //else
        //{

        //    for (int i = 0; i < GridView1.Rows.Count; i++)
        //    {
        //        CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
        //        item.Checked = false;


        //    }

        //}
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
                dtsv.CreateParameter("@TENDONVI",txtdohvi.Text),
                dtsv.CreateParameter("@HOTEN",txthoten.Text),
                dtsv.CreateParameter("@NOIDUNG",txtnoidung.Text),
                dtsv.CreateParameter("@ID",int.Parse(Session["IDAC"].ToString()))
            };
            tb = dtsv.ExecuteNonQuery("kh_update_dv", param);

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

                    tb = dtsv.ExecuteNonQuery("kh_del_donvi", param);


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
        int tb = 0;
        SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@MADETAI",ddldetai.SelectedValue),
            dtsv.CreateParameter("@TENDONVI",txtdohvi.Text),
            dtsv.CreateParameter("@HOTEN",txthoten.Text),
            dtsv.CreateParameter("@NOIDUNG",txtnoidung.Text)
        };
        tb = dtsv.ExecuteNonQuery("kh_insert_dvph", param);
        if (tb > 0)
            Label5.Text = "Lưu Thành Công";
        else Label5.Text = "Lưu Không Thành Công";
        LoadGridView();
        
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.DataItem != null)
        //e.Row.Cells[1].Text = dtsv.ExcuteScalary("kh_get_tendetai", dtsv.CreateParameter("@ID", int.Parse(e.Row.Cells[1].Text))).ToString();
    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblthongbao.Text = "";
        GetNhanVien();
        
    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblthongbao.Text = "";
        LoadMAdeTai();
        GridView1.DataBind();
        
    }
    protected void cbheader_CheckedChanged1(object sender, EventArgs e)
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
    protected void cbheader_CheckedChanged2(object sender, EventArgs e)
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
    protected void lblEdit_Click(object sender, EventArgs e)
    {
       
        btnCapNhat.Visible = true;
        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["IDAC"] = ID;
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("kh_get_dvtg_ma", param);
            if (dt.Rows.Count != 0)
            {
                ddldetai.SelectedValue = dt.Rows[0]["MADETAI"].ToString();
                txtdohvi.Text = dt.Rows[0]["TENDONVI"].ToString();
                txthoten.Text = dt.Rows[0]["HOTEN"].ToString();
                txtnoidung.Text = dt.Rows[0]["NOIDUNG"].ToString();
               
            }
        }
        catch 
        {
            Label5.Text = "Edit Không Thành Công"; ;
        }
        LoadGridView();
    }
    protected void txtnoidung_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ddlDonVi_SelectedIndexChanged1(object sender, EventArgs e)
    {
        lblthongbao.Text = "";
        GetNhanVien();
        LoadMAdeTai();
        GridView1.DataBind();
    }
    protected void ddlNhanVien_SelectedIndexChanged1(object sender, EventArgs e)
    {
        lblthongbao.Text = "";
        LoadMAdeTai();
        LoadGridView();
    }
}

