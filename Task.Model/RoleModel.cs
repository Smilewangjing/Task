using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task.Model
{
    public class RoleModel
    {
        private int id;//id
        private string name;//名字
        private string remark;//备注
        private int sortId;//排序
        private DateTime updateTime;//操作时间
        private int isDel;//逻辑删除

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int IsDel
        {
            get { return isDel; }
            set { isDel = value; }
        }

        public DateTime UpdateTime
        {
            get { return updateTime; }
            set { updateTime = value; }
        }

        public int SortId
        {
            get { return sortId; }
            set { sortId = value; }
        }

        public string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

     

    }
}
