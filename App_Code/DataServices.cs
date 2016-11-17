using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Configuration;
using System.Web.Configuration;
using System.Security.Cryptography;
using System.Web.UI.WebControls;
using System.IO;



namespace DAL
{
    /// <summary>
    /// Chuyen lam nhiem vu xu li va ket noi thong tin lien quan den database;
    /// 
    /// </summary>
    /// 
    #region Class Chuyên Kết Xử Lí Kết Nối 
    public class DataServices
    {

        public string Error { get; set; }

        
        public string LayChuoiKetNoi()
        {
            //PhanQuyen.decrypt();
           string ChuoiKetNoi=ConfigurationManager.ConnectionStrings["UNI_PORTALS"].ConnectionString;
            //PhanQuyen.encrypt();
           return ChuoiKetNoi;              
        }

        /// <summary>
        /// Doc du lieu theo dong
        /// </summary>
        /// <param name="procParams">Ten mot thuc tuc</param>
        /// <param name="ProcParams">Ten parammater</param>
        /// <returns>re ve mot sqldatareder</returns>
        public SqlDataReader ExcuteReader(string procParams, params SqlParameter[] ProcParams)
        {
            SqlDataReader dr = null;
            SqlConnection conn = null;
            SqlCommand cmd = null;
            try
            {
                conn = new SqlConnection(LayChuoiKetNoi());
                conn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                if (ProcParams != null)// neu co truyen tham so
                {
                    cmd.Parameters.AddRange(ProcParams);
                }
                dr = cmd.ExecuteReader();
            }
            catch
            {

                throw;
            }
            finally
            {
                if (conn != null)
                    conn.Dispose();

            }
            return dr;
        }
        /// <summary>
        /// Thuc hien cau lenh update,delete,inset....
        /// </summary>
        /// <param name="procName">Ten Thuc Tuc </param>
        /// <param name="procParams">Ten Tham So</param>
        /// <returns>So Hang Bi Tac Dong</returns>
        public int ExecuteNonQuery(string procName, params SqlParameter[] procParams)
        {
            SqlCommand cmd = null;
            SqlConnection conn = null;
            int affectedRows = 0;
            try
            {
                conn = new SqlConnection(LayChuoiKetNoi());
                conn.Open();
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = procName;
                cmd.CommandType = CommandType.StoredProcedure;
                if (procParams != null)
                {
                    for (int i = 0; i < procParams.Length; i++)
                    {
                        cmd.Parameters.Add(procParams[i]);
                    }
                }
                affectedRows = cmd.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
                conn.Close();
            }
            return affectedRows;
        }

        /// <summary>
        /// Thuc hien bang cau lenh insert,delete,update dung lenh 
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public int ExecuteNonQuery(string sql)
        {
            SqlCommand cmd = null;
            SqlConnection conn = null;
            int affectedRows = 0;
            try
            {
                conn = new SqlConnection(LayChuoiKetNoi());
                conn.Open();
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = sql;
                cmd.CommandType = CommandType.Text;                
                affectedRows = cmd.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
                conn.Close();
            }
            return affectedRows;
        }


        /// <summary>
        /// Thuc Hien cau lenh tra ve mot o
        /// </summary>
        /// <param name="procName">ten thu tuc</param>
        /// <param name="procParams">ten tham so </param>
        /// <returns>tra ve mot o dau tien</returns>
        public object ExcuteScalary(string procName, params SqlParameter[] procParams)
        {
            SqlConnection sqlcon = null;
            SqlCommand sqlcmd = null;
            object value;
            try
            {
                sqlcon = new SqlConnection(LayChuoiKetNoi());
                sqlcon.Open();
                sqlcmd = new SqlCommand(procName, sqlcon);

                sqlcmd.CommandType = CommandType.StoredProcedure;
                if (procParams != null)
                {
                    sqlcmd.Parameters.AddRange(procParams);

                }
                value = sqlcmd.ExecuteScalar();// thuc hien cau lenh

            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                if (sqlcon != null)
                {
                    sqlcmd.Dispose();
                }
            }
            return value;
        }
        /// <summary>
        /// Thuc hien cau lenh tra ve mot Object 
        /// </summary>
        /// <param name="sql"></param>
        
        /// <returns></returns>
        public object ExcuteScalary(string sql)
        {
            SqlConnection sqlcon = null;
            SqlCommand sqlcmd = null;
            object value;
            try
            {
                sqlcon = new SqlConnection(LayChuoiKetNoi());
                sqlcon.Open();
                sqlcmd = new SqlCommand(sql, sqlcon);

                sqlcmd.CommandType = CommandType.Text;               
                value = sqlcmd.ExecuteScalar();// thuc hien cau lenh

            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                if (sqlcon != null)
                {
                    sqlcmd.Dispose();
                }
            }
            return value;
        }
        /// <summary>
        /// Lay Mot dataset
        /// </summary>
        /// <param name="procName">ten thu tuc</param>
        /// <param name="procParams">ten tham so </param>
        /// <returns></returns>

