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
using System.Xml;
namespace StdTimeEditor
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
                     if (Session["Username"] != null)
                        {
                            this.bntsave.Visible = false;
                            this.bntupdate.Visible = true;
                            this.bntdelete.Visible = true;
                            this.txtcode.Enabled = false; 
                             CallViewEdit(CkEdit);
                              return;
                        }
                      else
                     {
                         Session["Page"] = "1";
                         Response.Redirect("~/FrmLogin.aspx");
                     }
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
         // DropDownList
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            //conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" SELECT Statustype,Itemcode, ItemName, Model, Location, MaxItem, MinItem, QtyIn, QtyOut, QtyBal, Createdate,Price FROM   [dbo].[tb_StockBal]  Where Itemcode='" + ID + "'", conn);
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
                  this.txtprice.Text = rs["Price"].ToString();
                  this.txtbal.Text = rs["QtyBal"].ToString();
                  string tempstr = rs["Statustype"].ToString();

                  this.DropDownList1.SelectedValue = tempstr;

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
                    Cmd = new System.Data.SqlClient.SqlCommand(" Insert into [dbo].[tb_StockBal](Itemcode, ItemName, Model, Location, MaxItem, MinItem, QtyIn, QtyOut, QtyBal, Createdate,Price,Statustype) "
                        + "VALUES ('" + txtcode.Text.Trim() + "', '" + txtitemname.Text.Trim() + "', '" + txtmodel.Text.Trim() + "','" + txtlocaion.Text.Trim() + "',isnull(" + txtmax.Text + ",0),isnull(" + txtmin.Text + ",0),isnull(" + txtbal.Text + ",0),0,isnull(" + txtbal.Text + ",0),Getdate(),isnull(" + this.txtprice.Text + ",0),'" + this.DropDownList1.Text + "')", conn);
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
                txtbal.Text = "";
                txtprice.Text = "";
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
            txtbal.Text = "0";
            txtprice.Text = "0";
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
            txtbal.Text = "0";
            txtmin.Text = "0";
            txtprice.Text = "0";
            lblname.Text = "***";
            lblname.Visible = false;
            lblitemname.Visible = false;
            bntsave.Visible = true;
            bntupdate.Visible = false;
            bntdelete.Visible = false;
            this.txtcode.Enabled = true;
            gvStdTime.DataBind();

        }

        #region " updateinout()"
        private void  updateinout(string tmpcode)
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_StockBal]  SET QtyIn=(select isnull(sum(qtyin),0)*(-1)  from [dbo].[tb_StockMov] where ItemCode='" + tmpcode + "' and qtyin<0)+QtyBal,QtyOut=(select isnull(sum(qtyin),0) from [dbo].[tb_StockMov] where ItemCode='" + tmpcode + "' and qtyin<0) Where Itemcode='" + tmpcode + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
            conn.Close();
            conn.Dispose();
        }
        #endregion

        protected void bntupdate_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_StockBal]  SET ItemName = '" + txtitemname.Text.Trim() + "',Model='" + txtmodel.Text.Trim() + "',Location='" + txtlocaion.Text.Trim() + "',MaxItem='" + txtmax.Text.Trim() + "',QtyBal='" + txtbal.Text.Trim() + "'"
                    + ",StatusType='" + DropDownList1.Text + "',MinItem='" + txtmin.Text.Trim() + "',Price='" + this.txtprice.Text.Trim() + "',Createdate=Getdate() Where Itemcode='" + this.txtcode.Text.Trim() + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
            conn.Close();
            conn.Dispose();

            updateinout(txtcode.Text.Trim());

            txtcode.Text = "";
            txtitemname.Text = "";
            txtmodel.Text = "";
            txtlocaion.Text = "";
            txtmax.Text = "0";
            txtbal.Text = "0";
            txtmin.Text = "0";
            txtprice.Text = "0";
            lblname.Text = "***";
            lblname.Visible = false;
            lblitemname.Visible = false;
            bntsave.Visible = true;
            bntupdate.Visible = false;
            bntdelete.Visible = false;
            this.txtcode.Enabled = true;
            gvStdTime.DataBind();
            txtbal.Text = "0";
        }

        protected void bntgroup_Click(object sender, EventArgs e)
        {
            Session["GroupReport"] = DropDownList1.Text;
            ScriptManager.RegisterClientScriptBlock(Page, GetType(), "",
              string.Format(
                  "window.open('../MN/Frmgroupreport.aspx', '_blank');",
                  "0", "3"), true);
        }

        protected void bntdelete0_Click(object sender, EventArgs e)
        {

        }
    }
}