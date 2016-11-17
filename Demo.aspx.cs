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

public partial class Demo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadNgayThang();
    }
    private void LoadNgayThang()
    {
        // Tao ra ngay

        ArrayList ngay = new ArrayList();
        for (int i = 1; i <= 31; i++)
            ngay.Add(i);
        ddlNgay.DataSource = ngay;
        ddlNgay.DataBind();

        //Tao ra thang
        ArrayList thang = new ArrayList();
        for (int i = 1; i <= 12; i++)
            thang.Add(i);
        ddlThang.DataSource = thang;
        ddlThang.DataBind();

        // Tao ra nam

        ArrayList nam = new ArrayList();
        for (int i = 1900; i <= 2011; i++)
            nam.Add(i);
        ddlNam.DataSource = nam;
        ddlNam.DataBind();

    }
}
