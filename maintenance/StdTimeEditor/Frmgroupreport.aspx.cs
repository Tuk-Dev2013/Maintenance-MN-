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
using StdTimeEditor.Report;


namespace StdTimeEditor
{
    public partial class Frmgroupreport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (!IsPostBack)
            {
                lblname.Text = Session["GroupReport"].ToString();
                CallRpt();
             }
        }

        private void CallRpt()
        {

            XtraReport report = new ReportGroup();
            ASPxDocumentViewer1.ReportTypeName = "StdTimeEditor.Report.ReportGroup";

            report.Parameters["StatusType"].Value = lblname.Text;


            report.Parameters["StatusType"].Visible = false;



            ASPxDocumentViewer1.Report = report;
        }
    }
}