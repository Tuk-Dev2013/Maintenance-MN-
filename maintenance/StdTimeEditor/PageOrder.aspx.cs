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
    public partial class PageOrder : System.Web.UI.Page
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
     

        protected void alert(string pv_msg)
        {
            string msg = "<script language = javascript>" +
                            " alert('" + pv_msg + "')" +
                            "</script>";
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", msg);
        }
 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            
                ASPxDateEdit1.Text = DateTime.Now.ToString("yyyy-MM-dd");
                ASPxDateEdit2.Text = DateTime.Now.AddDays(30).ToString("yyyy-MM-dd");
                // btnSave.Visible = true;  ProductionID
                bntdelete.Visible = false;
                lbldelete.Visible = false;
                bntcancel.Visible = false;
                txtbarcode.Enabled = true;
                txtqty.Enabled = true;

                CkEdit = Request.QueryString["ProductionID"];
               ckmode = Request.QueryString["mode"];
                if (CkEdit != null)
                {
                    if (ckmode == "Delete")
                    {
                        if (Session["Username"] != null)
                        {
                            txtbarcode.Enabled = false;
                            txtqty.Enabled = false;
                            //  btnSave.Visible = false;
                            lbldelete.Visible = true;
                            bntdelete.Visible = true;
                            bntcancel.Visible = true;
                            CallSearchDelete(CkEdit);
                        }
                        else
                        {
                            Session["Page"] = "2";
                            Response.Redirect("~/FrmLogin.aspx");
                        }

                    }
                }

            }
        }

        #region "CallSearchDelete"
        private void CallSearchDelete(String tmpID)
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            //conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" SELECT * FROM    [dbo].[ProductionOrder]  Where ProductionID=" + tmpID + "", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                while (rs.Read())
                {
                    this.txtbarcode.Text = rs["ItemCode"].ToString();
                    this.txtname.Text = rs["ItemName"].ToString();
                    this.txtqty.Text = rs["OrderQty"].ToString();
                    this.txtremark.Text = rs["Remark"].ToString();
                    this.ASPxDateEdit1.Text = Convert.ToDateTime(rs["OrderDate"].ToString()).ToString("yyyy-MM-dd"); 
                    this.ASPxDateEdit2.Text = Convert.ToDateTime(rs["ReceivedDate"].ToString()).ToString("yyyy-MM-dd");
                }
            }
            catch (Exception ex)
            {

            }
            conn.Close();
            conn.Dispose();
        }
        #endregion

        #region " Callsearc()"
        private void Callsearc()
        {
            btnSave.Enabled = false;
            cktmp = "N";
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            //conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" SELECT Itemcode, ItemName, Model, Location, MaxItem, MinItem, QtyIn, QtyOut, QtyBal FROM   [dbo].[tb_StockBal]  Where Itemcode='" + this.txtbarcode.Text.Trim() + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                while (rs.Read())
                {
                    btnSave.Enabled = true;
                    cktmp = "Y";
                    this.txtname.Text = rs["ItemName"].ToString();
                    QtyIn = Convert.ToDouble(rs["QtyIn"].ToString());
                    QtyOut = Convert.ToDouble(rs["QtyOut"].ToString());
                    QtyBal = Convert.ToDouble(rs["QtyBal"].ToString());
                    Location = rs["Location"].ToString();
                    this.txtqty.Focus();

                }
            }
            catch (Exception ex)
            {

            }
            conn.Close();
            conn.Dispose();
        }
        #endregion

        #region "Callinsert()"
        private void Callinsert()
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" Insert into [dbo].[ProductionOrder](Itemcode, ItemName, OrderDate, ReceivedDate, OrderQty, Remark, Status) "
                    + "VALUES ('" + txtbarcode.Text.Trim() + "', '" + this.txtname.Text.Trim() + "', '" + ASPxDateEdit1.Text + "', '" + ASPxDateEdit2.Text + "'," + this.txtqty.Text.Trim() + ",'" + this.txtremark.Text.Trim() + "','On Process')", conn);
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Callsearc();

            if (cktmp == "Y")
            {
                if (txtqty.Text == "")
                {
                    this.lblqty.Visible = true;
                    return;
                }
                try
                {
                    Double tmpQtyIn = QtyIn + Convert.ToDouble(txtqty.Text.Trim());
                }
                catch (Exception ex)
                {
                    this.lblqty.Visible = true;
                    this.lblqty.Text = "คุณคีย์ข้อมูลจำนวนเป็นตัวเลขเท่านั้น";
                    this.txtqty.Text = "";
                    this.txtqty.Focus();
                    return;
                }

             // Updatestock();
              Callinsert();

                QtyIn = 0;
                QtyOut = 0;
                QtyBal = 0;
                txtbarcode.Text = "";
                txtname.Text = "";
                txtqty.Text = "";
                txtremark.Text = "";
                ASPxDateEdit1.Text = DateTime.Now.ToString("yyyy-MM-dd");
                ASPxDateEdit2.Text = DateTime.Now.AddDays(30).ToString("yyyy-MM-dd");
                this.btnSave.Enabled = false;
                this.lblqty.Visible = false;
                txtbarcode.Focus();
                gvStdTime.DataBind();
            }
            else
            {
                this.txtname.Text = "ไม่มีข้อมูลในระบบ กรุณาคีย์ข้อมูลเข้าระบบก่อน ่ค่อยมารับเข้า";
                return;
            }

        }

        protected void bntcancel_Click(object sender, EventArgs e)
        {
            bntdelete.Visible = false;
            lbldelete.Visible = false;
            bntcancel.Visible = false;
            txtbarcode.Enabled = true;
            txtqty.Enabled = true;
            txtqty.Text = "";
            txtname.Text = "";
            txtbarcode.Text = "";
            txtremark.Text = "";
            ASPxDateEdit1.Text = DateTime.Now.ToString("yyyy-MM-dd");
            ASPxDateEdit2.Text = DateTime.Now.AddDays(30).ToString("yyyy-MM-dd");
            txtbarcode.Focus();
        }

        #region "CallDelete"
        private void CallDelete(string ID)
        {
            try
            {

                System.Data.SqlClient.SqlCommand Cmd;
                System.Data.SqlClient.SqlDataReader rs;
                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());

                Cmd = new System.Data.SqlClient.SqlCommand("Delete  [dbo].[ProductionOrder] where ProductionID=" + Request.QueryString["ProductionID"] + "", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

                conn.Close();
                conn.Dispose();

            }
            catch (Exception ex)
            {

            }
        }
        #endregion

        protected void bntdelete_Click(object sender, EventArgs e)
        {
            CallDelete(CkEdit);

            gvStdTime.DataBind();

            bntdelete.Visible = false;
            lbldelete.Visible = false;
            bntcancel.Visible = false;
            txtbarcode.Enabled = true;
            txtqty.Enabled = true;
            txtqty.Text = "";
            txtname.Text = "";
            txtbarcode.Text = "";
            txtremark.Text = "";
            ASPxDateEdit1.Text = DateTime.Now.ToString("yyyy-MM-dd");
            ASPxDateEdit2.Text = DateTime.Now.AddDays(30).ToString("yyyy-MM-dd");
            txtbarcode.Focus();
        }

        protected void gvStdTime_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            var tmpstatus = e.GetValue("Status");

            if (e.DataColumn.FieldName == "Status")
            {

                if (tmpstatus.ToString() == "On Process")
                {
                  e.Cell.BackColor = Color.Red;
                  e.Cell.Font.Bold = true;
                }
                else if (tmpstatus.ToString() == "Completed")
                {
                    e.Cell.BackColor = Color.Green;
                    e.Cell.Font.Bold = true;
                }
            }
        }

     
    }
}