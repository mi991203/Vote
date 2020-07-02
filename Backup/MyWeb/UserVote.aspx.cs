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
    public partial class UserVote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                userid.Value = Session["id"].ToString();
            }
        }
        [WebMethod]
        public static string loadInfo(string pi, string ps)
        {
            DBHelper db = new DBHelper();
            string html = "";
            string sql = "select top " + ((Convert.ToInt32(pi) - 1) * Convert.ToInt32(ps) + Convert.ToInt32(ps)) + " * from Vote_Tbl where del=0 and id not in (select top " + ((Convert.ToInt32(pi) - 1) * Convert.ToInt32(ps)) + " id from Vote_Tbl where del=0 order by addDate desc) order by addDate desc";
            DataSet ds = db.Query(sql);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                html += "<div style='float:left;margin:5px;'><a><img id='imgPictures' style='height:300px; width:280px' src='" + (ds.Tables[0].Rows[i]["url"]).ToString().Replace("~", "") + "' runat='server'/></a><div><div><span>投票主题：" + ds.Tables[0].Rows[i]["name"] + "</span></div>";
                sql = "select * from VoteDetail_Tbl where del=0 and voteId='" + ds.Tables[0].Rows[i]["id"] + "'";
                DataSet ds1 = db.Query(sql);
                for (int j = 0; j < ds1.Tables[0].Rows.Count; j++)
                {
                    html += "<div><input type='radio' name='xm' value='" + ds1.Tables[0].Rows[j]["id"] + "'><span>项目[" + j + "]：" + ds1.Tables[0].Rows[j]["name"] + "</span>&nbsp&nbsp&nbsp<span>" + ds1.Tables[0].Rows[j]["num"] + "票</span></div>";
                }
                html += "<div><span id='vote' style='border:1px solid red;cursor:point;width:25px;height:20px;color:red;'>投票</span></div></div></div>";
            }
            return html;
        }
        [WebMethod]
        public static string loadClick(string val,string userid)
        {
            DBHelper db = new DBHelper();
            string sql = "select * from VoteDetail_Tbl where del=0 and id='" + val + "'";
            DataSet ds = db.Query(sql);
            sql = "select * from UserVote_Tbl where del=0 and userId='" + userid + "' and voteId='" + ds.Tables[0].Rows[0]["voteId"].ToString() + "'";
            DataSet ds2 = db.Query(sql);
            if (ds2.Tables[0].Rows.Count > 0)
            {
                return "-2";
            }
            else
            {
                sql = "select * from Vote_Tbl where del=0 and id='" + ds.Tables[0].Rows[0]["voteId"].ToString() + "'";
                DataSet ds1 = db.Query(sql);
                if (ds1.Tables[0].Rows[0]["status"].ToString() == "1")
                {
                    int num = Convert.ToInt32(ds.Tables[0].Rows[0]["num"]) + 1;
                    sql = "update VoteDetail_Tbl set num='" + num + "' where del=0 and id='" + val + "'";
                    int renum = db.ExecuteSql(sql);
                    if (renum == 1)
                    {
                        sql = "insert into UserVote_Tbl values('" + userid + "','" + ds.Tables[0].Rows[0]["voteId"].ToString() + "',getdate(),0)";
                        renum = db.ExecuteSql(sql);
                        if (renum == 1)
                        {
                            return "1";
                        }
                        else
                        {
                            return "0";
                        }
                    }
                    else
                    {
                        return "0";
                    }
                }
                else
                {
                    return "-1";
                }
            }
        }
    }
}