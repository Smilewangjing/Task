using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.Model;
using Task.BLL;

public partial class loadhtml_OrganizEdit : System.Web.UI.Page
{
    public Organiz org = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //第一次访问先展示用户数据
        if(Request["id"]!=null)
        {
            ShowData();
        }
        if(Request["name"]!=null)
        {
            //封装对象
            org = new Organiz();
            org.ID = Convert.ToInt32(Request["id"]);
            org.Name = Request["name"];
            org.Explanation = Request["desc"];
            org.SortID = Convert.ToInt32(Request["sortID"]);
            org.SecretKey = Request["secretKey"];
            org.ParentID = Convert.ToInt32(Request["parentID"]);
            org.ParentCode = Request["parentCode"];
            org.MenuLevel = Convert.ToInt32(Request["level"]);
            org.UpdateTime = DateTime.Now;
            //进行修改
            OrganizDal dal = new OrganizDal();
            int rows = dal.Update(org);
            org = dal.GetByID(Convert.ToInt32(Request["id"]));
           
            //返回执行结果
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(rows);
            Response.End();
           
        }
        //修改的时候
        //if (Request["name"] != null)
        //{
        //    //封装对象
        //    org = new Organiz();
        //    org.ID = Convert.ToInt32(Request["id"]);
        //    org.Name = Request["name"];
        //    org.Explanation = Request["desc"];
        //    org.SortID = Convert.ToInt32(Request["sortID"]);
        //    org.SecretKey = Request["secretKey"];
        //    org.ParentID = Convert.ToInt32(Request["parentID"]);
        //    org.ParentCode = Request["parentCode"];
        //    org.MenuLevel = Convert.ToInt32(Request["level"]);
        //    org.UpdateTime = DateTime.Now;
        //    //进行修改
        //    OrganizDal dal = new OrganizDal();
        //    org = dal.GetByID(Convert.ToInt32(Request["id1"]));
        //    int rows = dal.Update(org);
        //    //返回执行结果
        //    Response.Clear();
        //    Response.ContentType = "text/plain";
        //    Response.ContentEncoding = System.Text.Encoding.UTF8;
        //    Response.Write(rows);
        //    Response.End();
        //}
    }
    //展示用户数据的函数
    private void ShowData()
    {
        OrganizDal dal = new OrganizDal();
        org = dal.GetByID(Convert.ToInt32(Request["id"]));
    }
}