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
using System.Data.SqlClient;

public partial class Admin_bonhiem_themphieubonhiem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataServices dtsv = new DataServices();
        int tb = 0;
        tb = dtsv.ExecuteNonQuery("tblphieubonhiem_set", dtsv.CreateParameter("@PHIEU", txtthem.Text));
        if (tb==0)
            lblthongbao.Text = "Không thành công";
        else lblthongbao.Text = "Thành công";
        GridView1.DataBind();
    }
}
