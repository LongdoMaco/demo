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

public partial class public_detaikhoahoc : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDMDeTai();
            LoadNam();
            LoadDanhSach();
        }
    }
    // khoi tao ma de tai
    private void LoadDMDeTai()
    {
        ddlDmdetai.DataSource = dtsv.ExcuteDataset("KH_CAPDETAI_getall").Tables[0].DefaultView;
        ddlDmdetai.DataTextField = "CAPDETAI";
        ddlDmdetai.DataValueField = "ID";
        ddlDmdetai.DataBind();
    }
    // Khoi tao nam
    private void LoadNam()
    {
    
        ddlNam.DataSource = dtsv.ExcuteDataset("KH_THUYETMINH_GETNAM",dtsv.CreateParameter("@IDCAPDEAI",ddlDmdetai.SelectedValue)).Tables[0].DefaultView;
        ddlNam.DataTextField = "Nam";
        ddlNam.DataValueField = "Nam";
        ddlNam.DataBind();
    }
    // Load Danh Dach Ma De Tai
    private void LoadDanhSach()
    {
        SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@IDCapDeTai",ddlDmdetai.SelectedValue),
            dtsv.CreateParameter("@Nam",ddlNam.SelectedValue)
        };
        DataList1.DataSource=dtsv.ExcuteDataset("KH_THUYETMINH_DMDETAI",param);
        DataList1.DataBind();
        
    }
    protected void ddlDmdetai_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadNam();
        LoadDanhSach();
    }
    protected void ddlNam_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadDanhSach();
    }
}
