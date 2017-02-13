using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Task.Model;
using Task.BLL;

public partial class loadhtml_EditRole : System.Web.UI.Page
{
    public RoleModel role=null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["roleId"] == null)
        { LoadData(); }
        else 
        {
            role=new RoleModel();
            RoleBll BLL=new RoleBll();
            role.Id=Convert.ToInt32(Request["roleId"]);
            role.Name=Request["roleName"];
            role.Remark=Request["roleRemark"];
            role.UpdateTime=DateTime.Now;
            int rows = BLL.Update(role);
            role = BLL.GetById(Convert.ToInt32(Request["roleId"])); 
            Response.Write(rows);
        }
    }
    public void LoadData() 
    {
        RoleBll BLL = new RoleBll();
        //role = BLL.GetById(1);
        role = BLL.GetById(Convert.ToInt32(Request["id"]));
    }
}