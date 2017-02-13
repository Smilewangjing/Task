using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task.Model
{
    public class UserRoleModel
    {
        private int id;
        private int userID;
        private int roleID;
        private DateTime updateTime;
        private string isDel;
        public int ID 
        {
            get { return id; }
            set { id = value; }
        }
        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }
        public int RoleID
        {
            get { return roleID; }
            set { roleID = value; }
        }
        public DateTime UpdateTime
        {
            get { return updateTime; }
            set { updateTime = value; }
        }
        public string IsDel 
        {
            get { return isDel; }
            set { isDel = value; }
        }
    }
}
