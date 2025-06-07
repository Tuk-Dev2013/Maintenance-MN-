using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Threading;
using System.Diagnostics;
using System.Linq;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StdTimeEditor
{
    public partial class FrmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if ((txtusername.Text == "") || (txtpassword.Text == ""))
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "",
                     string.Format("alert('คุณป้อนรหัส Username และ password ก่อน')"), true);
                return;
            }

            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            try
            {


                Cmd = new System.Data.SqlClient.SqlCommand("  select Username,Password,ActiveDel "
              + "  FROM   [dbo].[tb_Emp]  WHERE Username = '" + txtusername.Text.Trim() + "' AND Password = '" + txtpassword.Text.Trim() + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                while (rs.Read())
                {


                    Session["Username"] = rs["Username"].ToString();
                    Session["ActiveDel"] = rs["ActiveDel"].ToString();
                    if (Session["Page"].ToString()=="1")
                    {
                    Response.Redirect("~/PageStockbal.aspx");
                    }
                    else if (Session["Page"].ToString() == "2")
                    {
                        Response.Redirect("~/PageOrder.aspx");
                    }
                    else if (Session["Page"].ToString() == "3")
                    {
                        Response.Redirect("~/PageBarcodeIN.aspx");
                    }
                    else if (Session["Page"].ToString() == "4")
                    {
                        Response.Redirect("~/PageBarcodeOut.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/PageStockbal.aspx");
                    }
                }
                txtusername.Text = "";
                txtpassword.Text = "";
                this.lblme.Text = "คุณป้อนข้อมูลไม่ถูกต้อง หรือไม่มีสิทธิ์ คุณไม่สามารถดำเนินการได้ กรุณาติดต่อ IT....";
            }
            catch (Exception ex)
            {
            }
            conn.Close();
            conn.Dispose();
        }
    }
}