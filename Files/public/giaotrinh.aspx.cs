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
using DAL;

public partial class public_giaotrinh : System.Web.UI.Page
{

    DAL.DataServices dtsv = new DAL.DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadDataList();
        }

    }
    private void LoadDataList()
    {
        DataSet ds = dtsv.ExcuteDataset("[GiaoTrinh_Get_all_public]");
        CollectionPager1.PageSize = 20; // số items hiển thị trên một trang
        CollectionPager1.DataSource = ds.Tables[0].DefaultView;
        CollectionPager1.BindToControl = DataList1;
        DataList1.DataSource = CollectionPager1.DataSourcePaged;
    }
}
