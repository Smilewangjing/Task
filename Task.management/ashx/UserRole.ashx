<%@ WebHandler Language="C#" Class="UserRole" %>

using System;
using System.Web;
using Task.DAL;
using Task.BLL;
using Newtonsoft.Json;
using System.Data;


public class UserRole : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string JSON = null;
        try
        {
            userBll get = new userBll();
            if (context.Request["id"] != null)
            {
                string i = context.Request["id"];
                //JSON = JsonConvert.SerializeObject(get.getJurisdiction(i));
            }
            else {
                DataSet set = new DataSet();
                set.Tables.Add(get.getUserRole());
                JSON = JsonConvert.SerializeObject(set);
            }
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
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}