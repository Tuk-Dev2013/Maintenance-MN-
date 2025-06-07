using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MaintenanceService.Maintenance
{
    public partial class FrmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            
            }
        }
        protected void submitedC(Object sender, EventArgs e)
          {
              userid.Value = "";
              password.Value = "";
          }

        protected void submited(Object sender, EventArgs e)
        {
   
            if (userid.Value=="")
            {
                lblme1.Visible = true;
                return;
            }
            if (password.Value == "")
            {
                lblme2.Visible = true;
                return;
            }
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            try
            {

                lblme1.Visible = true;
                lblme2.Visible = true;
                Cmd = new System.Data.SqlClient.SqlCommand(" SELECT  UserID, Username,FullName, Password, Email, Position, Dept, CreatedDate, Status, ManagerName,ManagerMail,Grouppolicy"
              + "  FROM Tb_Users WHERE Username = '" + userid.Value + "' AND Password = '" + password.Value + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                while (rs.Read())
                {
                    lblme1.Visible = false;
                    lblme2.Visible = false;
                    Session["Userid"] = rs["UserID"].ToString();
                    Session["Username"] = rs["FullName"].ToString();
                    Session["Email"] = rs["Email"].ToString();
                    Session["Dept"] = rs["Dept"].ToString();
                    Session["Position"] = rs["Position"].ToString();
                    Session["ManagerName"] = rs["ManagerName"].ToString();
                    Session["ManagerMail"] = rs["ManagerMail"].ToString();
                    Session["Grouppolicy"] = rs["Grouppolicy"].ToString();
                    Session["CheckUPdate"] = "Save";
                    if (Session["Grouppolicy"].ToString() == "User")
                    {
                        Response.Redirect("~/Maintenance/FrmRequest.aspx");
                    }
                    else if (Session["Grouppolicy"].ToString() == "MN")
                    {
                        Response.Redirect("~/Maintenance/MaintenanceService.aspx");
                    }
                    else if (Session["Grouppolicy"].ToString() == "Manager")
                    {
                        Response.Redirect("~/Maintenance/ManagerTasks.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
            }
            conn.Close();
            conn.Dispose();
        }
    }
}