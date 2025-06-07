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

namespace MaintenanceService.Maintenance
{
    public partial class FrmCheckStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["CheckUPdate"] = "Save";
                String IssueNo = Request.QueryString["Sent"];
                if (IssueNo == "SentEmail")
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('Send Completed....')"), true);
                }
                if ((Session["Grouppolicy"].ToString() == "MN") || (Session["Grouppolicy"].ToString() == "Manager"))
                {
                    Response.Redirect("~/Maintenance/FraMain.aspx");
                }
            }

        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            var tmpstatus = e.GetValue("Status");

            if (e.DataColumn.FieldName == "Status")
            {

                  if (tmpstatus.ToString() == "Requester Recipient")
                  {
                    e.Cell.BackColor = Color.Yellow;
                    e.Cell.Font.Bold = true;
                  }
                  else if (tmpstatus.ToString() == "On Process")
                  {
                      e.Cell.BackColor = Color.Orange;
                      e.Cell.Font.Bold = true;
                  }
                  else if (tmpstatus.ToString() == "Pending")
                {
                    e.Cell.BackColor = Color.PowderBlue;
                      e.Cell.Font.Bold = true;
                }
                else if (tmpstatus.ToString() == "Finished")
                {
                    e.Cell.BackColor = Color.Green;
                    e.Cell.Font.Bold = true;
                }
                else if (tmpstatus.ToString() == "Reject")
                {
                    e.Cell.BackColor = Color.Red;
                    e.Cell.Font.Bold = true;
                }
            }
        }
    }
}