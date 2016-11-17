using System;
using System.Messaging;
using System.Web.Mail;
using System.Text;

namespace WebNT.ThuTinDienTu
{
	/// <summary>
	/// Summary description for SendAndReceiveMail.
	/// </summary>
	public class SendMail
	{
		const string crlf = "\r\n";

		public void sendMail(string server, string from, string to,
			string cc, string bcc, string subject, string body,
			string[] filePath)
		{
			MailMessage mail = new MailMessage();
			MailAttachment mailAttach;

			SmtpMail.SmtpServer = server;

			mail.From = from;
			mail.To = to;
			if(!cc.Equals(""))
			{
				mail.Cc = cc;
			}
			if(!bcc.Equals(""))
			{
				mail.Bcc = bcc;
			}
			mail.Subject = subject;
			mail.Body = body;
			mail.Priority = MailPriority.Normal;
			mail.BodyEncoding = Encoding.UTF8;
			mail.BodyFormat = MailFormat.Text;

			if(filePath != null)
			{
				if((filePath.Length > 0))
				{
					for(int i = 0; i < filePath.Length; i++)
					{
						mailAttach = new System.Web.Mail.MailAttachment(filePath[i]);
						mail.Attachments.Add(mailAttach);
						mailAttach = null;
					}
				}
			}

			try
			{
				SmtpMail.Send(mail);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}

//----------------------------------------------------------------------------
//Overload method SendMail

		public void sendMail(string server, string from, string to,
			string cc, string subject, string body)
		{
			MailMessage mail = new MailMessage();

			SmtpMail.SmtpServer = server;

			mail.From = from;
			mail.To = to;
			if(!cc.Equals(""))
			{
				mail.Cc = cc;
			}
			mail.Subject = subject;
			mail.Body = body;
			mail.Priority = MailPriority.Normal;
			mail.BodyEncoding = Encoding.UTF8;
			mail.BodyFormat = MailFormat.Text;

			try
			{
				SmtpMail.Send(mail);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message);
			}
		}


	}
}
