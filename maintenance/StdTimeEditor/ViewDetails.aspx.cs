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
    public partial class ViewDetails : System.Web.UI.Page
    {
         SqlCommand comm = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        private string CkEdit = string.Empty;
        private string ckmode = string.Empty;
        public string cktmp = "N";
        public string Location = "N";
        private double QtyIn = 0;
        private double QtyOut = 0;
        private double QtyBal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
               CkEdit = Request.QueryString["ProductionID"];
               ckmode = Request.QueryString["mode"];
                if (CkEdit != null)
                {
                    Session["ProductionID"] = "0";
                    if (ckmode == "Delete")
                    {
                      Session["ProductionID"] =CkEdit;
                      //Me.ClientScript.RegisterStartupScript(Me.GetType(), "myclose", "window.close();", True);
                      string msg = "<script language = javascript>window.close();</script>";
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", msg);
                    }
                }

            
        }
    }
}