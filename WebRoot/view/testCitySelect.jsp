<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'testCitySelect.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <title>无标题页</title>
    <style type="text/css"> 
* {margin:0;}
body {font-size:12px;}
#container div{margin-top:5px;}
#select_city h3{float:left;}
#main_city,#all_province {clear:both;}
#main_city div,#all_province div{width:600px;clear:left;}
#main_city h4,#all_province h4{float:left;display:inline;font-size:16px;}
#main_city div span,#all_province div span{margin:0 10px;cursor:pointer;font-size:12px;}
#float_lay{width:200px;height:120px;border:1px #d1d1d1 solid;position:absolute;background:#fff;z-index:999;display:none;}
</style>

</head>
<body>
<!--把下面代码加到<body>与</body>之间-->
<script type="text/javascript"> 
//弹出层
function zzjs_net()
{
    //创建一个div元素
    var popupDiv = document.createElement("div");
    //给这个元素设置属性与样式
    popupDiv.setAttribute("id","popupAddr")
    popupDiv.style.border = "1px solid #ccc";
    popupDiv.style.width = "600px";
    popupDiv.style.height = "400px";
    popupDiv.style.background = "#fff";
    popupDiv.style.zIndex = 99;
    popupDiv.style.position = "absolute";
    //让弹出层在页面中垂直左右居中
    var arrayPageSize = getPageSize();
    var arrayPageScroll = getPageScroll();
    //alert(arrayPageScroll);
    //alert(arrayPageSize);
    popupDiv.style.top = (arrayPageScroll[1] + ((arrayPageSize[3] - 35 - 400) / 2) + 'px') ;
    popupDiv.style.left = (((arrayPageSize[0] - 20 - 600) / 2) + 'px');
    //创建背景层
    var bodyBack = document.createElement("div");
    bodyBack.setAttribute("id","bodybg")
    bodyBack.style.width = "100%";
    bodyBack.style.height = (arrayPageSize[1] + 35 + 'px');
    bodyBack.style.zIndex = 98;
    bodyBack.style.position = "absolute";
    bodyBack.style.top = 0;
    bodyBack.style.left = 0;
    bodyBack.style.filter = "alpha(opacity=20)";
    bodyBack.style.opacity = 0.2;
    bodyBack.style.background = "#000";
    //收工插入到目标元素之后
    var mybody = document.getElementById("test");
    insertAfter(popupDiv,mybody);
    insertAfter(bodyBack,mybody);
    //弹出层内容
    popupDiv.innerHTML = addrHTML();
    init_check();
    init_check_event();
}
//元素插入另一个元素之后
function insertAfter(newElement, targetElement)
{
    var parent = targetElement.parentNode;
    if(parent.lastChild == targetElement)
    {
        parent.appendChild(newElement);
    }
    else
    {
        parent.insertBefore(newElement, targetElement.nextSibling);
    }
}
//获取滚动条的高度
function getPageScroll(){
    var yScroll;
    if (self.pageYOffset) {
        yScroll = self.pageYOffset;
    } else if (document.documentElement && document.documentElement.scrollTop){     // Explorer 6 Strict
        yScroll = document.documentElement.scrollTop;
    } else if (document.body) {// all other Explorers
        yScroll = document.body.scrollTop;
    }
    arrayPageScroll = new Array('',yScroll)
    return arrayPageScroll;
}
//获取页面实际大小
function getPageSize(){
    var xScroll, yScroll;
    if (window.innerHeight && window.scrollMaxY) {
        xScroll = document.body.scrollWidth;
        yScroll = window.innerHeight + window.scrollMaxY;
    } else if (document.body.scrollHeight > document.body.offsetHeight){ // all but Explorer Mac
        xScroll = document.body.scrollWidth;
        yScroll = document.body.scrollHeight;
    } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
        xScroll = document.body.offsetWidth;
        yScroll = document.body.offsetHeight;
    }
    var windowWidth, windowHeight;
    if (self.innerHeight) {    // all except Explorer
        windowWidth = self.innerWidth;
        windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
        windowWidth = document.documentElement.clientWidth;
        windowHeight = document.documentElement.clientHeight;
    } else if (document.body) { // other Explorers
        windowWidth = document.body.clientWidth;
        windowHeight = document.body.clientHeight;
    }
    // for small pages with total height less then height of the viewport
    if(yScroll < windowHeight){
        pageHeight = windowHeight;
    } else {
        pageHeight = yScroll;
    }
    // for small pages with total width less then width of the viewport
    if(xScroll < windowWidth){
        pageWidth = windowWidth;
    } else {
        pageWidth = xScroll;
    }
    arrayPageSize = new Array(pageWidth,pageHeight,windowWidth,windowHeight)
    return arrayPageSize;
}
//关闭弹出层
function closeLayer(obj)
{
    obj.style.display = "none";
    document.getElementById("bodybg").style.display = "none";
    return false;
}
//拖动函数
function mousedown(e)
{
    var obj = document.getElementById("popupAddr");
    var e = window.event ? window.event : e;
    obj.startX = e.clientX - obj.offsetLeft;
    obj.startY = e.clientY - obj.offsetTop;
    document.onmousemove = mousemove;
    var temp = document.attachEvent ? document.attachEvent("onmouseup",mouseup) : document.addEventListener("mouseup",mouseup,"");
}
function mousemove(e)
{
    var obj = document.getElementById("popupAddr");
    var e = window.event ? window.event : e;
    with(obj.style)
    {
        left = e.clientX - obj.startX + "px";
        top = e.clientY - obj.startY + "px";
    }
}
function mouseup(e)
{
    document.onmousemove = "";
    var temp = document.detachEvent ? document.detachEvent("onmouseup",mouseup) : document.addEventListener("mouseup",mouseup,"");
}
//END拖动函数
//弹出层内容
function addrHTML() {
    //文字
    var TITLE = "请选择工作地点，你最多能选择5项";
    var CLOSE = '<span style="cursor:pointer;" onclick="javascript:closeLayer(this.parentNode.parentNode.parentNode.parentNode); write_result();">[确定]</span>';
    //图片地址
    var TITLEBG = "images/51job_title_bg.gif";
    var ICN = "images/51job_ico.gif";
    var htmlDiv = '';
    htmlDiv += '<div style="width:100%;font-size:12px;">';
    //头部
    htmlDiv += '<div style="background:url('+TITLEBG+') repeat-x;height:40px;color:#fff;cursor:move;" onmousedown="mousedown(arguments[0])">';
    htmlDiv += '<span style="line-height:30px;padding-left:22px;float:left;background:url('+ ICN +') no-repeat 6px 8px;">';
    htmlDiv += TITLE;
    htmlDiv += '</span>';
    htmlDiv += '<span style="float:right;padding-right:12px;line-height:30px;">';
    htmlDiv += CLOSE;
    htmlDiv += '</span>';
    htmlDiv += '</div>';
    //END头部
    //内容部分
    htmlDiv += '<div id="container" style="width:600px;height:400px;"></div>';
    htmlDiv += '<div id="float_lay"></div>';
    //END内容部分
    htmlDiv += '</div>';
    return htmlDiv;
}
//工作地点键值匹配数组
var ja=[];
ja['0100']='北京市';
ja['0200']='上海市';
ja['0300']='广东省';ja['0302']='广州市';ja['0303']='惠州市';ja['0304']='汕头市'; ja['0305']='珠海市';ja['0306']='佛山市';ja['0307']='中山市';ja['0308']='东莞市'; ja['0310']='从化市';ja['0314']='韶关市';ja['0315']='江门市';ja['0316']='增城市'; ja['0317']='湛江市';ja['0318']='肇庆市';ja['0319']='清远市';ja['0320']='潮州市'; ja['0321']='河源市';ja['0322']='揭阳市';ja['0323']='茂名市';ja['0324']='汕尾市'; ja['0325']='顺德市';
ja['0400']='深圳市';
ja['0500']='天津市';
ja['0600']='重庆市';
ja['0700']='江苏省';ja['0702']='南京市';ja['0703']='苏州市';ja['0704']='无锡市'; ja['0705']='常州市';ja['0706']='昆山市';ja['0707']='常熟市';ja['0708']='扬州市'; ja['0709']='南通市';ja['0710']='镇江市';ja['0711']='徐州市';ja['0712']='连云港市'; ja['0713']='盐城市';ja['0714']='张家港市';
ja['0800']='浙江省';ja['0802']='杭州市';ja['0803']='宁波市';ja['0804']='温州市'; ja['0805']='绍兴市';ja['0806']='金华市';ja['0807']='嘉兴市';ja['0808']='台州市'; ja['0809']='湖州市';ja['0810']='丽水市';ja['0811']='舟山市';ja['0812']='衢州市';
ja['0900']='四川省';ja['0902']='成都市';ja['0903']='绵阳市';ja['0904']='乐山市'; ja['0905']='泸州市';ja['0906']='德阳市';ja['0907']='宜宾市';ja['0908']='自贡市'; ja['0909']='内江市';ja['0910']='攀枝花市';
ja['1000']='海南省';ja['1002']='海口市';ja['1003']='三亚市';
ja['1100']='福建省';ja['1102']='福州市';ja['1103']='厦门市';ja['1104']='泉州市'; ja['1105']='漳州市';ja['1106']='莆田市';ja['1107']='三明市';ja['1108']='南平市'; ja['1109']='宁德市';ja['1110']='龙岩市';
ja['1200']='山东省';ja['1202']='济南市';ja['1203']='青岛市';ja['1204']='烟台市'; ja['1205']='潍坊市';ja['1206']='威海市';ja['1207']='淄博市';ja['1208']='临沂市'; ja['1209']='济宁市';ja['1210']='东营市';ja['1211']='泰安市';ja['1212']='日照市'; ja['1213']='德州市';
ja['1300']='江西省';ja['1302']='南昌市';ja['1303']='九江市';
ja['1400']='广西';ja['1402']='南宁市';ja['1403']='桂林市';ja['1404']='柳州市';ja['1405']='北海市';
ja['1500']='安徽省';ja['1502']='合肥市';ja['1503']='芜湖市';ja['1504']='安庆市'; ja['1505']='马鞍山市';ja['1506']='蚌埠市';ja['1507']='阜阳市';ja['1508']='铜陵市'; ja['1509']='滁州市';ja['1510']='黄山市';ja['1511']='淮南市';ja['1512']='六安市'; ja['1513']='巢湖市';ja['1514']='宣城市';ja['1515']='池州市';
ja['1600']='河北省';ja['1602']='石家庄市';ja['1603']='廊坊市';ja['1604']='保定市';ja['1605']='唐山市';ja['1606']='秦皇岛市';
ja['1700']='河南省';ja['1702']='郑州市';ja['1703']='洛阳市';ja['1704']='开封市';
ja['1800']='湖北省';ja['1802']='武汉市';ja['1803']='宜昌市';ja['1804']='黄石市'; ja['1805']='襄樊市';ja['1806']='十堰市';ja['1807']='荆州市';ja['1808']='荆门市'; ja['1809']='孝感市';ja['1810']='鄂州市';
ja['1900']='湖南省';ja['1902']='长沙市';ja['1903']='株洲市';ja['1904']='湘潭市'; ja['1905']='衡阳市';ja['1906']='岳阳市';ja['1907']='常德市';ja['1908']='益阳市'; ja['1909']='郴州市';ja['1910']='邵阳市';ja['1911']='怀化市';ja['1912']='娄底市'; ja['1913']='永州市';ja['1914']='张家界市';
ja['2000']='陕西省';ja['2002']='西安市';ja['2003']='咸阳市';ja['2004']='宝鸡市';ja['2005']='铜川市';ja['2006']='延安市';
ja['2100']='山西省';ja['2102']='太原市';ja['2103']='运城市';ja['2104']='大同市';ja['2105']='临汾市';
ja['2200']='黑龙江省';ja['2202']='哈尔滨市';ja['2203']='伊春市';ja['2204']='绥化市'; ja['2205']='大庆市';ja['2206']='齐齐哈尔市';ja['2207']='牡丹江市';ja['2208']='佳木斯市';
ja['2300']='辽宁省';ja['2302']='沈阳市';ja['2303']='大连市';ja['2304']='鞍山市'; ja['2305']='营口市';ja['2306']='抚顺市';ja['2307']='锦州市';ja['2308']='丹东市'; ja['2309']='葫芦岛市';ja['2310']='本溪市';ja['2311']='辽阳市';ja['2312']='铁岭市';
ja['2400']='吉林省';ja['2402']='长春市';ja['2403']='吉林市';ja['2404']='辽源市';ja['2405']='通化市';
ja['2500']='云南省';ja['2502']='昆明市';ja['2503']='曲靖市';ja['2504']='玉溪市'; ja['2505']='大理市';ja['2506']='丽江市';ja['2507']='蒙自市';ja['2508']='开远市'; ja['2509']='个旧市';ja['2510']='红河州';
ja['2600']='贵州省';ja['2602']='贵阳市';ja['2603']='遵义市';
ja['2700']='甘肃省';ja['2702']='兰州市';ja['2703']='金昌市';
ja['2800']='内蒙古';ja['2802']='呼和浩特市';ja['2803']='赤峰市';ja['2804']='包头市';
ja['2900']='宁夏';ja['2902']='银川市';
ja['3000']='西藏';ja['3002']='拉萨市';ja['3003']='日喀则市';
ja['3100']='新疆';ja['3102']='乌鲁木齐市';ja['3103']='克拉玛依市';ja['3104']='喀什地区市';
ja['3200']='青海省';ja['3202']='西宁市';
ja['3300']='香港';
ja['3400']='澳门';
ja['3500']='台湾';
ja['3600']='国外';
//主要城市数据字典
var maincity=[['华北-东北',['0100','0500','2303','2302','2402','2202']],['华东 地区',['0200','0702','0703','0802','0803','1502','1102','1202','1203']],[' 华南-华中',['0302','0400','0308','1802','1902','1702']],['西北-西南', ['2002','0902','0600','2502']]];
//所有省份数据字典
var allprov=[['华北-东北',['1600','2100','2800','2300','2400','2200']],['华东 地区',['0700','0800','1500','1100','1300','1200']],['华南-华中', ['0300','1400','1000','1700','1800','1900']],['西北-西南', ['2000','2700','3200','2900','3100','0900','2600','2500','3000']],['其它', ['3300','3400','3500','3600']]];
var isIE = /msie/.test(navigator.userAgent.toLowerCase());
var containerID = "container";
var floatID = "float_lay";
function init_check(){
    _container = document.getElementById(containerID);
    _float = document.getElementById(floatID);
    _float.onmouseover = function(){this.style.display = 'block';}
    _float.onmouseout = function(){this.style.display = 'none';}
    //三个区域的创建
    _selectCity = document.createElement("div");
    if(document.getElementById("result").getElementsByTagName("input").length == 0){
        var s_h3 = document.createElement("h5"); s_h3.innerHTML = "选中城市：";
        _selectCity.appendChild(s_h3);
    }else{
        _selectCity.innerHTML = document.getElementById("result").innerHTML;
        var _input_s = _selectCity.getElementsByTagName("input");
        for (var i = 0 ; i < _input_s.length; i++){
            _input_s[i].checked = true;
            _input_s[i].onclick = function(){
                var _input_m = _mainCity.getElementsByTagName("input");
                var _input_a = _allProvince.getElementsByTagName("input");
                for (var i=0; i<_input_a.length; i++)
                    _input_m[_input_m.length+i] = _input_a[i];
                for(var j=0; j<_input_m.length+_input_a.length; j++)
                    if(_input_m[j].value == this.value)
                        _input_m[j].checked = false;
                _selectCity.removeChild(this.parentNode);
            }
        }
    }
    _mainCity = document.createElement("div");
    var m_h3 = document.createElement("h4"); m_h3.innerHTML = "主要城市：";
    _mainCity.appendChild(m_h3);
    _allProvince = document.createElement("div");
    var a_h3 = document.createElement("h4"); a_h3.innerHTML = "所有省份：";
    _allProvince.appendChild(a_h3);
    var div = [],h = [],input  = [],span = [];
    _selectCity.id = "select_city"; _mainCity.id = "main_city"; _allProvince.id = "all_province";
    _container.appendChild(_selectCity); _container.appendChild(_mainCity); _container.appendChild(_allProvince);
    //主要城市部分check的创建
    for (var i = 0 ; i < maincity.length ;i++){
        div[i] = document.createElement("div");
        _mainCity.appendChild(div[i]);
        h[i] = document.createElement("h5");
        div[i].appendChild(h[i]);
        h[i].innerHTML = maincity[i][0];
        for (var j=0 ; j < maincity[i][1].length ; j++){
            input[j] = document.createElement("input");
            input[j].type = "checkbox";
            input[j].value = maincity[i][1][j];
            span[j] = document.createElement("span");
            div[i].appendChild(span[j]);
            span[j].appendChild(input[j]);
            span[j].appendChild(document.createTextNode(ja[maincity[i][1][j]]));
        }
    }
    //所有省份check的创建(不包括其他)
    for (var i=0 ; i < allprov.length - 1; i++){
        div[i] = document.createElement("div");
        _allProvince.appendChild(div[i]);
        h[i] = document.createElement("h5");
        div[i].appendChild(h[i]);
        h[i].innerHTML = allprov[i][0];
        for (var j=0 ; j < allprov[i][1].length ; j++){
            span[j] = document.createElement("span");
            span[j].id = allprov[i][1][j];
            span[j].innerHTML = ja[allprov[i][1][j]];
            div[i].appendChild(span[j]);
            span[j].onclick = function(evt){
                if(_float.style.display == 'none'){
                    var e = evt || window.event;
                    _float.style.left = e.clientX-document.getElementById("popupAddr").offsetLeft + "px";
                    _float.style.top = e.clientY-document.getElementById("popupAddr").offsetTop + "px";
                    _float.style.display = 'block';
                    _float.className = this.id;
                    createLay(this.id);
                }
            }
            span[j].onmouseover = function(){
                if(_float.className == this.id)
                    _float.style.display = 'block';
            }
            span[j].onmouseout = function(){
                _float.style.display = 'none';
            }
        }
    }
    //所有省份check中其他的创建
    div[0] = document.createElement("div");
    _allProvince.appendChild(div[0]);
    h[0] = document.createElement("h5");
    div[0].appendChild(h[0]);
    h[0].innerHTML = allprov[4][0];
    for (var j=0 ; j < allprov[4][1].length ; j++){
        input[j] = document.createElement("input");
        input[j].type = "checkbox";
        input[j].value = allprov[4][1][j];
        span[j] = document.createElement("span");
        div[0].appendChild(span[j]);
        span[j].appendChild(input[j]);
        span[j].appendChild(document.createTextNode(ja[allprov[4][1][j]]));
    }
    check_in_select();
}
//maincity中的checkbox的事件相应
function init_check_event(){
    var _input_m = _mainCity.getElementsByTagName("input");
    var _input_a = _allProvince.getElementsByTagName("input");
    for (var j=0; j<_input_a.length; j++)
        _input_m[_input_m.length+j] = _input_a[j];
    for(var i=0 ; i < _input_m.length+_input_a.length ; i++)
        _input_m[i].onclick = function(){
            if(this.checked && check_num(this)){
                var span = this.parentNode.cloneNode(true);
                _selectCity.appendChild(span);
                change_float_check(this.value);
                if(isIE) select_true();
                //已选中的checkbox的事件相应
                span.getElementsByTagName("input")[0].onclick = function(){
                    for(var j=0; j<_input_m.length+_input_a.length; j++)
                        if(_input_m[j].value == this.value)
                            _input_m[j].checked = false;
                    change_float_check(this.value);
                    _selectCity.removeChild(this.parentNode);
                }
            } else {
                var _input_s = _selectCity.getElementsByTagName("input");
                for (var j=0; j < _input_s.length; j++){
                    if(_input_s[j].value == this.value)
                        _selectCity.removeChild(_input_s[j].parentNode);
                }
                change_float_check(this.value);
            }
        }
}
//为浮动层创建数据
function createLay(id){
    if(id.substr(0,1) != '0')
        var num = parseInt(id);
    else
        var num = parseInt(id.substr(1,4));
    var n;
    var span = [],input = [];
    _float.innerHTML = "";
    input[num] = document.createElement("input");
    input[num].type = "checkbox";
    input[num].value = id;
    span[num] = document.createElement("span");
    span[num].appendChild(input[num]);
    span[num].appendChild(document.createTextNode(ja[id]));
    _float.appendChild(span[num]);
    _float.appendChild(document.createElement("br"));
    for (var i = num+2; true; i++){
        if(num > 950)
            n = i.toString();
        else
            n = '0' + i.toString();
        if(ja[n] == null) break;
        else{
            input[n] = document.createElement("input");
            input[n].type = "checkbox";
            input[n].value = n;
            span[n] = document.createElement("span");
            span[n].appendChild(input[n]);
            span[n].appendChild(document.createTextNode(ja[n]));
            _float.appendChild(span[n]);
        }
    }
    check_in_select();
    init_lay_event();
}
function init_lay_event(){
    var _input_l = _float.getElementsByTagName("input");
    for (var i = 0 ; i < _input_l.length ; i++){
        _input_l[i].id = i;
        _input_l[i].onclick = function(){
            if(this.checked && check_num(this)){
                if(this.id == 0){
                    var _input_s = _selectCity.getElementsByTagName("input");
                    for (var j = 0 ; j < _input_s.length; j++){
                        if(_input_s[j].value.indexOf(this.value.substr(0,2)) != -1){
                            change_maincity_check(_input_s[j].value);
                            change_float_check(_input_s[j].value);
                            _selectCity.removeChild(_input_s[j].parentNode);
                            j--;
                        }
                    }
                }
                else{
                    if(_input_l[0].checked){
                        var _input_t = _selectCity.getElementsByTagName("input");
                        //alert(_input_t.length);
                        for (var k = 0 ; k < _input_t.length; k++){
                            if(_input_t[k].value == _input_l[0].value)
                                _selectCity.removeChild(_input_t[k].parentNode);
                            //alert(_input_t[k].value);
                        }
                        _input_l[0].checked = false;
                    }
                }
                var span = this.parentNode.cloneNode(true);
                _selectCity.appendChild(span);
                if(isIE) select_true();
                change_maincity_check(this.value);
                //float层中已选中的checkbox的事件相应
                span.getElementsByTagName("input")[0].onclick = function(){
                    for(var j=0; j<_input_l.length; j++)
                        if(_input_l[j].value == this.value)
                            _input_l[j].checked = false;
                    change_maincity_check(this.value);
                    _selectCity.removeChild(this.parentNode);
                }
            } else {
                var _input_s = _selectCity.getElementsByTagName("input");
                for (var j=0; j < _input_s.length; j++){
                    if(_input_s[j].value == this.value)
                        _selectCity.removeChild(_input_s[j].parentNode);
                }
                change_maincity_check(this.value);
            }
        }
    }
}
function check_num(obj){
    var _input_s = _selectCity.getElementsByTagName("input");
    if(_input_s.length < 5)    return true;
    else{
        obj.checked = false;
        alert("最多只能选择5个选项");
        return false;
    }
}
function change_maincity_check(value){
    var _input_m = _mainCity.getElementsByTagName("input");
    for (var i = 0 ; i < _input_m.length; i++){
        if(_input_m[i].value == value)
            if(!_input_m[i].checked)
                _input_m[i].checked = true;
            else
                _input_m[i].checked = false;
    }
}
function change_float_check(value){
    var _input_f = _float.getElementsByTagName("input");
    for (var i = 0 ; i < _input_f.length; i++){
        if(_input_f[i].value == value)
            if(!_input_f[i].checked)
                _input_f[i].checked = true;
            else
                _input_f[i].checked = false;
    }
}
function check_in_select(value){
    var _input_s = _selectCity.getElementsByTagName("input");
    var _input_f = _float.getElementsByTagName("input");
    var _input_m = _mainCity.getElementsByTagName("input");
    var _input_a = _allProvince.getElementsByTagName("input");
    for (var i = 0 ; i < _input_s.length ; i++){
        for (var j=0 ; j < _input_f.length ; j++){
            if(_input_f[j].value == _input_s[i].value)
                _input_f[j].checked = true;
        }
        for (var k=0 ; k < _input_m.length ; k++){
            if(_input_m[k].value == _input_s[i].value)
                _input_m[k].checked = true;
        }
        for (var l=0 ; l < _input_a.length ; l++){
            if(_input_a[l].value == _input_s[i].value)
                _input_a[l].checked = true;
        }
    }
}
function select_true(){
    var _input_s = _selectCity.getElementsByTagName("input");
    for (var i = 0 ; i < _input_s.length; i++)
        _input_s[i].checked = true;
}
function write_result(){
    var _result = document.getElementById("result");
    _result.innerHTML = _selectCity.innerHTML;
    var _result_input = _result.getElementsByTagName("input");
    for (var i = 0 ; i < _result_input.length; i++){
        _result_input[i].checked = true;
        _result_input[i].onclick = function(){
            _result.removeChild(this.parentNode);
        }
    }
}
</script>

    <form id="form1" runat="server">
    <input name="input" id="test" value="选择/修改" type="button"  onclick="zzjs_net('popupAddr')" />
<div id="addrinfo"></div>
<div id="result">结果：</div>

    </form>
</body>
</html>