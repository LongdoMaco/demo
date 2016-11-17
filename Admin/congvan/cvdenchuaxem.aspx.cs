using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DAL;
using System.IO;
using System.Globalization;

public partial class Admin_congvan_cvdenchuaxem : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Initiazlie();
        }

    }
    #region Khoi tao
    private void Initiazlie()
    {
        // Loai cong van
        dtsv.LoadDropDownList(ddlLoaiCV, "GetAllLoaicongvanden", "Tenloaicv", "ID");

        // Co quan ban hinh
        dtsv.LoadDropDownList(ddlCQBH, "GetAllCoquanbanhanh", "Tencoquanbanhanh", "ID");

        // Ma cong van
        dtsv.LoadDropDownList(dlMacv, "GetAllMaCVden", "TenMacongvan", "ID");

        // tat ca cong van den

        dtsv.LoadGridView(GridView1, "sp_cvdenchuaxem");
                
    }
    #endregion

    #region Hien thi gridview

     
    // theo loai cong van
    protected void ddlLoaiCV_SelectedIndexChanged(object sender, EventArgs e)
    {
        dtsv.LoadGridView(GridView1,"sp_cvchuaxem_Loai",dtsv.CreateParameter("@Loai_ID",ddlLoaiCV.SelectedValue));
    }


    // Theo co quan ban hanh 
    protected void ddlCQBH_SelectedIndexChanged(object sender, EventArgs e)
    {
        dtsv.LoadGridView(GridView1, "GetCongvandentheoCoquanbhadminchuaxem", dtsv.CreateParameter("@Cqbh_ID", ddlCQBH.SelectedValue));

    }

    // Theo ma cong van
    protected void dlMacv_SelectedIndexChanged(object sender, EventArgs e)
    {
        dtsv.LoadGridView(GridView1, "GetCongvandentheoMacongvandenadminchuaxem", dtsv.CreateParameter("@Macv_ID", dlMacv.SelectedValue));

    }
    #endregion


    protected void btnThem_Click(object sender, EventArgs e)
    {
        // Them
        Response.Redirect("nhapcvden.aspx");
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        // Xoa
        int tb = 0;
        try
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                CheckBox cbitem = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                if (cbitem.Checked)
                {
                    Label lb = (Label)GridView1.Rows[i].FindControl("Ma_CV_ND");
                    int ID = int.Parse(lb.Text);

                    // Thuc hien xoa file trong thuc muc
                    string tenFile=dtsv.ExcuteScalary("select Fileupload from Congvanden where ID="+ID).ToString();
                    string path=Server.MapPath("~/Files/congvan/congvanden/"+tenFile);
                    if(File.Exists(path))
                    File.Delete(path);

                    // thuc hien xoa trong co so du lieu
                    SqlParameter param = new SqlParameter("@Congvanden_ID", ID);
                    tb = dtsv.ExecuteNonQuery("DeleteCongvanden", param);
                }

            }
            if (tb > 0)
                lblThongBao.Text = "Xoá Thành Công";
            else
            {
                lblThongBao.Text = "Xóa Không Thành Công";
            }
        }
        catch
        {
            lblThongBao.Text = "Xóa Không Thành Công";
        }
        dtsv.LoadGridView(GridView1, "GetAllCongvandenadmin");

        
    }
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
    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            string nt = txtTuNgay.Text.Trim();
            string ngaytruoc = Convert.ToInt32(Mid(nt, 3, 2)) + "/" + Convert.ToInt32(Left(nt, 2)) + "/" + Convert.ToInt32(Right(nt, 4));
            string ns = txtDenNgay.Text;
            string ngaysau = Convert.ToInt32(Mid(ns, 3, 2)) + "/" + Convert.ToInt32(Left(ns, 2)) + "/" + Convert.ToInt32(Right(ns, 4));
           
            //sql_com.Parameters.Add(new SqlParameter("@Tungay", SqlDbType.SmallDateTime)).Value = ngaytruoc;//tungay.Text.Trim(); //"1/28/2003";
            //sql_com.Parameters.Add(new SqlParameter("@Denngay", SqlDbType.SmallDateTime)).Value = ngaysau;//
            SqlParameter[] param = new SqlParameter[]
            {
                dtsv.CreateParameter("@Tungay",ngaytruoc),
                 dtsv.CreateParameter("@Denngay",ngaysau),
            };

            dtsv.LoadGridView(GridView1, "Timtungaydenngaychuaxem", param);

        }
        catch 
        {
            
            throw;
        }
    }
    // Xu li chuoi
    public static string Left(string param, int length)
    {
        //we start at 0 since we want to get the characters starting from the
        //left and with the specified lenght and assign it to a variable
        string result = param.Substring(0, length);
        //return the result of the operation
        return result;
    }
    public static string Right(string param, int length)
    {
        //start at the index based on the lenght of the sting minus
        //the specified lenght and assign it a variable
        string result = param.Substring(param.Length - length, length);
        //return the result of the operation
        return result;
    }

    public static string Mid(string param, int startIndex, int length)
    {
        //start at the specified index in the string ang get N number of
        //characters depending on the lenght and assign it to a variable
        string result = param.Substring(startIndex, length);
        //return the result of the operation
        return result;
    }

    public static string Mid(string param, int startIndex)
    {
        //start at the specified index and return all characters after it
        //and assign it to a variable
        string result = param.Substring(startIndex);
        //return the result of the operation
        return result;
    }
}


