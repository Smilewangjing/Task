using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task.Model
{
    public class TaskSendeeModel
    {
        private int id;
        private int commandID;
        private int userID;
        private int state;
        private DateTime createTime;
        private int isDel;
        public int Id
        {
            get { return id; }
            set { value = id; }
        }
        public int CommandID
        {
            get { return commandID; }
            set { value = commandID; }
        }
        public int UserID
        {
            get { return userID; }
            set { value = userID; }
        }
        public int State
        {
            get { return state; }
            set { value = state; }
        }
        public DateTime CreateTime
        {
            get { return createTime; }
            set { value = createTime; }
        }
        public int IsDel
        {
            get { return isDel; }
            set { value = isDel; }
        }
    }
}
