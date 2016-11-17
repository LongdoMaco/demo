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

public partial class public_chitiettapchi : System.Web.UI.Page
{
    DataSet ds=new DataSet ();
    DAL.DataServices dtsv = new DAL.DataServices();
    private static string filename="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["MaSo"] == null)
            Response.Redirect("~/public/tapchi.aspx");
        if (!IsPostBack)
        {
            loadnoidung();
        }
    }
    private void loadnoidung()
    {
        ds = dtsv.ExcuteDataset("GiaoTrinh_Get_all_public_ID",dtsv.CreateParameter("@ID",int.Parse(Request.QueryString["MaSo"].ToString())));
        if(ds.Tables[0].Rows.Count!=0)
        {
            txttitle.Text = ds.Tables[0].Rows[0]["TIEUDE"].ToString();
            lblnguoidang.Text = ds.Tables[0].Rows[0]["HOVATEN"].ToString();
            lblngaydang.Text = ds.Tables[0].Rows[0]["NGAYDANG"].ToString();
            lbllinhvuc.Text = ds.Tables[0].Rows[0]["LOAI"].ToString();
            lbltrichdan.Text = ds.Tables[0].Rows[0]["TOMTAT"].ToString();
            lblnoidung.Text = ds.Tables[0].Rows[0]["NOIDUNG"].ToString();
            hinhanh.ImageUrl = "~/Image/imagegiaotrinh/"+ds.Tables[0].Rows[0]["HINHANH"].ToString();
            filename = ds.Tables[0].Rows[0]["TENFILE"].ToString();
            
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (filename == "")
            return;
        Response.Redirect("~/Files/giaotrinh/"+filename);
    }
}
