<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>测试放大镜效果</title>
    
<style>
ul,li{margin:0;padding:0;}
ul{list-style:none;}
.w960{
	margin:0 auto;
	width:960px;
	border:1px solid #ccc;
	border-right:none;
}
.pic-list{
	width:960px;
	overflow:hidden;
}
.pic-list .item{
	float:left;
	position:relative;
	margin-left:-1px;
	margin-bottom:-1px;
	width:240px;
	height:320px;
	border-right:1px solid #ccc;
	border-bottom:1px solid #ccc;
	overflow:hidden;
}
.pic-list .item img{
	position:absolute;
	cursor:pointer;
}
</style>
</head>
<body>
<div class="w960">
	<ul class="pic-list" id="pic-list">
		<li class="item">
        	<img src="http://p.blog.csdn.net/images/p_blog_csdn_net/sunxing007/EntryImages/20090511/test.jpg" width="240" height="320">
        </li>
        <li class="item">
        	<img src="http://p.blog.csdn.net/images/p_blog_csdn_net/sunxing007/EntryImages/20090511/test.jpg" width="240" height="320">
        </li>
        <li class="item">
        	<img src="http://p.blog.csdn.net/images/p_blog_csdn_net/sunxing007/EntryImages/20090511/test.jpg" width="240" height="320">
        </li>
        <li class="item">
        	<img src="http://p.blog.csdn.net/images/p_blog_csdn_net/sunxing007/EntryImages/20090511/test.jpg" width="240" height="320">
        </li>
        <li class="item">
        	<img src="http://p.blog.csdn.net/images/p_blog_csdn_net/sunxing007/EntryImages/20090511/test.jpg" width="240" height="320">
        </li>
        <li class="item">
        	<img src="http://p.blog.csdn.net/images/p_blog_csdn_net/sunxing007/EntryImages/20090511/test.jpg" width="240" height="320">
        </li>
        <li class="item">
        	<img src="http://p.blog.csdn.net/images/p_blog_csdn_net/sunxing007/EntryImages/20090511/test.jpg" width="240" height="320">
        </li>
        <li class="item">
        	<img src="http://p.blog.csdn.net/images/p_blog_csdn_net/sunxing007/EntryImages/20090511/test.jpg" width="240" height="320">
        </li>
	</ul>
</div>
<script>
(function(){
	var d = document.getElementById("pic-list"),
	    c = d.getElementsByTagName("li"),
		l = c.length,
		scale = 4;
	function stopEvent(e){
		if(e && e.stopPropagation){
			e.stopPropagation();				
		}else{
			e.cancelBubble = true;
		}
	}
	for(var i = 0; i < l; i++){
		c[i].left = c[i].getBoundingClientRect().left;
		c[i].top = c[i].getBoundingClientRect().top;
		(function(i){
			c[i].onmouseover = function(e){
				var e = e || window.event;
				var img = this.getElementsByTagName("img")[0];
				img.style.width = img.offsetWidth * scale + "px";
				img.style.height = img.offsetHeight * scale + "px";
				img.style.left = (this.offsetWidth - img.offsetWidth) / 2 + "px";
				img.style.top = (this.offsetHeight - img.offsetHeight) / 2 + "px";
				this.dsx = Math.abs(parseInt(img.style.left));
				this.dsy = Math.abs(parseInt(img.style.top));
				this.cdx = this.offsetWidth / 2;
				this.cdy = this.offsetHeight / 2;
				this.left = (this.offsetWidth - img.offsetWidth) / 2
				this.top = (this.offsetHeight - img.offsetHeight) / 2
				stopEvent(e);
			};
			c[i].onmouseout = function(e){
				var e = e || window.event;
				var img = this.getElementsByTagName("img")[0];
				img.style.width = img.offsetWidth / scale + "px";
				img.style.height = img.offsetHeight / scale + "px";
				img.style.left = Math.floor((this.offsetWidth - img.offsetWidth) / 2) + "px";
				img.style.top = Math.floor((this.offsetHeight - img.offsetHeight) / 2) + "px";
				stopEvent(e);
			};
			c[i].onmousemove = function(e){
				var e = e || window.event;
				var img = this.getElementsByTagName("img")[0];
				var center = {"x":this.getBoundingClientRect().left + this.offsetWidth / 2,"y":this.getBoundingClientRect().top + this.offsetHeight / 2};
				var mPos = {"x":e.clientX,"y":e.clientY};
				var deltax = center.x - mPos.x,deltay = center.y - mPos.y;
				var dleft = deltax / this.cdx * this.dsx;
				var dtop = deltay / this.cdy * this.dsy;
				img.style.left = Math.floor(this.left + dleft) + "px";
				img.style.top = Math.floor(this.top + dtop) + "px";
				stopEvent(e);
			}
		})(i);
	}
})();
</script>
</body>
</html>
