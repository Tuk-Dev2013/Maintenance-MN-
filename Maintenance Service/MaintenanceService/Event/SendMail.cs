using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Text;
using MaintenanceService;
using MaintenanceService.UI.Template.Email;

namespace MaintenanceService.UI.Event
{
    public class SendMail
    {
        private string _path, _PONumber, _Title, _Fullname, _Description, _Remark, _ActionURL, _Chiefname, _MailTo, _MailCC, _Action, _Position;
        private string[] _MailFrom;
        public string path { get { return _path;} set { _path = value; }}
        public string PONumber { get { return _PONumber;} set { _PONumber = value; }}
        public string Title { get { return _Title;} set { _Title = value; }}
        public string Fullname { get { return _Fullname;} set { _Fullname = value; }}
        public string Description { get { return _Description;} set { _Description = value; }}
        public string Remark { get { return _Remark;} set { _Remark = value; }}
        public string ActionURL { get { return _ActionURL;} set { _ActionURL = value; }}
        public string Chiefname { get { return _Chiefname;} set { _Chiefname = value; }}
        public string[] MailFrom { get { return _MailFrom;} set { _MailFrom = value; }}
        public string MailTo { get { return _MailTo; } set { _MailTo = value; } }
        public string MailCC { get { return _MailCC; } set { _MailCC = value; } }
        public string Action { get { return _Action; } set { _Action = value; } }
        public string Position { get { return _Position; } set { _Position = value; } }

        public void Send()
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
                            mail.From = new MailAddress(_MailFrom[0], _MailFrom[1]);
                            mail.To.Add(_MailTo);
                            mail.CC.Add("lzbtit@la-z-boy-th.com");
                            mail.Subject = poMail.MailSubject(_PONumber, _Action);
                            mail.Body = poMail.MailContent(_path, _PONumber, _Title, _Fullname, _Description, _Remark,
                                _ActionURL, _Chiefname, _Action, _Position);
                            mail.IsBodyHtml = true;
                            SmtpServer.Port = 25;
                            SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
                            SmtpServer.Send(mail);
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
    }
}
