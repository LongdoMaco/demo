using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DAL;
using System.Data;
using System.Globalization;

public partial class Admin_congvan_nhaptin : System.Web.UI.Page
{

    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["IDDEN"] == null)
            Response.Redirect("~/Admin/congvan/cvden.aspx");
        
        if (!IsPostBack)
        {
            Initialize();
            KhoiTaoID();
            
        }

    }

    #region Khoi tao

 
    private void Initialize()
    {
        // Ma cong van
        dtsv.LoadDropDownList(ddlMaCV, "GetAllMaCvden", "TenMacongvan", "ID");

        // Co quan ban hanh
        dtsv.LoadDropDownList(ddlCQBH, "GetAllCoquanbanhanh", "TenCoquanbanhanh", "ID");

        //Loai cong van den
        dtsv.LoadDropDownList(ddlLCV, "GetAllLoaicongvanden", "Tenloaicv", "ID");

        // Hien thi luoi


        /*
        create proc CongVanDen_get_vanthu
        as
        select A.HOVATEN,A.ID,B.DONVI
        from THONGTIN A
        inner join DONVI B on A.IDDONVI=B.ID
        inner join NSD_QUYENTRUYCAP C on A.ID=c.NguoiSuDungID
        where C.QuyenID=3


        */
     
        
        
    }
    private void KhoiTaoID()
    {
        int ID = int.Parse(Request.QueryString["IDDEN"].ToString());
        DataSet ds = dtsv.ExcuteDataset("select A.*,convert(varchar(10),ngayden,103) ngaydenngay,convert(varchar(10),ngaybanhanh,103) ngaybanhanhngay from Congvanden A where A.ID="+ID);
        if (ds.Tables[0].Rows.Count != 0)
        {
            ddlMaCV.SelectedValue = ds.Tables[0].Rows[0]["MaCV"].ToString();
            ddlCQBH.SelectedValue = ds.Tables[0].Rows[0]["MaCoquanbanhanh"].ToString();
            ddlLCV.SelectedValue = ds.Tables[0].Rows[0]["MaLoai"].ToString();
            txtNgayDen.Text = ds.Tables[0].Rows[0]["ngaydenngay"].ToString();
            txtSoKyHieu.Text = ds.Tables[0].Rows[0]["SoKyhieu"].ToString();
            txtNBH.Text = ds.Tables[0].Rows[0]["ngaybanhanhngay"].ToString();
            txtTrichYeu.Text= ds.Tables[0].Rows[0]["Trichyeunoidung"].ToString();
            txtSoLuu.Text= ds.Tables[0].Rows[0]["Soluu"].ToString();
            txtNoiNhan.Text = ds.Tables[0].Rows[0]["Noinhan"].ToString();
            txtNoiLuu.Text = ds.Tables[0].Rows[0]["Noiluu"].ToString();
                 
 
        }
    }

    #endregion


    #region Xu li su kien
  

    #endregion 
  
    protected void btnGoiCV_Click(object sender, EventArgs e)
    {

        int tb = 0;
        try
        {
            string tenfilethat = "";
            string dd = Server.MapPath("~/Files/congvan/congvanden/");
            int kiemtra=0;
            if (FileUpload1.HasFile)
            {
                tenfilethat = Guid.NewGuid().ToString() + "." + FileUpload1.PostedFile.FileName.Split('.')[1];
                dd += "/" + tenfilethat;
                FileUpload1.PostedFile.SaveAs(dd);
                kiemtra=1;
            }

            SqlParameter[] param = new SqlParameter[] {
                dtsv.CreateParameter("@Macvden",ddlMaCV.SelectedValue),
                dtsv.CreateParameter("@coquan_ID",ddlCQBH.SelectedValue),
                dtsv.CreateParameter("@loaicv_ID",ddlLCV.SelectedValue),
                dtsv.CreateParameter("@Ngayden",DateTime.ParseExact(txtNgayDen.Text,"dd/MM/yyyy",CultureInfo.InvariantCulture)),
                dtsv.CreateParameter("@Ngaybanhanh",DateTime.ParseExact(txtNBH.Text,"dd/MM/yyyy",CultureInfo.InvariantCulture)),
                dtsv.CreateParameter("@Sokyhieu",txtSoKyHieu.Text),
                dtsv.CreateParameter("@Soluu",txtSoLuu.Text),
                dtsv.CreateParameter("@Noinhan",txtNoiNhan.Text),
                dtsv.CreateParameter("@Noiluu",txtNoiLuu.Text),
                dtsv.CreateParameter("@Fileupload",tenfilethat),
                dtsv.CreateParameter("@Trichyeunoidung",txtTrichYeu.Text),
                dtsv.CreateParameter("@ID",int.Parse(Request.QueryString["IDDEN"].ToString())),
                dtsv.CreateParameter("@Kiemtra",kiemtra)
            
            };

            tb = dtsv.ExecuteNonQuery("Update_Congvanden", param);
            if (tb!=0) lblThongBao.Text = "Thành công";

            
           
        }
        catch
        {
            lblThongBao.Text = "Không thành công";
        }
    }

   
}

