using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task.Model
{
    public class UserModel
    {
        private int id;//id
        private string account;//用户名
        private string password;//密码
        private string nickName;//昵称
        private string mobilePhone;//手机
        private string email;//邮箱
        private Boolean isEmail;
        private int userState; //是否在线
        private DateTime currentTime;//最近登陆时间
        private DateTime lastTime;//最后登陆时间
        private DateTime createTime;//操作时间
        private DateTime updateTime;//更新时间
        private int isDel;//逻辑删除
        private int flag;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public string Account 
        {
            get { return account; }
            set { account = value; }
        }
        public string Password 
        {
            get { return password; }
            set { password = value; }
        }
        public string NickName
        {
            get { return nickName; }
            set { nickName = value; }
        }
        public string MobilePhone
        {
            get { return mobilePhone; }
            set { mobilePhone = value; }
        }
        public string Email 
        {
            get { return email; }
            set { email = value; }
        }
        public Boolean IsEmail {
            get { return isEmail; }
            set { isEmail = value; }
        }
        public int UserState {
            get { return userState; }
            set { userState = value; }
        }
        public DateTime CurrentTime
        {
            get { return currentTime; }
            set { currentTime = value; }
        }
        public DateTime LastTime
        {
            get { return lastTime; }
            set { lastTime = value; }
        }
        public DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }
        public DateTime UpdateTime
        {
            get { return updateTime; }
            set { updateTime = value; }
        }
        public int IsDel {
            get { return isDel; }
            set { isDel = value; }
        }
        public int Flag {
            get { return flag; }
            set { flag = value; }
        }
    }
}
