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

namespace MaintenanceService.MasterPages
{
    public partial class Maintenance : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblName.Text = "User :" +Session["Username"].ToString();
                lblDept.Text ="Dept :" + Session["Dept"].ToString();
               
            }
        }
    }
}