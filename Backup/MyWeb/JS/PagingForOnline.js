(function ($) {
    $.fn.pagingForOnline = function (options) {
        var _t = this;
        var listConfig = {
            //url: 'HouseSchoolList.aspx',
            //data: [],
            //pgConfig: { pi: 1, ps: 10, pgn: 1 },
            //getSearchWhere: function () {
            //    var po = { ot: 'GetRecordList' }
            //    po.scName = $('#sub_scName').val();
            //    po.scName = po.scName == '请输入学校名称' ? '' : po.scName;
            //    po.dictId = $('#sub_dict').val();
            //    po.reName = $('#sub_reName').val();
            //    po.reName = po.reName == '请输入划片小区名称' ? '' : po.reName;
            //    return po;
            //}
        }
        var listFuns = {}
        listFuns.getTopHtml = function (to) {
            var strArr = [
                '<div class="screening">',
                    //'<ul>',
                    //    '<li>排序：</li>',
                    //    '<li><a href="javascrpt:void(0);" >时间<i id="sort" class="mai-ico"></i></a></li>',
                    //'</ul>',
                    '<p>共有<span>', to.total, '</span>所小学　<span>', to.totHouNum, '</span>套福州二手房源</p>',
                '</div>'
            ];
            return strArr.join('');
        }
        listFuns.getRowHtml = function (ro) {
            var pp = GetFtpUri();
            var strArr = [
                '<li class="clearfix">',
                    '<a href="HouseSchoolDetail.aspx?linkSchoolId=', ro.id, '&avgPrice=', ro.AvgPrice, '&unitPrice=', ro.UnitPrice, '&reNum=', ro.reNum, '&houNum=', ro.houNum, '"><img src="',
                    GetHandlerImgUri() + "?isW=1&Img=" + pp + ro.path+'|220|162', '" onerror="imgErorr(this)" width="220" height="162" alt=""/></a>',
                '<div class="hide_border"><a href="HouseSchoolDetail.aspx?linkSchoolId=', ro.id, '&avgPrice=', ro.AvgPrice, '&unitPrice=', ro.UnitPrice, '&reNum=', ro.reNum, '&houNum=', ro.houNum, '"><label>', ro.imgNum, '图</label></a></div>',
                    '<div class="list_title">',
                        '<div class="the_price"><ol><strong><span>', ro.AvgPrice, '万</span></strong>', ro.UnitPrice, '元/平米</ol></div>',
                        '<div class="the_price house_num"><ol><strong><a href="house_search_list.aspx?keepQuery=1&linkSchoolId=', ro.id, '" onclick = "F5();"><span style="color:#55a2e4">',
                        ro.houNum, '套</span></a></strong>在售房源</ol></div>',
                        '<h1><a href="HouseSchoolDetail.aspx?linkSchoolId=', ro.id, '&avgPrice=', ro.AvgPrice, '&unitPrice=', ro.UnitPrice, '&reNum=', ro.reNum, '&houNum=', ro.houNum, '">', ro.name, '</a></h1>',
                        '<p class="house_info"><span>别名：', ro.SchoolNick, '</span><span>地址：', ro.Address, '</span></p>',
                        '<p class="house_hot"><span>划片小区：', ro.reNum, '个</span><span>对口中学：', ro.HighSchoolName, '</span></p>',
                    '</div>',
                '</li>'
            ];
            return strArr.join('');
        }
        listFuns.getBodyHtml = function () {
            var l = listConfig.data.length;
            var listCont = ['<div class="list_wrap list_xuequ"><ul>'];
            for (var i = 0; i < l; i++) {
                listCont.push(this.getRowHtml(listConfig.data[i]));
            }
            listCont.push('</ul></div>');
            return listCont.join('');
        }
        listFuns.getBottomHtml = function (bo) {
            if (!bo || !bo.total) { return ''; }
            var ps = listConfig.pgConfig.ps;
            var pi = listConfig.pgConfig.pi;
            var pgn = parseInt(bo.total / ps);
            if (bo.total % ps > 0) { pgn++; }
            listConfig.pgConfig.pgn = pgn;
            var strArr = [
                '<div class="paging clearfix">',
                    '<a href="#" class="up_page"><i class="mai-ico"></i>上一页</a>'
            ];
            if (pi > 3 && pgn > 5) { strArr.push('<span>...</span>'); }
            var i = (pi - 2) > 0 ? pi - 2 : 1; var cc = 0;
            for (; i <= pgn && cc < 5; i++, cc++) {
                strArr.push('<a href="#" ' + (i == pi ? 'class="on"' : '') + ' >' + i + '</a>');
            }
            if (pgn > 5 && i < pgn) { strArr.push('<span>...</span>'); }
            strArr.push('<a href="#" class="down_page">下一页<i class="mai-ico"></i></a></div>');
            return strArr.join('');
        }
        listFuns.getNoFoundHtml = function () {
            return '<div class="no_home"><i class="mai-ico"></i>抱歉！没有找到<span></span>相关数据，换个条件试试吧~</div>';
        }
        listFuns.getWaitingHtml = function () {
            return '<div class="no_home">数据加载中，请稍候~</div>';
        }
        listFuns.drawList = function () {
            var l = listConfig.data.length;
            if (l) {
                var listCont = [];
                listCont.push(this.getTopHtml(listConfig.data[0]));
                listCont.push(this.getBodyHtml());
                listCont.push(this.getBottomHtml(listConfig.data[0]));
                $(_t).html(listCont.join(''));
            } else {
                pucFuns.setMsgPage(0);
            }
        }
        listFuns.getListData = function (df) {
            var parms = listConfig.getSearchWhere() || {}; $.extend(parms, listConfig.pgConfig);
            pucFuns.setMsgPage(1);
            $.post(listConfig.url, parms, function (d) {
                try {
                    if (!d) { throw new Error('0|返回错误！'); }
                    listConfig.data = $.parseJSON(d);
                    listFuns.drawList();
                    if (typeof df === 'function') { df(); }
                } catch (e) {
                    pucFuns.setMsgPage(0);
                    if (typeof console == 'object') { console.log(e.message); } return;
                }
            });
        }
        listFuns.paging = function (pi, ps, df) {
            listConfig.pgConfig.pi = pi;
            listConfig.pgConfig.ps = ps || listConfig.pgConfig.ps;
            listFuns.getListData(df);
        }
        listFuns.initEvents = function () {
            $(_t).on("click", "div.paging a", function () {
                var tt = $(this).text();
                var pi = Number($(this).text()) || listConfig.pgConfig.pi;
                if (tt.indexOf('上一页') > -1) {
                    if (pi < 2) { return; }
                    pi = listConfig.pgConfig.pi - 1;
                }
                else if (tt.indexOf('下一页') > -1) {
                    if (pi >= listConfig.pgConfig.pgn) { return; }
                    pi = listConfig.pgConfig.pi + 1;
                }
                listConfig.pgConfig.pi = pi; listFuns.getListData();//, function () { alert(1); $(that).addClass('on').siblings().removeClass('on'); }
            });
        }
        listFuns.start = function () {
            $.extend(listConfig, options);
            listFuns.initEvents();
            listFuns.paging(1);
        }
        var pucFuns = {}
        pucFuns.paging = listFuns.paging;
        pucFuns.setMsgPage = function (pgt, holdDB) {
            if (!holdDB) { listConfig.data.length = 0; }
            var ht;
            switch (pgt) {
                case 0: ht = listFuns.getNoFoundHtml(); break;//未找到
                case 1: ht = listFuns.getWaitingHtml(); break;//等待中
                default: break;
            }
            $(_t).html(ht);
        }
        window.imgErorr = function (_this) {
            $(_this).attr('src', '../image/no_pic.jpg');
        }
        window.paging = listFuns.paging;
        listFuns.start();
    }
})(jQuery);
//动态改变页面高度，使得获得整个页面的数据。不会显示在页面底端
function F5() {
    var hag = window.frameElement;
    hag.style.height = "800px";
}