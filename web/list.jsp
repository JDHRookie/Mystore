<%--
  Created by IntelliJ IDEA.
  User: 蒋登禾
  Date: 2021/10/20
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>商品列表页</title>
    <link rel="stylesheet" href="css/base.css" type="text/css" />
    <link rel="stylesheet" href="css/shop_common.css" type="text/css" />
    <link rel="stylesheet" href="css/shop_header.css" type="text/css" />
    <link rel="stylesheet" href="css/shop_list.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.js" ></script>
    <script type="text/javascript" src="js/topNav.js" ></script>
    <script type="text/javascript" src="js/shop_list.js" ></script>
</head>
<body>
<!-- Header  -wll-2013/03/24 -->
<div class="shop_hd">
    <%@include file="inc/header.jsp" %>
</div>
<div class="clear"></div>
<!-- 面包屑 注意首页没有 -->
<div class="shop_hd_breadcrumb">
    <strong>当前位置：</strong>
    <span>
			<a href="">首页</a>&nbsp;›&nbsp;
			<a href="">商品分类</a>&nbsp;›&nbsp;
			<a href="">男装女装</a>&nbsp;›&nbsp;
			<a href="">男装</a>
		</span>
</div>
<div class="clear"></div>
<!-- 面包屑 End -->

<!-- Header End -->


