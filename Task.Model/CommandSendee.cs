using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task.Model
{
    public class CommandSendee
    {
        private int iD;//id
        private int commandID;//指令id
        private int userID;//网评员id
        private int state;//状态
        private DateTime createTime;//创建时间
        private int isDel;//逻辑删除

        public int IsDel
        {
            get { return isDel; }
            set { isDel = value; }
        }

        public DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        public int State
        {
            get { return state; }
            set { state = value; }
        }

        public int UserID
        {
            get { return userID; }
            set { userID = value; }
        }

        public int CommandID
        {
            get { return commandID; }
            set { commandID = value; }
        }

        public int ID
        {
            get { return iD; }
            set { iD = value; }
        }
    }
}
