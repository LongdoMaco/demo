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


namespace UNI.PUBLIC
{
    public partial class public_Default : System.Web.UI.Page
    {
 
        DataServices dtsv = new DataServices();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //LoadDataList1();
            //LoadInnerDataList();
            if (!IsPostBack)
            {
                LoadFeaturedright();
                LoadFeaturedLeft();
                LoadDataList2();
                LoadInnerDataList();
               
            }

            //LoadDati();
            
            
        }
        private void LoadFeaturedright()
        {
            DataList1.DataSource = dtsv.ExcuteDataset("BanTin_get_feteared_right").Tables[0];
            DataList1.DataBind();
        }
        private void LoadFeaturedLeft()
        {
            FormView1.DataSource = dtsv.ExcuteDataset("BanTin_get_feteared_left").Tables[0];
            FormView1.DataBind();
           
        }

        public void LoadDataList2()
        {

            DataList2.DataSource = dtsv.ExcuteDataset("BanTin_get_chuyende").Tables[0];//db1.GetChuyenDe();
            DataList2.DataBind();
          


        }
        private void LoadInnerDataList()
        {
            for (int i = 0; i < DataList2.Items.Count; i++)
            {
                HyperLink hyp = (HyperLink)DataList2.Items[i].FindControl("ChuyenMuc");
                DataSet ds = dtsv.ExcuteDataset("BanTin_GetTop_TenChuyenDe", dtsv.CreateParameter("@NameChuyenDe", hyp.Text));
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Image image = (Image)DataList2.Items[i].FindControl("HinhAnh");
                    image.ImageUrl = "~/Image/imagetintuc/" + ds.Tables[0].Rows[0]["HinhAnh"].ToString();

                    HyperLink tieudemoi = (HyperLink)DataList2.Items[i].FindControl("TieuDeMoi");
                    tieudemoi.Text = ds.Tables[0].Rows[0]["TIEUDE"].ToString();
                   // tieudemoi.ForeColor = System.Drawing.Color.Red;
                    tieudemoi.NavigateUrl="~/public/chitiet.aspx?ID=" + ds.Tables[0].Rows[0]["BanTinID"];
                   

                    Label tomtatmoi = (Label)DataList2.Items[i].FindControl("TomTatMoi");
                    tomtatmoi.Text = ds.Tables[0].Rows[0]["TrichDan"].ToString();
                    if (tomtatmoi.Text.Length > 200)
                        tomtatmoi.Text = tomtatmoi.Text.Substring(0, 200);
                   

                    DataList dtl = (DataList)DataList2.Items[i].FindControl("BaiLienQuan");
                    dtl.DataSource = dtsv.ExcuteDataset("BanTin_GetTop5_TenChuyenDe", dtsv.CreateParameter("@NameChuyenDe", hyp.Text)).Tables[0];
                    dtl.DataBind();


                }


            }


        }

        protected void BaiLienQuan_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void FormView1_DataBound(object sender, EventArgs e)
        {
            
        }
}
}