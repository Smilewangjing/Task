using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Task.Model;
using Task.DAL;
using System.Data;

namespace Task.BLL
{
    public class RoleBll
    {
        RoleDal dal = new RoleDal();
        //根据指定id获取
        public RoleModel GetById(int id) 
        {
            return dal.GetById(id);
        }
        //获取全部
        public DataTable GetAll() 
        {
            return dal.GetAll();
        }
        //增加
        public int Add(RoleModel role) 
        { 
            //调用DAL层的add方法并返回
            return dal.Add(role);
        }
        //删除
        public int Del(int id) 
        {
            return dal.Del(id);
        }
        //修改
        public int Update(RoleModel role) 
        {
            return dal.Update(role);
        }
    }
}
