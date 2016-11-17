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

public partial class Admin_nhansu_in_diachi : System.Web.UI.Page
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

    }

    private void Initializes()
    {
        GetAllDonVi();
        LoadGridView();
       
        GetNhanVien();
        LoadQGNQ();
        LoadQGHN();
        LoadTPNQ();
        LoadTPHN();
        
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
    private void LoadGridView()
    {
        SqlParameter param = new SqlParameter("@IDDONVI", ddlDonVi.SelectedValue);
        GridView1.DataSource = dtsv.ExcuteTable("ns_get_diachi_donvi", param);
        GridView1.DataBind();

    }







    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetNhanVien();
        LoadGridView();
        StatusConTrol();
        Label5.Text = "";
        Label1.Text = "";
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

                    tb = dtsv.ExecuteNonQuery("ns_del_DiaChia", param);
                }

            }
            if (tb > 0)
                Label5.Text = "Xoá Thành Công";
            else
            {
                Label5.Text = "Xóa Không Thành Công";
            }
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message;
        }
        LoadGridView();
    }

    private void StatusConTrol()
    {
        foreach (Control item in this.Form.Controls)
        {
            if (item is TextBox)
            {
                TextBox tb = (TextBox)item;
                tb.Text = "";
                
            }
           


        }

    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        int tb = 0;

        try
        {
            SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@XAPUONGNQ",txtXaNQ.Text),
                dtsv.CreateParameter("@HUYENQUANNQ",txtQuanNQ.Text),
                dtsv.CreateParameter("@IDTINHTPNQ",ddltpqn.SelectedValue),
                dtsv.CreateParameter("@DIENTHOAINQ",txtDTNQ.Text),
                dtsv.CreateParameter("@SONHAHN",txtSNHN.Text),
                dtsv.CreateParameter("@DUONGHN",txtDuongHN.Text),
                dtsv.CreateParameter("@XAPHUONGHN",txtXaHN.Text),
                dtsv.CreateParameter("@IDTINHTPHN",ddltphn.SelectedValue),
                dtsv.CreateParameter("@DIENTHOAIHN",txtDTHN.Text),
                dtsv.CreateParameter("@IDQUOCGIANQ",DDLQGNQ.SelectedValue),
                dtsv.CreateParameter("@IDQUOCGIAHN",ddlquocgiahn.SelectedValue),
                dtsv.CreateParameter("@HUUYENHN",txtHuyenHN.Text),
                dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue)
            

            };
            tb = dtsv.ExecuteNonQuery("ns_insert_diachi", param);
            if (tb > 0)
                Label5.Text = "Thêm Thành Công";
            else Label5.Text = "Cập Nhật Không Thành Công";
        }
        catch
        {
            Label5.Text = "Nhân viên này đã được thêm";
        }
        
            LoadGridView();

        
    }
    protected void bntCapNhat_Click(object sender, EventArgs e)
    {

        int tb = 0;
        // Cập Nhật Thông Tin Mới
        try
        {
          

                SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@XAPUONGNQ",txtXaNQ.Text),
                dtsv.CreateParameter("@HUYENQUANNQ",txtQuanNQ.Text),
                dtsv.CreateParameter("@IDTINHTPNQ",ddltpqn.SelectedValue),
                dtsv.CreateParameter("@DIENTHOAINQ",txtDTNQ.Text),
                dtsv.CreateParameter("@SONHAHN",txtSNHN.Text),
                dtsv.CreateParameter("@DUONGHN",txtDuongHN.Text),
                dtsv.CreateParameter("@XAPHUONGHN",txtXaHN.Text),
                dtsv.CreateParameter("@IDTINHTPHN",ddltphn.SelectedValue),
                dtsv.CreateParameter("@DIENTHOAIHN",txtDTHN.Text),
                dtsv.CreateParameter("@IDQUOCGIANQ",DDLQGNQ.SelectedValue),
                dtsv.CreateParameter("@IDQUOCGIAHN",ddlquocgiahn.SelectedValue),
                dtsv.CreateParameter("@HUUYENHN",txtHuyenHN.Text),
                dtsv.CreateParameter("@ID",Session["NVDC"])
            

            };
                tb = dtsv.ExecuteNonQuery("ns_update_diachi", param);

            }
            // Chen Thong Tin Moi
            


        
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();

        }
        if (tb > 0)
            Label5.Text = "Cập Nhật Thành Công";
        else
        {
            Label5.Text = "Cập Nhật Không Thành Công";
        }
        LoadGridView();

    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {    
        Label5.Text = "";      

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int IDNV = int.Parse(lbl.Text);
            Session["NVDC"] = IDNV;
            GetTen();
            SqlParameter param = new SqlParameter("@IDNV", IDNV);
            DataTable dt = dtsv.ExcuteTable("ns_get_DiaChi_NV", param);

            if (dt.Rows.Count != 0)
            {
                Label1.Text = "";
                txtXaNQ.Text = dt.Rows[0]["XAPUONGNQ"].ToString();
                txtQuanNQ.Text = dt.Rows[0]["HUYENQUANNQ"].ToString();
                ddltpqn.SelectedValue = dt.Rows[0]["IDTINHTPNQ"].ToString();
                DDLQGNQ.SelectedValue = dt.Rows[0]["IDQUOCGIANQ"].ToString();
                txtDTNQ.Text = dt.Rows[0]["DIENTHOAINQ"].ToString();
                txtSNHN.Text = dt.Rows[0]["SONHAHN"].ToString();
                txtDuongHN.Text = dt.Rows[0]["DUONGHN"].ToString();
                txtXaHN.Text = dt.Rows[0]["XAPHUONGHN"].ToString();
                ddltphn.SelectedValue = dt.Rows[0]["IDTINHTPHN"].ToString();
                ddlquocgiahn.SelectedValue = dt.Rows[0]["IDQUOCGIAHN"].ToString();
                txtDTHN.Text = dt.Rows[0]["DIENTHOAIHN"].ToString();
                txtHuyenHN.Text = dt.Rows[0]["HUUYENHN"].ToString();
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();
              

            }
            else
            {
                Label1.Text = "Nhân Viên Này Chưa Cập Nhật Thông Tin - Điền Đầy Đủ Thông Tin Rồi Thêm Mới  ";   
    
                
            }

        }
        catch 
        {
            Label5.Text = "Không Thể Sửa Được!";
        }
        GetTen();

    }
    private void LoadQGNQ()
    {
        DDLQGNQ.DataSource = dtsv.ExcuteTable("ns_get_qg");
        DDLQGNQ.DataTextField = "TENQUOCGIA";
        DDLQGNQ.DataValueField = "ID";
        DDLQGNQ.DataBind();

    }
    private void LoadQGHN()
    {
        ddlquocgiahn.DataSource = dtsv.ExcuteTable("ns_get_qg");
        ddlquocgiahn.DataTextField = "TENQUOCGIA";
        ddlquocgiahn.DataValueField = "ID";
        ddlquocgiahn.DataBind();


    }
    // Lay Ten
    public void GetTen()
    {
        try
        {

            SqlParameter param = new SqlParameter("@IDNV", ddlNhanVien.SelectedValue);
            Label6.Text = dtsv.ExcuteScalary("ns_gethoten", param).ToString();
        }
        catch
        {
            Label5.Text = "Có Lỗi Xảy Ra";
        }

    }
    protected void ddlquocgiahn_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    private void LoadTPNQ()
    {
        dtsv.LoadDropDownList(ddltpqn, "ns_get_pp", "TINHTHANHPHO", "ID");
    }
    private void LoadTPHN()
    {
        dtsv.LoadDropDownList(ddltphn, "ns_get_pp", "TINHTHANHPHO", "ID");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadGridView();
    }


}
