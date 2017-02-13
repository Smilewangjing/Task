using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.Model;
using Task.BLL;
public partial class loadhtml_OrganizAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["name"]!=null)
        {
            //接受参数封装对象
            Organiz org = new Organiz();
            org.Name=Request["name"];
            org.Explanation = Request["desc"];
            org.SortID = Convert.ToInt32(Request["sortID"]);
            org.SecretKey = Request["secretKey"];
            org.ParentID = Convert.ToInt32(Request["parentID"]);
            org.ParentCode = Request["parentCode"];
            org.MenuLevel = Convert.ToInt32(Request["level"]);
            org.UpdateTime = DateTime.Now;
            org.IsDel = 0;
            //添加到数据库里面去
            OrganizDal dal = new OrganizDal();
            int rows = dal.Add(org);
            //返回执行结果
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(rows);
            Response.End();
        }
    }
}