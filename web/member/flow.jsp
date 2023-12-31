<%--
  Created by IntelliJ IDEA.
  User: 蒋登禾
  Date: 2021/12/3
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="en.edu.svtcc.domain.CartDO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>购物车页面</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/base.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/shop_common.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/shop_header.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/shop_gouwuche.css" type="text/css" />
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.js" ></script>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/topNav.js" ></script>
    <script type="text/javascript" src="../js/jquery.goodnums.js" ></script>
    <script type="text/javascript" src="../js/shop_gouwuche.js" ></script>
</head>
<body>
<!-- Header  -wll-2013/03/24 -->
<div class="shop_hd">
    <%@include file="../inc/header.jsp" %>
</div>
<div class="clear"></div>
<!-- 面包屑 注意首页没有 -->
<div class="shop_hd_breadcrumb">
    <strong>当前位置：</strong>
    <span>
			<a href="">首页</a>&nbsp;›&nbsp;
			<a href="">我的商城</a>&nbsp;›&nbsp;
			<a href="">我的购物车</a>
		</span>
</div>
<div class="clear"></div>
<!-- 面包屑 End -->

<!-- Header End -->

<!-- 购物车 Body -->
<div class="shop_gwc_bd clearfix">
    <!-- 在具体实现的时候，根据情况选择其中一种情况 -->
    <!-- 购物车为空 -->
    <div class="empty_cart mb10">
        <div class="message">
            <p>购物车内暂时没有商品，您可以<a href="../index.html">去首页</a>挑选喜欢的商品</p>
        </div>
    </div>
    <!-- 购物车为空 end-->

    <!-- 购物车有商品 -->
    <div class="shop_gwc_bd_contents clearfix">
        <!-- 购物流程导航 -->
        <div class="shop_gwc_bd_contents_lc clearfix">
            <ul>
                <li class="step_a hover_a">确认购物清单</li>
                <li class="step_b">确认收货人资料及送货方式</li>
                <li class="step_c">购买完成</li>
            </ul>
        </div>
        <!-- 购物流程导航 End -->

        <!-- 购物车列表 -->
        <table>
            <thead>
            <tr>
                <th colspan="2"><span>商品</span></th>
                <th><span>单价(元)</span></th>
                <th><span>数量</span></th>
                <th><span>小计</span></th>
                <th><span>操作</span></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cart" items="${requestScope.Carts}">
                <tr>
                    <td class="gwc_list_pic"><a href=""><img width="100px" src="${pageContext.servletContext.contextPath}/productimg/${cart.product.img}" /></a></td>
                    <td class="gwc_list_title"><a href=""></a>${cart.product.productname}</td>
                    <td class="gwc_list_danjia"><span>￥<strong id="danjia_001">${cart.price}</strong></span></td>
                    <td class="gwc_list_shuliang">
                        <span>
                            <a class="good_num_jian this_good_nums" pid="${cart.productid}" did="danjia_001" xid="xiaoji_001" ty="-" valId="goods_001" href="javascript:void(0);">-</a><input type="text" value="${cart.quantity}" id="goods_001" class="good_nums" /><a href="javascript:void(0);" did="danjia_001" xid="xiaoji_001" ty="+" class="good_num_jia this_good_nums" valId="goods_001">+</a>
                        </span>
                    </td>
                    <td class="gwc_list_xiaoji"><span>￥<strong id="xiaoji_001" class="good_xiaojis">2550.00</strong></span></td>
                    <td class="gwc_list_caozuo"><a href="">收藏</a><a href="javascript:void(0);" class="shop_good_delete">删除</a></td>
                </tr>
            </c:forEach>

            </tbody>
            <tfoot>
            <tr>
                <td colspan="6">
                    <div class="gwc_foot_zongjia">商品总价(不含运费)<span>￥<strong id="good_zongjia">12750.00</strong></span></div>
                    <div class="clear"></div>
                    <div class="gwc_foot_links">
                        <a href="" class="go">继续购物</a>
                        <a href="" class="op">确认并填写订单</a>
                    </div>
                </td>
            </tr>
            </tfoot>
        </table>
        <!-- 购物车列表 End -->
    </div>
    <!-- 购物车有商品 end -->

</div>
<!-- 购物车 Body End -->

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
<script>
    $(document).ready(function (){
        $(".good_num_jian").each(function (i,e){
            //i表示是第几个元素
            //e表示元素
            $(e).click(function (){
                //1.获取下一个兄弟节点
                var input=$(e).next();
                //2.得到value值
                var quantity=$(input).val();
                //3.判断是否该减
                if (quantity>0){
                    quantity--;
                }
                $(input).val(quantity);
                var price=$(e).parent().parent().prev().children().first().children().first().text();
                var total=price*quantity;
                $(e).parent().parent().next().children().first().children().first().text(total);

                if (quantity==0){
                    $.post("${pageContext.servletContext.contextPath}/cart",{
                        action:"delete",
                        productId:$(e).attr("pid")
                    },function (){
                        $(e).parent().parent().parent().remove();
                    })
                }
            });
        });
    });
</script>
