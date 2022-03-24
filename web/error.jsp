<%--
  Created by IntelliJ IDEA.
  User: 蒋登禾
  Date: 2021/11/16
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>错误提示页面</title>
  <link rel="stylesheet" href="css/base.css" type="text/css" />
  <link rel="stylesheet" href="css/shop_common.css" type="text/css" />
  <link rel="stylesheet" href="css/shop_header.css" type="text/css" />
  <link rel="stylesheet" href="css/shop_list.css" type="text/css" />

  <script type="text/javascript" src="js/jquery.js" ></script>
  <script type="text/javascript" src="js/topNav.js" ></script>
  <style type="text/css">
    .shop_bd_error{width:1000px; height:50px; padding:100px 0; margin:10px auto 0; border:1px solid #ccc;}
    .shop_bd_error p{height:45px; line-height:45px; width:980px; text-align: center; font-size:14px; font-weight: bold; color:#55556F;}
    .shop_bd_error p span{display:inline-block;width:45px; height:45px; line-height:45px; overflow:hidden; text-indent: 99em; vertical-align:top; padding-right:10px; background:url('images/error.jpg') no-repeat left top;}
  </style>
</head> <body>
<!-- Header  -wll-2013/03/24 -->
<div class="shop_hd">
  <%@include file="inc/header.jsp" %>
</div>
<div class="clear"></div>


<!-- Header End -->

<!-- Body -->
<div class="shop_bd_error">
  <p><span>出错啦！</span>出错啦！</p>
</div>
<!-- Body End -->

<!-- Footer - wll - 2013/3/24 -->
<div class="clear"></div>
<div class="shop_footer">
  <%@include file="inc/footer.jsp"%>
</div>
<!-- Footer End -->
</body>
</html>
