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
    public partial class VoteDetailInfoManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                voteId.Value = Request["id"].ToString();
            }
        }
        [WebMethod]
        public static string loadVoteDetailInfoManage(string pi, string ps, string voteId)
        {
            DBHelper db = new DBHelper();
            string sql = "select top " + ((Convert.ToInt32(pi) - 1) * Convert.ToInt32(ps) + Convert.ToInt32(ps)) + " * from VoteDetail_Tbl where del=0 and voteId=" + voteId + " and id not in (select top " + ((Convert.ToInt32(pi) - 1) * Convert.ToInt32(ps)) + " id from VoteDetail_Tbl where del=0 and voteId=" + voteId + " order by addDate) order by addDate";
            DataSet ds = db.Query(sql);
            string html = "";
            string type = "";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                html += "<tr><td>" + ds.Tables[0].Rows[i]["name"] + "</td><td>" + ds.Tables[0].Rows[i]["num"] + "</td><td>" + ds.Tables[0].Rows[i]["addDate"] + "</td><td><input type='button' value='删除' class='btn' id='" + ds.Tables[0].Rows[i]["id"] + "'/></td><td><a href='EditVoteDetailInfo.aspx?id=" + ds.Tables[0].Rows[i]["id"] + "'>修改</a></td></tr>";
            }
            return html;
        }
        [WebMethod]
        public static int RemoveVoteDetailInfoManage(string id)
        {
            DBHelper db = new DBHelper();
            WebHelper wb = new WebHelper();
            string sql = "update VoteDetail_Tbl set del=1 where id='" + id + "'";
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