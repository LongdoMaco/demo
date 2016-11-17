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

public partial class Admin_nhansu_in_ranuocngoai : System.Web.UI.Page
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
            LoadLiDoDi();
            GetQuocGia();
            GetAllQuocGia();
           

        }
        bntCapNhat.Visible = false;

    }

    // Danh muc li do ra nuoc ngoai
    private void LoadLiDoDi()
    {
        dtsv.LoadDropDownList(ddlLiDoDi, "DMLIDODINUOCNGOAI_GETALL", "LIDO", "ID");
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






    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {

        GetTen();
        GetAllQuocGia();
        Label5.Text = "";

    }

    public void GetTen()
    {
        try
        {
            int IDNV = int.Parse(ddlNhanVien.SelectedValue);
            SqlParameter param = new SqlParameter("@IDNV", IDNV);
           Lable6.Text = dtsv.ExcuteScalary("ns_gethoten", param).ToString();
        }
        catch
        {
            Label5.Text = "Chưa tồn tại nhân viên";
        }

    }
    public void GetQuocGia()
    {
        ddlquocgia.DataSource = dtsv.ExcuteTable("ns_get_allQuocGia");
        ddlquocgia.DataTextField = "TENQUOCGIA";
        ddlquocgia.DataValueField = "ID";
        ddlquocgia.DataBind();

    }
    public void GetAllQuocGia()
    {
        SqlParameter param = new SqlParameter("@IDNV", ddlNhanVien.SelectedValue);
        GridView1.DataSource = dtsv.ExcuteTable("ns_Get_tt_ThongTinNuocNgoai", param);
        GridView1.DataBind();


    }



    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        GetNhanVien();
        GetTen();
        GetAllQuocGia();
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
    protected void lbEdit_Click(object sender, EventArgs e)
    {
        ShowControl();
        bntCapNhat.Visible = true;
     
        try
        {
            LinkButton lb = (LinkButton)sender;
            Label lbl = (Label)lb.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["RaNuocNgoai"] = ID;
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_tt_nn_id", param);
            if (dt.Rows.Count != 0)
            {
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
                ddlquocgia.SelectedValue = dt.Rows[0]["IDQUOCGIA"].ToString();
                txtDenNgay.Text = dt.Rows[0]["DENNGAY"].ToString();
                txtTuNgay.Text = dt.Rows[0]["TUNGAY"].ToString();
                txtnoiden.Text = dt.Rows[0]["NOIDEN"].ToString();
                txtmucdich.Text = dt.Rows[0]["MUCDICH"].ToString();
                ddlLiDoDi.SelectedValue = dt.Rows[0]["LIDO"].ToString();
                txtkinhphi.Text = dt.Rows[0]["KINHPHI"].ToString();
                txtsoquyetdinh.Text = dt.Rows[0]["SOQUYETDINH"].ToString();
            }
        }
        catch
        {
            Label5.Text = "Một Lỗi Xuất Hiện";
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

                    tb = dtsv.ExecuteNonQuery("ns_del_NuocNgoai", param);
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
        GetAllQuocGia();

    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
         int tb=0;
            try
            {
                SqlParameter[] param = new SqlParameter[] 
                {
                    dtsv.CreateParameter("@IDTHONGTIN",int.Parse(ddlNhanVien.SelectedValue)),
                    dtsv.CreateParameter("@IDQUOCGIA",ddlquocgia.SelectedValue),
                    dtsv.CreateParameter("@TUNGAY",txtTuNgay.Text),
                    dtsv.CreateParameter("@DENNGAY",txtDenNgay.Text),
                    dtsv.CreateParameter("@NOIDEN",txtnoiden.Text),
                    dtsv.CreateParameter("@MUCDICH",txtmucdich.Text),
                    dtsv.CreateParameter("@LIDO",ddlLiDoDi.SelectedValue),
                    dtsv.CreateParameter("@KINHPHI",txtkinhphi.Text),
                    dtsv.CreateParameter("@SOQUYETDINH",txtsoquyetdinh.Text),
                    //dtsv.CreateParameter("@IDTRANGTHAI","1"),
                };

                if (ddlquocgia.Text != "")
                    tb = dtsv.ExecuteNonQuery("ns_insert_nuocngoai", param);
                if (tb > 0)
                    Label5.Text = "Dữ Liệu Đã Được Thêm";
                else
                {
                    Label5.Text = "Dữ Liệu Chưa Được Thêm";
                }
            }
            
            catch (Exception)
            {

                Label5.Text = "Dữ Liệu Chưa Được Thêm";
            }
            GetAllQuocGia();
    }
    private void ShowControl()
    {
        txtDenNgay.Enabled = true;
        txtTuNgay.Enabled = true;
     

    }
    private void HiddenControl()
    {
        txtDenNgay.Enabled = false;
        txtTuNgay.Enabled = false;
      
    }
    protected void bntCapNhat_Click(object sender, EventArgs e)
    {
        //Edit
        int tb = 0;
       

            SqlParameter[] param = new SqlParameter[] 
                {
                    dtsv.CreateParameter("@ID",int.Parse(Session["RaNuocNgoai"].ToString())),
                    dtsv.CreateParameter("@IDQUOCGIA",ddlquocgia.SelectedValue),
                    dtsv.CreateParameter("@TUNGAY",txtTuNgay.Text),
                    dtsv.CreateParameter("@DENNGAY",txtDenNgay.Text),
                    dtsv.CreateParameter("@NOIDEN",txtnoiden.Text),
                    dtsv.CreateParameter("@MUCDICH",txtmucdich.Text),
                    dtsv.CreateParameter("@LIDO",ddlLiDoDi.SelectedValue),
                    dtsv.CreateParameter("@KINHPHI",txtkinhphi.Text),
                    dtsv.CreateParameter("@SOQUYETDINH",txtsoquyetdinh.Text),
                };
            try
            {
                tb = dtsv.ExecuteNonQuery("ns_update_NuocNgoai", param);
                if (tb > 0)
                    Label5.Text = "Cập Nhật Thành Công";
                else
                {
                    Label5.Text = "Cập Nhật Không Thành Công";

                }
            }
            catch (Exception ex)
            {

                Label5.Text = ex.Message.ToString();
            }
            GetAllQuocGia();
            bntCapNhat.Visible = false;

        
        //New create

       
            GetAllQuocGia();

        }
    
}
