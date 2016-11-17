using System;
using System.Data.SqlClient;
using System.Data;

namespace UNI.Class
{
	/// <summary>
	/// Summary description for sqlCommandClass.
	/// </summary>
	public class sqlCommandClass
	{
		public sqlCommandClass()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		//-------------------------------------------------------------
		// Store Procedure không có tham số
		public static void executeSqlCommand(string strConnect,
			string storeProcName)
		{
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;

			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
			}
			finally
			{
				sqlConnection.Close();
			}
		}


		//------------------------------------------------------------ 
		// Store Procedure có tham số kiểu Int
		public static void executeSqlCommand(string strConnect,
			string storeProcName, string[] paramNameInt, int[] valuesInt)
		{
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramNameInt.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameInt[b],
				SqlDbType.Int)).Value = valuesInt[b];
			}
			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
			}
			
			finally
			{
				sqlConnection.Close();
			}
		}
		
		//------------------------------------------------------------ 
		// Store Procedure có tham số kiểu NVarchar
		public static void executeSqlCommand(string strConnect,
			string storeProcName, string[] paramNameNVarChar,
			string[] valuesNVarChar)
		{
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramNameNVarChar.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameNVarChar[b],
					SqlDbType.NVarChar)).Value = valuesNVarChar[b];
			}
			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
			}
			
			finally
			{
				sqlConnection.Close();
			}
		}

		//-------------------------------------------------------------
		// Store Procedure có tham số kiểu Int, kiểu NVarChar
		public static void executeSqlCommand(string strConnect,
			string storeProcName, string[] paramNameInt, int[] valueInt	,
			string[] paramNameNVarChar, string[] valueNVarChar)
		{
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramNameInt.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameInt[b],
				SqlDbType.Int)).Value = valueInt[b];
			}

			for(byte b = 0; b < paramNameNVarChar.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameNVarChar[b],
				SqlDbType.NVarChar)).Value =valueNVarChar[b];

				
			}
			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
			}
			
			finally
			{
				sqlConnection.Close();
			}
		}
		
		//-------------------------------------------------------------
		// Store Procedure không có tham số , trả về tham số Output
		// kiểu int
		public static int executeSqlCommandIntOutput(string strConnect,
			string storeProcName, string outputParam)
		{
			int returnValue = 0;
			
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;
			
			SqlParameter sqlParam = new SqlParameter(outputParam, SqlDbType.Int);
			sqlParam.Direction = ParameterDirection.Output;
			sqlCommand.Parameters.Add(sqlParam);

			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
				returnValue = Int32.Parse(sqlParam.Value.ToString());
			}
			
			finally
			{
				sqlConnection.Close();
			}
			
			return returnValue;
		}
		
		//------------------------------------------------------------ 
		// Store Procedure có tham số kiểu Int , trả về tham số
		// kiểu int
		public static int executeSqlCommandIntOutput(string strConnect,
			string storeProcName, string[] paramNameInt, int[] valuesInt,
			string outputParam)
		{
			int returnValue = 0;
		
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramNameInt.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameInt[b],
					SqlDbType.Int)).Value = valuesInt[b];
			}
			
			SqlParameter sqlParam = new SqlParameter(outputParam, SqlDbType.Int);
			sqlParam.Direction = ParameterDirection.Output;
			
			sqlCommand.Parameters.Add(sqlParam);
			
			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
				returnValue = Int32.Parse(sqlParam.Value.ToString());
			}
			
			finally
			{
				sqlConnection.Close();
			}
			
			return returnValue;
		}
		
		//------------------------------------------------------------ 
		// Store Procedure có tham số kiểu NVarchar , trả về tham
		// số kiểu int
		public static int executeSqlCommandIntOutput(string strConnect,
			string storeProcName, string[] paramNameNVarChar,
			string[] valuesNVarChar, string outputParam)
		{
			int returnValue = 0;
		
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramNameNVarChar.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameNVarChar[b],
					SqlDbType.NVarChar)).Value = valuesNVarChar[b];
			}
			
			SqlParameter sqlParam = new SqlParameter(outputParam, SqlDbType.Int);
			sqlParam.Direction = ParameterDirection.Output;
			
			sqlCommand.Parameters.Add(sqlParam);
			
			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
				returnValue = Int32.Parse(sqlParam.Value.ToString());
			}
			
			finally
			{
				sqlConnection.Close();
			}
			
			return returnValue;
		}
		
		//-------------------------------------------------------------
		// Store Procedure có tham số kiểu Int, kiểu NVarChar ,
		// trả về tham số kiểu int
		public static int executeSqlCommandIntOutput(string strConnect,
			string storeProcName, string[] paramNameInt, int[] valueInt	,
			string[] paramNameNVarChar, string[] valueNVarChar,
			string outputParam)
		{
			int returnValue = 0;
			
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramNameInt.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameInt[b],
					SqlDbType.Int)).Value = valueInt[b];
			}

			for(byte b = 0; b < paramNameNVarChar.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameNVarChar[b],
					SqlDbType.NVarChar)).Value =valueNVarChar[b];
			}
			
			SqlParameter sqlParam = new SqlParameter(outputParam, SqlDbType.Int);
			sqlParam.Direction = ParameterDirection.Output;
			
			sqlCommand.Parameters.Add(sqlParam);
			
			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
				returnValue = Int32.Parse(sqlParam.Value.ToString());
			}
			
			finally
			{
				sqlConnection.Close();
			}
			
			return returnValue;
		}
		
