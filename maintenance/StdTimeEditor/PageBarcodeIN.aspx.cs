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
    public partial class PageBarcodeIN : System.Web.UI.Page
    {
        SqlCommand comm = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        private string CkEdit = string.Empty;
        private string Ckitemcode = string.Empty;
        private string CkOrder = string.Empty;
        private string ckmode = string.Empty;
        public string cktmp = "N";
        public string Location = "N";
        private double QtyIn = 0;
        private double QtyOut = 0;
        private double QtyBal = 0;
        Boolean Isfind = false;
        protected void alert(string pv_msg)
        {
            string msg = "<script language = javascript>" +
                            " alert('" + pv_msg + "')" +
                            "</script>";
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", msg);
        }

        #region "CallOrder()"
        private void CallOrder()
        {
            try
            {

                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
                conn.Open();
                SqlDataAdapter dtAdapter;
                DataTable dt = new DataTable();

                string strSQL1 = "";
                strSQL1 = "  select ProductionID,CASE  WHEN ItemName = 'กรุณาเลือก' THEN '<<กรุณาเลือก>>' ELSE Itemcode+' : '+ ItemName+' :  '+ CAST(OrderQty AS varchar)  + ' Qty' END AS Ordername from [dbo].[ProductionOrder] where Status='On Process'";

                dtAdapter = new SqlDataAdapter(strSQL1, conn);
                dtAdapter.Fill(dt);

                //*** DropDownList ***//    
                this.cboselect.DataSource = dt;
                this.cboselect.DataTextField = "Ordername";
                this.cboselect.DataValueField = "ProductionID";
                this.cboselect.DataBind();



                dtAdapter = null;
                conn.Close();
                conn = null;
           }
            catch (Exception ex)
            {
               return;
            }
            
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CallOrder();
               // btnSave.Visible = true;
                bntdelete.Visible = false;
                lbldelete.Visible = false;
                bntcancel.Visible = false;
                txtbarcode.Enabled = true;
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
                          //  btnSave.Visible = false;
                          lbldelete.Visible = true;
                          bntdelete.Visible = true;
                          bntcancel.Visible = true;
                          CallSearchDelete(CkEdit);
                      }
                      else
                      {
                          Session["Page"] = "3";
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
                }
            }
            catch (Exception ex)
            {

            }
            conn.Close();
            conn.Dispose();
        }
        #endregion

        #region "CallUPdateStockBal()"
        private void CallUPdateStockBal()
        {
            try
            {

                System.Data.SqlClient.SqlCommand Cmd;
                System.Data.SqlClient.SqlDataReader rs;
                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());

                Cmd = new System.Data.SqlClient.SqlCommand(" update [dbo].[tb_StockBal] "
                    + " Set  QtyIn= Case When QtyIn<0 then 0 Else QtyIn-" + txtqty.Text.Trim() + " End,QtyBal= Case When QtyBal<0 then 0 Else QtyBal-" + txtqty.Text.Trim() + " End "
                  + " Where ItemCode='"+txtbarcode.Text.Trim()+"' ", conn);
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
                Cmd = new System.Data.SqlClient.SqlCommand(" SELECT Itemcode, ItemName, Model, Location, MaxItem, MinItem, QtyIn, QtyOut, QtyBal FROM   [dbo].[tb_StockBal]  Where Itemcode='" +this.txtbarcode.Text.Trim() + "'", conn);
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

        #region "Updatestock()"
        private void Updatestock()
        { 
            try
            {
                Double tmpQtyIn = QtyIn + Convert.ToDouble(txtqty.Text.Trim());
                Double tmpQtyBal = QtyBal + Convert.ToDouble(txtqty.Text.Trim());

                System.Data.SqlClient.SqlCommand Cmd;
                System.Data.SqlClient.SqlDataReader rs;
                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());

                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_StockBal]  SET QtyBal = " + tmpQtyBal + ",QtyIn=" + tmpQtyIn + ""
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
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" Insert into [dbo].[tb_StockMov](ItemCode, ItemName, Location, QtyIn, Status, CreateDate) "
                    + "VALUES ('" + txtbarcode.Text.Trim() + "', '" + this.txtname.Text.Trim() + "', '" + Location + "'," + this.txtqty.Text.Trim() + ",'IN',Getdate())", conn);
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

                Updatestock();
                Callinsert();
                gvStdTime.DataBind();

                if (Session["ProductionID"] != null)
                {
                    if (Session["ProductionID"].ToString() == "Y")
                    {
                        updateOrder(this.cboselect.SelectedValue);
                    }
                }
                Session["ProductionID"] = "N";
                CallOrder();
                this.txtqty.Enabled = true;
                this.txtbarcode.Enabled = true;
                QtyIn = 0;
                QtyOut = 0;
                QtyBal = 0;
                txtbarcode.Text="";
                txtname.Text = "";
                txtqty.Text="";
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


            gvStdTime.DataBind();
        }

        #region "updateOrder"
        private void updateOrder(string ID)
        {
            try
            {
                Double tmpQtyIn = QtyIn + Convert.ToDouble(txtqty.Text.Trim());
                Double tmpQtyBal = QtyBal + Convert.ToDouble(txtqty.Text.Trim());

                System.Data.SqlClient.SqlCommand Cmd;
                System.Data.SqlClient.SqlDataReader rs;
                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());

                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[ProductionOrder]  SET Status ='Completed'"
                  + " Where ProductionID=" + ID + "", conn);
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
            txtbarcode.Focus();
        }

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
            txtqty.Text = "";
            txtname.Text = "";
            txtbarcode.Text = "";
            txtbarcode.Focus();
        }

        protected void txtbarcode_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnOpenPopupWindow_Click(object sender, EventArgs e)
        {
            if (Session["ProductionID"].ToString()=="0")
            {
            
            }
        }

        protected void cboselect_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cboselect.Text == "1")
            {
                this.txtqty.Enabled = true;
                this.txtbarcode.Enabled = true;
                this.txtbarcode.Text = "";
                this.txtname.Text ="";
                this.txtqty.Text = "";
               return;
            }
            else
            {
                CallsearcOrder(this.cboselect.SelectedValue);
                this.txtbarcode.Text = Ckitemcode;
                Callsearc();
            
            }
        }

        #region "CallsearcOrder();
        private void CallsearcOrder(string n)
        {
          //  CkOrder = "N";
            this.txtqty.Enabled = true;
            this.txtbarcode.Enabled = true;
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            //conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand("select Itemcode,Itemname,OrderQty from [dbo].[ProductionOrder] where ProductionID=" + n + "", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                while (rs.Read())
                {
         
                    this.txtname.Text = rs["ItemName"].ToString();
                    this.txtqty.Text = rs["OrderQty"].ToString();
                    Ckitemcode = rs["Itemcode"].ToString();
                    this.txtqty.Enabled = false;
                    this.txtbarcode.Enabled = false;
                    Session["ProductionID"] = "Y";
                }
            }
            catch (Exception ex)
            {

            }
            conn.Close();
            conn.Dispose();
        }
        #endregion

        //   protected void bntselect_Click(object sender, EventArgs e)
     //   {
           // ScriptManager.RegisterStartupScript(Page, typeof(Page), "OpenWindow", "window.open('ViewDetails.aspx','mywindow','menubar=0,resizable=0,width=400,height=500');", true);
      //  }



      
    }
}