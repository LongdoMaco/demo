using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;

public partial class Admin_congvan_chitietcvden : System.Web.UI.Page
{
  
    DataSet temp;
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["IDDEN"] == null)
            Response.Redirect("~/cvden.aspx");
        if (!IsPostBack)
        {
            BindData(int.Parse(Request.QueryString["IDDEN"].ToString()));
 
        }

    }

    private void BindData(int ID)
    {

      
        temp = dtsv.ExcuteDataset("GetCongvanTheoID", dtsv.CreateParameter("@Congvan_ID", ID));
        if (temp.Tables[0].Rows.Count != 0)
        {
            //for (int i = 0; i < temp.Tables[0].Rows.Count; i++)
            //    {
            DataList datalist1 = new DataList();
            lblMaCV.Text = temp.Tables[0].Rows[0]["TenMaCongvan"].ToString();
            lblNgayden.Text = temp.Tables[0].Rows[0]["denngay"].ToString();
            lblSoKyhieu.Text = temp.Tables[0].Rows[0]["SoKyhieu"].ToString();
            lblLoai.Text = temp.Tables[0].Rows[0]["Tenloaicv"].ToString();
            lblCoquan.Text = temp.Tables[0].Rows[0]["TenCoquanbanhanh"].ToString();
            lblNgaybanhanh.Text = temp.Tables[0].Rows[0]["banhanhngay"].ToString();
            lblTrichyeu.Text = temp.Tables[0].Rows[0]["Trichyeunoidung"].ToString();
            lblSoluu.Text = temp.Tables[0].Rows[0]["Soluu"].ToString();
            lblNoinhan.Text = temp.Tables[0].Rows[0]["Noinhan"].ToString();
            //lblNoiluu.Text = temp.Tables[0].Rows[0]["Noiluu"].ToString();
            //linkFileupload.Text = temp.Tables[0].Rows[0]["Fileupload"].ToString();
            //HyperLink noidung = new HyperLink();
            //noidung.Text = temp.Tables[0].Rows[0]["Fileupload"].ToString();
            Session["oldfileupload"] = temp.Tables[0].Rows[0]["Fileupload"].ToString();
            //    Session["userID"]= temp.Tables[0].Rows[0]["NguoiSuDungID"].ToString();            
            if (!Session["oldfileupload"].ToString().Equals(""))
            {
                //Image1.Visible = true;               
                HyperLink5.Text = "Nội dung file - Click để tải về ";
                HyperLink5.NavigateUrl = @"~\Files\Congvan\congvanden\" + temp.Tables[0].Rows[0]["Fileupload"].ToString();
                //filename.Value = @"congvanden\congvanden\"+Session["oldfileupload"].ToString();
                //    Label28.Visible = false;
            }
            else
            {
               
                HyperLink5.Text = "";
                HyperLink5.Visible = false;
                //   Label28.Visible = true;
                //   CheckBox3.Visible = false;
            }
            //HyperLink1.NavigateUrl = @"../Congvanden/Congvanden/" + temp.Tables[0].Rows[0]["Fileupload"].ToString();
            lblNgaynhap.Text = "Ngày nhập: " + "(" + temp.Tables[0].Rows[0]["Ngaynhap"].ToString() + ")";
        }

        //}
        else
            Label11.Text = "BẠN HÃY QUAN LẠI TRANG TRƯỚC ĐỂ CHỌN NỘI DUNG";
        //HyperLink1.NavigateUrl = @"";
        //HyperLink1.Text = "Về trang trước"

    }
}
