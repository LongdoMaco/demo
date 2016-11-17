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

public partial class Admin_quanlyuser_phanquyentruycap : System.Web.UI.Page
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
        if (Request.QueryString["Ma"] == null)
            Response.Redirect("~/public/UnauthorizedAccess.aspx", true);
       
        if (!IsPostBack)
        {
            //if (!CheckAdmin( int.Parse(Request.QueryString["Ma"].ToString())))
            //{
            //    try
            //    {
            //        NSD_Module_setadmin(int.Parse(Request.QueryString["Ma"].ToString()));
            //    }
            //    catch 
            //    {
            //        lblthongbao.Text = "Hệ thống đang bảo trì";
            //    }
            //}
            LoadDanhSachQuyen();
            LoadGridView(int.Parse(Request.QueryString["Ma"].ToString()));
            lblthongbao.Text = "";
        }

    }
    // Hien thi tat ca thuc muc ma nguoi dungid co duoc
    private void LoadGridView(int nguoisudngID)
    {
        DataTable dt = dtsv.ExcuteDataset("NSD_QuyenTruyCap_TheoID", dtsv.CreateParameter("@ID", nguoisudngID)).Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    // Kiem tra co quyen admin chua
    //public bool CheckAdmin(int NguoiSuDungID)
    //{
    //    SqlParameter[] param = new SqlParameter[]
    //   {
    //       dtsv.CreateParameter("@check",0),
    //       dtsv.CreateParameter("@nguoisudung",NguoiSuDungID)
    //   };
    //    param[0].Direction=ParameterDirection.Output;
    //    DataTable dt = dtsv.ExcuteTable("NSD_Module_checkadmin", param);
    //    if(param[0].Value.ToString()!="0")
    //    {
    //       return true;
    //    }
    //    return false;
    //}


    // Ham set quyen vao thu muc admin
    //public void NSD_Module_setadmin(int ID)
    //{
    //    int tb = 0;
    //    tb=dtsv.ExecuteNonQuery("NSD_Module_setadmin", dtsv.CreateParameter("@NguoiSuDung", ID));
    //    if (tb==0)
    //    {
    //        lblthongbao.Text = " không thành  công";
    //        return;
    //    }
    //    lblthongbao.Text = "Thành công";
    //    LoadGridView(ID);

        
    //}


    // Them Moi Thu Muc
    protected void Button2_Click(object sender, EventArgs e)
    {
        lblthongbao.Text = "";
        int tb = 0;
        SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@nguoisudungid", int.Parse(Request.QueryString["Ma"].ToString())),
            dtsv.CreateParameter("@QUYENID",ddlquyen.SelectedValue)

        };
        try
        {
            tb = dtsv.ExecuteNonQuery("NSD_QuyenTruyCap_setmquyen", param);
        }
        catch
        {
            lblthongbao.Text = "Error";
        }
        if (tb<=0)
            lblthongbao.Text = " không thành  công";
        else lblthongbao.Text = "Thành công";
        LoadGridView(int.Parse(Request.QueryString["Ma"].ToString()));
    }
    private void LoadDanhSachQuyen()
    {
        dtsv.LoadDropDownList(ddlquyen,"QuyenTruyCap_get_all","Tenquyen","id");
 
    }
    protected void bltxoa_Click(object sender, EventArgs e)
    {
        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");
        int ID = int.Parse(lbl.Text);
        try
        {
            dtsv.ExecuteNonQuery("NSD_QuyenTruyCap_delete_ID", dtsv.CreateParameter("@ID", ID));
        }
        catch
        {
            lblthongbao.Text = "Không thành công";
        }
        LoadGridView(int.Parse(Request.QueryString["Ma"].ToString()));
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
  
}
