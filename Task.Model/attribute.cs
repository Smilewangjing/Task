using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task.Model
{
    public class attribute
    {
        private int ID;//id
        private string name;//名字
        private string icon;//图片
        private string url;//url
        private int sortID;//排序
        private int parentID;//父ID
        private string parentCode;//父代码
        private int level;//等级
        private int loaded;//是否加载
        private int defaulted;//是否默认
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

        public int Defaulted
        {
            get { return defaulted; }
            set { defaulted = value; }
        }

        public int Loaded
        {
            get { return loaded; }
            set { loaded = value; }
        }

        public int Level
        {
            get { return level; }
            set { level = value; }
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

        public int SortID
        {
            get { return sortID; }
            set { sortID = value; }
        }

        public string Url
        {
            get { return url; }
            set { url = value; }
        }

        public string Icon
        {
            get { return icon; }
            set { icon = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public int ID1
        {
            get { return ID; }
            set { ID = value; }
        }
    }
}
