<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;

using Task.DAL;
using Task.BLL;
using Newtonsoft.Json;


public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request["account"]!=null) 
        {
            string JSON = null;
            try
            {
                loginBll login = new loginBll();
                JSON = JsonConvert.SerializeObject(login.login(context.Request["account"], context.Request["password"]));
            }
            catch (Exception ex)
            {
                JSON = ex.ToString();
            }
            context.Response.Clear();
            context.Response.ContentType = "text/plain";
            context.Response.ContentEncoding = System.Text.Encoding.UTF8;
            context.Response.Write(JSON);
            context.Response.End();
        }

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}