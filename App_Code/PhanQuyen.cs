using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;



/// <summary>
/// Summary description for PhanQuyen
/// </summary>
/// 
namespace DAL
{
    public class PhanQuyen
    {

        public PhanQuyen()
        {
            //
            // TODO: Add constructor logic here
            //
        }


        /// <summary>
        /// Kiểm Tra Phân Quyền :
        /// </summary>
        /// <param name="chuoikiemtra"></param>
        /// <param name="nguoisudungid"></param>
        /// <returns></returns>
        public static bool KiemTra(string chuoikiemtra, int nguoisudungid)
        {
            bool kiemtra=false;
            DataServices dtsv=new DataServices ();
            DataTable dt =dtsv.ExcuteDataset("NSD_MODULE_PhanQuyen",dtsv.CreateParameter("@nguoisudungid",nguoisudungid)).Tables[0] ;
            if (dt.Rows.Count != 0)
            {
                for (int i = 0; i < dt.Rows.Count;i++ )
                {
                    if (chuoikiemtra.ToUpper()== dt.Rows[i]["Module"].ToString().ToUpper())
                    {
                        kiemtra = true;
                    }

                }
            }
            return kiemtra;

        }
        public static bool XacNhanGroup(int nguoisudungid,int MaGroup)
        {
            DataServices dtsv = new DataServices();
            SqlParameter[] param = new SqlParameter[] 
            {
                dtsv.CreateParameter("@NguoiSuDungID",nguoisudungid),
                 dtsv.CreateParameter("@QuyenID",MaGroup)
            };
            DataTable dt = dtsv.ExcuteDataset("NSD_QuyenTruyCap_NguoiSuDung", param).Tables[0];
            if (dt.Rows.Count != 0)
                return true;
            return false;
            
        }

        /// <summary>
        /// Mã hóa web config 
        /// </summary>
        //public static void encrypt()
        //{
        //    try
        //    {
        //        //mở file web.config
        //        Configuration config = WebConfigurationManager.OpenWebConfiguration(System.Web.HttpContext.Current.Request.ApplicationPath);
        //        //Chỉ định vùng mà ta muốn mã hóa
        //        ConfigurationSection section = config.GetSection("connectionStrings");
        //        //Chọn kiểu mã hóa: ở đây có 2 kiểu mã hóa:
        //        //kiểu mã hóa thứ nhất là Data
        //        section.SectionInformation.ProtectSection("DataProtectionConfigurationProvider");
        //        //kiểu mã hóa thứ hai là RSA
        //        //section.SectionInformation.ProtectSection("RSAProtectionConfigurationProvider");
        //        //lưu lại thông tin trở lại web.config
        //        config.Save();
        //    }
        //    catch (Exception ex)
        //    {
        //        System.Web.HttpContext.Current.Response.Write("Erro" + ex);
        //    }
        //}
        /// <summary>
        ///  Giải mã web config đã mã hóa
        /// </summary>
        //public static void decrypt()
        //{
        //    //Mở file web.config
        //    Configuration config = WebConfigurationManager.OpenWebConfiguration(System.Web.HttpContext.Current.Request.ApplicationPath);
        //    //Chỉ định vùng mã đã mã hóa
        //    ConfigurationSection section = config.GetSection("connectionStrings");
        //    //thực hiện giải mã
        //    section.SectionInformation.UnprotectSection();
        //    //lưu lại thông tin vào file web.config
        //    config.Save();
        //}

    }
}