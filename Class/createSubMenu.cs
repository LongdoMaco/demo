using System;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Drawing;

namespace UNI.Class
{
	/// <summary>
	/// Summary description for createSubMenu.
	/// </summary>
	public class createSubMenu
	{
		public createSubMenu()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static void createMenu(Panel panel, string[] subName,
			string[] subLink, int indexLink)
		{
			for(int i  = 0; i < subName.Length; i++)
			{
				if(i == indexLink)
				{
					Panel temp = new Panel();
					temp.Height = 20;
					Label indexLabel = new Label();
					indexLabel.Text = subName[i];
					indexLabel.Font.Bold = true;
					indexLabel.ForeColor = Color.Red;
					indexLabel.Font.Underline = true;
					temp.Controls.Add(indexLabel);
					panel.Controls.Add(temp);
					
					continue;
				}
				Panel tempLink = new Panel();
				tempLink.Height = 20;
				HyperLink link = new HyperLink();
				link.Text = subName[i];
				link.NavigateUrl = subLink[i];
				tempLink.Controls.Add(link);
				panel.Controls.Add(tempLink);
				
			}
		}

		public static void createMenuNgang(Panel panel, string[] subName,
			string[] subLink, int indexLink)
		{
			
			for(int i  = 0; i < subName.Length; i++)
			{
				if(i != 0)
				{
					Label lab = new Label();
					lab.Text = "  |  ";
					lab.ForeColor = Color.Blue;
					lab.Font.Bold = true;
					panel.Controls.Add(lab);
				}

				if(i == indexLink)
				{
					Label indexLabel = new Label();
					indexLabel.Text = subName[i];
					indexLabel.Font.Bold = true;
					indexLabel.ForeColor = Color.Red;
					indexLabel.Font.Underline = true;
					panel.Controls.Add(indexLabel);
					
					continue;
				}
				
				HyperLink link = new HyperLink();
				link.Text = subName[i];
				link.NavigateUrl = subLink[i];
				panel.Controls.Add(link);
			}
		}
	}
}
