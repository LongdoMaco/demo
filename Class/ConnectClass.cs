using System;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Web.UI.WebControls;
using System.IO;

namespace UNI.Class
{
	/// <summary>
	/// Summary description for ConnectClass.
	/// </summary>
	public class ConnectClass
	{
		public ConnectClass()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static DataSet getDataSet(string strDSN, string strQuery)
		{
			OdbcConnection connection = new OdbcConnection(strDSN);
			OdbcCommand command = new OdbcCommand(strQuery, connection);
			command.CommandType = CommandType.Text;
			OdbcDataAdapter dataAdapter = new OdbcDataAdapter(command);
			DataSet dataSet = new DataSet();
			try
			{
				connection.Open();
				dataAdapter.Fill(dataSet);
			}
			finally
			{
				connection.Close();
			}

			return dataSet;
		}

		public static string getTenNguoiCN(string strDataGrid)
		{
			string strReturn = "";
			try
			{
				string[] arrayStr = strDataGrid.Split('/');

				for(int i = 0; i < arrayStr.Length; i++)
				{
					string str = arrayStr[i];
					int index = 0;
					for(int k = 0; k < str.Length; k++)
					{
						string flash = str.Substring(k, 1);
						if(flash.Equals("="))
						{
							index = k + 1;
							break;
						}
					}

					str = str.Substring(index);

					strReturn += str + "/";
				
				}
				strReturn = strReturn.Substring(0, strReturn.Length - 1);
			}
			catch(Exception ex)
			{
				strReturn = "";
			}
			return strReturn;
		}

		public static bool getChuongTrinh(string strEquals, string[] array)
		{
			for(int i = 0; i < array.Length; i++)
			{
				string sosanh = array[i];
				if(sosanh == null)
				{
					continue;
				}
				if(sosanh.Equals(strEquals))
				{
					return false;
				}
			}
			return true;
		}

		public static DropDownList filterRow(DataSet dataSet,
			string column)
		{
			DropDownList dropList = new DropDownList();
			int length = dataSet.Tables[0].Rows.Count;
			if(length > 0)
			{
				string firstItem = dataSet.Tables[0].Rows[0][column].ToString();
				dropList.Items.Add(firstItem);

				for(int i = 0; i < length; i++)
				{
					string strEquals = dataSet.Tables[0].Rows[i][column].ToString();
					for(int k = 0; k < dropList.Items.Count; k++)
					{
						string strDropList = dropList.Items[k].Text;
						if(!strDropList.Equals(strEquals))
						{
							dropList.Items.Add(strEquals);
						}
					}
				}
			}
			return dropList;
		}

		public static string getDate(string date)
		{
			string[] arrayDate = date.Split(' ');
			string strReturn = arrayDate[0];

			return strReturn;
		}

		public static string convertDateVN(string date)
		{
			string str = "";
			try
			{
				string[] arrayDate = date.Split(' ');
				string strReturn = arrayDate[0];
				if(strReturn.Length != 0)
				{
					string[] dateConvert = strReturn.Split('/');
					str = dateConvert[1] + "/" + dateConvert[0] + "/" + dateConvert[2];
				}
			}
			catch(Exception ex)
			{
				str = "";
			}

			return str;
		}

		public static string getDate()
		{
			int day = System.DateTime.Now.Day;
			string date = "";
			if(day < 10)
			{
				date = "0" + day;
			}
			else
			{
				date = day.ToString();
			}
			int month = System.DateTime.Now.Month;
			string thang = "";
			if(month < 10)
			{
				thang = "0" + month;
			}
			else
			{
				thang = month.ToString();
			}
			string year = System.DateTime.Now.Year.ToString();

			string strReturn = year + "-" + thang + "-" + date;
			return strReturn;
		}

		public static string getDate(DateTime dateTime)
		{
			int day = dateTime.Day;
			string date = "";
			if(day < 10)
			{
				date = "0" + day;
			}
			else
			{
				date = day.ToString();
			}
			int month = dateTime.Month;
			string thang = "";
			if(month < 10)
			{
				thang = "0" + month;
			}
			else
			{
				thang = month.ToString();
			}
			string year = dateTime.Year.ToString();

			string strReturn = year + "-" + thang + "-" + date;
			return strReturn;
		}

		public static void addFileName(string path, string file, string ID,
			Panel panel )
		{
			try
			{
				string[] arrayfile = Directory.GetFiles(path+ID);
	
				string temp;
				for(int i = 0 ;i<arrayfile.Length;i++)
				{
					Panel p = new Panel();
					HyperLink hy = new HyperLink();
					temp = arrayfile[i];
					temp = temp.Remove(0,path.Length+ID.Length+1);
					hy.Text = temp;
					hy.NavigateUrl = file+ID+"\\"+temp;
					p.Controls.Add(hy);
					panel.Controls.Add(p);
				}
			}
			catch(Exception ex)
			{
			}
		}

		public static string trimAddBody(string body)
		{
			string str = "";
			string[] trim = body.Split(' ');

			int length = trim.Length;

			for ( int i = 0; i < length - 1; i++)
			{
				str += trim[i] + " ";
			}

			return str + "...";
		}
	}
}
