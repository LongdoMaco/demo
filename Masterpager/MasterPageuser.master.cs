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
using DAL;

public partial class user_MasterPage : System.Web.UI.MasterPage
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        int ID = int.Parse(Session["nguoisudung_ID"].ToString());
        if (!IsPostBack)
        {
            Label1.Text = GetName_Ma(ID);
        }

    }
    private string GetName_Ma(int ID)
    {
        return dtsv.ExcuteScalary("usert_getuser_ma", dtsv.CreateParameter("@ID", ID)).ToString();

    }
   
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("~/DangNhap.aspx");

    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Session.RemoveAll();
      
        Response.Redirect("~/DangNhap.aspx");
    }
}
