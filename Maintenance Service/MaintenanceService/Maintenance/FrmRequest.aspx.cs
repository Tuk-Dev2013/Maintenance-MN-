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
using System.Data.OleDb;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using MaintenanceService.UI.Template.Email;
using MaintenanceService.UI.Event;

namespace MaintenanceService.Maintenance
{
    public partial class FrmRequest : System.Web.UI.Page
    {

        private String AutoIssueNo;
        private String tmpType;
        private string _path, _PONumber, _Title, _Fullname, _Description, _Remark, _ActionURL, _Chiefname, _MailTo, _MailCC, _Action, _Position;
        private string[] _MailFrom;
        public string path { get { return _path; } set { _path = value; } }
        public string PONumber { get { return _PONumber; } set { _PONumber = value; } }
        public string Title { get { return _Title; } set { _Title = value; } }
        public string Fullname { get { return _Fullname; } set { _Fullname = value; } }
        public string Description { get { return _Description; } set { _Description = value; } }
        public string Remark { get { return _Remark; } set { _Remark = value; } }
        public string ActionURL { get { return _ActionURL; } set { _ActionURL = value; } }
        public string Chiefname { get { return _Chiefname; } set { _Chiefname = value; } }
        public string[] MailFrom { get { return _MailFrom; } set { _MailFrom = value; } }
        public string MailTo { get { return _MailTo; } set { _MailTo = value; } }
        public string MailCC { get { return _MailCC; } set { _MailCC = value; } }
        public string Action { get { return _Action; } set { _Action = value; } }
        public string Position { get { return _Position; } set { _Position = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FileUpload2.Text = "";
                FileUpload33.Text = "";
                FileUpload44.Text = "";
               txtdate.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss", new System.Globalization.CultureInfo("en-US"));
               txtname.Text= Session["Username"].ToString();
               txtdept.Text = Session["Dept"].ToString();
               txtmanager.Text = Session["ManagerName"].ToString();
               if ((Session["Grouppolicy"].ToString() == "MN") || (Session["Grouppolicy"].ToString() == "Manager"))
               {
                   Response.Redirect("~/Maintenance/FraMain.aspx");
               }
               else if (Session["CheckUPdate"].ToString()=="Update")
                {
                    CallViewUpdate(Session["CheckIssueNo"].ToString());
                }
            }

        }

        #region  cut number

        public static string Left(string param, int length)
        {
            //we start at 0 since we want to get the characters starting from the
            //left and with the specified lenght and assign it to a variable
            string result = param.Substring(0, length);
            //return the result of the operation
            return result;
        }
        public static string Right(string param, int length)
        {
            //start at the index based on the lenght of the sting minus
            //the specified lenght and assign it a variable
            string result = param.Substring(param.Length - length, length);
            //return the result of the operation
            return result;
        }

        public static string Mid(string param, int startIndex, int length)
        {
            //start at the specified index in the string ang get N number of
            //characters depending on the lenght and assign it to a variable
            string result = param.Substring(startIndex, length);
            //return the result of the operation
            return result;
        }

        #endregion

        #region "CallAutoKey()"
        private void CallAutoKey()
        {
            string tmpOrder;
            int OrderID = 0;
            string resultdate = DateTime.Now.ToString("dd/MM/yyyy", new System.Globalization.CultureInfo("en-US"));
            string y = Right(resultdate, 2);
            string d = Left(resultdate, 2);
            string M = Mid(resultdate, 3, 2);
            string dmy = "MN" + y + M + d;

            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            conn.Open();
            try
            {
                SqlCommand sqlCmd = new SqlCommand();
                sqlCmd.Connection = conn;
                sqlCmd.CommandText = " select max(IssueNo) from [dbo].[tb_DocIssue]   where IssueNo like '" + dmy + "%'";
                tmpOrder = (String)sqlCmd.ExecuteScalar();

                OrderID = Convert.ToInt32(Right(tmpOrder, 3));
                OrderID = OrderID + 1;

                AutoIssueNo = dmy + OrderID.ToString("000");
                //strnewid = strnewid.PadLeft(4, '0');    
            }

            catch (Exception ex)
            {
                AutoIssueNo = dmy + OrderID.ToString("001");
            }
            conn.Close();
        }
        #endregion

