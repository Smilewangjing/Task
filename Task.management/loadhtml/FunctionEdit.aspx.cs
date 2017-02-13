using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.BLL;
using Task.Model;

public partial class loadhtml_FunctionEdit : System.Web.UI.Page
{
    public Function fun = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            GetData();
        }
        if(Request["name"]!=null)
        {
            //拿到值
            fun=new Function();
            fun.Id = Convert.ToInt32(Request["id"]);
            fun.Name = Request["name"];
            fun.Icon = Request["icon"];
            fun.Url=Request["url"];
            fun.SortID = Convert.ToInt32(Request["sortID"]);
            fun.ParentID = Convert.ToInt32(Request["fatherID"]);
            fun.ParentCode = Request["fatherCode"];
            fun.Level = Convert.ToInt32(Request["level"]);
            fun.Loaded = Convert.ToInt32(Request["loaded"]);
            fun.Defaulted = Convert.ToInt32(Request["defaultLoad"]);
            fun.UpdateTime=DateTime.Now;
            //修改
            FunctionDal dal=new FunctionDal();
            int rows = dal.Update(fun);
            fun = dal.GetByID(Convert.ToInt32(Request["id"]));
            //返回结果
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(rows);
            Response.End();
        }
        
    }

    public  void GetData()
    {
        FunctionDal dal = new FunctionDal();
        fun = dal.GetByID(Convert.ToInt32(Request["id"]));
    }
}