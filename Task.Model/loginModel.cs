using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task.Model
{
    public class loginModel
    {
        private int iD;//id

     
        private string account; //用户名
        private string password; //密码
        private string nickname; //昵称
        private string phone; //手机 
        private string email; //邮箱
        private DateTime currenttime; //登录时间
        private DateTime lasttime; //最后时间
        private DateTime createtime; //创建时间
        private DateTime updatetime; //更新时间
        private int isdel; //逻辑删除
        public int ID
        {
            get { return iD; }
            set { iD = value; }
        }
        public string Account 
        {
            get { return account;}
            set { account = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string NickName
        {
            get { return nickname; }
            set { nickname = value; }
        }
        public string MobilePhone
        {
            get { return phone; }
            set { phone = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public DateTime CurrentTime
        {
            get { return currenttime; }
            set { currenttime = value; }
        }
        public DateTime LastTime
        {
            get { return lasttime; }
            set { lasttime = value; }
        }
        public DateTime CreateTime
        {
            get { return createtime; }
            set { createtime = value; }
        }
        public DateTime UpdateTime
        {
            get { return updatetime; }
            set { updatetime = value; }
        }
        public int IsDel
        {
            get { return isdel; }
            set { isdel = value; }
        }
    }
}
