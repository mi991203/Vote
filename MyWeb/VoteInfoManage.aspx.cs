using MyWeb.DBUtility;
using MyWeb.WebUtility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyWeb
{
    public partial class VoteInfoManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string loadVoteInfoManage(string pi, string ps)
        {
            DBHelper db = new DBHelper();
            string sql = "select top " + ((Convert.ToInt32(pi) - 1) * Convert.ToInt32(ps) + Convert.ToInt32(ps)) + " * from Vote_Tbl where del=0 and id not in (select top " + ((Convert.ToInt32(pi) - 1) * Convert.ToInt32(ps)) + " id from Vote_Tbl where del=0 order by addDate) order by addDate";
            DataSet ds = db.Query(sql);
            string html = "";
            string type = "";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["status"].ToString() == "1")
                {
                    type = "是";
                }
                else {
                    type = "否";
                }
                html += "<tr><td>" + ds.Tables[0].Rows[i]["name"] + "</td><td class='type'>" + type + "</td><td>" + ds.Tables[0].Rows[i]["addDate"] + "</td><td><input type='button' value='设置可投票' class='btn1' id='" + ds.Tables[0].Rows[i]["id"] + "'/></td><td><input type='button' value='设置不可投票' class='btn0' id='" + ds.Tables[0].Rows[i]["id"] + "'/></td><td><input type='button' value='删除' class='btn' id='" + ds.Tables[0].Rows[i]["id"] + "'/></td><td><a href='EditVoteInfo.aspx?id=" + ds.Tables[0].Rows[i]["id"] + "'>修改</a></td><td><a href='AddVoteDetailInfo.aspx?id=" + ds.Tables[0].Rows[i]["id"] + "'>添加项目明细</a></td><td><a href='VoteDetailInfoManage.aspx?id=" + ds.Tables[0].Rows[i]["id"] + "'>项目明细管理</a></td></tr>";
            }
            return html;
        }
        [WebMethod]
        public static int RemoveVoteInfoManage(string id)
        {
            DBHelper db = new DBHelper();
            WebHelper wb = new WebHelper();
            string sql = "update Vote_Tbl set del=1 where id='" + id + "'";
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
        [WebMethod]
        public static int SetNoVoteInfoManage(string id)
        {
            DBHelper db = new DBHelper();
            WebHelper wb = new WebHelper();
            string sql = "update Vote_Tbl set status=0 where id='" + id + "'";
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
        [WebMethod]
        public static int SetYesVoteInfoManage(string id)
        {
            DBHelper db = new DBHelper();
            WebHelper wb = new WebHelper();
            string sql = "update Vote_Tbl set status=1 where id='" + id + "'";
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