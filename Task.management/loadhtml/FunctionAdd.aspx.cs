using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.Model;
using Task.BLL;

public partial class loadhtml_AddFunction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["name"] == null)
        { }
        else 
        { 
            //拿到前台的值
            Function fun = new Function();
            fun.Name=Request["name"];
            fun.Icon= Request["icon"];
            fun.Url= Request["url"];
            fun.SortID= Convert.ToInt32(Request["sortID"]);
            fun.ParentID= Convert.ToInt32(Request["fatherID"]);
            fun.ParentCode= Request["fatherCode"];
            fun.Level= Convert.ToInt32(Request["level"]);
            fun.Loaded= Convert.ToInt32(Request["loaded"]);
            fun.Defaulted= Convert.ToInt32(Request["defaultLoad"]);
            fun.UpdateTime = DateTime.Now;
            fun.IsDel = 0;
            //添加到数据库
            FunctionDal dal = new FunctionDal();
            int rows= dal.Add(fun);
           //返回执行结果
           Response.Clear();
           Response.ContentType = "text/plain";
           Response.ContentEncoding = System.Text.Encoding.UTF8;
           Response.Write(rows);
           Response.End();

        }
    }
}