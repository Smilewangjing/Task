<%@ WebHandler Language="C#" Class="ProcessReceiver" %>

using System;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using Task.BLL;
using Task.DAL;
using Newtonsoft.Json;

public class ProcessReceiver : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
       string flag=context.Request["flag"];
       int id = Convert.ToInt32(context.Request["userID"]);
       int duration = context.Request["duration"]!=null?Convert.ToInt32(context.Request["duration"]):0;
       string result = "";
       switch (flag) 
       { 
           case "all":
               if (duration == 0)
               {
                   result = Query(id, 0);
               }
               else 
               {
                   result = QueryAddDuration(id, 0, duration);
               }
              
               break;
           case "unfinshed":
               if (duration == 0)
               {
                   result = Query(id, 123);
               }
               else 
               {
                   result = QueryAddDuration(id, 123, duration);
               }
              
               break;
           case "finshed":
               if (duration == 0)
               {
                   result = Query(id, 4);
               }
               else 
               {
                   result = QueryAddDuration(id, 4, duration);
               }  
               break;
           case "1":
               if (duration == 0)
               {
                   result = Query(id, 1);
               }
               else 
               {
                   result = QueryAddDuration(id, 1, duration);
               }  
               break;
           case "2":
               if (duration == 0)
               {
                   result = Query(id, 2);
               }
               else
               {
                   result = QueryAddDuration(id, 2, duration);
               }
               break;
           case "3":
               if (duration == 0)
               {
                   result = Query(id, 3);
               }
               else
               {
                   result = QueryAddDuration(id, 3, duration);
               }
               break;
       }
       context.Response.Clear();
       context.Response.ContentType = "text/plain";
       context.Response.ContentEncoding = System.Text.Encoding.UTF8;
       context.Response.Write(result);
       context.Response.End();
    }
    //根据网评员id和条件查询
    private string Query(int id, int state)
    {
        string sql = "";
        //全部
        if (state == 0)
        {
            sql = string.Format("select t1.ID,t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.ID=t2.CommandID and t2.State=t3.ID  and t2.UserID={0}", id);
        }
        //查询未完成
        else if (state == 123)
        {
            sql = string.Format("select t1.ID,t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.ID=t2.CommandID and t2.State=t3.ID  and t2.UserID={0} and t2.State!={1}", id, 4);
        }
        else
        {
            sql = string.Format("select t1.ID,t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.ID=t2.CommandID and t2.State=t3.ID  and t2.UserID={0} and t2.State={1}", id, state);
        }
        //返回
        DataTable dt = DBHelper.ExecuteDataTable(sql, System.Data.CommandType.Text);
        string json = JsonConvert.SerializeObject(dt);
        return json;
    }
    //时间
    private string QueryAddDuration(int id, int state, int dur)
    {
        string sql = "";
        DataTable dt3;
        if (dur != 7)
        {
            DateTime dt1 = DateTime.Now, dt2 = DateTime.Now;
            switch (dur)
            {
                case 1:
                    dt1 = DateTime.Now.Date;
                    dt2 = DateTime.Now.AddDays(1).Date;
                    break;
                case 3:
                    dt1 = DateTime.Now.AddDays(-1).Date;
                    dt2 = DateTime.Now.AddDays(1).Date;
                    break;
            }

            //全部
            if (state == 0)
            {
                sql = string.Format("select t1.ID,t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.ID=t2.CommandID and t2.UserID={0} and t2.State=t3.ID and t2.CreateTime between @d1 and @d2", id);
            }
            //查询未完成
            else if (state == 123)
            {
                sql = string.Format("select t1.ID,t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.ID=t2.CommandID and t2.UserID={0} and t2.State!={1} and t2.State=t3.ID and t2.CreateTime between @d1 and @d2", id, 4);
            }
            else
            {
                sql = string.Format("select t1.ID,t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.ID=t2.CommandID and t2.UserID={0} and t2.State={1} and t2.State=t3.ID and t2.CreateTime between @d1 and @d2", id, state);
            }
            SqlParameter[] pms =
        {
            new SqlParameter("@d1",dt1),
            new SqlParameter("@d2",dt2)
        };
            //返回
            dt3 = DBHelper.ExecuteDataTable(sql, System.Data.CommandType.Text, pms);
        }
        else
        {
            if (state == 0)
            {
                sql = string.Format("select t1.ID,t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.ID=t2.CommandID and t2.State=t3.ID  and  t2.UserID={0}", id);
            }
            //查询未完成
            else if (state == 123)
            {
                sql = string.Format("select t1.ID,t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.ID=t2.CommandID and t2.State=t3.ID  and t2.UserID={0} and t2.State!={1}", id, 4);
            }
            else
            {
                sql = string.Format("select t1.ID,t1.ServerName,t1.CommandContent,t3.Description,t2.CreateTime,t2.DisableTime from CMT_Command t1,CMT_CommandSendee t2,CMT_State t3 where t1.ID=t2.CommandID and t2.State=t3.ID  and t2.UserID={0} and t2.State={1}", id, state);
            }
            dt3 = DBHelper.ExecuteDataTable(sql, System.Data.CommandType.Text);
        }

        string json = JsonConvert.SerializeObject(dt3);
        return json;
    } 
    public bool IsReusable {
        get {
            return false;
        }
    }

}