//---------------------------------------------------------------------
//---------------------------------------------------------------------

/*		//-------------------------------------------------------------
		// Store Procedure không có tham số , trả về tham số Output
		// kiểu NVarChar
		public static string executeSqlCommandNVarCharOutput(string strConnect,
			string storeProcName, string outputParam)
		{
			string returnValue = "";
			
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;
			
			SqlParameter sqlParam = new SqlParameter(outputParam, SqlDbType.NVarChar);
			sqlParam.Direction = ParameterDirection.Output;
			sqlCommand.Parameters.Add(sqlParam);

			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
				returnValue = sqlParam.Value.ToString();
			}
			catch(Exception ex)
			{
				throw new Exception();
			}
			finally
			{
				sqlConnection.Close();
			}
			
			return returnValue;
		}
		
		//------------------------------------------------------------ 
		// Store Procedure có tham số kiểu Int , trả về tham số
		// kiểu NVarChar
		public static string executeSqlCommandNVarCharOutput(string strConnect,
			string storeProcName, string[] paramNameInt, int[] valuesInt,
			string outputParam)
		{
			string returnValue = "";
		
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramNameInt.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameInt[b],
					SqlDbType.Int)).Value = valuesInt[b];
			}
			
			SqlParameter sqlParam = new SqlParameter(outputParam, SqlDbType.NVarChar);
			sqlParam.Direction = ParameterDirection.Output;
			
			sqlCommand.Parameters.Add(sqlParam);
			
			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
				returnValue = sqlParam.Value.ToString();
			}
			catch(Exception ex)
			{
				throw new Exception();
			}
			finally
			{
				sqlConnection.Close();
			}
			
			return returnValue;
		}
		
		//------------------------------------------------------------ 
		// Store Procedure có tham số kiểu NVarchar , trả về tham
		// số kiểu NVarChar
		public static string executeSqlCommandNVarCharOutput(string strConnect,
			string storeProcName, string[] paramNameNVarChar,
			string[] valuesNVarChar, string outputParam)
		{
			string returnValue = "";
		
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramNameNVarChar.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameNVarChar[b],
					SqlDbType.NVarChar)).Value = valuesNVarChar[b];
			}
			
			SqlParameter sqlParam = new SqlParameter(outputParam, SqlDbType.NVarChar);
			sqlCommand.Parameters.Add(sqlParam);
			sqlParam.Direction = ParameterDirection.Output;
			
			try
			{
				sqlConnection.Open();
				returnValue +="-" + "Da thuc hien";
				sqlCommand.ExecuteNonQuery();
				returnValue = sqlParam.Value.ToString();
			}
			catch(Exception ex)
			{
				return returnValue += "" + ex.Message + ex.ToString();
			}
			finally
			{
				sqlConnection.Close();
			}
			
			return returnValue;
		}
		
		//-------------------------------------------------------------
		// Store Procedure có tham số kiểu Int, kiểu NVarChar ,
		// trả về tham số kiểu NVarChar
		public static string executeSqlCommandNVarCharOutput(string strConnect,
			string storeProcName, string[] paramNameInt, int[] valueInt	,
			string[] paramNameNVarChar, string[] valueNVarChar,
			string outputParam)
		{
			string returnValue = "";
			
			storeProcName = "[" + storeProcName + "]";

			SqlConnection sqlConnection = new SqlConnection(strConnect);
			SqlCommand sqlCommand = new SqlCommand(storeProcName, sqlConnection);
			sqlCommand.CommandType = CommandType.StoredProcedure;

			for(byte b = 0; b < paramNameInt.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameInt[b],
					SqlDbType.Int)).Value = valueInt[b];
			}

			for(byte b = 0; b < paramNameNVarChar.Length; b++)
			{
				sqlCommand.Parameters.Add(new SqlParameter(paramNameNVarChar[b],
					SqlDbType.NVarChar)).Value =valueNVarChar[b];
			}
			
			SqlParameter sqlParam = new SqlParameter(outputParam, SqlDbType.NVarChar);
			sqlCommand.Parameters.Add(sqlParam);
			sqlParam.Direction = ParameterDirection.Output;
			
			try
			{
				sqlConnection.Open();
				sqlCommand.ExecuteNonQuery();
				returnValue = sqlParam.Value.ToString();
			}
			catch(Exception ex)
			{
				throw new Exception();
			}
			finally
			{
				sqlConnection.Close();
			}
			
			return returnValue;
		}
*/	}
}
