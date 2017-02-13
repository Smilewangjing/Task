<%@ WebHandler Language="C#" Class="Login" %>

using System;
using System.Web;
using Task.DAL;
using Task.BLL;
using Newtonsoft.Json;

public class Login : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string JSON = null;
        userBll ubl = new userBll();
        if (context.Request["account"] != null)
        {
            JSON = JsonConvert.SerializeObject(ubl.getOneUser(context.Request["account"]));
            if (context.Request["password"] != null)
            {
                try
                {
                    loginBll login = new loginBll();
                    JSON = JsonConvert.SerializeObject(login.login(context.Request["account"], context.Request["password"]));
                }
                catch (Exception ex)
                {
                    JSON = ex.ToString();
                }
            }
        }
        else if (context.Request["ID"] != null) 
        {
            JSON = JsonConvert.SerializeObject(ubl.getOneRole(context.Request["ID"]));
        }
        context.Response.Clear();
        context.Response.ContentType = "text/plain";
        context.Response.ContentEncoding = System.Text.Encoding.UTF8;
        context.Response.Write(JSON);
        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}