using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyWeb.DBUtility;
using System.Web.Services;
using System.Data;

namespace MyWeb
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static int AddRegister(string Account, string Password, string Name, string Sex, string Identity)
        {
            DBHelper db = new DBHelper();
            string sql0 = "select * from UserInfo_Tbl where del=0 and account='" + Account + "'";
            DataSet ds = db.Query(sql0);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return 0;
            }
            else
            {
                string sql = "insert into UserInfo_Tbl(account,password,name,sex,IDNo,type,addDate,del) values('" + Account + "','" + Password + "','" + Name + "','" + Sex + "','" + Identity + "',1,getdate(),0)";
                int renum = db.ExecuteSql(sql);
                if (renum == 1)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }


        }
    }
}