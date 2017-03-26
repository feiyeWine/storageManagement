<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>玫琳凯西安分店库存管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


    <!-- jQuery AND jQueryUI -->
    <script type="text/javascript" src="jsp/js/libs/jquery/1.6/jquery.min.js"></script>
    <script type="text/javascript" src="jsp/js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>

    <!-- Compressed Version
    <link type="text/css" rel="stylesheet" href="min/b=CoreAdmin&f=css/reset.css,css/style.css,css/jqueryui/jqueryui.css,js/jwysiwyg/jquery.wysiwyg.old-school.css,js/zoombox/zoombox.css" />
    <script type="text/javascript" src="min/b=CoreAdmin/js&f=cookie/jquery.cookie.js,jwysiwyg/jquery.wysiwyg.js,tooltipsy.min.js,iphone-style-checkboxes.js,excanvas.js,zoombox/zoombox.js,visualize.jQuery.js,jquery.uniform.min.js,main.js"></script>
    -->
    <link rel="stylesheet" href="jsp/css/min.css" />
    <script type="text/javascript" src="jsp/js/min.js"></script>

    <style>
        #main{
            position: absolute;
            top:45px;
            right:5px;
            left:245px;
            bottom: 5px;
        }
    </style>
</head>
<body>

<script type="text/javascript" src="jsp/content/settings/main.js"></script>
<link rel="stylesheet" href="jsp/content/settings/style.css" />



<!--
        HEAD
                -->
<div id="head">
    <div class="left" >
        <span style="font-size: 18px;font-weight: bold">玫琳凯西安分店库存管理系统</span>

    </div>
    <div class="right">
        <a href="##" class="button profile"><img src="jsp/img/icons/top/huser.png" alt="" /></a>
        仓管员：
        <a id="lookManager"><span id="managerSpan"><c:out value="${manager}"></c:out></span></a>
        |
        <a href="http://localhost:8080/storageManagement/">退出</a>
    </div>
    <!-- <div class="right">
        <form action="#" id="search" class="search placeholder">
            <label>Looking for something ?</label>
            <input type="text" value="" name="q" class="text"/>
            <input type="submit" value="rechercher" class="submit"/>
        </form>
    </div> -->
</div>


<!--
        SIDEBAR
                 -->
<div id="sidebar">
    <ul>
        <li  class="current"><a id="getGoods"><img src="jsp/img/icons/menu/layout.png" alt="" /> 库存查询</a>

        </li>

        <li><a id="interGoods"><img src="jsp/img/icons/menu/layout.png" alt="" /> 入库管理</a>

        </li>
        <li><a id="outerGoods"><img src="jsp/img/icons/menu/layout.png" alt="" /> 出库管理</a>

        </li>
        <li><a id="recorderOuter"><img src="jsp/img/icons/menu/list.png" alt="" /> 出库记录</a>

        </li>
        <li><a id="storageCheck"><img src="jsp/img/icons/menu/list.png" alt="" /> 库存盘点</a>

        </li>

        <li><a id="warnGoods" ><img src="jsp/img/icons/menu/list.png" alt="" /> 警报管理</a>

        </li>

    </ul>


</div>

<div id="main" >
    <iframe id="iframe" src="findStorage.do" frameBorder="0" width="100%" scrolling="no" height="100%"></iframe>
</div
>

</body>
<script type="text/javascript">
    $(function(){

        $("#getGoods").click(function(){
            $("#iframe").attr("src","findStorage.do");

        });

        $("#interGoods").click(function(){
            $("#getGoods").parents("li").removeClass();
//            $("#interGoods").css("color","#AAA");
//            $(this).parents("li").addClass("current");

            $("#iframe").attr("src","getGoods.do");

        });

        $("#warnGoods").click(function(){
            $("#iframe").attr("src","warning.do");

        });
        $("#outerGoods").click(function(){
//            $(this).parents("li").addClass("current");
            $("#iframe").attr("src","outerGoods.do");

        });
        $("#recorderOuter").click(function(){
            $("#iframe").attr("src","recorderOuter.do");

        });
        $("#storageCheck").click(function(){
//            $(this).parents("li").addClass("current");
            $("#iframe").attr("src","storageCheck.do");

        });

    });

</script>
</html>