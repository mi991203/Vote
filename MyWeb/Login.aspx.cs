using MyWeb.DBUtility;
using MyWeb.WebUtility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["id"] = null;
                Session["name"] = null;
            }
        }
        protected void btn_login_ServerClick(object sender, EventArgs e)
        {
            DBHelper db = new DBHelper();
            WebHelper wb = new WebHelper();
            if (Account.Value == "")
            {
                wb.Alert("账号不能为空！");
            }
            else if (Password.Value == "")
            {
                wb.Alert("密码不能为空！");
            }
            else if (VCode.Value == "")
            {
                wb.Alert("验证码不能为空！");
            }
            else if (VCode.Value != Session["check_code"].ToString())
            {

                wb.Alert("验证码输入错误！");
            }
            else
            {
                string sql = "select id,name from UserInfo_Tbl where del=0 and account='" + Account.Value + "' and password='" + Password.Value + "'";
                DataSet ds = db.Query(sql);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["id"] = ds.Tables[0].Rows[0]["id"];
                    Session["name"] = ds.Tables[0].Rows[0]["name"];
                    wb.Alert("登陆成功", "UserVote.aspx");
                }
                else
                {
                    wb.Alert("登陆失败，请检查账号和密码是否正确！");
                }
            }
        }
    }
}