        #region " InsertIssue()"
        private void  InsertIssue()
        {
            try
            {
        
                if (ck1.Checked ==true)
                { tmpType = "สร้าง"; }
                else if (ck2.Checked == true)
                { tmpType = "ซ่อม"; }
                else { tmpType = "ไม่ระบบ"; }
                System.Data.SqlClient.SqlCommand Cmd;
                System.Data.SqlClient.SqlDataReader rs;
                SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
                // conn.Open();
                try
                {
                    Cmd = new System.Data.SqlClient.SqlCommand(" Insert into [dbo].[tb_DocIssue](IssueNo, TypeHead, IssueDate, IssueName, IssueDept, IssueManager, IssueHead, IssueDetail,  Status, Remark) "
                        + "VALUES ('" + AutoIssueNo + "', '" + tmpType + "', Getdate(), '" + txtname.Text.Trim() + "','" + txtdept.Text.Trim() + "','" + txtmanager.Text.Trim() + "','" + txthead.Text.Trim() + "','" + txtdetail.Text.Trim() + "','Requester Submitted','" + txtremark.Text.Trim() + "')", conn);
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

        #region "UploadPic"
        private void uploadPic()
        {
           // if (FileUpload1.HasFile)
          //  {
                try
                {
                    string tmp = Path.GetFileName(FileUpload1.FileName);

                    if (FileUpload1.PostedFile.ContentLength < 902400)
                    {
                        string filename = Path.GetFileName(FileUpload1.FileName);
                        FileUpload1.SaveAs(Server.MapPath("~/FileUpload/") + filename);
                       // FileUpload2.Text = "Upload status: File uploaded!";
                        FileUploadsave(filename);
                        //Showupload();
                    }
                    else
                    {
                       // FileUpload2.Text = "Upload status: The file has to be less than 900 kb!";
                    }
           
                }
                catch (Exception ex)
                {
                 //   FileUpload2.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
          //  }

        }
        #endregion

        #region "FileUploadsave"
        private void FileUploadsave(string tmpfilename)
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_DocIssue] SET IssuePicture = '" + FileUpload2.Text.Trim() + "',ExFile1 = '" + FileUpload33.Text.Trim() + "',ExFile2 = '" + FileUpload44.Text.Trim() + "'"
                    + " Where IssueNo='" + AutoIssueNo + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
        }
        #endregion

        #region " Send()"
        private void  Send()
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
                           string strTo= Session["ManagerMail"].ToString();
                           string strCC = "lzbtit@la-z-boy-th.com";

                           mail.From = new MailAddress(strFrom.Trim());
                          // mail.To.Add("Pudit@la-z-boy-th.com");//Sent MN
                          // mail.To.Add("lzbtmaintenance@la-z-boy-th.com");//Sent MN
                          // mail.To.Add("lzbtmaintenance1@la-z-boy-th.com");//Sent MN
                           mail.To.Add(strTo);//Sent MN
                           mail.CC.Add(strCC.Trim());

                           if (FileUpload44.Text != "")
                           {
                               Attachment data = new Attachment(Server.MapPath("~/FileUpload/" + FileUpload44.Text.Trim()));
                               mail.Attachments.Add(data);
                           }
                           if (FileUpload33.Text != "")
                           {
                               Attachment data2 = new Attachment(Server.MapPath("~/FileUpload/" + FileUpload33.Text.Trim()));
                               mail.Attachments.Add(data2);
                           }
                           if (FileUpload2.Text != "")
                           {
                               Attachment data3 = new Attachment(Server.MapPath("~/FileUpload/" + FileUpload2.Text.Trim()));
                               mail.Attachments.Add(data3);
                           }

                           mail.Subject = "Waiting for your approval No: " + AutoIssueNo;
                           string body = string.Empty;
                           using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.htm")))
                           {
                               body = reader.ReadToEnd();
                           }
                           string ID = AutoIssueNo;
                           string tmpurl = "http://192.168.1.3/MN/Maintenance/Frmviewhistory.aspx?id=" + ID;
                           body = body.Replace("{_Recievername}", Session["ManagerName"].ToString());
                           body = body.Replace("{_Action}", "Online Review Request Issue");
                           body = body.Replace("{_PONumber}", " ประเภทแจ้ง : " +tmpType+ " เลขที่ : " +AutoIssueNo);
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

        #region "inserthistory()"
        private void  inserthistory()
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
                        + "VALUES ('" + AutoIssueNo + "','Requester Submitted', '" + txtname.Text.Trim() + "',Getdate())", conn);
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

        #region " UploadFile()"
        private void  UploadFile()
        {
            try
            {
                if (this.FileUpload4.HasFile)
                {
                    string filename4 = Path.GetFileName(FileUpload4.PostedFile.FileName);
                    if (filename4 != "")
                    {
                        FileUpload4.SaveAs(Server.MapPath("~/FileUpload/" + filename4));
                        FileUpload44.Text = filename4;
                    }
                }

                if (this.FileUpload3.HasFile)
                {
                    string filename3 = Path.GetFileName(FileUpload3.PostedFile.FileName);
                    if (filename3 != "")
                    {
                        FileUpload3.SaveAs(Server.MapPath("~/FileUpload/" + filename3));
                        FileUpload33.Text = filename3;
                    }
                }

                if (this.FileUpload1.HasFile)
                {
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename != "")
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/FileUpload/" + filename));
                        FileUpload2.Text = Path.GetFileName(FileUpload1.FileName);
                    }
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('ชื่อไฟล์แนบซ้ำ กรุณาเปลี่ยนชื่อไฟล์แนบใหม่ก่อน Upload...')"), true);
                return;
            }
        }
        #endregion

