using System;
using System.Text;
using System.Security.Cryptography;
namespace UNI.Class
{
	/// <summary>
	/// Summary description for Security.
	/// </summary>
	public class Security
	{
		public static string Encrypt(string str){
			byte[] m_byPassword = new UnicodeEncoding().GetBytes(str);
			byte[] hashString  = ((HashAlgorithm) CryptoConfig.CreateFromName("MD5")).ComputeHash(m_byPassword);
			return BitConverter.ToString(hashString);
		}

	}
}
