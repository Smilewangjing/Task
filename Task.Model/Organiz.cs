using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task.Model
{
    public class Organiz
    {
        private int num;//总数量

        public int Num
        {
            get { return num; }
            set { num = value; }
        }
        private int iD;//id
        private string name;//名称
        private string explanation;//描述
        private int sortID;//排序字段
        private string secretKey;//唯一标识
        private int parentID;//父级ID
        private string parentCode;//父级代码
        private int menuLevel;//等级
        private DateTime updateTime;//操作时间
        private int isDel;//逻辑删除

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

        public int MenuLevel
        {
            get { return menuLevel; }
            set { menuLevel = value; }
        }

        public string ParentCode
        {
            get { return parentCode; }
            set { parentCode = value; }
        }

        public int ParentID
        {
            get { return parentID; }
            set { parentID = value; }
        }

        public string SecretKey
        {
            get { return secretKey; }
            set { secretKey = value; }
        }
        public int SortID
        {
            get { return sortID; }
            set { sortID = value; }
        }

        public string Explanation
        {
            get { return explanation; }
            set { explanation = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public int ID
        {
            get { return iD; }
            set { iD = value; }
        }
    }
}
