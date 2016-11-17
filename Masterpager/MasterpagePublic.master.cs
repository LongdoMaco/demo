using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.SqlClient;
using DAL;

public partial class Masterpager_MasterpagePublic : System.Web.UI.MasterPage
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadThongBao();
            LoadTapChi();
            Loadgiaotrinh();
        }
    }
    private void LoadThongBao()
    {
        GridView1.DataSource = dtsv.ExcuteDataset("BanTin_Get_ThongBao").Tables[0].DefaultView;
        GridView1.DataBind();
    }
    private void LoadTapChi()
    {
        GridView2.DataSource = dtsv.ExcuteDataset("TapChi_Get_Top").Tables[0].DefaultView;
        GridView2.DataBind();
 
    }
      private void Loadgiaotrinh()
    {
        GridView3.DataSource = dtsv.ExcuteDataset("giaotrinh_Get_Top").Tables[0].DefaultView;
        GridView3.DataBind();
 
    }
   
}
