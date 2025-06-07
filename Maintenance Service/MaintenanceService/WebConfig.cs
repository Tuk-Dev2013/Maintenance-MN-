using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MaintenanceService
{
    public class WebConfig
    {

        public static string Getconnection()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["DBBarcode"].ConnectionString;
            //   return ConfigurationManager.AppSettings("DBConnectionString");
        }
    }
}