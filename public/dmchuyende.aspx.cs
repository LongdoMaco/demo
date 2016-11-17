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
using PublicTableAdapters;

public partial class public_dmchuyende : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    DMChuyenDeTableAdapter db = new DMChuyenDeTableAdapter();
    BanTinTableAdapter db1 = new BanTinTableAdapter();

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["IDCD"] == "")
            Response.Redirect("~/public/Error.aspx");
        if (!IsPostBack)
        {
            LoadData(int.Parse(Request.QueryString["IDCD"].ToString()));
            LoadTenChuyenDe(int.Parse(Request.QueryString["IDCD"].ToString()));
        }
    }
    private void LoadData(int ChuyenDeID)
    {
        CollectionPager1.PageSize = 3; // số items hiển thị trên một trang
        CollectionPager1.DataSource = dtsv.ExcuteDataset("BanTin_Get_TheoChuyenDe", dtsv.CreateParameter("@IDChuyenDe", ChuyenDeID)).Tables[0].DefaultView;
        CollectionPager1.BindToControl = DataList1;
        DataList1.DataSource = CollectionPager1.DataSourcePaged;



        
    }
    private void LoadTenChuyenDe(int ChuyenDeID)
    {
       DataTable dt=dtsv.ExcuteDataset("DMCHUYENDE_GetTen_IDCHUYENDE", dtsv.CreateParameter("@IDCHUUYENDE", ChuyenDeID)).Tables[0];
       if (dt.Rows.Count != 0)
           Label1.Text = dt.Rows[0]["TenChuyenDe"].ToString();

      
    }

}
