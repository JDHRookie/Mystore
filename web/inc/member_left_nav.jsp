<%--
  Created by IntelliJ IDEA.
  User: 蒋登禾
  Date: 2021/11/12
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="shop_member_bd_left clearfix">

    <div class="shop_member_bd_left_pic">
        <a href="javascript:void(0);"><img src="${pageContext.servletContext.contextPath}/images/avatar.png" /></a>
    </div>
    <div class="clear"></div>

    <dl>
        <dt>我的交易</dt>
        <dd><span><a href="${pageContext.servletContext.contextPath}/member/member">已购买商品</a></span></dd>
        <dd><span><a href="">我的收藏</a></span></dd>
        <dd><span><a href="">评价管理</a></span></dd>
    </dl>

    <dl>
        <dt>我的账户</dt>
        <dd><span><a href="${pageContext.servletContext.contextPath}/member/member_info">个人资料</a></span></dd>
        <dd><span><a href="${pageContext.servletContext.contextPath}/member/password_edit">密码修改</a></span></dd>
        <dd><span><a href="">收货地址</a></span></dd>
    </dl>

</div>
