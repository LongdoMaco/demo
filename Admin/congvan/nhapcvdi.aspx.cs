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

public partial class Admin_congvan_Nhapcvdi : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Initialize(); 
        }

    }


    #region Khoi tao

 
    private void Initialize()
    {
        // Ma cong van
       
        dtsv.FillDropDownListSQL(ddlMaCV, "select * from MaCongvandi", "MaCongvandi","ID");  
     
        // Bo phan soan thao
        dtsv.FillDropDownListSQL(ddlCQBH, "select * from BophanSoanthao", "TenBophan", "MaBophan");


        //Loai cong van den
        dtsv.FillDropDownListSQL(ddlLCV, "select * from Loaicongvandi", "Tenloai", "Maloai");

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
        dtsv.LoadGridView(GridView1, "CongVanDen_get_vanthu");
        
        
    }

    #endregion


    #region Xu li su kien
  

    #endregion 
    protected void cbheader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox checkhead = (CheckBox)GridView1.HeaderRow.FindControl("cbheader");
        if (checkhead.Checked)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                item.Checked = true;

            }
        }
        else
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox item = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                item.Checked = false;

            }
        }
    }
    protected void btnGoiCV_Click(object sender, EventArgs e)
    {

        int tb = 0;
        try
        {
            string tenfilethat = "";
            string dd = Server.MapPath("~/Files/congvan/congvandi/");
            if (FileUpload1.HasFile)
            {
                tenfilethat = Guid.NewGuid().ToString() + "." + FileUpload1.PostedFile.FileName.Split('.')[1];
                dd += "/" + tenfilethat;
                FileUpload1.PostedFile.SaveAs(dd);
            }

            SqlParameter[] param = new SqlParameter[] {
                dtsv.CreateParameter("@Macvdi",ddlMaCV.SelectedValue),
                dtsv.CreateParameter("@soanthao_ID",ddlCQBH.SelectedValue),
                dtsv.CreateParameter("@loaicv_ID",ddlLCV.SelectedValue),
                dtsv.CreateParameter("@Ngaydi",DateTime.ParseExact(txtNgayDen.Text,"dd/MM/yyyy",CultureInfo.InvariantCulture)),
                dtsv.CreateParameter("@Ngaybanhanh",DateTime.ParseExact(txtNBH.Text,"dd/MM/yyyy",CultureInfo.InvariantCulture)),
                dtsv.CreateParameter("@Sokyhieu",txtSoKyHieu.Text),
                dtsv.CreateParameter("@Nguoiky",txtSoLuu.Text),
                dtsv.CreateParameter("@Noinhan",txtNoiNhan.Text),
                dtsv.CreateParameter("@Noiluu",txtNoiLuu.Text),
                dtsv.CreateParameter("@Fileupload",tenfilethat),
                dtsv.CreateParameter("@Trichyeunoidung",txtTrichYeu.Text),
                dtsv.CreateParameter("@total",0)          
            
               };
            param[11].Direction = ParameterDirection.Output;
            tb = dtsv.ExecuteNonQuery("InsertCongvandi", param);

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                CheckBox cbitem = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                if (cbitem.Checked)
                {
                    Label lb = (Label)GridView1.Rows[i].FindControl("ID");
                    int ID = int.Parse(lb.Text);
                    SqlParameter[] param1 = new SqlParameter[] {
                    
                    dtsv.CreateParameter("@MaNguoisudung",ID),
                    dtsv.CreateParameter("@MaCongvandi",param[11].Value.ToString())
                    };

                    tb = dtsv.ExecuteNonQuery("InsertUsert_cvdi", param1);
                }

            }
            if (tb <= 0)
                lblThongBao.Text = "Không thành công";
            else lblThongBao.Text = "Thành công";
           
        }
        catch
        {
            lblThongBao.Text = "Không thành công";
        }
    }

   
}

