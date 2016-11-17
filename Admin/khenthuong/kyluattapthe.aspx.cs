using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DAL;
using System.Data;

public partial class Admin_khenthuong_kiluattapthe : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GetAllDonVi();
            getNamHoc();
            GetHinhThuc();
            LoadGridView();
        }

    }
    #region khoi tao
    // don vi
    public void GetAllDonVi()
    {
        ddlDonVi.DataSource = dtsv.ExcuteTable("ns_getAll_donvi");
        ddlDonVi.DataTextField = "DONVI";
        ddlDonVi.DataValueField = "ID";
        ddlDonVi.DataBind();       
          

    }
    // hinh thuc ki luat
    private void GetHinhThuc()
    {
        dtsv.LoadDropDownList(ddlhinhthuckl, "ns_get_htkl", "HINHTHUC", "ID");

    }
    // Load GridView
    private void LoadGridView()
    {
        dtsv.LoadGridView(GridView1, "KILUATTAP_getall", dtsv.CreateParameter("@IDNAM", ddlnamhockl.SelectedValue));

    }
    // load Nam
    private void getNamHoc()
    {
        dtsv.LoadDropDownList(ddlnamhockl, "ns_getAll_namhoc", "NAMHOC", "ID");
    }

   
    #endregion

    //su kiem them moi 
    protected void btnThem_Click(object sender, EventArgs e)
    {
        int tb = 0;
        SqlParameter[] param = new SqlParameter[] { 
        
        dtsv.CreateParameter("@DONVIKILUAT",txtkiluat.Text),
        dtsv.CreateParameter("@IDDONVI",ddlDonVi.SelectedValue),
        dtsv.CreateParameter("@IDHINHTHUC",ddlhinhthuckl.SelectedValue),
        dtsv.CreateParameter("@IDNAM",ddlnamhockl.SelectedValue),
        dtsv.CreateParameter("@LIDO ",txtlido.Text)
        
        };
        try
        {
            tb = dtsv.ExecuteNonQuery("KL_TAPTHE_SET", param);
            if (tb <= 0)
                lblthongbao.Text = "Không thành công !";
            else lblthongbao.Text = "Thành công!";

        }
        catch 
        {

            lblthongbao.Text = "Thành công!";
        }
        LoadGridView();
               

    }
    protected void btnCapNhat_Click(object sender, EventArgs e)
    {
        int tb = 0;
        SqlParameter[] param = new SqlParameter[] { 
        
        dtsv.CreateParameter("@DONVIKILUAT",txtkiluat.Text),
        dtsv.CreateParameter("@IDDONVI",ddlDonVi.SelectedValue),
        dtsv.CreateParameter("@IDHINHTHUC",ddlhinhthuckl.SelectedValue),
        dtsv.CreateParameter("@ID",int.Parse(Session["KL_TAPTHE"].ToString())),
        dtsv.CreateParameter("@IDNAM",ddlnamhockl.SelectedValue),
        dtsv.CreateParameter("@LIDO ",txtlido.Text)
        
        };
        try
        {
            tb = dtsv.ExecuteNonQuery("KL_TAPTHE_UPDATE", param);
            if (tb <= 0)
                lblthongbao.Text = "Không thành công !";
            else lblthongbao.Text = "Thành công!";

        }
        catch
        {

            lblthongbao.Text = "Thành công!";
        }
        LoadGridView();
    }
    // thuc hien chon
    protected void lblxem_Click(object sender, EventArgs e)
    {
            

        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        Session["KL_TAPTHE"] = Convert.ToInt32(lbl.Text);
        SqlParameter param = new SqlParameter("@ID", int.Parse(lbl.Text));
        DataTable temp = dtsv.ExcuteTable("KL_TAPTHE_SELECT", param);
        if (temp.Rows.Count != 0)
        {
            ddlDonVi.SelectedValue = temp.Rows[0]["IDDONVI"].ToString();
            txtkiluat.Text = temp.Rows[0]["DONVIKILUAT"].ToString();
            ddlnamhockl.SelectedValue = temp.Rows[0]["IDNAM"].ToString();
            ddlhinhthuckl.SelectedValue = temp.Rows[0]["IDHINHTHUC"].ToString();
            txtlido.Text = temp.Rows[0]["LIDO"].ToString();       
        }
    }
    protected void lblXóa_Click(object sender, EventArgs e)
    {
        int tb = 0;
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        SqlParameter param = new SqlParameter("@ID", int.Parse(lbl.Text));
        try
        {
            tb = dtsv.ExecuteNonQuery("KL_TAPTHE_DEL", param);
            if (tb <= 0)
                lblthongbao.Text = "Không thành công";
            else lblthongbao.Text = "Thành công";
            
        }
        catch 
        {

            lblthongbao.Text = "Không thành công";
        }
        LoadGridView();
    }
    protected void ddlnamhockl_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadGridView();
    }
}
