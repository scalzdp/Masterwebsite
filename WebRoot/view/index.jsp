<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>欢迎观看</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">

		#img-display
		{
		width: 62%;height: 100%;overflow: hidden;margin:0;float:left;border-right:1px solid red;
		background: url(Img/waite-for-you.png)  no-repeat;
		}
		#map-display{width: 38%; position:relative; left:10px; height: 45%;overflow: hidden;margin:0;}
		body
        {
            font-family: Arial, Verdana, 宋体;
            margin: 0;
            padding: 0;
            font-size: 13px;
            color: #120C0D;
        }
        div, img, ul, ol, li, dl, dt, dd
        {
            margin: 0;
            padding: 0;
            border: 0;
        }
        
         .clearfix
        {
            zoom: 1;
        }
        .clearfix:after
        {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
        * html .clearfix
        {
            height: 1%;
        }
        ul, li
        {
            list-style: none;
        }
        .clr
        {
            clear: both;
        }
        a
        {
            color: #120C0D;
            text-decoration: none;
        }
        .j_box
        {
        	position: relative;
            width: 100%;
            height: 200px;
            border: 2px solid #C91521;
            padding: 0;
            z-index: 2;
            top:30%;
        }
        .j_boxcontent
        {
        	float: left;
            position: relative;
            z-index: 1;
            padding: 0 31px;
            margin: 0;
            width: 93%;
            height: 200px;
            overflow: hidden;
            _display: inline;
        }
        .j_boxcontent .pre, .j_boxcontent .next
        {
            display: block;
            position: absolute;
            float: left;
            z-index: 2;
            top: 0px;
            width: 31px;
            height: 200px;
            margin-left:5px;
            background: url(http://x.jd.com/picture/i2.jpg) no-repeat;
            line-height: 500px;
            overflow: hidden;
        }
        .j_boxcontent .pre
        {
            left: 0;
            background: url(http://img11.360buyimg.com/da/g15/M05/0E/1D/rBEhWVJYvZcIAAAAAAABcTqRek0AAEDJwP__hgAAAHo228.png) center #e4e3e3 no-repeat;
        }
        .j_boxcontent .next
        {
            right: 0;
            background: url(http://img14.360buyimg.com/da/g15/M02/0E/1C/rBEhWFJYq_wIAAAAAAABtzX8mYMAAECzQP__h8AAAHh954.png) center #e4e3e3 no-repeat;
        }
        .clearfix
        {
            zoom: 1;
        }
        .clearfix:after
        {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
        * html .clearfix
        {
            height: 1%;
        }
        .j_skulist
        {
            width: 800px;
            float: left;
            overflow: hidden;
            position: absolute;
            left: 35px;
            top: 1px;
        }
        .j_skulist a{display:block;}
        .j_skulist a:hover{background:#FFFDEE;}
         .j_skulist .j_skulist_inner
        {
            width: 32777px;
        }
        .j_skulist ul
        {
            float: left;
            
        }
        .j_skulist li
        {
            float: left;
            width: 190px;
            overflow: hidden;
            margin: 0 10px 0 0;
        }
        


        .j_skulist .p_img img {
            width: 188px;
            height: 188px;
        }

        .j_skulist .p_img .p_img_tag {
            position: absolute;
            right: -15px;
            top: 0;
            display: inline-block;
            padding: 1px 2px;
            background: #FF6600;
            color: #fff;
            height: 15px;
            vertical-align: top;
            font-size: 14px;
            font-weight: bold;
        }

        .j_skulist .p_price {
            height: 21px;
            line-height: 21px;
            float: left;
            margin: 6px 0 0 9px;
            color: #E4393C;
        }

        .j_skulist .p_price .tag_content {
            margin: 0 0 0 2px;
            font-size: 25px;
            font-weight: bold;
        }

        .j_skulist .p_promo {
            height: 16px;
            width: 132px;
            line-height: 12px;
            float: left;
            margin: 3px 0 0 0;
            color: #e4393c;
            font-size: 12px;
            overflow: hidden;
        }

        .j_skulist .p_promo div {
            margin: 1px 0 0 0;
            width: 100%;
            overflow: hidden;
            height: 14px;
        }

        .j_skulist .p_promo .tag_title {
            color: #fff;
            background: #e4393c;
            padding: 1px 2px;
            line-height: 12px;
            margin-right: 5px;
            display: inline-block;
        }

        .j_skulist .p_promo .tag_content {
            color: #e4393c;
        }

        #cont .p_promo img {
            float: left;
            border: 1px solid #ddd;
            margin-right: 3px;
            width: 15px;
            height: 15px;
        }

        .j_skulist .p_name {
            width: 148px;
            line-height: 16px;
            height: 32px;
            overflow: hidden;
            float: left;
            margin: 2px 0 0 2px;
            font-style: normal;
        }
        
	</style>



    <script type="text/javascript">
	function StopUp(){
		
	}
	function GoUp(){
		
	}
	function StopDown(){
		
	}
	function GoDown(){
		
	}
    </script>
  </head>
  
  <body>
    	<div id="img-display" >
    		<div class="j_box">
			    <div class="j_boxcontent">
			        <a href="javascript:void(0);" class="pre" onmouseup="StopUp()" onmousedown="GoUp()" onmouseout="StopUp()"></a>
			        <div class="j_skulist" id="cont">
			            <div class="j_skulist_inner">
			                <ul class="clearfix" id="list1">
						        <li>
						            <a href="http://x.jd.com/dsp/nc?ext=Y2xpY2sudW5pb24uamQuY29tL0pkQ2xpY2svP3VuaW9uSWQ9NTIwMDYmc2l0ZWlkPTMyOF80NCZ0bz1odHRwOi8vaXRlbS5qZC5jb20vNTYzOTg5Lmh0bWw=&amp;log=Vcdh5a7Fmwyz8lVa4hNm5oddGhRkR/sTdKQa9kkseKtg3A16Wf3wYz7D8Y8BNoxM/PyXhRmKxJQd/WvrmJAjWJkVk3XwmE4d7Z+/uRhQWc/CL7kTVZsj9IYDiygwDCh1KUNdxenE8bLW+9gobL0Oat2l6EPXWafGC+5Cxhdn7GSWbYOZGp8L0yahDEAiYiC2CQT190I+s4LrvOWdPdb3FQ==&amp;v=2" target="_blank" title="朗能（lonon） NB5B1023  10A  惠美五孔插座10只装（雅白色）test">
						                <div class="p_img">
						                    <sub class="p_img_tag" id="zk_563989" style="display:none"></sub>
						                    <img src="http://img11.360buyimg.com/n1/g12/M00/0E/1F/rBEQYVNlp6kIAAAAAAMOVVqbS1YAAFc6wHdXHMAAw5t088.jpg">
						                </div>
						            </a>
						        </li>
						        <li>
						            <a href="http://x.jd.com/dsp/nc?ext=Y2xpY2sudW5pb24uamQuY29tL0pkQ2xpY2svP3VuaW9uSWQ9NTIwMDYmc2l0ZWlkPTMyOF80NCZ0bz1odHRwOi8vaXRlbS5qZC5jb20vNTY0MDA0Lmh0bWw=&amp;log=Vcdh5a7Fmwyz8lVa4hNm5oddGhRkR/sTdKQa9kkseKtg3A16Wf3wYz7D8Y8BNoxM/PyXhRmKxJQd/WvrmJAjWJkVk3XwmE4d7Z+/uRhQWc/CL7kTVZsj9IYDiygwDCh1W87vdDgF0VFgdym7+8PIcxjvYgR+ejGDrqrWk+fEqQTC4jnlQHhQUM6na5JuGBuYKPSentekwcOBmb5h8hPomg==&amp;v=2" target="_blank" title="朗能（lonon） NB5B163  16A  惠美16A三极插座（雅白色）">
						                <div class="p_img">
						                    <sub class="p_img_tag" id="zk_564004" style="display:none"></sub>
						                    <img src="http://img11.360buyimg.com/n1/g15/M03/1B/0F/rBEhWFNlqNAIAAAAAAKiDUiyQ-8AAM0bwO5wMwAAqIl488.jpg">
						                </div>
					
						            </a>
						        </li>
						        <li>
						            <a href="http://x.jd.com/dsp/nc?ext=Y2xpY2sudW5pb24uamQuY29tL0pkQ2xpY2svP3VuaW9uSWQ9NTIwMDYmc2l0ZWlkPTMyOF80NCZ0bz1odHRwOi8vaXRlbS5qZC5jb20vNTYzOTkxLmh0bWw=&amp;log=Vcdh5a7Fmwyz8lVa4hNm5oddGhRkR/sTdKQa9kkseKtg3A16Wf3wYz7D8Y8BNoxM/PyXhRmKxJQd/WvrmJAjWJkVk3XwmE4d7Z+/uRhQWc/CL7kTVZsj9IYDiygwDCh1UIU9rA4l3jZp5LRnAkNWH0yAuqI3Aiz7LJfBLWrScqhVABhUuc5dcNl9IUwvtkwHrap/vvGnpwMgmTaYlqCd0w==&amp;v=2" target="_blank" title="朗能（lonon） NB5B1Q/2Y  16A  惠美单联双控开关（雅白色）">
						                <div class="p_img">
						                    <sub class="p_img_tag" id="zk_563991" style="display:none"></sub>
						                    <img src="http://img11.360buyimg.com/n1/g13/M0A/00/0F/rBEhUlNlqCgIAAAAAAPHtef7PrMAAMy-AKEAr4AA8fN678.jpg">
						                </div>
						            </a>
						        </li>
						        <li>
						            <a href="http://x.jd.com/dsp/nc?ext=Y2xpY2sudW5pb24uamQuY29tL0pkQ2xpY2svP3VuaW9uSWQ9NTIwMDYmc2l0ZWlkPTMyOF80NCZ0bz1odHRwOi8vaXRlbS5qZC5jb20vNTYzOTkxLmh0bWw=&amp;log=Vcdh5a7Fmwyz8lVa4hNm5oddGhRkR/sTdKQa9kkseKtg3A16Wf3wYz7D8Y8BNoxM/PyXhRmKxJQd/WvrmJAjWJkVk3XwmE4d7Z+/uRhQWc/CL7kTVZsj9IYDiygwDCh1UIU9rA4l3jZp5LRnAkNWH0yAuqI3Aiz7LJfBLWrScqhVABhUuc5dcNl9IUwvtkwHrap/vvGnpwMgmTaYlqCd0w==&amp;v=2" target="_blank" title="朗能（lonon） NB5B1Q/2Y  16A  惠美单联双控开关（雅白色）">
						                <div class="p_img">
						                    <sub class="p_img_tag" id="zk_563992" style="display:none"></sub>
						                    <img src="http://img11.360buyimg.com/n1/g13/M0A/00/0F/rBEhUlNlqCgIAAAAAAPHtef7PrMAAMy-AKEAr4AA8fN678.jpg">
						                </div>
						            </a>
						        </li>
						        
						    </ul>
						</div>
			        </div>
			        <a onmouseup="StopDown()" class="next" onmousedown="GoDown()" onmouseout="StopDown()" href="javascript:void(0);"></a>
			    </div>
			    
			</div>
			  
    	</div>
    	<div id="map-display">
    		hello right
    	</div>
  </body>
</html>
