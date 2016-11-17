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

public partial class public_chitiet : System.Web.UI.Page
{
 
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["ID"]==null)
            Response.Redirect("~/public/Error.aspx");
        if(!IsPostBack)
        {
            LoadChuyenDe(int.Parse(Request.QueryString["ID"]));
            LoadData(int.Parse(Request.QueryString["ID"]));


        }
    }
    private void LoadData(int ID)
    {
        DataTable dt = dtsv.ExcuteDataset("BanTin_Get_TheoCBanTinID", dtsv.CreateParameter("@BanTinID", ID)).Tables[0];
        if(dt.Rows.Count!=0)
        {
            lblTieuDe.Text=dt.Rows[0]["TIEUDE"].ToString();
            lblNgayDang.Text=dt.Rows[0]["NgayNhap"].ToString();
            lblNoiDung.Text=dt.Rows[0]["NoiDung"].ToString();
            nguon.Text=dt.Rows[0]["NguonTin"].ToString();
            tacgia.Text=dt.Rows[0]["TacGia"].ToString();

        }

     
    }
    private void LoadChuyenDe(int ID)
    {
        DataSet ds = dtsv.ExcuteDataset("DMChuyenDe_get_tenchuyende", dtsv.CreateParameter("@ID", ID));
        if(ds.Tables[0].Rows.Count!=0)
        lblChuyenDe.Text = ds.Tables[0].Rows[0]["TenChuyenDe"].ToString();
 
    }
}
