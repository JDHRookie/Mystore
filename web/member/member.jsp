<%@ page import="java.util.ArrayList" %>
<%@ page import="en.edu.svtcc.domain.OrdersDO" %><%--
  Created by IntelliJ IDEA.
  User: 蒋登禾
  Date: 2021/10/26
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path=request.getContextPath();
    //从域对象中获取订单数据
    ArrayList<OrdersDO> orders=(ArrayList<OrdersDO>) request.getAttribute("Orders");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/base.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/shop_common.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/shop_header.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/shop_manager.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.js" ></script>
    <script type="text/javascript" src="js/topNav.js" ></script>
</head>
<body>
<!-- Header  -wll-2013/03/24 -->
<div class="shop_hd">
    <%@include file="../inc/header.jsp"%>
</div>
<div class="clear"></div>
<!-- 面包屑 注意首页没有 -->
<div class="shop_hd_breadcrumb">
    <strong>当前位置：</strong>
    <span>
			<a href="">首页</a>&nbsp;›&nbsp;
			<a href="">我的商城</a>&nbsp;›&nbsp;
			<a href="">已买到商品</a>
		</span>
</div>
<div class="clear"></div>
<!-- 面包屑 End -->

<!-- Header End -->

<!-- 我的个人中心 -->
<div class="shop_member_bd clearfix">
    <!-- 左边导航 -->
    <%@include file="../inc/member_left_nav.jsp"%>
    <!-- 左边导航 End -->

    <!-- 右边购物列表 -->
    <div class="shop_member_bd_right clearfix">

        <div class="shop_meber_bd_good_lists clearfix">
            <div class="title"><h3>订单列表</h3></div>
            <table>
                <thead class="tab_title">
                <th style="width:410px;"><span>商品信息</span></th>
                <th style="width:100px;"><span>单价</span></th>
                <th style="width:80px;"><span>数量</span></th>
                <th style="width:100px;"><span>商品价格</span></th>
                <th style="width:115px;"><span>状态与操作</span></th>
                </thead>
                <tbody>

                <c:forEach var="order" items="<%=orders%>">

                    <tr><td colspan="5">
                        <table class="good">
                            <thead >
                            <tr><th colspan="6">
                                <span><strong>订单号码：</strong>${order.orderid}</span>
                            </th></tr>
                            </thead>
                            <tbody>
                        <c:forEach var="orderdetails" items="${order.details}">
                            <tr>
                                <td class="dingdan_pic"><img src="${pageContext.servletContext.contextPath}/productimg/${orderdetails.productDO.img}" /></td>
                                <td class="dingdan_title"><span><a href="">${orderdetails.productDO.productname}</a></span><br />尺码:${orderdetails.productDO.size}
                                    品牌:${orderdetails.productDO.brand}</td>
                                <td class="dingdan_danjia">￥<strong>${orderdetails.productDO.price}</strong></td>
                                <td class="dingdan_shuliang">${orderdetails.quantity}</td>
                                <td class="dingdan_zongjia">￥<strong>${orderdetails.productDO.price*orderdetails.quantity}</strong><br />(免运费)</td>
                                <td class="digndan_caozuo"><a href="">等待买家付款</a></td>
                            </tr>
                        </c:forEach>
                            </tbody>
                        </table>
                    </td></tr>

                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
    <!-- 右边购物列表 End -->

</div>
<!-- 我的个人中心 End -->

<!-- Footer - wll - 2013/3/24 -->
<div class="clear"></div>
<div class="shop_footer">
    <div class="shop_footer_link">
        <p>
            <a href="">首页</a>|
            <a href="">招聘英才</a>|
            <a href="">广告合作</a>|
            <a href="">关于ShopCZ</a>|
            <a href="">关于我们</a>
        </p>
    </div>
    <div class="shop_footer_copy">
        <p>Copyright 2004-2013 itcast Inc.,All rights reserved.</p>
    </div>
</div>
<!-- Footer End -->
</body>
</html>