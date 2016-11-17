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

public partial class Admin_nhansu_in_gd : System.Web.UI.Page
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

        if (!IsPostBack )
        {
            GetAllDonVi();
            GetNhanVien();
            DanhSachQuanHe();
            GetTen();
            GetQuanHe();
            LoadTPHN();
            LoadQGNQ();
          
            
        }
        bntCapNhat.Visible = false;

    }
    private void LoadQGNQ()
    {
        DDLQGNQ.DataSource = dtsv.ExcuteTable("ns_get_qg");
        DDLQGNQ.DataTextField = "TENQUOCGIA";
        DDLQGNQ.DataValueField = "ID";
        DDLQGNQ.DataBind();

    }
    private void LoadTPHN()
    {
        dtsv.LoadDropDownList(ddltphn, "ns_get_pp", "TINHTHANHPHO", "ID");
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
    public void DanhSachQuanHe()
    {
        dtsv.LoadGridView(GridView1, "ns_Get_tt_QuanheGiaDinh", dtsv.CreateParameter("@IDNV ", ddlNhanVien.SelectedValue));
       
    }




    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label5.Text = "";
        GetNhanVien();
        GetTen();
        DanhSachQuanHe();


    }
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        DanhSachQuanHe();
        GetTen();
        Label5.Text = "";

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.DataItem != null)
        //    e.Row.Cells[3].Text = dtsv.ExcuteScalary("ns_get_tenquanhe", dtsv.CreateParameter("@IDQuanHe", e.Row.Cells[2].Text)).ToString();

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
            Label5.Text = "Chưa có nhân viên";
        }

    }
    public void GetQuanHe()
    {
        ddlquanhe.DataSource = dtsv.ExcuteTable("ns_get_quanheall");
        ddlquanhe.DataTextField = "QUANHE";
        ddlquanhe.DataValueField = "ID";
        ddlquanhe.DataBind();

    }

    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        ShowControl();
        bntCapNhat.Visible = true;
    
        try
        {
            LinkButton lbk = (LinkButton)sender;
            Label lb = (Label)lbk.Parent.FindControl("ID");
            int ID = int.Parse(lb.Text);
            Session["QHGD"] = ID;

            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_allQuanHe", param);
            int k = dt.Rows.Count;
            if (k != 0)
            {
                txthoten.Text = dt.Rows[0]["HOVATEN"].ToString();
                txtngaysinh.Text = dt.Rows[0]["NGAYSINH"].ToString();
                ddlquanhe.SelectedValue = dt.Rows[0]["IDQUANHE"].ToString();
                txtNgheNghiep.Text = dt.Rows[0]["NGHENGHIEP"].ToString();
                txtSNHN.Text = dt.Rows[0]["SONHA"].ToString();
                txtDuongHN.Text = dt.Rows[0]["DUONG"].ToString();
               txtXaHN.Text= dt.Rows[0]["XA"].ToString();
                txtHuyenHN.Text = dt.Rows[0]["HUYEN"].ToString();
               ddltphn.SelectedValue = dt.Rows[0]["TINH"].ToString();
                DDLQGNQ.SelectedValue = dt.Rows[0]["QUOCGIA"].ToString();
                txtDTHN.Text = dt.Rows[0]["DIENTHOAI"].ToString();
            }
        }
        catch 
        {
            Label5.Text = "Server đang nâng cấp";
        }


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

                    tb = dtsv.ExecuteNonQuery("ns_del_QuanHeTheoMa", param);


                }

            }
            if (tb > 0)
                Label5.Text = "Xoa Thanh Cong";
            else Label5.Text = "Xóa Không Thành Công";
              
            
        }
        catch 
        {
            Label5.Text = "Xóa Không Thành Công";
        }
        DanhSachQuanHe();
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
    protected void cbitem_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void bntCapNhat_Click(object sender, EventArgs e)
    {
        //EDIT
        int tb = 0;
      

            SqlParameter[] param = new SqlParameter[] 
                {
                    dtsv.CreateParameter("@ID",int.Parse( Session["QHGD"].ToString())),
                    dtsv.CreateParameter("@HOVATEN",txthoten.Text),
                    dtsv.CreateParameter("@NGAYSINH",txtngaysinh.Text),
                    dtsv.CreateParameter("@IDQUANHE",ddlquanhe.SelectedValue),
                    dtsv.CreateParameter("@NGHENGHIEP",txtNgheNghiep.Text),
                     dtsv.CreateParameter("@SONHA",txtSNHN.Text),
                    dtsv.CreateParameter("@DUONG",txtDuongHN.Text),
                    dtsv.CreateParameter("@XA",txtXaHN.Text),
                    dtsv.CreateParameter("@HUYEN",txtHuyenHN.Text),
                    dtsv.CreateParameter("@TINH",ddltphn.SelectedValue),
                    dtsv.CreateParameter("@QUOCGIA",DDLQGNQ.SelectedValue),
                    dtsv.CreateParameter("@DIENTHOAI",txtDTHN.Text)
                };
            try
            {
                tb = dtsv.ExecuteNonQuery("ns_update_Quanhegiadinh", param);
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
            DanhSachQuanHe();
            bntCapNhat.Visible = false;
        
        // New create
        

    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        int tb = 0;
       
            SqlParameter[] param = new SqlParameter[] 
                {
                    dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
                    dtsv.CreateParameter("@HOVATEN",txthoten.Text),
                    dtsv.CreateParameter("@NGAYSINH",txtngaysinh.Text),
                    dtsv.CreateParameter("@IDQUANHE",ddlquanhe.SelectedValue),
                    dtsv.CreateParameter("@NGHENGHIEP",txtNgheNghiep.Text),                  
                    dtsv.CreateParameter("@SONHA",txtSNHN.Text),
                    dtsv.CreateParameter("@DUONG",txtDuongHN.Text),
                    dtsv.CreateParameter("@XA",txtXaHN.Text),
                    dtsv.CreateParameter("@HUYEN",txtHuyenHN.Text),
                    dtsv.CreateParameter("@TINH",ddltphn.SelectedValue),
                    dtsv.CreateParameter("@QUOCGIA",DDLQGNQ.SelectedValue),
                    dtsv.CreateParameter("@DIENTHOAI",txtDTHN.Text)
                    
                };
            try
            {
                if (txthoten.Text != "")
                    tb = dtsv.ExecuteNonQuery("ns_insert_quanhegiadinh", param);
                if (tb > 0)
                    Label5.Text = "Dữ Liệu Đã Được Thêm";
                else
                {
                    Label5.Text = "Dữ Liệu Chưa Được Thêm";
                }
            }
            catch 
            {

                Label5.Text = "Dữ Liệu Chưa Được Thêm";
            }
            DanhSachQuanHe();

        
    }
    private void HiddenControl()
    {
        txthoten.Enabled = false;
        txtngaysinh.Enabled = false;
        txtNgheNghiep.Enabled = false;
       
        ddlquanhe.Enabled = false;
    }
    private void ShowControl()
    {

        txthoten.Enabled = true;
        txtngaysinh.Enabled = true;
        txtNgheNghiep.Enabled = true;
     
        ddlquanhe.Enabled = true;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.DanhSachQuanHe();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    protected void ddlquocgiahn_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
