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
using DAL;

public partial class Admin_nhansu_phonghocham : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    private static int index ;
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
            GetAllDonVi();
            GetNhanVien();
            GetQuocGia();
            LoadDanhHieu();
            LoadGrivews();
            GetTen();
            
        }
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
    private void LoadDanhHieu()
    {
        dtsv.LoadDropDownList(ddlDanhHieu, "ns_get_hamdanhhieu", "HAMDANHHIEU", "ID");

    }
    public void GetTen()
    {
        try
        {
            int IDNV = int.Parse(ddlNhanVien.SelectedValue);
            SqlParameter param = new SqlParameter("@IDNV", IDNV);
            lblThongTin.Text = dtsv.ExcuteScalary("ns_gethoten", param).ToString();
        }
        catch
        {
            lblThongTin.Text = "Chưa tồn tại nhân viên";
        }

    }
    public void GetQuocGia()
    {
        ddlquocgia.DataSource = dtsv.ExcuteTable("ns_get_allQuocGia");
        ddlquocgia.DataTextField = "TENQUOCGIA";
        ddlquocgia.DataValueField = "ID";
        ddlquocgia.DataBind();

    }
    private void LoadGrivews()
    {
        try
        {
            SqlParameter param = new SqlParameter("@ID",ddlDonVi.SelectedValue);
            dtsv.LoadGridView(GridView1, "ns_get_hocham_ma", param);
        }
        catch
        {
            Label5.Text = "Một Lỗi Phát Sinh";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        GetNhanVien();
        GetTen();
        LoadGrivews();
    }
    protected void btnThemMoi_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {
            SqlParameter[] param = new SqlParameter[] { 
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDHAMDANHHIEU",ddlDanhHieu.SelectedValue),
            dtsv.CreateParameter("@NAM",txtNam.Text),
            dtsv.CreateParameter("@IDQUOCGIA",ddlquocgia.SelectedValue)

        };
            tb = dtsv.ExecuteNonQuery("ns_insert_hocham", param);
        }
        catch
        {
            Label5.Text = "Thêm Không Thành Công";
        }
       

        if (tb > 0)
            Label5.Text = "Thêm Thành Công";
        else Label5.Text = "Thêm Không Thành Công";
        LoadGrivews();

        
    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetTen();
        LoadGrivews();
    }
    protected void cbheader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox cbhead = (CheckBox)GridView1.HeaderRow.FindControl("cbheader");
        if (cbhead.Checked == true)
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
    protected void lbtEdit_Click(object sender, EventArgs e)
    {

        try
        {
            LinkButton lbk = (LinkButton)sender;
            Label lb = (Label)lbk.Parent.FindControl("ID");
            int ID = int.Parse(lb.Text);
            index = ID;

            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_phongham", param);
            int k = dt.Rows.Count;
            if (k != 0)
            {
                txtNam.Text = dt.Rows[0]["NAM"].ToString();
                ddlDanhHieu.SelectedValue = dt.Rows[0]["IDHAMDANHHIEU"].ToString();
                ddlquocgia.SelectedValue = dt.Rows[0]["IDQUOCGIA"].ToString();
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();

            }
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }
    }
    protected void btnluusua_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {
            SqlParameter[] param = new SqlParameter[] { 
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDHAMDANHHIEU",ddlDanhHieu.SelectedValue),
            dtsv.CreateParameter("@NAM",txtNam.Text),
            dtsv.CreateParameter("@IDQUOCGIA",ddlquocgia.SelectedValue),
            dtsv.CreateParameter("@ID",index),

        };
            tb = dtsv.ExecuteNonQuery("ns_update_hocham", param);
        }
        catch
        {
            Label5.Text = "Sửa Không Thành Công";
        }


        if (tb > 0)
            Label5.Text = "Sửa Thành Công";
        else Label5.Text = "Sửa Không Thành Công";
        LoadGrivews();
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

                    tb = dtsv.ExecuteNonQuery("ns_del_phma", param);


                }

            }
            if (tb > 0)
            {
                Label5.Text = "Xóa Thành Công";

            }
            else Label5.Text = "Xóa Không Thành Công";
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }
        LoadGrivews();
    }
}
