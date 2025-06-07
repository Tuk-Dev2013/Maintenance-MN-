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

namespace MaintenanceService
{
    public partial class PageStockbal : System.Web.UI.Page
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
  
        public string cktmp = "Y";
        private string CkEdit = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (!IsPostBack)
            {
                CkEdit = Request.QueryString["Itemcode"];
                if (CkEdit != null)
                {
                    this.bntsave.Visible = false;
                    this.bntupdate.Visible = true;
                    this.bntdelete.Visible = true;
                    this.txtcode.Enabled = false; 
                    CallViewEdit(CkEdit);
                    return;
                    //ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('Please select item for delete.')"), true);
                }
                {
                    this.txtcode.Enabled = true; 
                    this.bntsave.Visible = true;
                }
            }

        }

        #region "CallViewEdit"
        private void CallViewEdit(String ID)
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            //conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" SELECT Itemcode, ItemName, Model, Location, MaxItem, MinItem, QtyIn, QtyOut, QtyBal, Createdate FROM   [dbo].[tb_StockBal]  Where Itemcode='" + ID + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                while (rs.Read())
                {
                  this.txtcode.Text = rs["Itemcode"].ToString();
                  this.txtitemname.Text = rs["ItemName"].ToString();
                  this.txtmodel.Text = rs["Model"].ToString();
                  this.txtlocaion.Text = rs["Location"].ToString();
                  this.txtmax.Text = rs["MaxItem"].ToString();
                  this.txtmin.Text = rs["MinItem"].ToString();
                }
            }
            catch (Exception ex)
            {
               
            }
            conn.Close();
            conn.Dispose();
        }
        #endregion

        #region "CheckItemcode"
        private void CheckItemcode(String Itemcode)
        {

            cktmp = "Y";
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand("  SELECT Itemcode, ItemName  "
              + "  FROM   [dbo].[tb_StockBal]  where  Itemcode='" + Itemcode + "' ", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                while (rs.Read())
                {
                    cktmp = "N";
                }
            }
            catch (Exception ex)
            {
            }
            conn.Close();
            conn.Dispose();
        
        }
        #endregion

        protected void bntsave_Click(object sender, EventArgs e)
        {
            if (this.txtcode.Text == "")
            {
                lblname.Visible = true;
                return;
            }
            if (txtitemname.Text == "") 
            {
                lblname.Visible = false;
                lblitemname.Visible = true;
                return;
            }

            // ตรวจสอบรหัสซ้ำ
            CheckItemcode(txtcode.Text.Trim());
            if (cktmp == "Y")
            {

                System.Data.SqlClient.SqlCommand Cmd;
                System.Data.SqlClient.SqlDataReader rs;
                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
                // conn.Open();
                try
                {
                    Cmd = new System.Data.SqlClient.SqlCommand(" Insert into [dbo].[tb_StockBal](Itemcode, ItemName, Model, Location, MaxItem, MinItem, QtyIn, QtyOut, QtyBal, Createdate) "
                        + "VALUES ('" + txtcode.Text.Trim() + "', '" + txtitemname.Text.Trim() + "', '" + txtmodel.Text.Trim() + "','" + txtlocaion.Text.Trim() + "',isnull(" + txtmax.Text + ",0),isnull(" + txtmin.Text + ",0),0,0,0,Getdate())", conn);
                    conn.Open();
                    rs = Cmd.ExecuteReader();

                }
                catch (Exception ex)
                {
                }
                conn.Close();
                conn.Dispose();


                txtcode.Text = "";
                txtitemname.Text = "";
                txtmodel.Text = "";
                txtlocaion.Text = "";
                txtmax.Text = "";
                txtmin.Text = "";
                lblname.Visible = false;
                lblitemname.Visible = false;
                gvStdTime.DataBind();
            }
            else
            {
   //      ScriptManager.RegisterClientScriptBlock(this, GetType(), "",
     //                      string.Format("alert('คุณป้อนรหัส ItemCode ซ้ำ กรุณาป้อนใหม่')"), true);
                lblname.Text = "คุณป้อนรหัส ItemCode ซ้ำ กรุณาป้อนใหม่";
                lblname.Visible = true;
            }
      

        }

        protected void bntcancel_Click(object sender, EventArgs e)
        {

            txtcode.Text = "";
            txtitemname.Text = "";
            txtmodel.Text = "";
            txtlocaion.Text = "";
            txtmax.Text = "0";
            txtmin.Text = "0";
            lblname.Text = "***";
            lblname.Visible = false;
            lblitemname.Visible = false;
            bntsave.Visible = true;
            bntupdate.Visible = false;
            bntdelete.Visible = false;
            this.txtcode.Enabled = true; 
            CkEdit = "";
        }

        protected void bntdelete_Click(object sender, EventArgs e)
        {
   
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" Delete  [dbo].[tb_StockBal]  Where Itemcode='"+txtcode.Text.Trim()+"'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
            conn.Close();
            conn.Dispose();

              txtcode.Text = "";
            txtitemname.Text = "";
            txtmodel.Text = "";
            txtlocaion.Text = "";
            txtmax.Text = "0";
            txtmin.Text = "0";
            lblname.Text = "***";
            lblname.Visible = false;
            lblitemname.Visible = false;
            bntsave.Visible = true;
            bntupdate.Visible = false;
            bntdelete.Visible = false;
            this.txtcode.Enabled = true;
            gvStdTime.DataBind();
        }

        protected void bntupdate_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_StockBal]  SET ItemName = '" + txtitemname.Text.Trim() + "',Model='" + txtmodel.Text.Trim() + "',Location='" + txtlocaion.Text.Trim() + "',MaxItem='" + txtmax.Text.Trim() + "'"
                    + ",MinItem='" + txtmin.Text.Trim() + "',Createdate=Getdate() Where Itemcode='"+ this.txtcode.Text.Trim()+"'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
            conn.Close();
            conn.Dispose();

            txtcode.Text = "";
            txtitemname.Text = "";
            txtmodel.Text = "";
            txtlocaion.Text = "";
            txtmax.Text = "0";
            txtmin.Text = "0";
            lblname.Text = "***";
            lblname.Visible = false;
            lblitemname.Visible = false;
            bntsave.Visible = true;
            bntupdate.Visible = false;
            bntdelete.Visible = false;
            this.txtcode.Enabled = true;
            gvStdTime.DataBind();
        }
    }
}