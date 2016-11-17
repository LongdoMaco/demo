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

public partial class Admin_nhansu_in_kt_tt : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            InitData();
        }

    }
    private void InitData()
    {
        LoadHinhThuc();
        DuocTang();
        NamHoc();
        LoadThongBao();
      
        GetAllDonVi();
        
        LoadGridView();
    
       
        btnCapNhat.Visible = false;
    }
    // loadhinh thuc
    private void LoadGridView()
    {
        SqlParameter[] param=new  SqlParameter[]
        {
            dtsv.CreateParameter("@IDDUOCTANG",dlduoctang.SelectedValue),
            dtsv.CreateParameter("@IDNAM",dlnamhoc.SelectedValue)
        };
        dtsv.LoadGridView(GridView1, "ns_get_tt_kt", param);
    }
    private void LoadHinhThuc()
    {
        dtsv.LoadDropDownList(dlhinhthuc, "ns_getAll_hinhthuc", "HINHTHUC", "ID");

    }
    // Load Duoc Tang
    private void DuocTang()
    {
        SqlParameter param = new SqlParameter("@HINHTHUC_ID", dlhinhthuc.SelectedValue);
        dtsv.LoadDropDownList(dlduoctang, "ns_Get_kt_theohinhthuc", "DUOCTANG", "ID", param);
    }
    // load nam hoc
    private void NamHoc()
    {
        dtsv.LoadDropDownList(dlnamhoc, "ns_getAll_NamHoc", "NAMHOC", "ID");
    }


    protected void dlhinhthuc_SelectedIndexChanged(object sender, EventArgs e)
    {
        DuocTang();
        LoadGridView();
        LoadThongBao();

        StatusConTrol(true, true);

    }

    protected void dlnamhoc_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadGridView();
        LoadThongBao();


        StatusConTrol(true, true);
    }
    private void LoadThongBao()
    {
        SqlParameter parma1 = new SqlParameter("@IDNAMHOC", dlnamhoc.SelectedValue);
        lblnamhoc.Text = dtsv.ExcuteScalary("get_tennamhoc", parma1).ToString();
        SqlParameter parma2 = new SqlParameter("@IDDUONGTANG", dlduoctang.SelectedValue);
       
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
    protected void dlduoctang_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadThongBao();
        LoadGridView();
        StatusConTrol(true, true);

    }
    protected void lbtEdit_Click(object sender, EventArgs e)
    {
      
        
        StatusConTrol(true, false);       
        
        btnCapNhat.Visible = true;
      
        
        // ShowControl();

        try
        {
            LinkButton lbt = (LinkButton)sender;
            Label lbl = (Label)lbt.Parent.FindControl("ID");
            int ID = int.Parse(lbl.Text);
            Session["KTTT"] = ID;
            SqlParameter param = new SqlParameter("@ID", ID);
            DataTable dt = dtsv.ExcuteTable("ns_get_all_kt_tt", param);
            if (dt.Rows.Count != 0)
            {
                dlhinhthuc.SelectedValue = dt.Rows[0]["IDHINHTHUC"].ToString();
                dlduoctang.SelectedValue = dt.Rows[0]["IDDUOCTANG"].ToString();
                dlnamhoc.SelectedValue = dt.Rows[0]["IDNAM"].ToString();
                txtnoidung.Text = dt.Rows[0]["NOIDUNG"].ToString();
                txtngayki.Text = dt.Rows[0]["NGAYKY"].ToString();
                txtNguoiKi.Text = dt.Rows[0]["NGUOIKY"].ToString();
                txtQD.Text = dt.Rows[0]["QUYETDINHSO"].ToString();
               
            }
        }
        catch 
        {
            Label5.Text ="Error";
        }
        dlduoctang.AutoPostBack = false;
        dlnamhoc.AutoPostBack = false;
    }
    protected void btnCapNhat_Click(object sender, EventArgs e)
    {
        // Cap nhat
        int tb = 0;
        try
        {


                SqlParameter[] param = new SqlParameter[]
                {
                    dtsv.CreateParameter("@ID",int.Parse(Session["KTTT"].ToString())),
                    dtsv.CreateParameter("@IDDUOCTANG",dlduoctang.SelectedValue),
                    dtsv.CreateParameter("@IDNAM",dlnamhoc.SelectedValue),
                    dtsv.CreateParameter("@NOIDUNG",txtnoidung.Text),
                    dtsv.CreateParameter("@QUYETDINHSO",txtQD.Text),
                    dtsv.CreateParameter("@NGAYKY",txtngayki.Text),
                    dtsv.CreateParameter("@NGUOIKY",txtNguoiKi.Text),
                    //dtsv.CreateParameter(""
                };
                tb = dtsv.ExecuteNonQuery("ns_update_kt_tt", param);

            
          


        }
        catch (Exception ex)
        {

            Label5.Text = ex.Message;
        }
        if (tb > 0)
            Label5.Text = "Cập Nhật Thành Công";
        else Label5.Text = "Cập Nhật Không Thành Công";
        LoadGridView();
        dlduoctang.AutoPostBack = true;
        dlnamhoc.AutoPostBack = true;


    }
    protected void btnTaoMoi_Click(object sender, EventArgs e)
    {

        int tb = 0;
        try
        {
            SqlParameter[] param = new SqlParameter[]
                {
                   // dtsv.CreateParameter("@ID",ddlDonVi.SelectedValue),
                    dtsv.CreateParameter("@IDDUOCTANG",dlduoctang.SelectedValue),
                    dtsv.CreateParameter("@IDNAM",dlnamhoc.SelectedValue),
                    dtsv.CreateParameter("@NOIDUNG",txtnoidung.Text),
                    dtsv.CreateParameter("@QUYETDINHSO",txtQD.Text),
                    dtsv.CreateParameter("@NGAYKY",txtngayki.Text),
                    dtsv.CreateParameter("@NGUOIKY",txtNguoiKi.Text),
                    dtsv.CreateParameter("@IDDONVI",ddlDonVi.SelectedValue),
                    //dtsv.CreateParameter(""
                };
            tb = dtsv.ExecuteNonQuery("ns_insert_kt_tt", param);
        }

        catch
        {
            Label5.Text = "Thêm Không Thành Công";
        }
        if (tb > 0)
                Label5.Text = "Thêm Thành Công";
            else Label5.Text = "Thêm Không Thành Công";
        LoadGridView();

        
        
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
    public void GetAllDonVi()
    {
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();
        if (ddlDonVi.Items.Count < 0)
            Label5.Text = "Chưa có đơn vị nào cả";



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

                    tb = dtsv.ExecuteNonQuery("ns_del_kt_tt", param);


                }

            }
            if (tb > 0)
                Label5.Text = "Xoá Thành Công";
            else Label5.Text = "Xóa Không Thành Công";
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }
        LoadGridView();
    }
    protected void txtnoidung_TextChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadGridView();
        
    }
    protected void ddlDonVi_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadGridView();
    }
}
