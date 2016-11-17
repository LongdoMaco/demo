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

public partial class Admin_nhansu_in_trinhdo : System.Web.UI.Page
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
            LoadQuocGia();
            LoadTrinhDo();
            GetQuocGia();
            LoadDanhHieu();
            GetTen();
            LoadGridView();
            DanhSachPhongHocHam();


        }
        bntCapNhat.Visible = false;
       


    }
    private void LoadGridView()
        
    {
        dtsv.LoadGridView(GridView1, "ns_get_trinhdos", dtsv.CreateParameter("IDNV", ddlNhanVien.SelectedValue));
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
    // Load Len Grid





    //protected void cbheader_CheckedChanged(object sender, EventArgs e)
    //{

    //    CheckBox checkhead = (CheckBox)GridView1.HeaderRow.FindControl("cbheader");
    //    if (checkhead.Checked)
    //    {
    //        for (int i = 0; i < GridView1.Rows.Count; i++)
    //        {
    //            CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
    //            item.Checked = true;

    //        }
    //    }
    //    else
    //    {

    //        for (int i = 0; i < GridView1.Rows.Count; i++)
    //        {
    //            CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
    //            item.Checked = false;

    //        }
    //    }
    //}

    public void GetNhanVien()
    {
        int IDDonVi = int.Parse(ddlDonVi.SelectedValue);
        SqlParameter param = new SqlParameter("@DONVI_ID", IDDonVi);
        ddlNhanVien.DataSource = dtsv.ExcuteTable("ns_Get_tt_theoDonvi", param);
        ddlNhanVien.DataTextField = "HOVATEN";
        ddlNhanVien.DataValueField = "ID";
        ddlNhanVien.DataBind();
        if (ddlNhanVien.Items.Count == 0)
        {
            Label5.Text = "Chưa có nhân viên nào";
            Label6.Text = "";
        }
    }
    // Danh hieu hoc ham
    private void LoadDanhHieu()
    {
        dtsv.FillDropDownListSQL(ddlDanhHieu, "select * from HOCHAM", "HOCHAM", "ID");

    }
    // Quoc gia phong hoc ham
    public void GetQuocGia()
    {
        ddlquocgiaphong.DataSource = dtsv.ExcuteTable("ns_get_allQuocGia");
        ddlquocgiaphong.DataTextField = "TENQUOCGIA";
        ddlquocgiaphong.DataValueField = "ID";
        ddlquocgiaphong.DataBind();

    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetNhanVien();
        GetTen();
        DanhSachPhongHocHam();
        LoadGridView();
    }

    private void LoadQuocGia()
    {
        ddlquocgia.DataSource = dtsv.ExcuteTable("ns_get_allQuocGia");
        ddlquocgia.DataTextField = "TENQUOCGIA";
        ddlquocgia.DataValueField = "ID";
        ddlquocgia.DataBind();
    }
    private void LoadTrinhDo()
    {
         dtsv.LoadDropDownList(ddlTrinhDo, "ns_getAll_hocvi", "HOCVI", "ID");
    }
    protected void cbheader_CheckedChanged1(object sender, EventArgs e)
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
    protected void btnThem_Click(object sender, EventArgs e)
    {
             

        int tb = 0;// kiem tra qua trinh chen hoc vi
      
        try
        {
            SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@IDTRINHDO",ddlTrinhDo.SelectedValue),
                dtsv.CreateParameter("@CHUYENMON ",txtchuyenmon.Text),
                dtsv.CreateParameter("@COSODAOTAO",txtcsdt.Text),  
                dtsv.CreateParameter("@IDQUOCGIA",ddlquocgia.SelectedValue),        
                dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
                dtsv.CreateParameter("@NAM",txtnam.Text)
            

            };
       
                tb = dtsv.ExecuteNonQuery("ns_insert_trinhdo", param);
             
            if (tb > 0)
                Label5.Text = "Thêm Thành Công";
            else Label5.Text = "Thêm Không Thành Công";
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
        try
        {           

                SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@IDTRINHDO",ddlTrinhDo.SelectedValue),
                dtsv.CreateParameter("@CHUYENMON ",txtchuyenmon.Text),
                dtsv.CreateParameter("@COSODAOTAO",txtcsdt.Text),  
                dtsv.CreateParameter("@IDQUOCGIA",ddlquocgia.SelectedValue),
                dtsv.CreateParameter("@NAM",txtnam.Text),
                dtsv.CreateParameter("@ID",int.Parse(  Session["TrinhDo"].ToString()))
            

            };
                tb = dtsv.ExecuteNonQuery("ns_update_trinhdo", param);

            
            
        }
        catch(Exception ex)
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
    protected void lbtEdit_Click(object sender, EventArgs e)
    {
       
        Label5.Text = "";
        bntCapNhat.Visible = true;
        StatusConTrol(true, false);

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["TrinhDo"] = ID;
            //GetTen();
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_trinhdo_nv", param);

            if (dt.Rows.Count != 0)
            {

                ddlTrinhDo.SelectedValue = dt.Rows[0]["IDTRINHDO"].ToString();
                txtchuyenmon.Text = dt.Rows[0]["CHUYENMON"].ToString();
                txtcsdt.Text = dt.Rows[0]["COSODAOTAO"].ToString();
                ddlquocgia.Text = dt.Rows[0]["IDQUOCGIA"].ToString();
                txtnam.Text = dt.Rows[0]["NAM"].ToString();


            }
            else
            {
                Label5.Text = "Không Thể Edit Được";

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
                CheckBox remove = (CheckBox)GridView1.Rows[i].FindControl("cbitem");

                if (remove.Checked)
                {
                    Label lb = (Label)GridView1.Rows[i].FindControl("ID");
                    int ID = int.Parse(lb.Text);
                    SqlParameter param = new SqlParameter("@ID", ID);

                    tb = dtsv.ExecuteNonQuery("ns_del_trinhdo", param);


                }

            }
            if (tb <= 0)
            {
                Label5.Text = "Xoa Khong Thanh Cong";

            }
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }
        LoadGridView();
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
    protected void ddlNhanVien_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetTen();
        LoadGridView();

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {
            SqlParameter[] param = new SqlParameter[] { 
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDHAMDANHHIEU",ddlDanhHieu.SelectedValue),
            dtsv.CreateParameter("@NAM",txtNamPhong.Text),
            dtsv.CreateParameter("@IDQUOCGIA",ddlquocgiaphong.SelectedValue)

        };
            tb = dtsv.ExecuteNonQuery("ns_insert_hocham", param);
        }
        catch
        {
            Label7.Text = "Thêm không thành công";
        }


        if (tb > 0)
            Label7.Text = "Thêm thành công";
        else Label7.Text = "Thêm không thành công";
        DanhSachPhongHocHam();

    }


    private void DanhSachPhongHocHam()
    {
        try
        {
            SqlParameter param = new SqlParameter("@ID", ddlDonVi.SelectedValue);
            dtsv.LoadGridView(GridView2, "ns_get_hocham_ma", param);
        }
        catch
        {
            Label5.Text = "Một Lỗi Phát Sinh";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {
            SqlParameter[] param = new SqlParameter[] { 
            dtsv.CreateParameter("@IDTHONGTIN",ddlNhanVien.SelectedValue),
            dtsv.CreateParameter("@IDHAMDANHHIEU",ddlDanhHieu.SelectedValue),
            dtsv.CreateParameter("@NAM",txtNamPhong.Text),
            dtsv.CreateParameter("@IDQUOCGIA",ddlquocgia.SelectedValue),
            dtsv.CreateParameter("@ID",int.Parse( Session["SO"].ToString())),

        };
            tb = dtsv.ExecuteNonQuery("ns_update_hocham", param);
        }
        catch
        {
            Label7.Text = "Sửa Không Thành Công";
        }


        if (tb > 0)
            Label7.Text = "Sửa Thành Công";
        else Label7.Text = "Sửa Không Thành Công";
        DanhSachPhongHocHam();
    }
    protected void lbtEdit0_Click(object sender, EventArgs e)
    {

      
        try
        {
            LinkButton lbk = (LinkButton)sender;
            Label lb = (Label)lbk.Parent.FindControl("ID0");
            int ID = int.Parse(lb.Text);
            Session["SO"] = ID;

            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_phongham", param);
            int k = dt.Rows.Count;
            if (k != 0)
            {
                txtNamPhong.Text = dt.Rows[0]["NAM"].ToString();
                ddlDanhHieu.SelectedValue = dt.Rows[0]["IDHAMDANHHIEU"].ToString();
                ddlquocgia.SelectedValue = dt.Rows[0]["IDQUOCGIA"].ToString();
                ddlNhanVien.SelectedValue = dt.Rows[0]["IDTHONGTIN"].ToString();

            }
        }
        catch 
        {
            Label7.Text ="Error";
        }
        DanhSachPhongHocHam();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                CheckBox remove = (CheckBox)GridView2.Rows[i].FindControl("cbitem0");

                if (remove.Checked)
                {
                    Label lb = (Label)GridView2.Rows[i].FindControl("ID0");
                    int ID = int.Parse(lb.Text);
                    SqlParameter param = new SqlParameter("@ID", ID);

                    tb = dtsv.ExecuteNonQuery("ns_del_phma", param);


                }

            }
            if (tb > 0)
            {
                Label7.Text = "Xóa Thành Công";

            }
            else Label7.Text = "Xóa Không Thành Công";
        }
        catch 
        {
            Label7.Text ="Xóa không thành công";
        }
        DanhSachPhongHocHam();
    }
    protected void cbheader_CheckedChanged(object sender, EventArgs e)
    {

    }
}
