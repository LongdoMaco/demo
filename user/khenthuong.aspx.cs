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
public partial class user_khenthuong : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/Dangnhap.aspx");
        if (!IsPostBack)
        {
            LoadGridview();
 
        }

    }
    private void LoadGridview()
    {
        dtsv.LoadGridView(GridView1, "KT_CANHAN_Get_user",dtsv.CreateParameter("@nguoisudungid",int.Parse(Session["nguoisudung_ID"].ToString())));
 
    }
}
