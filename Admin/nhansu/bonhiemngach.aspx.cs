using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using UNI.Class;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using DAL;

public partial class Admin_nhansu_bonhiemngach : System.Web.UI.Page
{
    DataSet ds;

    DataServices dtsv = new DataServices();
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
            InitData();
            InnitDataHesoluong();
            InnitDataloaidh();
            InnitDataMavienchuc();
            btnCapNhat.Visible = false;

           
        }
        //btSua.Visible = false;
        // btThemmoi.Visible = false;
        // Label4.Visible = false;
       
    }
    private void InitData()
    {
        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_getAll_donvi");
        ds = ConnectSQL.FillDataSet(sql_com);
        dlChuyende.DataSource = ds.Tables[0].DefaultView;
        dlChuyende.DataTextField = "DONVI";
        dlChuyende.DataValueField = "ID";
        dlChuyende.DataBind();
        //dlChuyende.Items.Insert(0, "Chọn đơn vị công tác");
        if (dlChuyende.Items.Count == 0)
        {
            dlChuyende.Visible = false;
        }
        else

            BindDataGrid();
        InnitDataTHONGTINTHEO_idDONVI();
    }
    private void InnitDataloaidh()
    {

        dtsv.LoadDropDownList(dlloaihopdong, "ns_getAll_loaihd", "LOAIHOPDONG", "ID");
        //dlloaihopdong.Items.Insert(0, "Chọn loại hợp đồng");
    }
    private void InnitDataTHONGTINTHEO_idDONVI()
    {

        SqlCommand sql_TT_IDDONVI = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_Get_tt_theoDonvi");
        sql_TT_IDDONVI.Parameters.Add(new SqlParameter("@DONVI_ID", SqlDbType.TinyInt)).Value = dlChuyende.SelectedValue;// DV_ID;// Convert.ToByte(dlChuyende.SelectedValue)
        ds = ConnectSQL.FillDataSet(sql_TT_IDDONVI);
        dlthongtin.DataSource = ds.Tables[0].DefaultView;
        dlthongtin.DataTextField = "HOVATEN";
        dlthongtin.DataValueField = "ID";
        dlthongtin.DataBind();
        //dlloaihopdong.Items.Insert(0, "Chọn loại hợp đồng");    

    }
    private void InnitDataHesoluong()
    {
        SqlCommand sql_cv = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_getAll_hesoluong");
        ds = ConnectSQL.FillDataSet(sql_cv);
        dlhesoluong.DataSource = ds.Tables[0].DefaultView;
        dlhesoluong.DataTextField = "HESOLUONG";
        dlhesoluong.DataValueField = "ID";
        dlhesoluong.DataBind();
        // dlchucvu.Items.Insert(0, "Chọn chức vụ");
    }
    private void InnitDataMavienchuc()
    {
        SqlCommand sql_lhd = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_getAll_manhanvien");
        ds = ConnectSQL.FillDataSet(sql_lhd);
        dlmavienchuc.DataSource = ds.Tables[0].DefaultView;
        dlmavienchuc.DataTextField = "MAVIENCHUC";
        dlmavienchuc.DataValueField = "ID";
        dlmavienchuc.DataBind();
        //dlloaihopdong.Items.Insert(0, "Chọn loại hợp đồng");
    }

    private void BindDataGrid()
    {

        SqlParameter param = new SqlParameter("@IDNhanVien", dlthongtin.SelectedValue);
        dtsv.LoadGridView(GridView1, "ns_Get_tt_IDDONVI_bnn", param);
    }

    protected void dlChuyende_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        InnitDataTHONGTINTHEO_idDONVI();
        BindDataGrid();
    }
    protected void btxemall_Click(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //them moi
        //byte donvi_ID = Convert.ToByte(dlChuyende.SelectedValue);
        byte thongtin_ID = Convert.ToByte(dlthongtin.SelectedValue);
        byte mavienchuc_ID = Convert.ToByte(dlmavienchuc.SelectedValue);
        byte hesoluong_ID = Convert.ToByte(dlhesoluong.SelectedValue);
        SqlCommand sql_com;
        sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_Ins_bnn");
        sql_com.Parameters.Add(new SqlParameter("@NGAYBATDAU", SqlDbType.NVarChar)).Value = txtngaybatdau.Text.Trim();
        sql_com.Parameters.Add(new SqlParameter("@NGAYTUYENDUNG", SqlDbType.NVarChar)).Value = txtngaytuyendung.Text.Trim();
        sql_com.Parameters.Add(new SqlParameter("@NGAYBONHIEM", SqlDbType.NVarChar)).Value = txtngaybonhiem.Text.Trim();
        sql_com.Parameters.Add(new SqlParameter("@NGAYHUONGLUONG", SqlDbType.NVarChar)).Value = txtngayhuongluong.Text.Trim();
        sql_com.Parameters.Add(new SqlParameter("@NGAYHETTAPSU", SqlDbType.NVarChar)).Value = txtngayhettapsu.Text;
        sql_com.Parameters.Add(new SqlParameter("@NGAYTANGLUONGTRUOCTH", SqlDbType.NVarChar)).Value = txttangluong.Text;
        sql_com.Parameters.Add(new SqlParameter("@CONGVIECBONHIEM", SqlDbType.NVarChar)).Value = txtdanglam.Value.Trim();
        //sql_com.Parameters.Add(new SqlParameter("@IDDONVI", SqlDbType.Int)).Value = donvi_ID;
        sql_com.Parameters.Add(new SqlParameter("@IDTHONGTIN", SqlDbType.Int)).Value = thongtin_ID;
        sql_com.Parameters.Add(new SqlParameter("@IDMANGACH", SqlDbType.Int)).Value = mavienchuc_ID;
        sql_com.Parameters.Add(new SqlParameter("@IDHESOLUONG", SqlDbType.Int)).Value = hesoluong_ID;
        SqlParameter param = new SqlParameter("@total", SqlDbType.Int);
        param.Direction = ParameterDirection.Output;
        sql_com.Parameters.Add(param);
        sql_com.ExecuteNonQuery();
        int total = Convert.ToInt32(param.Value.ToString());
        if (total != 0)
        {
            //TextBox1.Visible = true;
            // Label4.Visible = true;
            Label5.Text = "Cập nhật dữ liệu thành công";
            BindDataGrid();
            clear();
        }
        else
            //TextBox1.Visible = true;
            Label5.Text = "Nhân viên này đã có rồi hoặc xem lại thông tin nhập ";

    }
    private void clear()
    {
        txtngaybatdau.Text = "";
        txtdanglam.Value = "";
        txtngaybatdau.Text = "";
        txtngaybonhiem.Text = "";
        txtngayhuongluong.Text = "";
        txtngaytuyendung.Text = "";
        txtngayhettapsu.Text = "";
        txttangluong.Text = "";
    }


    protected void butXem_Click(object sender, EventArgs e)
    {

    }
    protected void btPrint_Click(object sender, EventArgs e)
    {

    }
    protected void btThoat_Click(object sender, EventArgs e)
    {

    }

    //private void DataGrid1_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
    //{
    //    btSua.Visible = true;
    //    btThemmoi.Visible = true;
    //    btnLuu.Visible = false;
    //    DataSet temp;
    //    int index = e.Item.ItemIndex;
    //    if (e.CommandName.Equals("Edit"))
    //    {
    //        Label bonhiemngach_ID = (Label)DataGrid1.Items[index].FindControl("ID");
    //        Session["BNN_ID"] = Convert.ToInt32(bonhiemngach_ID.Text);
    //        SqlCommand sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_get_bonhiemngach_ID");
    //        sql_com.Parameters.Add(new SqlParameter("@IDBONHIEMNGACH", SqlDbType.Int)).Value = Convert.ToInt32(bonhiemngach_ID.Text);
    //        temp = ConnectSQL.FillDataSet(sql_com);
    //        if (temp.Tables[0].Rows.Count != 0)
    //        {
    //            txtngaybatdau.Value = temp.Tables[0].Rows[0]["NGAYBATDAU"].ToString();
    //            txtngaytuyendung.Value = temp.Tables[0].Rows[0]["NGAYTUYENDUNG"].ToString();
    //            txtngaybonhiem.Value = temp.Tables[0].Rows[0]["NGAYBONHIEM"].ToString();
    //            txtngayhuongluong.Value = temp.Tables[0].Rows[0]["NGAYHUONGLUONG"].ToString();
    //            txtdanglam.Value = temp.Tables[0].Rows[0]["CONGVIECBONHIEM"].ToString();
    //            //dlChuyende.SelectedValue = temp.Tables[0].Rows[0]["CONGVIECBONHIEM"].ToString();
    //            dlthongtin.SelectedValue = temp.Tables[0].Rows[0]["ID_THONGTIN"].ToString();
    //            dlmavienchuc.SelectedValue = temp.Tables[0].Rows[0]["ID_MAVIENCHUC"].ToString();
    //            dlhesoluong.SelectedValue = temp.Tables[0].Rows[0]["ID_HESOLUONG"].ToString();
    //        }
    //        Label5.Text = (bonhiemngach_ID.Text);
    //    }
    //}
    //protected void btSua_Click(object sender, EventArgs e)
    //{
    //    // Sửa thông tin
    //    byte thongtin_ID = Convert.ToByte(dlthongtin.SelectedValue);
    //    byte mavienchuc_ID = Convert.ToByte(dlmavienchuc.SelectedValue);
    //    byte hesoluong_ID = Convert.ToByte(dlhesoluong.SelectedValue);
    //    SqlCommand sql_com;
    //    sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_Upd_bnn");
    //    sql_com.Parameters.Add(new SqlParameter("@BONHIEM_ID", SqlDbType.Int)).Value = Convert.ToInt32(Session["BNN_ID"].ToString());//Convert.ToInt32(thongtin_ID.Text);
    //    sql_com.Parameters.Add(new SqlParameter("@NGAYBATDAU", SqlDbType.NVarChar)).Value = txtngaybatdau.Value.Trim();
    //    sql_com.Parameters.Add(new SqlParameter("@NGAYTUYENDUNG", SqlDbType.NVarChar)).Value = txtngaytuyendung.Value.Trim();
    //    sql_com.Parameters.Add(new SqlParameter("@NGAYBONHIEM", SqlDbType.NVarChar)).Value = txtngaybonhiem.Value.Trim();
    //    sql_com.Parameters.Add(new SqlParameter("@NGAYHUONGLUONG", SqlDbType.NVarChar)).Value = txtngayhuongluong.Value.Trim();
    //    sql_com.Parameters.Add(new SqlParameter("@CONGVIECBONHIEM", SqlDbType.NVarChar)).Value = txtdanglam.Value.Trim();
    //    //sql_com.Parameters.Add(new SqlParameter("@IDDONVI", SqlDbType.Int)).Value = donvi_ID;
    //    sql_com.Parameters.Add(new SqlParameter("@IDTHONGTIN", SqlDbType.Int)).Value = thongtin_ID;
    //    sql_com.Parameters.Add(new SqlParameter("@IDMANGACH", SqlDbType.Int)).Value = mavienchuc_ID;
    //    sql_com.Parameters.Add(new SqlParameter("@IDHESOLUONG", SqlDbType.Int)).Value = hesoluong_ID;
    //    sql_com.ExecuteNonQuery();
    //    sql_com.Connection.Close();
    //    BindDataGrid();
    //    clear();
    //}
    protected void btThemmoi_Click(object sender, EventArgs e)
    {
        clear();
        //btnLuu.Visible = true;
        //btSua.Visible = false;
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
    protected void btnThemMoi_Click(object sender, EventArgs e)
    {

        //them moi
        //byte donvi_ID = Convert.ToByte(dlChuyende.SelectedValue);
        int bactrongngach = 0;
        float hsthamnien = 0;
        if (txtbactrongngach.Text != "")
            bactrongngach = int.Parse(txtbactrongngach.Text);
        if (txthesothamnien.Text != "")
            hsthamnien = float.Parse(txthesothamnien.Text);


        try
        {
            //byte thongtin_ID = Convert.ToByte(dlthongtin.SelectedValue);
            //byte mavienchuc_ID = Convert.ToByte(dlmavienchuc.SelectedValue);
            //byte hesoluong_ID = Convert.ToByte(dlhesoluong.SelectedValue);
            SqlCommand sql_com;
            sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_Ins_bnn");
            sql_com.Parameters.Add(new SqlParameter("@NGAYBATDAU", SqlDbType.NVarChar)).Value = txtngaybatdau.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@NGAYTUYENDUNG", SqlDbType.NVarChar)).Value = txtngaytuyendung.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@NGAYBONHIEM", SqlDbType.NVarChar)).Value = txtngaybonhiem.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@NGAYHUONGLUONG", SqlDbType.NVarChar)).Value = txtngayhuongluong.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@CONGVIECBONHIEM", SqlDbType.NVarChar)).Value = txtdanglam.Value.Trim();
            sql_com.Parameters.Add(new SqlParameter("@NGAYHETTAPSU", SqlDbType.NVarChar)).Value = txtngayhettapsu.Text;
            sql_com.Parameters.Add(new SqlParameter("@NGAYTANGLUONGTRUOCTH", SqlDbType.NVarChar)).Value = txttangluong.Text;
            //sql_com.Parameters.Add(new SqlParameter("@IDDONVI", SqlDbType.Int)).Value = donvi_ID;
            sql_com.Parameters.Add(new SqlParameter("@IDTHONGTIN", SqlDbType.Int)).Value = dlthongtin.SelectedValue ;
            sql_com.Parameters.Add(new SqlParameter("@IDMANGACH", SqlDbType.Int)).Value = dlmavienchuc.SelectedValue;
            sql_com.Parameters.Add(new SqlParameter("@IDHESOLUONG", SqlDbType.Int)).Value = dlhesoluong.SelectedValue;
            sql_com.Parameters.Add(new SqlParameter("@BACTRONGNGACH", SqlDbType.Int)).Value = bactrongngach;
            sql_com.Parameters.Add(new SqlParameter("@HESOTHAMNIEN", SqlDbType.Float)).Value = hsthamnien;
            sql_com.Parameters.Add(new SqlParameter("@IDHOPDONG", SqlDbType.Int)).Value =dlloaihopdong.SelectedValue;

           // SqlParameter param = new SqlParameter("@total", SqlDbType.Int);
           // param.Direction = ParameterDirection.Output;
           // sql_com.Parameters.Add(param);
            sql_com.ExecuteNonQuery();
            //int total = int.Parse(param.Value.ToString());
            
                //TextBox1.Visible = true;
                // Label4.Visible = true;
                Label5.Text = "Cập nhật dữ liệu thành công";
                BindDataGrid();
                clear();
         
        }
        catch
        {
            Label5.Text = "Bạn nhập sai định dạng dữ liệu ! Vui lòng nhập lại";
        }


    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {

        ////them moi
        ////byte donvi_ID = Convert.ToByte(dlChuyende.SelectedValue);
        //byte thongtin_ID = Convert.ToByte(dlthongtin.SelectedValue);
        //byte mavienchuc_ID = Convert.ToByte(dlmavienchuc.SelectedValue);
        //byte hesoluong_ID = Convert.ToByte(dlhesoluong.SelectedValue);
        //SqlCommand sql_com;
        //sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_Ins_bnn");
        //sql_com.Parameters.Add(new SqlParameter("@NGAYBATDAU", SqlDbType.NVarChar)).Value = txtngaybatdau.Value.Trim();
        //sql_com.Parameters.Add(new SqlParameter("@NGAYTUYENDUNG", SqlDbType.NVarChar)).Value = txtngaytuyendung.Value.Trim();
        //sql_com.Parameters.Add(new SqlParameter("@NGAYBONHIEM", SqlDbType.NVarChar)).Value = txtngaybonhiem.Value.Trim();
        //sql_com.Parameters.Add(new SqlParameter("@NGAYHUONGLUONG", SqlDbType.NVarChar)).Value = txtngayhuongluong.Value.Trim();
        //sql_com.Parameters.Add(new SqlParameter("@CONGVIECBONHIEM", SqlDbType.NVarChar)).Value = txtdanglam.Value.Trim();
        ////sql_com.Parameters.Add(new SqlParameter("@IDDONVI", SqlDbType.Int)).Value = donvi_ID;
        //sql_com.Parameters.Add(new SqlParameter("@IDTHONGTIN", SqlDbType.Int)).Value = thongtin_ID;
        //sql_com.Parameters.Add(new SqlParameter("@IDMANGACH", SqlDbType.Int)).Value = mavienchuc_ID;
        //sql_com.Parameters.Add(new SqlParameter("@IDHESOLUONG", SqlDbType.Int)).Value = hesoluong_ID;
        //SqlParameter param = new SqlParameter("@total", SqlDbType.Int);
        //param.Direction = ParameterDirection.Output;
        //sql_com.Parameters.Add(param);
        //sql_com.ExecuteNonQuery();
        //int total = Convert.ToInt32(param.Value.ToString());
        //if (total != 0)
        //{
        //    //TextBox1.Visible = true;
        //    // Label4.Visible = true;
        //    Label5.Text = "Cập nhật dữ liệu thành công";
        //    BindDataGrid();
        //    clear();
        //}
        //else
        //    //TextBox1.Visible = true;
        //    Label5.Text = "Cập nhật dữ liệu không thành công";


    }
    protected void cbheader_CheckedChanged1(object sender, EventArgs e)
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
    protected void lbtedit_Click(object sender, EventArgs e)
    {



        btnCapNhat.Visible = true;

        LinkButton lbt = (LinkButton)sender;
        Label lbl = (Label)lbt.Parent.FindControl("ID");


        Session["BNN_ID"] = Convert.ToInt32(lbl.Text);
        SqlParameter param = new SqlParameter("@IDBONHIEMNGACH", int.Parse(lbl.Text));
        DataTable temp = dtsv.ExcuteTable("ns_get_bonhiemngach_ID", param);
        if (temp.Rows.Count != 0)
        {
            txtngaybatdau.Text = temp.Rows[0]["NGAYBATDAU"].ToString();
            txtngaytuyendung.Text = temp.Rows[0]["NGAYTUYENDUNG"].ToString();
            txtngaybonhiem.Text = temp.Rows[0]["NGAYBONHIEM"].ToString();
            txtngayhuongluong.Text = temp.Rows[0]["NGAYHUONGLUONG"].ToString();
            txtdanglam.Value = temp.Rows[0]["CONGVIECBONHIEM"].ToString();
            //dlChuyende.SelectedValue = temp.Tables[0].Rows[0]["CONGVIECBONHIEM"].ToString();
            txtngayhettapsu.Text = temp.Rows[0]["NGAYHETTAPSU"].ToString();
            txttangluong.Text = temp.Rows[0]["NGAYTANGLUONGTRUOC"].ToString();
            dlthongtin.SelectedValue = temp.Rows[0]["ID_THONGTIN"].ToString();
            dlmavienchuc.SelectedValue = temp.Rows[0]["ID_MAVIENCHUC"].ToString();
            dlhesoluong.SelectedValue = temp.Rows[0]["ID_HESOLUONG"].ToString();
            txthesothamnien.Text = temp.Rows[0]["HESOTHAMNIEN"].ToString();
            txtbactrongngach.Text = temp.Rows[0]["BACTRONGNGACH"].ToString();
            dlloaihopdong.SelectedValue = temp.Rows[0]["IDHOPDONG"].ToString();
        }
       


    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        int tb = 0;
        try
        {

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                CheckBox cbitem = (CheckBox)GridView1.Rows[i].FindControl("cbitem");
                if (cbitem.Checked)
                {
                    Label lb = (Label)GridView1.Rows[i].FindControl("ID");
                    int ID = int.Parse(lb.Text);
                    SqlParameter param = new SqlParameter("@bonghiemngach_ID", ID);
                    tb = dtsv.ExecuteNonQuery("ns_del_bonhiemngach", param);
                }

            }
            if (tb > 0)
                Label5.Text = "Xoá Thành Công";
            else
            {
                Label5.Text = "Xóa Không Thành Công";
            }
        }
        catch
        {
            Label5.Text = "Xóa Không Thành Công";
        }
        BindDataGrid();

    }
    protected void btnCapNhat_Click(object sender, EventArgs e)
    {
        // Sửa thông tin
        try
        {
            byte thongtin_ID = Convert.ToByte(dlthongtin.SelectedValue);
            byte mavienchuc_ID = Convert.ToByte(dlmavienchuc.SelectedValue);
            byte hesoluong_ID = Convert.ToByte(dlhesoluong.SelectedValue);
            SqlCommand sql_com;
            sql_com = ConnectSQL.CreateSQLCommand("UNI_PORTAL", "ns_Upd_bnn");
            sql_com.Parameters.Add(new SqlParameter("@BONHIEM_ID", SqlDbType.Int)).Value = Convert.ToInt32(Session["BNN_ID"].ToString());//Convert.ToInt32(thongtin_ID.Text);
            sql_com.Parameters.Add(new SqlParameter("@NGAYBATDAU", SqlDbType.NVarChar)).Value = txtngaybatdau.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@NGAYTUYENDUNG", SqlDbType.NVarChar)).Value = txtngaytuyendung.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@NGAYBONHIEM", SqlDbType.NVarChar)).Value = txtngaybonhiem.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@NGAYHUONGLUONG", SqlDbType.NVarChar)).Value = txtngayhuongluong.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@CONGVIECBONHIEM", SqlDbType.NVarChar)).Value = txtdanglam.Value.Trim();
            sql_com.Parameters.Add(new SqlParameter("@NGAYHETTAPSU", SqlDbType.NVarChar)).Value = txtngayhettapsu.Text;
            sql_com.Parameters.Add(new SqlParameter("@NGAYTANGLUONGTRUOCTH", SqlDbType.NVarChar)).Value = txttangluong.Text;
            //sql_com.Parameters.Add(new SqlParameter("@IDDONVI", SqlDbType.Int)).Value = donvi_ID;
            //sql_com.Parameters.Add(new SqlParameter("@IDTHONGTIN", SqlDbType.Int)).Value = thongtin_ID;
            sql_com.Parameters.Add(new SqlParameter("@IDMANGACH", SqlDbType.Int)).Value = mavienchuc_ID;
            sql_com.Parameters.Add(new SqlParameter("@IDHESOLUONG", SqlDbType.Int)).Value = hesoluong_ID;
            sql_com.Parameters.Add(new SqlParameter("@BACTRONGNGACH", SqlDbType.Int)).Value = txtbactrongngach.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@HESOTHAMNIEN", SqlDbType.Int)).Value = txthesothamnien.Text.Trim();
            sql_com.Parameters.Add(new SqlParameter("@IDHOPDONG", SqlDbType.Int)).Value = dlloaihopdong.SelectedValue;
            sql_com.ExecuteNonQuery();
            sql_com.Connection.Close();
            Label5.Text = "Cập Nhật Thành Công";
        }
        catch
        {
            Label5.Text = "Cập Nhật Không thành công";
        }

        BindDataGrid();

        clear();
        btnCapNhat.Visible = false;

    }
    protected void dlthongtin_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDataGrid();
    }
}