        public DataSet ExcuteDataset(string procName, params SqlParameter[] procParams)
        {
            SqlConnection conn = null;
            SqlCommand cmd = null;
            DataSet ds = new DataSet();
            SqlDataAdapter da = null;

            try
            {
                conn = new SqlConnection(LayChuoiKetNoi());
                conn.Open();
                cmd = new SqlCommand(procName, conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (procParams != null)
                {
                    cmd.Parameters.AddRange(procParams);
                }

                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
            }
            catch
            {

                throw;
            }
            finally
            {
                if (conn != null)
                    conn.Dispose();

            }
            return ds;
        }
      /// <summary>
      /// tra ve dataset 
      /// </summary>
      /// <param name="sql"> cau lenh sql can thuc thi</param>
      /// <returns></returns>
        public DataSet ExcuteDataset(string sql)
        {
            SqlConnection conn = null;
            SqlCommand cmd = null;
            DataSet ds = new DataSet();
            SqlDataAdapter da = null;

            try
            {
                conn = new SqlConnection(LayChuoiKetNoi());
                conn.Open();
                cmd = new SqlCommand(sql,conn);
                cmd.CommandType = CommandType.Text;    
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
            }
            catch
            {

                throw;
            }
            finally
            {
                if (conn != null)
                    conn.Dispose();

            }
            return ds;
        }

        /// <summary>
        /// Lay datatable
        /// </summary>
        /// <param name="procName">ten thu tuc</param>
        /// <param name="procParams">ten tham so</param>
        /// <returns>datatable</returns>
        public DataTable ExcuteTable(string procName, params SqlParameter[] procParams)
        {
            SqlConnection conn = null;
            SqlCommand cmd = null;
            DataTable dt = new DataTable();
            SqlDataAdapter da = null;
            try
            {
                conn = new SqlConnection(LayChuoiKetNoi());
                conn.Open();
                cmd = new SqlCommand(procName, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                if (procParams != null)
                {
                    cmd.Parameters.AddRange(procParams);
                }
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch
            {

                Error = "Xảy Ra Lỗi Rồi";
            }
            finally
            {
                if (conn != null)
                    conn.Dispose();

            }
            return dt;
        }
        /// <summary>
        /// tra ve datatable
        /// </summary>
        /// <param name="sql"> cau lenh sql co thuc thi</param>
        /// <returns></returns>
        public DataTable ExcuteTable(string sql)
        {
            SqlConnection conn = null;
            SqlCommand cmd = null;
            DataTable dt = new DataTable();
            SqlDataAdapter da = null;
            try
            {
                conn = new SqlConnection(LayChuoiKetNoi());
                conn.Open();
                cmd = new SqlCommand(sql, conn);
                cmd.CommandType = CommandType.Text;              
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch
            {

                Error = "Xảy Ra Lỗi Rồi";
            }
            finally
            {
                if (conn != null)
                    conn.Dispose();

            }
            return dt;
        }
        /// <summary>
        /// Parameter
        /// </summary>
        /// <param name="paramName">Ten Parameter</param>
        /// <param name="value">Ten doi so truyn veo</param>
        /// <returns>mot sqlparameter</returns>
        public SqlParameter CreateParameter(string paramName, object value)
        {
            SqlParameter sqlparameter = new SqlParameter(paramName, value);
            return sqlparameter;
        }



        //*****************************These Method fill data to control***************************
        /// <summary>
        /// Do vao DropDownList dung StoreProcedure
        /// </summary>
        /// <param name="ddl"></param>
        /// <param name="procName"></param>
        /// <param name="TextField"></param>
        /// <param name="ValueField"></param>
        /// <param name="paramsName"></param>
        public void LoadDropDownList(DropDownList ddl,string procName, string TextField, string ValueField,params SqlParameter[] paramsName)
        {
           
            ddl.DataSource =this.ExcuteDataset(procName,paramsName).Tables[0];
            ddl.DataTextField = TextField;
            ddl.DataValueField = ValueField;
            ddl.DataBind();
            
        }
        /// <summary>
        /// DropDownList dung Sql truc tiep
        /// </summary>
        /// <param name="ddl"></param>
        /// <param name="sql"></param>
        /// <param name="TextField"></param>
        /// <param name="ValueField"></param>
        /// <param name="paramsName"></param>
        public void FillDropDownListSQL(DropDownList ddl, string sql, string TextField, string ValueField)
        {

            ddl.DataSource = this.ExcuteDataset(sql).Tables[0];
            ddl.DataTextField = TextField;
            ddl.DataValueField = ValueField;
            ddl.DataBind();

        }
        /// <summary>
        /// Do vao Luoi dung store procedure
        /// </summary>
        /// <param name="gv"></param>
        /// <param name="procName"></param>
        /// <param name="paramsName"></param>
        public void LoadGridView(GridView gv,string procName,params SqlParameter[] paramsName)
        {

            gv.DataSource = this.ExcuteDataset(procName, paramsName).Tables[0];          
            gv.DataBind();
            
        }
        /// <summary>
        /// Do vao luoi dung cua lenh sql truc tiep
        /// </summary>
        /// <param name="gv"></param>
        /// <param name="sql"></param>
        public void FillGridViewSQL(GridView gv, string sql)
        {

            gv.DataSource = this.ExcuteDataset(sql).Tables[0];
            gv.DataBind();

        }
                



    }
    #endregion
    #region Class Mã Hóa Thông Tin  


    public class Security
    {
        private static string mKey = "wqdj~yriu!@*k0_^fa7431%p$#=@hd+&";
        private static string mSalt = "mnbvcxzasdfghjklpoiuytrewq";

        private static SymmetricAlgorithm mCryptoService;

        private static void SetLegalIV()
        {
            mCryptoService.IV = new byte[] { 0xf, 0x6f, 0x13, 0x2e, 0x35, 0xc2, 0xcd, 0xf9 };
        }

        private static byte[] GetLegalKey()
        {
            mCryptoService = new DESCryptoServiceProvider();
            mCryptoService.Mode = CipherMode.CBC;
            // Adjust key if necessary, and return a valid key
            if (mCryptoService.LegalKeySizes.Length > 0)
            {
                // Key sizes in bits
                int keySize = mKey.Length * 8;
                int minSize = mCryptoService.LegalKeySizes[0].MinSize;
                int maxSize = mCryptoService.LegalKeySizes[0].MaxSize;
                int skipSize = mCryptoService.LegalKeySizes[0].SkipSize;

                if (keySize > maxSize)
                {
                    // Extract maximum size allowed
                    mKey = mKey.Substring(0, maxSize / 8);
                }
                else if (keySize < maxSize)
                {
                    // Set valid size
                    int validSize = (keySize <= minSize) ? minSize :
                        (keySize - keySize % skipSize) + skipSize;
                    if (keySize < validSize)
                    {
                        // Pad the key with asterisk to make up the size
                        mKey = mKey.PadRight(validSize / 8, '*');
                    }
                }
            }
            PasswordDeriveBytes key = new PasswordDeriveBytes(mKey, ASCIIEncoding.ASCII.GetBytes(mSalt));
            return key.GetBytes(mKey.Length);
        }
        /// <summary>
        /// Hàm mã hóa dữ liệu
        /// </summary>
        /// <param name="plainText"></param>
        /// <returns></returns>
        public static string EncryptData(string plainText)
        {
            mCryptoService = new DESCryptoServiceProvider();
            mCryptoService.Mode = CipherMode.CBC;
            byte[] plainByte = ASCIIEncoding.ASCII.GetBytes(plainText);
            byte[] keyByte = GetLegalKey();

            // Set private key
            mCryptoService.Key = keyByte;
            SetLegalIV();

            // Encryptor object
            ICryptoTransform cryptoTransform = mCryptoService.CreateEncryptor();

            // Memory stream object
            MemoryStream ms = new MemoryStream();

            // Crpto stream object
            CryptoStream cs = new CryptoStream(ms, cryptoTransform,
                CryptoStreamMode.Write);

            // Write encrypted byte to memory stream
            cs.Write(plainByte, 0, plainByte.Length);
            cs.FlushFinalBlock();

            // Get the encrypted byte length
            byte[] cryptoByte = ms.ToArray();

            // Convert into base 64 to enable result to be used in Xml
            return Convert.ToBase64String(cryptoByte, 0, cryptoByte.GetLength(0));
        }
        /// <summary>
        /// Giải mã dữ liệu
        /// </summary>
        /// <param name="cryptoText"></param>
        /// <returns></returns>
        public static string DecryptData(string cryptoText)
        {
            // Convert from base 64 string to bytes
            try
            {
                byte[] cryptoByte = Convert.FromBase64String(cryptoText);

                byte[] keyByte = GetLegalKey();

                // Set private key
                mCryptoService.Key = keyByte;
                SetLegalIV();

                // Decryptor object
                ICryptoTransform cryptoTransform = mCryptoService.CreateDecryptor();
                // Memory stream object
                MemoryStream ms = new MemoryStream(cryptoByte, 0, cryptoByte.Length);

                // Crpto stream object
                CryptoStream cs = new CryptoStream(ms, cryptoTransform,
                    CryptoStreamMode.Read);

                // Get the result from the Crypto stream
                StreamReader sr = new StreamReader(cs);
                return sr.ReadToEnd();
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// Mã hóa mật khẩu truy cập
        /// </summary>
        /// <param name="plainText"></param>
        /// <returns></returns>
        public static string EncryptPassword(string plainText)
        {
            //Convert the string into a byte[]
            byte[] unicodeByte = Encoding.Unicode.GetBytes(plainText);
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] arrHashValue = md5.ComputeHash(unicodeByte);

            string strHashData = BitConverter.ToString(arrHashValue).ToLower();
            strHashData = strHashData.Replace("-", "");
            strHashData = strHashData.Replace("b", "a");
            strHashData = strHashData.Replace("t", "g");
            strHashData = strHashData.Replace("l", "h");
            strHashData = strHashData.Replace("m", "l");

            return strHashData;
        }
        
    }

    #endregion

}