        #region "FileUpdateIssueEdit"
        private void FileUpdateIssueEdit(string issuedocno)
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                if (ck1.Checked == true)
                { tmpType = "สร้าง"; }
                else if (ck2.Checked == true)
                { tmpType = "ซ่อม"; }
                else { tmpType = "ไม่ระบบ"; }
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_DocIssue] SET IssuePicture = '" + FileUpload2.Text.Trim() + "',ExFile1 = '" + FileUpload33.Text.Trim() + "',ExFile2 = '" + FileUpload44.Text.Trim() + "'"
                  + ",IssueHead = '" + txthead.Text.Trim() + "',IssueDetail = '" + txtdetail.Text.Trim() + "',Remark = '" + txtremark.Text.Trim() + "',TypeHead = '" + tmpType + "',CkUser = 'แก้ไขเพิ่มเติม',CkUserDate = Getdate(),MNStatus = NULL"
                    + " Where IssueNo='" + issuedocno + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
        }
        #endregion

     #region "SendMN()"
       private void SendMN()
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
                             string strTo = Session["ManagerMail"].ToString();
                             string strCC = "lzbtit@la-z-boy-th.com";

                             mail.From = new MailAddress(strFrom.Trim());
                             mail.To.Add("kaisak@la-z-boy-th.com");//Sent MN
                             mail.To.Add("lzbtmaintenance@la-z-boy-th.com");//Sent MN
                             mail.To.Add("lzbtmaintenance1@la-z-boy-th.com");//Sent MN
                             mail.CC.Add(strCC.Trim());
                             mail.CC.Add(Session["ManagerMail"].ToString());

                           if (FileUpload44.Text != "")
                           {
                               Attachment data = new Attachment(Server.MapPath("~/FileUpload/" + FileUpload44.Text.Trim()));
                               mail.Attachments.Add(data);
                           }
                           if (FileUpload33.Text != "")
                           {
                               Attachment data2 = new Attachment(Server.MapPath("~/FileUpload/" + FileUpload33.Text.Trim()));
                               mail.Attachments.Add(data2);
                           }
                           if (FileUpload2.Text != "")
                           {
                               Attachment data3 = new Attachment(Server.MapPath("~/FileUpload/" + FileUpload2.Text.Trim()));
                               mail.Attachments.Add(data3);
                           }
                             mail.Subject = "แก้ไขงานเพิมเติม เลขที่ : " + AutoIssueNo;
                             string body = string.Empty;
                             using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplateGr.htm")))
                             {
                                 body = reader.ReadToEnd();
                             }
                             string ID = AutoIssueNo;
                             string tmpurl = "http://192.168.1.3/MN/Maintenance/Frmviewhistory.aspx?id=" + ID;
                             body = body.Replace("{_Manager}", "แก้ไขงานเพิมเติม");
                             body = body.Replace("{_Action}", "Online Review Request Issue");
                             body = body.Replace("{_PONumber}", " ประเภทแจ้ง : " + tmpType + " เลขที่ : " + AutoIssueNo);
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

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            if ((Session["CheckUPdate"].ToString() == "Update")&&(Session["CheckStatus"].ToString() != "แก้ไขเพิ่มเติม"))
            { //แก้ไข
                if ((ck1.Checked == false) && (ck2.Checked == false))
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('กรุณาเลือกประเภท การแจ้ง สร้าง หรือ ซ่อม ก่อน....')"), true);
                    return;
                }

                if ((txthead.Text == "") || (txtdetail.Text == "") || (AutoIssueNo == ""))
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('กรุณาป้อนข้อมูลให้ครบด้วย....')"), true);
                    return;
                }
                AutoIssueNo = IssueNo.Text.Trim();
                if (ck1.Checked == true)
                { tmpType = "สร้าง"; }
                else if (ck2.Checked == true)
                { tmpType = "ซ่อม"; }
                else { tmpType = "ไม่ระบบ"; }

                FileUpdateIssue(IssueNo.Text.Trim());
                Send();

                Response.Redirect("~/Maintenance/FrmCheckStatus.aspx?Sent=SentEmail");
                AutoIssueNo = "";
                txthead.Text = "";
                txtdetail.Text = "";
                FileUpload2.Text = "";
                FileUpload33.Text = "";
                FileUpload44.Text = "";
                //update

                ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('แก้ไข....')"), true);
                Session["CheckUPdate"] = "Save";
            }
            else if ((Session["CheckUPdate"].ToString() == "Update") && (Session["CheckStatus"].ToString() == "แก้ไขเพิ่มเติม"))
            {//ตรวจสอบ แก้ไข อีกรอบ
                if ((ck1.Checked == false) && (ck2.Checked == false))
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('กรุณาเลือกประเภท การแจ้ง สร้าง หรือ ซ่อม ก่อน....')"), true);
                    return;
                }


                if ((txthead.Text == "") || (txtdetail.Text == "") || (AutoIssueNo == ""))
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('กรุณาป้อนข้อมูลให้ครบด้วย....')"), true);
                    return;
                }

                AutoIssueNo = IssueNo.Text.Trim();
                if (ck1.Checked == true)
                { tmpType = "สร้าง"; }
                else if (ck2.Checked == true)
                { tmpType = "ซ่อม"; }
                else { tmpType = "ไม่ระบบ"; }

                FileUpdateIssueEdit(IssueNo.Text.Trim());
                SendMN();

                Response.Redirect("~/Maintenance/FrmCheckStatus.aspx?Sent=SentEmail");
                AutoIssueNo = "";
                txthead.Text = "";
                txtdetail.Text = "";
                FileUpload2.Text = "";
                FileUpload33.Text = "";
                FileUpload44.Text = "";
            }
            else //บันทึก
            {
            CallAutoKey();

            if ((ck1.Checked ==false)&&(ck2.Checked ==false))
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('กรุณาเลือกประเภท การแจ้ง สร้าง หรือ ซ่อม ก่อน....')"), true);
                return;
            }


            if ((txthead.Text =="")||(txtdetail.Text=="")||(AutoIssueNo==""))
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "",string.Format("alert('กรุณาป้อนข้อมูลให้ครบด้วย....')"), true);
                return;
            }

            InsertIssue();
            FileUploadsave(FileUpload2.Text.Trim());
            inserthistory();

            Send();

            Response.Redirect("~/Maintenance/FrmCheckStatus.aspx?Sent=SentEmail");
            AutoIssueNo = "";
            txthead.Text = "";
            txtdetail.Text = "";
            FileUpload2.Text = "";
            FileUpload33.Text = "";
            FileUpload44.Text = "";
            }
        }

        protected void UploadFile(object sender, EventArgs e)
        {


         //   string folderPath = Server.MapPath("~/FileUpload/");
         //   if (!Directory.Exists(folderPath))
           // {
           //     Directory.CreateDirectory(folderPath);
           // }

           // FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
           // Image2.ImageUrl = "~/FileUpload/" + Path.GetFileName(FileUpload1.FileName);
           // FileUpload2.Text = Path.GetFileName(FileUpload1.FileName);

            try
            {
               
                   string filename4 = Path.GetFileName(FileUpload4.PostedFile.FileName);
                   if (filename4 != "")
                   {
                    FileUpload4.SaveAs(Server.MapPath("~/FileUpload/" + filename4));
                    FileUpload44.Text = filename4;
                   }
                   else
                   { FileUpload44.Text = ""; }
                

                string filename3 = Path.GetFileName(FileUpload3.PostedFile.FileName);
                if (filename3 != "")
                {
                    FileUpload3.SaveAs(Server.MapPath("~/FileUpload/" + filename3));
                    FileUpload33.Text = filename3;
                }
                else
                { FileUpload33.Text = ""; }
             
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename != "")
                  {
                    FileUpload1.SaveAs(Server.MapPath("~/FileUpload/" + filename));
                    FileUpload2.Text = Path.GetFileName(FileUpload1.FileName);
                }
                else
                { FileUpload2.Text = ""; }
             
                FileUpload4.Visible = false;
                FileUpload3.Visible = false;
                FileUpload1.Visible = false;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "", string.Format("alert('ชื่อไฟล์แนบซ้ำ กรุณาเปลี่ยนชื่อไฟล์แนบใหม่ก่อน Upload...')"), true);
                return;
            }

         

        }

        protected void ck1_CheckedChanged(object sender, EventArgs e)
        {
            if (ck1.Checked==true)
            {
                ck2.Checked = false;
            }
        }

        protected void ck2_CheckedChanged(object sender, EventArgs e)
        {
            if (ck2.Checked == true)
            {
                ck1.Checked = false;
            }
        }

        #region "CallViewUpdate"
        private void CallViewUpdate(String tmpDocno)
        {
        
             System.Data.SqlClient.SqlCommand Cmd;
             System.Data.SqlClient.SqlDataReader rs;
             SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
             //conn.Open();
             try
             {
                 Cmd = new System.Data.SqlClient.SqlCommand(" select * from [dbo].[tb_DocIssue]  Where IssueNo='" + tmpDocno + "'", conn);
                 conn.Open();
                 rs = Cmd.ExecuteReader();
                 while (rs.Read())
                 {
                     IssueNo.Visible = true;
                     IssueNo.Text = rs["IssueNo"].ToString();
                     txthead.Text = rs["IssueHead"].ToString();
                     txtdetail.Text = rs["IssueDetail"].ToString();
                     txtremark.Text = rs["Remark"].ToString();
                     FileUpload44.Text = rs["ExFile2"].ToString();
                     FileUpload44.NavigateUrl = "~/FileUpload/" + rs["ExFile2"].ToString();
                     FileUpload33.Text = rs["ExFile1"].ToString();
                     FileUpload33.NavigateUrl = "~/FileUpload/" + rs["ExFile1"].ToString();
                     FileUpload2.Text = rs["IssuePicture"].ToString();
                     FileUpload2.NavigateUrl = "~/FileUpload/" + rs["IssuePicture"].ToString();

                     string ck = rs["TypeHead"].ToString();
                     if ( ck =="สร้าง")
                     {
                         ck1.Checked = true;
                         ck2.Checked = false;
                     }
                     else
                     {
                         ck2.Checked = true;
                         ck1.Checked = false;
                     }
                     if (Session["CheckStatus"] == "แก้ไขเพิ่มเติม")
                     {
                         lblEdit.Visible = true;
                         lblEdit.Text = "แก้ไขเพิ่มเติม";
                     }
                     else
                     {
                         lblEdit.Visible = false;
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

        #region "FileUpdateIssue"
        private void FileUpdateIssue(string issuedocno)
        {
            System.Data.SqlClient.SqlCommand Cmd;
            System.Data.SqlClient.SqlDataReader rs;
            SqlConnection conn = new SqlConnection(WebConfig.Getconnection());
            // conn.Open();
            try
            {
                if (ck1.Checked == true)
                { tmpType = "สร้าง"; }
                else if (ck2.Checked == true)
                { tmpType = "ซ่อม"; }
                else { tmpType = "ไม่ระบบ"; }
                Cmd = new System.Data.SqlClient.SqlCommand(" UPDATE [dbo].[tb_DocIssue] SET IssuePicture = '" + FileUpload2.Text.Trim() + "',ExFile1 = '" + FileUpload33.Text.Trim() + "',ExFile2 = '" + FileUpload44.Text.Trim() + "'"
                  + ",IssueHead = '" + txthead.Text.Trim() + "',IssueDetail = '" + txtdetail.Text.Trim() + "',Remark = '" + txtremark.Text.Trim() + "',IssueDate = Getdate(),TypeHead = '" + tmpType + "'"
                    + " Where IssueNo='" + issuedocno + "'", conn);
                conn.Open();
                rs = Cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
            }
        }
        #endregion

    }
}