using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace MaintenanceService.UI.Template.Email
{
    public class POMail
    {
        private string _MailSubject;
        private string _MailContent;

        public string MailSubject(string PONumber, string Action)
        {
            if (Action == "submit")
                _MailSubject = string.Format("PO no. {0} waiting for your approval.", PONumber);
            else if (Action == "approved")
                _MailSubject = string.Format("PO no. {0} has approved.", PONumber);
            else if (Action == "rejected")
                _MailSubject = string.Format("PO no. {0} has rejected.", PONumber);
            else if (Action == "messages")
                _MailSubject = string.Format("Messages from PO no. {0}.", PONumber);
            return _MailSubject;
        }

        public string MailContent(string path, string PONumber, string Title, string Fullname, string Description, string Remark, string ActionURL, string Chiefname, string Action, string Position)
        {
            return PopulateBody(path, PONumber, Title, Fullname, Description, Remark, ActionURL, Chiefname, Action, Position);
        }

        private string PopulateBody(string path, string PONumber, string Title, string Fullname, string Description, string Remark, string ActionURL, string Chiefname, string Action, string Position)
        {
            using (StreamReader reader = new StreamReader(path))
            {
                _MailContent = reader.ReadToEnd();
            }
            _MailContent = _MailContent.Replace("[_Recievername]", Fullname);
            _MailContent = _MailContent.Replace("[_PONumber]", PONumber);
            _MailContent = _MailContent.Replace("[_Title]", Title);
            _MailContent = _MailContent.Replace("[_Description]", Description);
            _MailContent = _MailContent.Replace("[_Remark]", Remark);
            _MailContent = _MailContent.Replace("[_ActionURL]", ActionURL);
            _MailContent = _MailContent.Replace("[_Sendername]", Chiefname);
            _MailContent = _MailContent.Replace("[_Action]", Action);
            _MailContent = _MailContent.Replace("[_Position]", Position);
            return _MailContent;
        }
    }
}
