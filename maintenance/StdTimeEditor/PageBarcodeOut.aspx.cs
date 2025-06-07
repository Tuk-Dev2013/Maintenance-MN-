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
    public partial class PageBarcodeOut : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                // btnSave.Visible = true;
                bntdelete.Visible = false;
                lbldelete.Visible = false;
                bntcancel.Visible = false;
                txtbarcode.Enabled = true;
                txtemployee.Enabled = true;
                txtqty.Enabled = true;
                CkEdit = Request.QueryString["MovID"];
                ckmode = Request.QueryString["mode"];
                if (CkEdit != null)
                {
                    if (ckmode == "Delete")
                    {
                        if (Session["Username"] != null)
                        {
                        txtbarcode.Enabled = false;
                        txtqty.Enabled = false;
                        txtemployee.Enabled = false;
                        lbldelete.Visible = true;
                        bntdelete.Visible = true;
                        bntcancel.Visible = true;
                        CallSearchDelete(CkEdit);
                        }
                        else
                        {
                            Session["Page"] = "4";
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
                Cmd = new System.Data.SqlClient.SqlCommand(" SELECT * FROM   [dbo].[tb_StockMov]  Where MovID=" + tmpID + "", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                while (rs.Read())
                {
                    this.txtbarcode.Text = rs["ItemCode"].ToString();
                    this.txtname.Text = rs["ItemName"].ToString();
                    this.txtqty.Text = rs["QtyIn"].ToString();
                    this.txtemployee.Text = rs["UserName"].ToString();
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
                    this.txtbal.Text = rs["QtyBal"].ToString();
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

        #region "Updatestock()"
        private void Updatestock()
        {
            try
            {
                Double tmpQtyOut = QtyOut - Convert.ToDouble(txtqty.Text.Trim());
                Double tmpQtyBal = QtyBal - Convert.ToDouble(txtqty.Text.Trim());

                System.Data.SqlClient.SqlCommand Cmd;
                System.Data.SqlClient.SqlDataReader rs;
                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());

                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_StockBal]  SET QtyBal = " + tmpQtyBal + ",QtyOut=" + tmpQtyOut + ""
                  + " Where Itemcode='" + this.txtbarcode.Text.Trim() + "'", conn);
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

        #region "Callinsert()"
        private void Callinsert()
        {
            Double tmpQtyIn = (-1) * Convert.ToDouble(txtqty.Text.Trim());
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" Insert into [dbo].[tb_StockMov](ItemCode, ItemName, Location, QtyIn, Status, UserName, CreateDate) "
                    + "VALUES ('" + txtbarcode.Text.Trim() + "', '" + this.txtname.Text.Trim() + "', '" + Location + "'," + tmpQtyIn + ",'Out','" + this.txtempname.Text.Trim() + "',Getdate())", conn);
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


        #region " Callemp()"
        private void Callemp()
        {
            this.txtempname.Text = "ไม่มี";
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            //conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" SELECT EMPCode, EMPName, Status FROM   tb_Emp where EMPCode='" + this.txtemployee.Text.Trim() + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                while (rs.Read())
                {
                    this.txtempname.Text = rs["EMPName"].ToString();
                   // this.btnSave.Focus();
                }
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
            Callemp();

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
              
                  if (this.txtempname.Text == "ไม่มี")
                   {
                   this.lblckemployee.Visible = true;
                    this.lblckemployee.Text = " กรุณายิงรหัสพนักงาน..";
                    txtemployee.Text = "";
                    return;
                   }
              

                if (txtemployee.Text == "")
                {
                    this.lblckemployee.Visible = true;
                    this.lblckemployee.Focus();
                    return;
                }
            
                if (Convert.ToDouble(txtqty.Text)>Convert.ToDouble(txtbal.Text))
                {
                    this.lblqty.Visible = true;
                    this.lblqty.Text = "คุณคีย์ข้อมูลจำนวน มากกว่าที่มีในสต๊อก คีย์ใหม่";
                    this.txtqty.Text = "";
                    this.txtqty.Focus();
                    return;
                }
            
                Updatestock();
                Callinsert();

                QtyIn = 0;
                QtyOut = 0;
                QtyBal = 0;
                txtbarcode.Text = "";
                txtname.Text = "";
                txtqty.Text = "";
                txtbal.Text = "0";
                this.txtempname.Text = "";
                txtemployee.Text = "";
                this.btnSave.Enabled = false;
                this.lblqty.Visible = false;
                this.lblckemployee.Visible = false; 
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
            txtemployee.Enabled = true;
            txtqty.Text = "";
            txtname.Text = "";
            txtbarcode.Text = "";
            txtemployee.Text = "";
            txtbarcode.Focus();
        }

        #region "CallUPdateStockBal()"
        private void CallUPdateStockBal()
        {
            try
            {
                Double tmpQtyOut = (-1) * Convert.ToDouble(txtqty.Text.Trim());
                System.Data.SqlClient.SqlCommand Cmd;
                System.Data.SqlClient.SqlDataReader rs;
                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());

                Cmd = new System.Data.SqlClient.SqlCommand(" update [dbo].[tb_StockBal] "
                    + " Set  QtyOut= Case When QtyOut>0 then 0 Else QtyOut+" + tmpQtyOut + " End,QtyBal= Case When QtyBal<0 then 0 Else QtyBal+" + tmpQtyOut + " End "
                  + " Where ItemCode='" + txtbarcode.Text.Trim() + "' ", conn);
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

        #region "CallDelete"
        private void CallDelete(string ID)
        {
            try
            {

                System.Data.SqlClient.SqlCommand Cmd;
                System.Data.SqlClient.SqlDataReader rs;
                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());

                Cmd = new System.Data.SqlClient.SqlCommand("Delete  [dbo].[tb_StockMov] where MovID=" + Request.QueryString["MovID"] + "", conn);
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
            CallUPdateStockBal();
            CallDelete(CkEdit);

            gvStdTime.DataBind();

            bntdelete.Visible = false;
            lbldelete.Visible = false;
            bntcancel.Visible = false;
            txtbarcode.Enabled = true;
            txtqty.Enabled = true;
            txtemployee.Enabled = true;
            txtqty.Text = "";
            txtname.Text = "";
            txtbarcode.Text = "";
            txtemployee.Text = "";
            txtbarcode.Focus();
        }

 



    }
}