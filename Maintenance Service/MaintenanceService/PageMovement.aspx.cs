using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraReports.UI;
using DevExpress.XtraPrinting;
using MaintenanceService.Report;


namespace MaintenanceService
{
    public partial class PageMovement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ASPxDateEdit1.Text = DateTime.Now.ToString("yyyy-MM-dd");
                ASPxDateEdit2.Text = DateTime.Now.ToString("yyyy-MM-dd");
                selectRP();
            }
        }


        private void selectRP()
        {
            string CHKselRP = Request.QueryString["selRP"] == null ? "" : Request.QueryString["selRP"].ToString();

            if (CHKselRP == "")
            {
                ASPxDateEdit1.Text = DateTime.Now.ToString("yyyy-MM-dd");
                ASPxDateEdit2.Text = DateTime.Now.ToString("yyyy-MM-dd");

            }
            else if (CHKselRP == "1")
            {
                string datefrom = Request.QueryString["datefrom"].Replace("A", "-");
                string dateto = Request.QueryString["dateto"].Replace("A", "-");

                ASPxDateEdit1.Text = datefrom;
                ASPxDateEdit2.Text = dateto;


                XtraReport report = new xr_MovementReport();
                ASPxDocumentViewer1.ReportTypeName = "StdTimeEditor.Report.xr_MovementReport";

                report.Parameters["parameter1"].Value = datefrom;
                report.Parameters["parameter2"].Value = dateto;

                report.Parameters["parameter1"].Visible = false;
                report.Parameters["parameter2"].Visible = false;


                ASPxDocumentViewer1.Report = report;
            }
        }



        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            try
            {

                ScriptManager.RegisterClientScriptBlock(Page, GetType(), "",
                    string.Format(
                        "window.open('../MN/PageMovement.aspx?datefrom={0}&dateto={1}&selRP={2}', '_parent');",
                        ASPxDateEdit1.Text.Substring(0, 10).Replace("-", "A"), ASPxDateEdit2.Text.Substring(0, 10).Replace("-", "A"),
                        "1"), true); //chk selRP

            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('The program has a problem, please contact department IT !')"), true);
            }

            //XtraReport report1 = new Reports.MovmentReport();
            //ASPxDocumentViewer1.ReportTypeName = "StdTimeEditor.Reports.MovmentReport.cs";
            //report1.Parameters["parameter1"].Value = "20220208";
            //report1.Parameters["parameter2"].Value = "20220208";
            //ASPxDocumentViewer1.Report = report1;
        }
    }
}