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
using DevExpress.XtraReports.UI;
using DevExpress.XtraPrinting;
using MaintenanceService.Report;


namespace MaintenanceService.Maintenance
{
    public partial class FrmMNReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String IssueNo = Request.QueryString["id"];
                lblissueno.Text = IssueNo;
                if ((Session["Grouppolicy"].ToString() == "User") || (Session["Grouppolicy"].ToString() == "Manager"))
                {
                    if (Session["Username"].ToString() != "ไกรศักดิ์ ตั้งมั่นธนบวร")
                    {
                        Response.Redirect("~/Maintenance/FraMain.aspx");
                    }
                }

                   selectRP();
            }

        }

        private void selectRP()
        {
            XtraReport report = new MNIsoReport();
            ASPxDocumentViewer1.ReportTypeName = "MaintenanceService.Report.MNIsoReport";

            report.Parameters["parameter1"].Value = lblissueno.Text.Trim();

          report.Parameters["parameter1"].Visible = false;


            ASPxDocumentViewer1.Report = report;
        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

   
    }
}