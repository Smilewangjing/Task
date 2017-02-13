using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.IO;
using System.Net.Mime;

using System.Data;
using Task.DAL;
using Task.Model;

namespace Task.BLL
{
    public class loginBll
    {
        loginDal dal = new loginDal();
        public Boolean checkUserName(string account)
        {
            string sqlStr = string.Format("select * from EHS_User where Account COLLATE Chinese_PRC_CS_AI ='{0}'", account);
            return dal.checkUserName(sqlStr);
        }
        public Boolean checkMobilePhone(string mobilePhone)
        {
            string sqlStr = string.Format("select * from EHS_User where MobilePhone='{0}'", mobilePhone);
            return dal.checkMobilePhone(sqlStr);
        }
        public Boolean checkEmail(string Email)
        {
            string sqlStr = string.Format("select * from EHS_User where Email='{0}'", Email);
            return dal.checkMobilePhone(sqlStr);
        }
        public DataTable login(string account,string password)
        {
            string sqlStr = string.Format("select * from EHS_User where Account='{0}'", account);
            return dal.login(sqlStr,password);
        }
        public string SendMails(string MailTo, string Subject, string ValidataCode, int BodyFormat, int Priority, string Attachments)
        {
            string result;
            SmtpClient mail = new SmtpClient();
            //发送方式
            mail.DeliveryMethod = SmtpDeliveryMethod.Network;
            //smtp服务器
            mail.Host = "smtp.163.com";
            //用户名凭证               
            mail.Credentials = new System.Net.NetworkCredential("18668097870", "wocaonima");
            //邮件信息
            MailMessage message = new MailMessage();
            //发件人
            message.From = new MailAddress("18668097870@163.com");
            //收件人
            message.To.Add(MailTo);
            //附件
            //message.Attachments.Add(new Attachment("ValidatedCode.aspx"));
            //附件格式
            //message.Attachments[0].ContentType.Name = "image/gif";
            //主题
            message.Subject = Subject;
            //内容
            string body1 = "欢迎注册远哈指令管理系统,";
            string body2 = "您的验证码为";
            string body3 = ValidataCode;
            string Body = body1 + body2 + body3;
            message.Body = Body;
            //正文编码
            message.BodyEncoding = System.Text.Encoding.UTF8;
            //设置为HTML格式
            message.IsBodyHtml = true;
            //优先级
            message.Priority = MailPriority.High;
            try
            {
                mail.Send(message);
                result = "发送成功";
                return result;
            }
            catch (Exception e)
            {
                result = e.ToString();
            }
            return result;
        }

    }
}
