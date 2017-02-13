<%@ WebHandler Language="C#" Class="Log" %>

using System;
using System.Web;

using Task.DAL;
using Task.BLL;
using Newtonsoft.Json;

public class Log : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request["id"] != null && context.Request["limit"]!=null)
        {
            string JSON = null;
            try
            {
                logBll log = new logBll();
                JSON = JsonConvert.SerializeObject(log.getLog(context.Request["limit"], context.Request["id"]));
                //JSON = demo.bll.ToJSON.ToJson(select.selectName());
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