<!-- List Body 2013/03/27 -->
<div class="shop_bd clearfix">

    <%@include file="inc/hots.jsp" %>
    <div class="shop_bd_list_right clearfix">
        <!-- 条件筛选框 -->
        <div class="module_filter">
            <div class="module_filter_line">
                <dl>
                    <dt>尺码：</dt>
                    <dd>
                        <span><a href="">XXS</a></span>
                        <span><a href="">XS</a></span>
                        <span><a href="">S</a></span>
                        <span><a href="">M</a></span>
                        <span><a href="">L</a></span>
                        <span><a href="">XL</a></span>
                        <span><a href="">XXL</a></span>
                        <span><a href="">XXXL</a></span>
                        <span><a href="">加大XXXL</a></span>
                        <span><a href="">均码</a></span>
                    </dd>
                </dl>

                <dl>
                    <dt>品牌：</dt>
                    <dd>
                        <span><a href="">彪马</a></span>
                        <span><a href="">安踏</a></span>
                        <span><a href="">阿迪达斯</a></span>
                        <span><a href="">李宁</a></span>
                        <span><a href="">匡威</a></span>
                        <span><a href="">耐克</a></span>
                        <span><a href="">卡帕</a></span>
                        <span><a href="">鸿星尔克</a></span>
                        <span><a href="">沃特</a></span>
                        <span><a href="">垃圾</a></span>
                    </dd>
                </dl>

                <dl>
                    <dt>款式：</dt>
                    <dd>
                        <span><a href="">长袖</a></span>
                        <span><a href="">短袖</a></span>
                        <span><a href="">无袖</a></span>
                        <span><a href="">两件套</a></span>
                        <span><a href="">宽松</a></span>

                    </dd>
                </dl>

                <dl>
                    <dt>材质：</dt>
                    <dd>
                        <span><a href="">纯棉</a></span>
                        <span><a href="">真丝</a></span>
                        <span><a href="">聚酯</a></span>
                        <span><a href="">棉+氨纶</a></span>
                        <span><a href="">卡莱</a></span>
                        <span><a href="">人造棉</a></span>
                        <span><a href="">其它</a></span>
                    </dd>
                </dl>


            </div>
            <div class="bottom"></div>
        </div>
        <!-- 条件筛选框 -->

        <!-- 显示菜单 -->
        <div class="sort-bar">
            <div class="bar-l">
                <!-- 查看方式S -->
                <div class="switch"><span class="selected"><a title="以方格显示" ecvalue="squares" nc_type="display_mode" class="pm" href="javascript:void(0)">大图</a></span><span style="border-left:none;"><a title="以列表显示" ecvalue="list" nc_type="display_mode" class="lm" href="javascript:void(0)">列表</a></span></div>
                <!-- 查看方式E -->
                <!-- 排序方式S -->
                <ul class="array">
                    <li class="selected"><a title="默认排序" onclick="javascript:dropParam(['key','order'],'','array');" class="nobg" href="javascript:void(0)">默认</a></li>
                    <li><a title="点击按销量从高到低排序" onclick="javascript:replaceParam(['key','order'],['sales','desc'],'array');" href="javascript:void(0)">销量</a></li>
                    <li><a title="点击按人气从高到低排序" onclick="javascript:replaceParam(['key','order'],['click','desc'],'array');" href="javascript:void(0)">人气</a></li>
                    <li><a title="点击按信用从高到低排序" onclick="javascript:replaceParam(['key','order'],['credit','desc'],'array');" href="javascript:void(0)">信用</a></li>
                    <li><a title="点击按价格从高到低排序" onclick="javascript:replaceParam(['key','order'],['price','desc'],'array');" href="javascript:void(0)">价格</a></li>
                </ul>
                <!-- 排序方式E -->
                <!-- 价格段S -->
                <div class="prices"> <em>¥</em>
                    <input type="text" value="" class="w30">
                    <em>-</em>
                    <input type="text" value="" class="w30">
                    <input type="submit" value="确认" id="search_by_price">
                </div>
                <!-- 价格段E -->
            </div>
        </div>
        <div class="clear"></div>
        <!-- 显示菜单 End -->

        <!-- 商品列表 -->
        <div class="shop_bd_list_content clearfix">
            <ul>
                <c:forEach var="p" items="${requestScope.Products}">
                    <li>
                        <dl>
                            <dt><a href="${pageContext.servletContext.contextPath}/goods?productId=${p.productid}"><img src="${pageContext.servletContext.contextPath}/productimg/${p.img}" /></a></dt>
                            <dd class="title"><a href="">${p.productname}</a></dd>
                            <dd class="content">
                                <span class="goods_jiage">￥<strong>${p.price}</strong></span>
                                <span class="goods_chengjiao">最近成交5笔</span>
                            </dd>
                        </dl>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="clear"></div>
        <div class="pagination">
            <ul><li><span>首页</span></li>
                <li>
                    <a href="${pageContext.servletContext.contextPath}/product_list?pageIndex=${requestScope.PageIndex>1?requestScope.PageIndex-1:requestScope.PageIndex}"><span>上一页</span></a>
                </li>
                <c:forEach var="i" begin="1" end="${requestScope.PageCount}" step="1">
                    <a href="${pageContext.servletContext.contextPath}/product_list?pageIndex=${i}">
                        <li><span class="${requestScope.PageIndex==i?"currentpage":""}">${i}</span></li>
                    </a>
                </c:forEach>
<%--                <a href="${pageContext.servletContext.contextPath}/product_list?pageIndex=1"><li><span class="${requestScope.PageIndex==1?"currentpage":""}">1</span></li></a>--%>
<%--                <a href="${pageContext.servletContext.contextPath}/product_list?pageIndex=2"><li><span class="${requestScope.PageIndex==2?"currentpage":""}">2</span></li></a>--%>
<%--                <a href="${pageContext.servletContext.contextPath}/product_list?pageIndex=3"><li><span class="${requestScope.PageIndex==3?"currentpage":""}">3</span></li></a>--%>
                <li>
                    <a href="${pageContext.servletContext.contextPath}/product_list?pageIndex=${requestScope.PageIndex<requestScope.PageCount?requestScope.PageIndex+1:requestScope.PageIndex}"><span>下一页</span></a>
                </li>
                <li><span>末页</span></li>
            </ul>
        </div>
        <!-- 商品列表 End -->


    </div>
</div>
<!-- List Body End -->

<!-- Footer - wll - 2013/3/24 -->
<div class="clear"></div>
<div class="shop_footer">
    <%@include file="inc/footer.jsp" %>
</div>
<!-- Footer End -->

</body>
</html>
