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
using System.Web.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using MaintenanceService.UI.Template.Email;
using MaintenanceService.UI.Event;
using System.Xml;
using Excel = Microsoft.Office.Interop.Excel;
using System.Reflection; 

namespace MaintenanceService.Maintenance
{
    public partial class Frmviewhistory : System.Web.UI.Page
    {
        private string ckstatus = "";
        private String tmpType;
        private String tmpPic;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                IDuser.Visible = false;
                Session["CheckUPdate"] = "Save";
                String IssueNo = Request.QueryString["id"];
                ASPxDateEdit1.Text = DateTime.Now.ToString("yyyy-MM-dd");
                ASPxDateEdit2.Text = DateTime.Now.ToString("yyyy-MM-dd");
                CallView(IssueNo);
                //Requester Submitted ตรวจสอบแก้ไขได้
                if ((lblMe.Text == "Status: Requester Submitted")&&(Session["Grouppolicy"].ToString() == "User"))
                {
                    Session["CheckUPdate"] = "Update";
                    Session["CheckIssueNo"] = IssueNo;
                    Session["CheckStatus"] = "";
                    Response.Redirect("~/Maintenance/FrmRequest.aspx");
                }
                CallMail();
                if ((Session["Grouppolicy"].ToString() == "User") || (Session["Grouppolicy"].ToString() == "Manager"))
                {
                    if (Session["Username"].ToString() != "ไกรศักดิ์ ตั้งมั่นธนบวร")
                    {
                        txtissueno.Enabled = false;
                        cboissuename0.Enabled = false;
                        cbomncheck.Enabled = false;
                        txtissuedate.Enabled = false;
                        cboissuename.Enabled = false;
                        ASPxDateEdit1.Enabled = false;
                        ASPxDateEdit2.Enabled = false;
                        cbostatus.Enabled = false;
                        txtremark.Enabled = false;
                        txtmnissue.Enabled = false;
                        txtmnedit.Enabled = false;
                        //  txtmnservice.Enabled = false;
                        txtlist1.Enabled = false;
                        txtlist2.Enabled = false;
                        txtlist3.Enabled = false;
                        txtlist4.Enabled = false;
                        txtlist5.Enabled = false;
                        txtlist6.Enabled = false;
                        txtlist7.Enabled = false;
                        txtqty1.Enabled = false;
                        txtqty2.Enabled = false;
                        txtqty3.Enabled = false;
                        txtqty4.Enabled = false;
                        txtqty5.Enabled = false;
                        txtqty6.Enabled = false;
                        txtqty7.Enabled = false;
                        txtunit1.Enabled = false;
                        txtunit2.Enabled = false;
                        txtunit3.Enabled = false;
                        txtunit4.Enabled = false;
                        txtunit5.Enabled = false;
                        txtunit6.Enabled = false;
                        txtunit7.Enabled = false;
                        bntsent.Visible = false;
                        bntprint.Visible = false;
                    }

                    if (Session["Grouppolicy"].ToString() == "User")
                    {
                        txtuserreamrk0.Enabled = false;
                        bntapprove.Visible = false;
                        bntreject.Visible = false;
                        Image1.Visible = false;
                    }
                }
            
               
            }
        }

        #region "CallView"
         private void CallView(string IssueNo)
         {
             System.Data.SqlClient.SqlCommand Cmd;
             System.Data.SqlClient.SqlDataReader rs;
             SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
             //conn.Open();
             try
             {
                 Cmd = new System.Data.SqlClient.SqlCommand(" select * from [dbo].[tb_DocIssue]  Where IssueNo='" + IssueNo + "'", conn);
                 conn.Open();
                 rs = Cmd.ExecuteReader();
                 while (rs.Read())
                 {
                     txtissueno.Enabled = false;
                     txtissuedate.Enabled = false;
                     lblMe.Text ="Status: "+ rs["Status"].ToString();
                    // ckstatus = rs["Status"].ToString();
                     //เจ้าหน้าที่
                     txtissueno.Text = rs["IssueNo"].ToString();
                     txtissuedate.Text = rs["MNDate"].ToString();
                     string nameRe = rs["MNName"].ToString();

                     if (nameRe!="")
                     {
                         cboissuename0.Text = rs["MNName"].ToString();
                         cboissuename0.Enabled = false;

                         DateTime tmpdate = Convert.ToDateTime(rs["MNDate"].ToString());
                         txtissuedate.Text = tmpdate.ToString("dd/MM/yyyy HH:mm:ss", new System.Globalization.CultureInfo("en-US"));
                     }
                     else
                     {
                         cboissuename0.Text = "ไม่ระบุ";
                         txtissuedate.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss", new System.Globalization.CultureInfo("en-US"));
                     }


                     string name = rs["MNIssueName"].ToString();
                     if (name != "")
                     {
                         cboissuename.Text = rs["MNIssueName"].ToString();
                     }
                     else
                     {
                         cboissuename.Text = "ไม่ระบุ";
                     }

                     string name1 = rs["MNIssue"].ToString();
                     if (name1 != "")
                     {
                         cbomncheck.Text = rs["MNIssue"].ToString();
                     }
                     else
                     {
                         cbomncheck.Text = "ไม่ระบุ";
                     }


                     string sdate=rs["MNStartDate"].ToString();
                     if (sdate!="")
                     {
                         ASPxDateEdit1.Text = Convert.ToDateTime(rs["MNStartDate"].ToString()).ToString("yyyy-MM-dd");
                     }
                     string edate = rs["MNEndDate"].ToString();
                     if (edate != "")
                     {
                         ASPxDateEdit2.Text = Convert.ToDateTime(rs["MNEndDate"].ToString()).ToString("yyyy-MM-dd");
                     }
                     cbostatus.Text = rs["MNStatus"].ToString();
                     txtremark.Text = rs["MNRemark"].ToString();

                     if (rs["Status"].ToString() == "Finished")
                     {
                         txtissueno.Enabled = false;
                         cboissuename0.Enabled = false;
                         cbomncheck.Enabled = false;
                         txtissuedate.Enabled = false;
                         cboissuename.Enabled = false;
                         ASPxDateEdit1.Enabled = false;
                         ASPxDateEdit2.Enabled = false;
                         cbostatus.Enabled = false;
                         txtremark.Enabled = false;
                         txtmnissue.Enabled = false;
                         txtmnedit.Enabled = false;
                         txtlist1.Enabled = false;
                         txtlist2.Enabled = false;
                         txtlist3.Enabled = false;
                         txtlist4.Enabled = false;
                         txtlist5.Enabled = false;
                         txtlist6.Enabled = false;
                         txtlist7.Enabled = false;
                         txtqty1.Enabled = false;
                         txtqty2.Enabled = false;
                         txtqty3.Enabled = false;
                         txtqty4.Enabled = false;
                         txtqty5.Enabled = false;
                         txtqty6.Enabled = false;
                         txtqty7.Enabled = false;
                         txtunit1.Enabled = false;
                         txtunit2.Enabled = false;
                         txtunit3.Enabled = false;
                         txtunit4.Enabled = false;
                         txtunit5.Enabled = false;
                         txtunit6.Enabled = false;
                         txtunit7.Enabled = false;
                         bntsent.Visible = false;
                     }
                     //MN
                     this.txtmnissue.Text = rs["MNIssuecheck"].ToString();
                     this.txtmnedit.Text = rs["MNIssueedit"].ToString();
                     this.txtlist1.Text = rs["MNList1"].ToString();
                     this.txtlist2.Text = rs["MNList2"].ToString();
                     this.txtlist3.Text = rs["MNList3"].ToString();
                     this.txtlist4.Text = rs["MNList4"].ToString();
                     this.txtlist5.Text = rs["MNList5"].ToString();
                     this.txtlist6.Text = rs["MNList6"].ToString();
                     this.txtlist7.Text = rs["MNList7"].ToString();
                     this.txtqty1.Text = rs["MNQty1"].ToString();
                     this.txtqty2.Text = rs["MNQty2"].ToString();
                     this.txtqty3.Text = rs["MNQty3"].ToString();
                     this.txtqty4.Text = rs["MNQty4"].ToString();
                     this.txtqty5.Text = rs["MNQty5"].ToString();
                     this.txtqty6.Text = rs["MNQty6"].ToString();
                     this.txtqty7.Text = rs["MNQty7"].ToString();
                     this.txtunit1.Text = rs["MNUnit1"].ToString();
                     this.txtunit2.Text = rs["MNUnit2"].ToString();
                     this.txtunit3.Text = rs["MNUnit3"].ToString();
                     this.txtunit4.Text = rs["MNUnit4"].ToString();
                     this.txtunit5.Text = rs["MNUnit5"].ToString();
                     this.txtunit6.Text = rs["MNUnit6"].ToString();
                     this.txtunit7.Text = rs["MNUnit7"].ToString();
                     //พนักงาน
                     this.txtdate.Text = rs["IssueDate"].ToString();
                     this.txtname.Text = rs["IssueName"].ToString();
                     this.txtdept.Text = rs["IssueDept"].ToString();
                     this.txtmanager.Text = rs["IssueManager"].ToString();
                     this.txthead.Text = rs["IssueHead"].ToString();
                     this.txtdetail.Text = rs["IssueDetail"].ToString();
                     string tempPic = rs["IssuePicture"].ToString();
                     this.txtuserreamrk.Text = rs["Remark"].ToString();
                     lblnumber.Text = rs["IssueNo"].ToString();
                 

                     hlAttachment.Text = rs["ExFile1"].ToString();
                     hlAttachment.NavigateUrl = "~/FileUpload/" + rs["ExFile1"].ToString();

                     HyperLink2.Text = rs["ExFile2"].ToString();
                     HyperLink2.NavigateUrl = "~/FileUpload/" + rs["ExFile2"].ToString();

                     string cktype = rs["TypeHead"].ToString();
                     if (cktype.Trim() == "ซ่อม")
                     {
                         ck2.Checked = true;
                     }
                     else
                     {
                         ck1.Checked = true;
                     }
                     string ck = rs["Status"].ToString();
                     if ((ck == "Manager Reject") || (ck == "Manager Approval"))
                     {
                         txtuserreamrk0.Text = "(" +ck+") "+rs["ManagerRemark"].ToString() ;
                         txtuserreamrk0.Enabled = false;
                         Image1.Visible =false;
                         bntapprove.Visible =false;
                         bntreject.Visible = false;
                         this.MN.Visible =true;
                     }
                     else
                     {
                         Image1.Visible = true;
                         bntapprove.Visible = true;
                         bntreject.Visible = true;
                        if (Session["Grouppolicy"].ToString() == "Manager")
                         {
                              this.MN.Visible = false;
                         }
                     }
                     Image2.ImageUrl = "~/FileUpload/" + tempPic;
                     tmpPic = tempPic;
                    //ตรวจสอบงาน
                     string cktmp = rs["MNStatus"].ToString();
                     string CkUser = rs["CkUser"].ToString();
                     if ((cktmp=="งานเสร็จสมบูรณ์")&&(CkUser!="งานเสร็จสมบูรณ์เรียบร้อย"))
                     {
                         IDuser.Visible = true;
                     }
                     else
                     {
                         IDuser.Visible = false;
                     }

                    
                 }
             }
             catch (Exception ex)
             {

             }
             conn.Close();
             conn.Dispose();
      
         }
        #endregion

         #region "UpdateStatusMN()"
        private void UpdateStatusMN()
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_DocIssue] SET MNName = '" + cboissuename0.Text.Trim() + "',"
                    + "MNDate=Getdate(),MNRemark='" + txtremark.Text.Trim() + "',MNStatus='" + cbostatus.Text.Trim() + "',MNIssuecheck='" + txtmnissue.Text.Trim() + "',MNIssueedit='" + txtmnedit.Text.Trim() + "',"
                    + "MNList1='" + txtlist1.Text.Trim() + "',MNList2='" + txtlist2.Text.Trim() + "',MNList3='" + txtlist3.Text.Trim() + "',MNList4='" + txtlist4.Text.Trim() + "',MNList5='" + txtlist5.Text.Trim() + "',MNList6='" + txtlist6.Text.Trim() + "',MNList7='" + txtlist7.Text.Trim() + "',"
                    + "MNQty1='" + txtqty1.Text.Trim() + "',MNQty2='" + txtqty2.Text.Trim() + "',MNQty3='" + txtqty3.Text.Trim() + "',MNQty4='" + txtqty4.Text.Trim() + "',MNQty5='" + txtqty5.Text.Trim() + "',MNQty6='" + txtqty6.Text.Trim() + "',MNQty7='" + txtqty7.Text.Trim() + "',"
                    + "MNUnit1='" + txtunit1.Text.Trim() + "',MNUnit2='" + txtunit2.Text.Trim() + "',MNUnit3='" + txtunit3.Text.Trim() + "',MNUnit4='" + txtunit4.Text.Trim() + "',MNUnit5='" + txtunit5.Text.Trim() + "',MNUnit6='" + txtunit6.Text.Trim() + "',MNUnit7='" + txtunit7.Text.Trim() + "',MNIssue='" + cbomncheck.Text.Trim() + "',CkUser=NULL"
                    + " Where IssueNo='" + this.txtissueno.Text.Trim() + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
        }
         #endregion

        #region "UpdateStatusMNAll()"
        private void UpdateStatusMNAll()
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_DocIssue] SET MNName = '" + cboissuename0.Text.Trim() + "',"
                    + "MNDate=Getdate(),MNRemark='" + txtremark.Text.Trim() + "',MNIssueName='" + cboissuename.Text.Trim() + "',"
                    + "MNStartDate='" + ASPxDateEdit1.Text.Trim() + "',MNEndDate='" + ASPxDateEdit2.Text.Trim() + "',MNStatus='" + cbostatus.Text.Trim() + "',MNIssuecheck='" + txtmnissue.Text.Trim() + "',MNIssueedit='" + txtmnedit.Text.Trim() + "',"
                    + "MNList1='" + txtlist1.Text.Trim() + "',MNList2='" + txtlist2.Text.Trim() + "',MNList3='" + txtlist3.Text.Trim() + "',MNList4='" + txtlist4.Text.Trim() + "',MNList5='" + txtlist5.Text.Trim() + "',MNList6='" + txtlist6.Text.Trim() + "',MNList7='" + txtlist7.Text.Trim() + "',"
                    + "MNQty1='" + txtqty1.Text.Trim() + "',MNQty2='" + txtqty2.Text.Trim() + "',MNQty3='" + txtqty3.Text.Trim() + "',MNQty4='" + txtqty4.Text.Trim() + "',MNQty5='" + txtqty5.Text.Trim() + "',MNQty6='" + txtqty6.Text.Trim() + "',MNQty7='" + txtqty7.Text.Trim() + "',"
                    + "MNUnit1='" + txtunit1.Text.Trim() + "',MNUnit2='" + txtunit2.Text.Trim() + "',MNUnit3='" + txtunit3.Text.Trim() + "',MNUnit4='" + txtunit4.Text.Trim() + "',MNUnit5='" + txtunit5.Text.Trim() + "',MNUnit6='" + txtunit6.Text.Trim() + "',MNUnit7='" + txtunit7.Text.Trim() + "',MNIssue='" + cbomncheck.Text.Trim() + "',CkUser=NULL"
                    + " Where IssueNo='" + this.txtissueno.Text.Trim() + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
        }
        #endregion
        #region "UpdateStatusMNProcess()"
        private void UpdateStatusMNProcess()
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_DocIssue] SET "
                    + " MNRemark='" + txtremark.Text.Trim() + "',MNIssueName='" + cboissuename.Text.Trim() + "',"
                    + " MNStartDate='" + ASPxDateEdit1.Text.Trim() + "',MNEndDate='" + ASPxDateEdit2.Text.Trim() + "',MNStatus='" + cbostatus.Text.Trim() + "',MNIssuecheck='" + txtmnissue.Text.Trim() + "',MNIssueedit='" + txtmnedit.Text.Trim() + "',"
                    + "MNList1='" + txtlist1.Text.Trim() + "',MNList2='" + txtlist2.Text.Trim() + "',MNList3='" + txtlist3.Text.Trim() + "',MNList4='" + txtlist4.Text.Trim() + "',MNList5='" + txtlist5.Text.Trim() + "',MNList6='" + txtlist6.Text.Trim() + "',MNList7='" + txtlist7.Text.Trim() + "',"
                    + "MNQty1='" + txtqty1.Text.Trim() + "',MNQty2='" + txtqty2.Text.Trim() + "',MNQty3='" + txtqty3.Text.Trim() + "',MNQty4='" + txtqty4.Text.Trim() + "',MNQty5='" + txtqty5.Text.Trim() + "',MNQty6='" + txtqty6.Text.Trim() + "',MNQty7='" + txtqty7.Text.Trim() + "',"
                    + "MNUnit1='" + txtunit1.Text.Trim() + "',MNUnit2='" + txtunit2.Text.Trim() + "',MNUnit3='" + txtunit3.Text.Trim() + "',MNUnit4='" + txtunit4.Text.Trim() + "',MNUnit5='" + txtunit5.Text.Trim() + "',MNUnit6='" + txtunit6.Text.Trim() + "',MNUnit7='" + txtunit7.Text.Trim() + "',MNIssue='" + cbomncheck.Text.Trim() + "',CkUser=NULL"
                    + " Where IssueNo='" + this.txtissueno.Text.Trim() + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
        }
        #endregion

        #region " Send()"
        private void Send()
        {
            POMail poMail = new POMail();
            int tryAgain = 10;
            bool failed = false;
            do
            {
                try
                {
                    failed = false;
                    using (MailMessage mail = new MailMessage())
                    {
                        using (SmtpClient SmtpServer = new SmtpClient("192.168.1.254"))
                        {
                            string strFrom = Session["Email"].ToString();
                            string strTo = txtnameemail.Text.Trim();
                            string strCC = txtmanageremail.Text.Trim();

                            mail.From = new MailAddress(strFrom.Trim());
                            mail.To.Add(strTo.Trim());//Sent MN
                            mail.CC.Add(strCC.Trim());
                            mail.Subject = "สถานะ "+this.cbostatus.Text.Trim() + " เลขที่ใบแจ้ง " + txtissueno.Text.Trim();
                            string body = string.Empty;
                            using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.htm")))
                            {
                                body = reader.ReadToEnd();
                            }
                            string ID = txtissueno.Text.Trim();
                            string tmpurl = "http://192.168.1.3/MN/Maintenance/Frmviewhistory.aspx?id=" + ID;
                            body = body.Replace("{_Recievername}", txtname.Text.Trim());
                            body = body.Replace("{_Action}", "Online Review Request Issue status : " + this.cbostatus.Text.Trim());
                            body = body.Replace("{_PONumber}", txtissueno.Text.Trim() + " , ผู้รับเรื่อง : " + cboissuename0.Text.Trim());
                            body = body.Replace("{_Title}", txthead.Text.Trim());
                            body = body.Replace("{_Description}", txtdetail.Text.Trim());
                            body = body.Replace("{_Dept}", txtdept.Text.Trim());
                            body = body.Replace("{_ActionURL}", tmpurl);
                            body = body.Replace("{_Sendername}", Session["Username"].ToString());
                            body = body.Replace("{_Position} ", Session["Dept"].ToString());
                            mail.Body = body;

                            mail.IsBodyHtml = true;
                            SmtpServer.Port = 25;
                            SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
                            SmtpServer.Send(mail);

                            //save issue
                            //  callinsertissue();

                            // alert("Complete send email");
                            //  CallAutoKey();
                            // CallShow();

                        }
                    }
                }
                catch (Exception)
                {
                    failed = true;
                    tryAgain--;
                }
            } while (failed && tryAgain != 0);
        }
        #endregion

        #region "   CallMail()"
        private void CallMail()
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            //conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand("  select EMail,ManagerMail from [dbo].[Tb_Users]  Where Fullname='" + txtname.Text.Trim() + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                while (rs.Read())
                {

                    this.txtnameemail.Text = rs["EMail"].ToString();
                    this.txtmanageremail.Text = rs["ManagerMail"].ToString();
                }
            }
            catch (Exception ex)
            {

            }
            conn.Close();
            conn.Dispose();
        }
        #endregion

        protected void bntsent_Click(object sender, ImageClickEventArgs e)
         {
             if (cboissuename0.Text=="ไม่ระบุ")
             {
                 ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('กรุณาป้อนระบุชื่อคนรับเรื่องก่อน...')"), true);
                 return;
             }
             if (cbostatus.Text == "Requester Submitted")
             {
                 ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('คุณไม่สามารถระบุ status นี้ได้ กรุณาระบุใหม่')"), true);
                 return;
             }
             if (cbostatus.Text == "<< Select >>")
             {
                 ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('กรุณาป้อนระบุสถานะการทำงานก่อน...')"), true);
                 return;
             }
             //Update status
           
             if ((cboissuename0.Enabled==true)&&(cboissuename.Text == "ไม่ระบุ"))
             {
                 UpdateStatusMN();
                 inserthistory(cbostatus.Text.Trim());
                 Send();
                 Response.Redirect("~/Maintenance/MaintenanceService.aspx?Sent=SentEmail");
                 //ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('คุณทำรายการเรียบร้อยแล้ว')"), true);
             }
             else if ((cboissuename0.Enabled == true) && (cboissuename0.Enabled == true))
             {
                 UpdateStatusMNAll();
                 inserthistory(cbostatus.Text.Trim());
                 Send();
                 Response.Redirect("~/Maintenance/MaintenanceService.aspx?Sent=SentEmail");
                // ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('คุณทำรายการเรียบร้อยแล้ว')"), true);
             }
             else if ((cbostatus.Text.Trim() == "รับเรื่องแล้ว") || (cbostatus.Text.Trim() == "อยู่ระหว่างดำเนินการ") || (cbostatus.Text.Trim() == "รอดำเนินการ") || (cbostatus.Text.Trim() == "รออะไหล่/อุปกรณ์") || (cbostatus.Text.Trim() == "งานเสร็จสมบูรณ์") || (cbostatus.Text.Trim() == "ยกเลิกงาน"))
             {
                 UpdateStatusMNProcess();
                 inserthistory(cbostatus.Text.Trim());
                 Send();
                 Response.Redirect("~/Maintenance/MaintenanceService.aspx?Sent=SentEmail");
               //  ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('คุณทำรายการเรียบร้อยแล้ว')"), true);
             }
         }

      

        #region "UpdateStatusManager"
        private void UpdateStatusManager(string tmp)
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_DocIssue] SET ManagerRemark = '" + txtuserreamrk0.Text.Trim() + "',"
                    + "Status='" + tmp + "'"
                    + " Where IssueNo='" + this.lblnumber.Text.Trim() + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
        
        }
        #endregion

        #region "inserthistory()"
        private void inserthistory(string tmp)
        {
            try
            {
                System.Data.SqlClient.SqlCommand Cmd;
                System.Data.SqlClient.SqlDataReader rs;
                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
                // conn.Open();
                try
                {
                    Cmd = new System.Data.SqlClient.SqlCommand(" Insert into [dbo].[tb_History]( IssueNo, Status, UserName, Createdate) "
                        + "VALUES ('" + this.lblnumber.Text.Trim() + "','" + tmp + "', '" + Session["Username"].ToString() + "',Getdate())", conn);
                    conn.Open();
                    rs = Cmd.ExecuteReader();

                }
                catch (Exception ex)
                {
                }
                conn.Close();
                conn.Dispose();

            }
            catch (Exception ex)
            {
            }
        }
        #endregion

        #region " SendManager()"
        private void SendManager(string tmp)
        {
             if (ck1.Checked ==true)
                { tmpType = "สร้าง"; }
                else if (ck2.Checked == true)
                { tmpType = "ซ่อม"; }
                else { tmpType = "ไม่ระบบ"; }

            POMail poMail = new POMail();
            int tryAgain = 10;
            bool failed = false;
            do
            {
                try
                {
                    failed = false;
                    using (MailMessage mail = new MailMessage())
                    {
                        using (SmtpClient SmtpServer = new SmtpClient("192.168.1.254"))
                        {
                            string strFrom = Session["Email"].ToString();
                            string strCC = txtnameemail.Text.Trim();

                            if (tmp == "Manager Approval")
                            {
                                //ส่งไปหา MN
                                mail.From = new MailAddress(strFrom.Trim());
                                mail.To.Add("kaisak@la-z-boy-th.com");//Sent MN  Pudit@la-z-boy-th.com
                                mail.To.Add("lzbtmaintenance@la-z-boy-th.com");//Sent MN
                                mail.To.Add("lzbtmaintenance1@la-z-boy-th.com");//Sent MN
                                mail.CC.Add(strCC.Trim());

                                if (hlAttachment.Text != "")
                                {
                                    Attachment data = new Attachment(Server.MapPath("~/FileUpload/" + hlAttachment.Text.Trim()));
                                    mail.Attachments.Add(data);
                                }
                                if (HyperLink2.Text != "")
                                {
                                    Attachment data2 = new Attachment(Server.MapPath("~/FileUpload/" + HyperLink2.Text.Trim()));
                                    mail.Attachments.Add(data2);
                                }
                                if ((tmpPic != "")&&(tmpPic!=null))
                                {
                                    Attachment data3 = new Attachment(Server.MapPath("~/FileUpload/" + tmpPic.Trim()));
                                    mail.Attachments.Add(data3);
                                }
                                mail.Subject = "Waiting for your approval No: " + this.lblnumber.Text.Trim();
                            }
                            else
                            {  //ส่งกลับ Reject หาเจ้าของงาน
                                mail.From = new MailAddress(strFrom.Trim());
                                mail.To.Add(txtnameemail.Text.Trim());

                                mail.Subject = tmp;
                            }

                    
                            string body = string.Empty;
                            using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplateGr.htm")))
                            {
                                body = reader.ReadToEnd();
                            }
                            string ID = this.lblnumber.Text.Trim();
                            string tmpurl = "http://192.168.1.3/MN/Maintenance/Frmviewhistory.aspx?id=" + ID;
                            body = body.Replace("{_Manager}", txtuserreamrk0.Text.Trim());
                            body = body.Replace("{_Action}", "Online Review Request Issue Status : " + tmp);
                            body = body.Replace("{_PONumber}", " ประเภทแจ้ง : " + tmpType + " เลขที่ : " + this.lblnumber.Text.Trim());
                            body = body.Replace("{_Title}", txthead.Text.Trim());
                            body = body.Replace("{_Description}", txtdetail.Text.Trim());
                            body = body.Replace("{_Dept}", Session["Dept"].ToString());
                            body = body.Replace("{_ActionURL}", tmpurl);
                            body = body.Replace("{_Sendername}", Session["Username"].ToString());
                            body = body.Replace("{_Position} ", Session["Dept"].ToString());
                            mail.Body = body;

                            mail.IsBodyHtml = true;
                            SmtpServer.Port = 25;
                            SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
                            SmtpServer.Send(mail);

                            //save issue
                            //  callinsertissue();

                            // alert("Complete send email");
                            //  CallAutoKey();
                            // CallShow();

                        }
                    }
                }
                catch (Exception)
                {
                    failed = true;
                    tryAgain--;
                }
            } while (failed && tryAgain != 0);
        }
        #endregion

        protected void bntapprove_Click(object sender, ImageClickEventArgs e)
        {
            if (txtuserreamrk0.Text=="")
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('กรุณาป้อนรายละเอียดในการอนุมัติครับ...')"), true);
                return;
            }

            UpdateStatusManager("Manager Approval");
            inserthistory("Manager Approval");
            SendManager("Manager Approval");
            Response.Redirect("~/Maintenance/ManagerTasks.aspx?Sent=SentEmail");
        }

        protected void bntreject_Click(object sender, ImageClickEventArgs e)
        {
            if (txtuserreamrk0.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('กรุณาป้อนรายละเอียดในการอนุมัติครับ...')"), true);
                return;
            }

            UpdateStatusManager("Manager Reject");
            inserthistory("Manager Reject");
            SendManager("Manager Reject");
            Response.Redirect("~/Maintenance/ManagerTasks.aspx?Sent=SentEmail");
        }

        protected void bntprint_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Maintenance/FrmMNReport.aspx?id=" + txtissueno.Text.Trim()+ "");
        }

        protected void btnViewFile_Click(object sender, EventArgs e)
        {

            try
            {
                string tmp = hlAttachment.Text.Trim();
                if (tmp=="")
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('ไม่มีไฟล์แนบ..')"), true);
                    return;
                }
                else
                {
                Response.Redirect("~/FileUpload/" + hlAttachment.Text.Trim());
                }
            }
            catch (Exception Ex)
            {
                Console.Write(e.ToString());
            }



        }

        private void SaveAs(string p)
        {
            throw new NotImplementedException();
        }

        protected void btnViewFile0_Click(object sender, EventArgs e)
        {
            try
            {
                string tmp = HyperLink2.Text.Trim();
                  if (tmp == "")
                  {
                      ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('ไม่มีไฟล์แนบ..')"), true);
                      return;
                  }
                  else
                  {
                      Response.Redirect("~/FileUpload/" + HyperLink2.Text.Trim());
                  }
            }
            catch (Exception Ex)
            {
                Console.Write(e.ToString());
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["CheckUPdate"] = "Update";
            Session["CheckStatus"] = "แก้ไขเพิ่มเติม";
            Session["CheckIssueNo"] = txtissueno.Text.Trim();
            Response.Redirect("~/Maintenance/FrmRequest.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_DocIssue] SET CkUser = 'งานเสร็จสมบูรณ์เรียบร้อย',CkUserDate=Getdate()"
                    + " Where IssueNo='" + txtissueno.Text.Trim() + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();
                Response.Redirect("~/Maintenance/FrmCheckStatus.aspx");
            }
            catch (Exception ex)
            {
            }
        
        }

    }
}