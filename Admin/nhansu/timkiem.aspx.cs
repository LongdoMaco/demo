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
using System.Data.SqlClient;
using System.IO;

public partial class Admin_nhansu_TimKiem : System.Web.UI.Page
{
    DataServices dtsv = new DataServices();
    private static string TenNhanVien = "";      
    
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
            Initialize();
           
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TenNhanVien=TextBox1.Text;
        dtsv.LoadGridView(GridView1,"get_nhanvien_theoten",  dtsv.CreateParameter("@TenNhanVien", TenNhanVien));
        Button2.Visible = false;     
        
    }
  
    protected void Button3_Click(object sender, EventArgs e)
    {
       DataSet ds=dtsv.ExcuteDataset(StringSql());      
           GridView1.DataSource = ds.Tables[0].DefaultView;
           GridView1.DataBind();       
    }
   

    private void Initialize()
    {
        // load don vin
        dtsv.LoadDropDownList(ddldonvi, "ns_getAll_donvi", "DONVI", "ID");
        // load hop dong 
        dtsv.LoadDropDownList(ddlloaihopdong, "ns_getAll_loaihd", "LOAIHOPDONG", "ID");
        //Load Chuc Danh       
        dtsv.LoadDropDownList(ddltrinhdo, "ns_getAll_hocvi", "HOCVI", "ID");
        dtsv.LoadDropDownList(ddlhocham, "ns_getAll_hocham", "HOCHAM", "ID");
        dtsv.LoadDropDownList(ddltdct, "ns_get_chinhtri", "CHINHTRI", "ID");
        dtsv.LoadDropDownList(ddlgioitinh, "ns_getAll_gioitinh", "GIOITINH", "ID");
        dtsv.LoadDropDownList(ddltongiao, "ns_getAll_tongiao", "TONGIAO", "ID");
        dtsv.LoadDropDownList(ddlquoctich, "ns_get_allQuocGia", "TENQUOCGIA", "ID");
        dtsv.LoadDropDownList(ddlkethon, "ns_getAll_kethon", "KETHON", "ID");
        dtsv.LoadDropDownList(ddlchucdanh, "ns_get_chucdanh", "CHUCDANH", "ID");
        dtsv.LoadDropDownList(ddlcvdoanthe, "ns_get_DMCHUCVUDDOANTHE", "CHUCVU", "ID");
        dtsv.LoadDropDownList(ddlcvcq, "ns_get_DMCHUCVUCHINHQUYEN", "CHUCVU", "ID");
        dtsv.LoadDropDownList(ddlchucvudang, "ns_get_DMCHUCVUDANG", "CHUCVU", "ID");
        dtsv.LoadDropDownList(ddldinuocngoai, "ns_get_allQuocGia", "TENQUOCGIA", "ID");
        dtsv.LoadDropDownList(ddlhesoluong ,"ns_getAll_hesoluong", "HESOLUONG", "ID");
        dtsv.LoadDropDownList(ddlMaVienChuc, "ns_getAll_manhanvien", "MAVIENCHUC", "ID");        
    }
    private  string StringSql()
    {
        // Cau lenh neu con ngay
        
        
        
        // Cau lenh lay thong so tuy chọn
        string mysql =
@"SELECT  distinct t.MANHANVIEN,t.ID ,t.HOVATEN,t.NGAYSINH,t.EMAIL,t.DIENTHOAI" + 
" FROM THONGTIN t "  +
" left  JOIN BNCHUCVUDANG b ON t.ID=b.IDTHONGTIN"+
" left JOIN BNCHUCVUDOANTHE b1 ON t.ID=b1.IDTHONGTIN"+
" left JOIN BNCHUCVUCHINHQUYEN CVCQ ON t.ID=CVCQ.IDTHONGTIN"+
" LEFT JOIN BONHIEMNGACH N ON t.ID=n.IDTHONGTIN"+
" LEFT JOIN RANUOCNGOAI r ON t.ID=r.IDTHONGTIN"+
" LEFT JOIN DOANTHE d ON t.ID=d.IDTHONGTIN where 1=1  ";
         if(hd.Checked)
             mysql += "and  n.IDHOPDONG=" + ddlloaihopdong.SelectedValue;
         if(hd0.Checked)
            mysql+="and  t.IDHOCHAM="+ddlhocham.SelectedValue;
         if(hd1.Checked)
            mysql+="and  t.IDGIOITINH="+ddlgioitinh.SelectedValue;
         if(hd2.Checked)
            mysql+="and  t.IDQUOCTICH="+ddlquoctich.SelectedValue;
        if(hd3.Checked)
            mysql+="and  t.IDCHINHTRI="+ddltdct.SelectedValue;
        if(hd4.Checked)
            mysql += "and  t.IDDONVI=" + ddldonvi.SelectedValue;
        if (hd5.Checked)
            mysql += "and  t.IDCHUCDANH=" + ddlchucdanh.SelectedValue;
        if (hd6.Checked)
            mysql += "and  t.IDHOCVI=" + ddltrinhdo.SelectedValue;
        if (hd7.Checked)
            mysql += "and  t.IDTONGIAO=" + ddltongiao.SelectedValue;
        if (hd8.Checked)
            mysql += "and  t.IDCHUCDANH=" + ddlchucdanh.SelectedValue;
        if (hd8.Checked)
            mysql += "and  t.IDKETHON=" + ddlkethon.SelectedValue;
        if (hd9.Checked)
            mysql += "and (len(d.NGAYVAODANG)>0)";
        if (hd10.Checked)
            mysql += "and  b.IDCHUCVU=" +ddlchucvudang.SelectedValue;
        if(hd11.Checked)
            mysql += "and  CVCQ.IDCHUCVU=" + ddlcvcq.SelectedValue;
        if(hd12.Checked)
            mysql += "and  b1.IDCHUCVU=" + ddlcvdoanthe.SelectedValue;
        if(hd13.Checked)
            mysql += "and  r.IDQUOCGIA=" + ddldinuocngoai.SelectedValue;
        if(hd14.Checked)
            mysql += "and  N.IDHESOLUONG=" + ddlhesoluong.SelectedValue;
        if (hd15.Checked)
            mysql += "and  N.IDMANGACH=" + ddlMaVienChuc.SelectedValue;
        if ((!string.IsNullOrEmpty(txtDenNam.Text))&&(!string.IsNullOrEmpty(txtTuNam.Text)))
        {
            
           
            string mydate = " and datepart(year,t.NGAYSINH)>=" + int.Parse(txtTuNam.Text) +  "  and datepart(year,t.NGAYSINH)<=" + int.Parse(txtDenNam.Text) + "";
            mysql += mydate;
        }
        return mysql;


    }




    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        DataSet ds = dtsv.ExcuteDataset(StringSql());
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind(); 
        
       
    }
    protected void btnTheoNam_Click(object sender, EventArgs e)
    {
       
        try
        {
            SqlParameter[] param = new SqlParameter[]
        {
            dtsv.CreateParameter("@Tunam",int.Parse(txtTuNam.Text)),
            dtsv.CreateParameter("@Dennam",int.Parse(txtDenNam.Text))
        };
            dtsv.LoadGridView(GridView1, "sp_timkiem_theonam", param);


        }
        catch
        {

            throw;

        }
    }
}
