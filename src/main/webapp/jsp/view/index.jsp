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
                管理员： 
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
                <li class="current"><a href="getUsers.do"><img src="jsp/img/icons/menu/users.png" alt="" /> 仓管员管理</a>
                    <ul>
                        <li id="userManager" class="current"><a href="#">仓管员信息管理</a></li>
                        <li><a id="addUser" >添加仓管员</a></li>
                    </ul>
                </li>
               <!--  <li><a href="##"><img src="img/icons/menu/inbox.png" alt="" />系统信息管理</a>
                   <ul>
                       <li><a href="#">仓管员信息管理</a></li>
                       <li><a href="#">添加仓管员</a></li>
                   
                   </ul>
               </li> -->
                <li><a href="#"><img src="jsp/img/icons/menu/layout.png" alt="" /> 商品管理</a>
                    <ul>
                        <!--class="current"-->
                         <li><a id="goodsManager" href="#">商品信息管理</a></li>
                        <li><a id="addGoods" href="#">添加商品</a></li>
                         <li><a id="typeManager" href="#">商品类别管理</a></li>
                     </ul>
                </li>
                <li><a href="#"><img src="jsp/img/icons/menu/list.png" alt="" /> 库存管理</a>
                    <ul>
                        <li><a id="getGoods" href="#">库存查询</a></li>
                        <li><a id="warnGoods" href="#">警报管理</a></li>
                        <li><a id="returnGoods" href="#">退货管理</a></li>
                    </ul>
                </li>
                
            </ul>

           
        </div>

        <div id="main" >
            <iframe id="iframe" src="getUsers.do" frameBorder="0" width="100%" scrolling="no" height="100%"></iframe>
        </div
        >
        
    <!--<div id="content" class="white">
            <h1><img src="jsp/img/icons/posts.png" alt="" /> Table</h1>
        </div>
        <div class="bloc">
            <div style="margin-top:45px;margin-left:245px;height:100%;width: 100%;">
                <iframe id="iframe" src="users.jsp" frameBorder="0" width="100%" scrolling="no" height="100%"></iframe>
            </div>
        </div>-->

    </body>
    <script type="text/javascript">
        $(function(){
            $("#lookManager").click(function(){
                $("#iframe").attr("src","manager.do?name="+$("#managerSpan").text());
            });

            $("#userManager").click(function(){
                $("#iframe").attr("src","getUsers.do");
            });

            $("#addUser").click(function(){
                $("#iframe").attr("src","jsp/view/addUsers.jsp");

            });
            $("#goodsManager").click(function(){
                $("#iframe").attr("src","getGoodsInfo.do");

            });

            $("#addGoods").click(function(){
                $("#iframe").attr("src","getGoodType.do");

            });

            $("#typeManager").click(function(){
                $("#iframe").attr("src","getType.do");

            });

            $("#getGoods").click(function(){
                $("#iframe").attr("src","findStorage.do");

            });

            $("#warnGoods").click(function(){
                $("#iframe").attr("src","warning.do");

            });

            $("#returnGoods").click(function(){
                $("#iframe").attr("src","returnGoods.do");

            });


        });

    </script>
</html>