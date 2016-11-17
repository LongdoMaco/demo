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
public partial class Admin_NhanSus_ThongKeNS : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    private static float tong;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["nguoisudung_ID"] == null)
            Response.Redirect("~/DangNhap.aspx");
        string url = HttpContext.Current.Request.Url.AbsoluteUri;
        string[] MangTach = url.Split('/');
        if (!PhanQuyen.KiemTra(MangTach[MangTach.Length - 2].ToString(), int.Parse(Session["nguoisudung_ID"].ToString())))
        {
            Response.Redirect("~/public/UnauthorizedAccess.aspx");
        }

        if (!IsPostBack)
        {

            TK_TongSo();
            TK_DoanThe();
        }
    }
    private void TK_TongSo()
    {
        DataTable dt = dtsv.ExcuteTable("ThongKeHocVi");
       
        if (dt.Rows.Count != 0)
       {
           lblTongNV.Text = dt.Rows[0]["Tong"].ToString();
           tong = float.Parse(lblTongNV.Text);

           lblNam.Text = dt.Rows[0]["Nam"].ToString();
           lbltlnam.Text = ((float.Parse(lblNam.Text)) * 100 / tong).ToString("00.00");
           lblNu.Text = dt.Rows[0]["Nu"].ToString();

           lbltlnu.Text = ((float.Parse(lblNu.Text)) * 100 / tong).ToString("00.00");
           lblhgs.Text = dt.Rows[0]["HOCHAMGS"].ToString();
           tlhamgs.Text = ((float.Parse(lblhgs.Text)) * 100 / tong).ToString();

           lbltrogiang.Text = dt.Rows[0]["TroGiang"].ToString();
           tltg.Text = ((float.Parse(lbltrogiang.Text)) * 100 / tong).ToString("00.00");

           lblgvcc.Text = dt.Rows[0]["GVCaoCap"].ToString();
           tlgvcc.Text = ((float.Parse(lblgvcc.Text)) * 100 / tong).ToString("00.00");


           lblgvc.Text = dt.Rows[0]["GiaoVienChinh"].ToString();
           tlgvc.Text = ((float.Parse(lblgvc.Text)) * 100 / tong).ToString("00.00");


           lbltiensi.Text = dt.Rows[0]["TS"].ToString();
           tlts.Text = ((float.Parse(lbltiensi.Text)) * 100 / tong).ToString("00.00");


           lblthacsi.Text = dt.Rows[0]["ThacSi"].ToString();
           tlths.Text = ((float.Parse(lblthacsi.Text)) * 100 / tong).ToString("00.00");

           lblDaiHoc.Text = dt.Rows[0]["DaiHoc"].ToString();
           tldh.Text = ((float.Parse(lblDaiHoc.Text)) * 100 / tong).ToString("00.00");


           lblCaoDang.Text = dt.Rows[0]["CaoDang"].ToString();
           tlcd.Text = ((float.Parse(lblCaoDang.Text)) * 100 / tong).ToString("00.00");

           lbltrungcapcn.Text = dt.Rows[0]["TrungCap"].ToString();
           tltccn.Text = ((float.Parse(lbltrungcapcn.Text)) * 100 / tong).ToString("00.00");


           lblTDK.Text = dt.Rows[0]["TDK"].ToString();
           tlkhac.Text = ((float.Parse(lblTDK.Text)) * 100 / tong).ToString("00.00");

       }
        
    }
    private void TK_DoanThe()
    {
        DataTable dt = dtsv.ExcuteTable("tk_doanthe");

        if (dt.Rows.Count != 0)
        {

            lblTongdangvien.Text = dt.Rows[0]["Tong"].ToString();
            lbltldv.Text = ((float.Parse(lblTongdangvien.Text)) * 100 / tong).ToString("00.00");

            lblnamdv.Text = dt.Rows[0]["Nam"].ToString();
            lblnudv.Text = dt.Rows[0]["Nu"].ToString();
            
        }
    }

}
