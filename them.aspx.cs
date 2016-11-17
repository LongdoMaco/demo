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
using DAL;
using System.Data.SqlClient;
using UNI.Class;

public partial class Admin_congvan_member_them : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //if (Session["nguoisudung_ID"] == null)
        //    Response.Redirect("~/DangNhap.aspx");
        //string url = HttpContext.Current.Request.Url.AbsoluteUri;
        //string[] MangTach = url.Split('/');
        //if (!PhanQuyen.KiemTra(MangTach[MangTach.Length - 2].ToString(), int.Parse(Session["nguoisudung_ID"].ToString())))
        //{
        //    Response.Redirect("~/public/UnauthorizedAccess.aspx");
        //}
        if (!IsPostBack)
        {
            GetAllDonVi();
            GetNhanVien();
          
            //LoadGridView();
        }
        Button3.Visible = false;
    }
    public void GetAllDonVi()
    {
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        if (ddlDonVi.Items.Count < 0)
            Label1.Text = "Chưa có đơn vị nào cả";



    }
   
    public void GetNhanVien()
    {

        SqlParameter param = new SqlParameter("@DONVI_ID", ddlDonVi.SelectedValue);
        ddlNhanVien.DataSource = dtsv.ExcuteTable("ns_Get_tt_theoDonvi", param);
        ddlNhanVien.DataTextField = "HOVATEN";
        ddlNhanVien.DataValueField = "ID";
        ddlNhanVien.DataBind();
        if (ddlNhanVien.Items.Count == 0)
            Label1.Text = "Chưa có nhân viên nào";

    }
 
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (txtDangNhap.Text == "")
            Label1.Text = "Không đựợc để trống tên đăng nhập";
        else if (txtMatKhau.Text!=txtNhapLaiMatKhau.Text)
            Label1.Text = "Mật khẩu không giống nhau";
        else
        {
            int tb = 0;




            SqlParameter[] parm = new SqlParameter[]
        {
            dtsv.CreateParameter("@NguoiSuDungID",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@TENDANGNHAP",DAL.Security.EncryptData(txtDangNhap.Text)),
            dtsv.CreateParameter("@MATKHAU",DAL.Security.EncryptData(txtMatKhau.Text)),
        };
            try
            {
                tb = dtsv.ExecuteNonQuery("ns_taonguoisudung", parm);
            }
            catch
            {
                Label1.Text = "Không Thành Công";
            }
            if (tb > 0)
                Label1.Text = "Thêm Thành Công";
            else Label1.Text = "Thêm Không Thành Công";
           
        }
        LoadGridView();
        
    }
    private void LoadGridView()
    {
        dtsv.LoadGridView(GridView1, "NguoiSudung_get_all", dtsv.CreateParameter("@IDDONVI", ddlDonVi.SelectedValue));

    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = "";
        GetNhanVien();
        LoadGridView();

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
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.DataItem!=null)
        e.Row.Cells[2].Text = DAL.Security.DecryptData(e.Row.Cells[2].Text);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Button3.Visible = true;
       
        try
        {
            LinkButton lb = (LinkButton)sender;
            Label lbl = (Label)lb.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["ID_USER"] = ID;
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("cv_get_tt_usert", param);
            if (dt.Rows.Count != 0)
            {
                ddlNhanVien.SelectedValue = dt.Rows[0]["NguoiSuDungID"].ToString();
                txtDangNhap.Text = DAL.Security.DecryptData(dt.Rows[0]["TENDANGNHAP"].ToString());
               
            }
        }
        catch
        {
            Label1.Text = "Một Lỗi Xuất Hiện";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int tb = 0;
      

        SqlParameter[] parm = new SqlParameter[]
        {
            dtsv.CreateParameter("@NguoiSuDungID",int.Parse(Session["ID_USER"].ToString())),
            dtsv.CreateParameter("@TENDANGNHAP",DAL.Security.EncryptData(txtDangNhap.Text)),
            dtsv.CreateParameter("@MATKHAU",DAL.Security.EncryptData(txtMatKhau.Text)),
           
           
        };
        try
        {
            tb = dtsv.ExecuteNonQuery("cv_update_user", parm);
        }
        catch
        {
            Label1.Text = "Cập Nhật Không Thành Công";
        }
        if (tb > 0)
            Label1.Text = " Thành Công";
        else Label1.Text = " Không Thành Công";
        //Session.Remove("ID_USER");
        Button3.Visible = false;
           
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
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

                    tb = dtsv.ExecuteNonQuery("cv_del_user", param);
                }

            }
            if (tb > 0)
                Label1.Text = "Xoá Thành Công";
            else
            {
                Label1.Text = "Xóa Không Thành Công";
            }
        }
        catch
        {
            Label1.Text = "Xóa Không Thành Công";
        }
        LoadGridView();
    }
    protected void trangthai_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox cb = (CheckBox)sender;
        if (cb.Checked)
        {
            try
            {
                Label lbl = (Label)cb.Parent.FindControl("ID");
                int ID = int.Parse(lbl.Text);
                dtsv.ExecuteNonQuery("NguoiSuDung_KichHoat", dtsv.CreateParameter("@ID", ID));
            }
            catch
            {
                 Label1.Text = "Không kích hoạt được";
            }
        }
        else
        {


            try
            {
                Label lbl = (Label)cb.Parent.FindControl("ID");
                int ID = int.Parse(lbl.Text);
                dtsv.ExecuteNonQuery("NguoiSuDung_DelKichHoat", dtsv.CreateParameter("@ID", ID));
            }
            catch
            {
                Label1.Text = "Không kích hoạt được";
            }
        }
    }
}
