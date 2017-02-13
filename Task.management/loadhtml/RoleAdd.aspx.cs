using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.Model;
using Task.BLL;

public partial class loadhtml_AddRole : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["roleName"]!=null)
        {
            //拿到前台的值
            string roleName = Request["roleName"];
            string roleRemark = Request["roleRemark"];
            int roleSortId = Convert.ToInt32(Request["roleSortId"]);
            //插入到数据库里
            RoleModel role = new RoleModel();
            role.Name = roleName; 
            role.Remark = roleRemark;
            role.SortId = roleSortId;
            role.UpdateTime = DateTime.Now;
            role.IsDel = 0;
            RoleBll BLL = new RoleBll();
            int rows = -1;
            rows=BLL.Add(role);
            //返回执行结果
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(rows);
            Response.End();
        }
    }
}