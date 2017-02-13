using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Task.BLL;

public partial class home_EmailValidated : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loginBll eml = new loginBll();
        if (Request["Email"] != null)
        {
            ValidatedCode v = new ValidatedCode();
            string code = v.CreateVerifyCode();
            Session["EmailCode"] = code;
            string a = eml.SendMails(Request["Email"], "远哈注册", code, 0, 2, "null");
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(a);
            Response.End();
        }
        else if (Request["Validatedcode"] != null)
        {
            string vCode = Session["EmailCode"].ToString();
            string a = vCode.ToUpper() == Request["Validatedcode"].Trim().ToUpper() ? "true" : "false";
            Response.Clear();
            Response.ContentType = "text/plain";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(a);
            Response.End();
        }
    }
}