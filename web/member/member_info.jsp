<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: 蒋登禾
  Date: 2021/11/19
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>修改个人资料</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/base.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/shop_common.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/shop_header.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/shop_manager.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/shop_form.css" type="text/css" />
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.js" ></script>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/topNav.js" ></script>
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
            <div class="title"><h3>基本信息</h3></div>
            <div class="clear"></div>
            <dic class="shop_home_form">
                <form athion="" name="" class="shop_form" method="post">
                    <ul>
                        <li><label>用户名称：</label>${sessionScope.UserName}</li>
                        <li><label>电子邮件：</label>${sessionScope.email}</li>
                        <li><label>真实姓名：</label><input type="text" class="truename form-text" value="${sessionScope.realname}"/></li>
                        <li><label>性别:</label>
                            <c:if test='${sessionScope.gender.equals("男")}'>
                                <input type="radio" class="ml10 mr5" name="sex" checked="checked" value="男" />男
                                <input type="radio" class="mr5" name="sex" value="保密" />保密
                                <input type="radio" class="ml10 mr5" name="sex" value="女" />女
                            </c:if>
                            <c:if test='${sessionScope.gender.equals("女")}'>
                                <input type="radio" class="ml10 mr5" name="sex" checked="checked" value="女" />女
                                <input type="radio" class="ml10 mr5" name="sex" value="男" />男
                                <input type="radio" class="mr5" name="sex" value="保密" />保密
                            </c:if>
                            <c:if test='${sessionScope.gender.equals("保密")}'>
                                <input type="radio" class="ml10 mr5" name="sex" value="女" />女
                                <input type="radio" class="ml10 mr5" name="sex" value="男" />男
                                <input type="radio" class="mr5" name="sex" checked="checked" value="保密" />保密
                            </c:if>
                        </li>
                        <li class="bn"><label>&nbsp;</label><input type="submit" class="form-submit" value="保存修改" /></li>
                    </ul>
                </form>
        </div>
    </div>
</div>
<!-- 右边购物列表 End -->

</div>
<!-- 我的个人中心 End -->

<!-- Footer - wll - 2013/3/24 -->
<div class="clear"></div>
<div class="shop_footer">
    <%@include file="../inc/footer.jsp"%>
</div>
<!-- Footer End -->
</body>
</html>
