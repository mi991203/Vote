<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageForAdmin.Master" AutoEventWireup="true" CodeBehind="VoteInfoManage.aspx.cs" Inherits="MyWeb.VoteInfoManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .tbl tr td, th
        {
            padding: 5px;
            width: 8%;
            border: 1px solid #aaa;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table class="tbl">
            <thead>
                <tr>
                    <th>
                        投票主题名称
                    </th>
                    <th>
                        是否可投票
                    </th>
                    <th>
                        添加时间
                    </th>
                    <th>
                        设置
                    </th>
                    <th>
                        设置
                    </th>
                    <th>
                        操作
                    </th>
                    <th>
                        操作
                    </th>
                    <th>
                        操作
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
            </thead>
        </table>
    </div>
    <div class="paging clearfix" style="width: 1000px;">
        <a class="up_page"><i class="mai-ico"></i>上一页</a><a class="showpage">1</a><a class="showpage">2</a><a
            class="showpage">3</a><a class="showpage">4</a><a class="showpage">5</a><a class="down_page">下一页<i
                class="mai-ico"></i></a></div>
    <input type="hidden" id="pi" value="1" runat="server" />
    <input type="hidden" id="ps" value="20" runat="server" />
    <script type="text/javascript">
        var pi = $("#ContentPlaceHolder1_pi").val();
        var ps = $("#ContentPlaceHolder1_ps").val();
        $.ajax({
            type: "post",
            dataType: "json",
            contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
            data: "{ 'pi': '" + pi + "','ps': '" + ps + "'}", //注意：data参数可以是string个int类型
            url: "VoteInfoManage.aspx/loadVoteInfoManage", //模拟web服务，提交到方法
            // 可选的 async:false,阻塞的异步就是同步
            beforeSend: function () {                   // do something.
                // 一般是禁用按钮等防止用户重复提交
                //$("#btnClick").attr({disabled:"disabled"});
                // 或者是显示loading图片
            },
            success: function (data) {
                //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                // 有时候需要嵌套调用ajax请求，也是可以的
                $(".tbl").append(data.d);
            },
            complete: function () {
                //do something.
                //$("#btnClick").removeAttr("disabled");
                // 隐藏loading图片
                //$("#showMessage").val("");
            },
            error: function (data) {
                alert("error: " + data.d);
            }
        });
        $(".tbl").on("click", ".btn", function () {
            var id = $(this).attr("id");
            var that = $(this);
            $.ajax({
                type: "post",
                dataType: "json",
                contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                data: "{ 'id': '" + id + "'}", //注意：data参数可以是string个int类型
                url: "VoteInfoManage.aspx/RemoveVoteInfoManage", //模拟web服务，提交到方法
                // 可选的 async:false,阻塞的异步就是同步
                beforeSend: function () {                   // do something.
                    // 一般是禁用按钮等防止用户重复提交
                    //$("#btnClick").attr({disabled:"disabled"});
                    // 或者是显示loading图片
                },
                success: function (data) {
                    //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                    // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                    // 有时候需要嵌套调用ajax请求，也是可以的

                    if (data.d == "1") {
                        alert("删除投票主题信息成功");
                        that.parent().parent().remove();
                    }
                    else {
                        alert("删除投票主题信息失败，请联系管理员");
                    }
                },
                complete: function () {
                    //do something.
                    //$("#btnClick").removeAttr("disabled");
                    // 隐藏loading图片
                    //$("#showMessage").val("");
                },
                error: function (data) {
                    alert("error: " + data.d);
                }
            });
        });
        $(".tbl").on("click", ".btn0", function () {
            var id = $(this).attr("id");
            var that = $(this);
            $.ajax({
                type: "post",
                dataType: "json",
                contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                data: "{ 'id': '" + id + "'}", //注意：data参数可以是string个int类型
                url: "VoteInfoManage.aspx/SetNoVoteInfoManage", //模拟web服务，提交到方法
                // 可选的 async:false,阻塞的异步就是同步
                beforeSend: function () {                   // do something.
                    // 一般是禁用按钮等防止用户重复提交
                    //$("#btnClick").attr({disabled:"disabled"});
                    // 或者是显示loading图片
                },
                success: function (data) {
                    //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                    // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                    // 有时候需要嵌套调用ajax请求，也是可以的

                    if (data.d == "1") {
                        alert("设置信息成功");
                        that.parent().parent().find(".type").text("否");
                    }
                    else {
                        alert("设置失败，请联系管理员");
                    }
                },
                complete: function () {
                    //do something.
                    //$("#btnClick").removeAttr("disabled");
                    // 隐藏loading图片
                    //$("#showMessage").val("");
                },
                error: function (data) {
                    alert("error: " + data.d);
                }
            });
        });
        $(".tbl").on("click", ".btn1", function () {
            var id = $(this).attr("id");
            var that = $(this);
            $.ajax({
                type: "post",
                dataType: "json",
                contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                data: "{ 'id': '" + id + "'}", //注意：data参数可以是string个int类型
                url: "VoteInfoManage.aspx/SetYesVoteInfoManage", //模拟web服务，提交到方法
                // 可选的 async:false,阻塞的异步就是同步
                beforeSend: function () {                   // do something.
                    // 一般是禁用按钮等防止用户重复提交
                    //$("#btnClick").attr({disabled:"disabled"});
                    // 或者是显示loading图片
                },
                success: function (data) {
                    //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                    // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                    // 有时候需要嵌套调用ajax请求，也是可以的

                    if (data.d == "1") {
                        alert("设置成功");
                        that.parent().parent().find(".type").text("是");
                    }
                    else {
                        alert("设置失败，请联系管理员");
                    }
                },
                complete: function () {
                    //do something.
                    //$("#btnClick").removeAttr("disabled");
                    // 隐藏loading图片
                    //$("#showMessage").val("");
                },
                error: function (data) {
                    alert("error: " + data.d);
                }
            });
        });

        //分页

        $(".showpage").click(function () {

            var pi = $(this).text();
            $("#ContentPlaceHolder1_pi").val($(this).text());
            var ps = $("#ContentPlaceHolder1_ps").val();
            //加载页面
            $.ajax({
                type: "post",
                dataType: "json",
                contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                data: "{ 'pi': '" + pi + "','ps': '" + ps + "'}", //注意：data参数可以是string个int类型
                url: "VoteInfoManage.aspx/loadVoteInfoManage", //模拟web服务，提交到方法
                // 可选的 async:false,阻塞的异步就是同步
                beforeSend: function () {                   // do something.
                    // 一般是禁用按钮等防止用户重复提交
                    //$("#btnClick").attr({disabled:"disabled"});
                    // 或者是显示loading图片
                    $(".tbl").html("");
                },
                success: function (data) {
                    //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                    // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                    // 有时候需要嵌套调用ajax请求，也是可以的
                    //                alert("1234");
                    //                alert($("#navSearch"));
                    //                    alert(data.d);
                    $(".tbl").append(data.d);
                },
                complete: function () {
                    //do something.
                    //$("#btnClick").removeAttr("disabled");
                    // 隐藏loading图片
                    //$("#showMessage").val("");
                },
                error: function (data) {
                    alert("error: " + data.d);
                }
            });
        });
        $(".up_page").click(function () {
            if ((parseInt($("#ContentPlaceHolder1_pi").val()) - 1) >= 1) {
                $("#ContentPlaceHolder1_pi").val((parseInt($("#ContentPlaceHolder1_pi").val()) - 1).toString());
                var pi = $("#ContentPlaceHolder1_pi").val();
                var ps = $("#ContentPlaceHolder1_ps").val();
                //        alert(classId);
                //加载页面
                $.ajax({
                    type: "post",
                    dataType: "json",
                    contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                    data: "{ 'pi': '" + pi + "','ps': '" + ps + "'}", //注意：data参数可以是string个int类型
                    url: "VoteInfoManage.aspx/loadVoteInfoManage", //模拟web服务，提交到方法
                    // 可选的 async:false,阻塞的异步就是同步
                    beforeSend: function () {                   // do something.
                        // 一般是禁用按钮等防止用户重复提交
                        //$("#btnClick").attr({disabled:"disabled"});
                        // 或者是显示loading图片
                        $(".tbl").html("");
                    },
                    success: function (data) {
                        //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                        // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                        // 有时候需要嵌套调用ajax请求，也是可以的
                        //                alert("1234");
                        //                alert($("#navSearch"));
                        //                    alert(data.d);
                        $(".tbl").append(data.d);
                    },
                    complete: function () {
                        //do something.
                        //$("#btnClick").removeAttr("disabled");
                        // 隐藏loading图片
                        //$("#showMessage").val("");
                    },
                    error: function (data) {
                        alert("error: " + data.d);
                    }
                });
            }
            else {
                var pi = "1";
                var ps = $("#ContentPlaceHolder1_ps").val();
                //        alert(classId);
                //加载页面
                $.ajax({
                    type: "post",
                    dataType: "json",
                    contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                    data: "{ 'pi': '" + pi + "','ps': '" + ps + "'}", //注意：data参数可以是string个int类型
                    url: "VoteInfoManage.aspx/loadVoteInfoManage", //模拟web服务，提交到方法
                    // 可选的 async:false,阻塞的异步就是同步
                    beforeSend: function () {                   // do something.
                        // 一般是禁用按钮等防止用户重复提交
                        //$("#btnClick").attr({disabled:"disabled"});
                        // 或者是显示loading图片
                        $(".tbl").html("");
                    },
                    success: function (data) {
                        //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                        // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                        // 有时候需要嵌套调用ajax请求，也是可以的
                        //                alert("1234");
                        //                alert($("#navSearch"));
                        //                    alert(data.d);
                        $(".tbl").append(data.d);
                    },
                    complete: function () {
                        //do something.
                        //$("#btnClick").removeAttr("disabled");
                        // 隐藏loading图片
                        //$("#showMessage").val("");
                    },
                    error: function (data) {
                        alert("error: " + data.d);
                    }
                });
            }
        });
        $(".down_page").click(function () {
            if ((parseInt($("#ContentPlaceHolder1_pi").val()) - 1) >= 0) {
                $("#ContentPlaceHolder1_pi").val((parseInt($("#ContentPlaceHolder1_pi").val()) + 1).toString());
                var pi = $("#ContentPlaceHolder1_pi").val();
                var ps = $("#ContentPlaceHolder1_ps").val();
                //        alert(classId);
                //加载页面
                $.ajax({
                    type: "post",
                    dataType: "json",
                    contentType: "application/json", //注意：WebMethod()必须加这项，否则客户端数据不会传到服务端
                    data: "{ 'pi': '" + pi + "','ps': '" + ps + "'}", //注意：data参数可以是string个int类型
                    url: "VoteInfoManage.aspx/loadVoteInfoManage", //模拟web服务，提交到方法
                    // 可选的 async:false,阻塞的异步就是同步
                    beforeSend: function () {                   // do something.
                        // 一般是禁用按钮等防止用户重复提交
                        //$("#btnClick").attr({disabled:"disabled"});
                        // 或者是显示loading图片
                        $(".tbl").html("");
                    },
                    success: function (data) {
                        //alert("success: " + data.d);//注意这里：必须通过data.d才能获取到服务器返回的值
                        // 服务端可以直接返回Model，也可以返回序列化之后的字符串，如果需要反序列化：string json = JSON.parse(data.d);
                        // 有时候需要嵌套调用ajax请求，也是可以的
                        //                alert("1234");
                        //                alert($("#navSearch"));
                        //                    alert(data.d);
                        $(".tbl").append(data.d);
                    },
                    complete: function () {
                        //do something.
                        //$("#btnClick").removeAttr("disabled");
                        // 隐藏loading图片
                        //$("#showMessage").val("");
                    },
                    error: function (data) {
                        alert("error: " + data.d);
                    }
                });
            }
        });
    </script>
</asp:Content>
