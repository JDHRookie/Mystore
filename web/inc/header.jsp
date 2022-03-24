<%--
  Created by IntelliJ IDEA.
  User: 蒋登禾
  Date: 2021/10/20
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Header TopNav -->
<div class="shop_hd_topNav">
    <div class="shop_hd_topNav_all">
        <!-- Header TopNav Left -->
        <div class="shop_hd_topNav_all_left">
            <p>您好，欢迎来到<b><a href="/">ShoopNC商城${pageContext.request.requestURI}</a></b>[<a href="login">登录</a>][<a href="">注册</a>]</p>
        </div>
        <!-- Header TopNav Left End -->

        <!-- Header TopNav Right -->
        <div class="shop_hd_topNav_all_right">
            <ul class="topNav_quick_menu">

                <li>
                    <div class="topNav_menu">
                        <a href="#" class="topNavHover">我的商城<i></i></a>
                        <div class="topNav_menu_bd" style="display:none;" >
                            <ul>
                                <li><a title="已买到的商品" target="_top" href="#">已买到的商品</a></li>
                                <li><a title="个人主页" target="_top" href="#">个人主页</a></li>
                                <li><a title="注销" target="_top" href="${pageContext.servletContext.contextPath}/login_out">我的好友</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="topNav_menu">
                        <a href="#" class="topNavHover">卖家中心<i></i></a>
                        <div class="topNav_menu_bd" style="display:none;">
                            <ul>
                                <li><a title="已售出的商品" target="_top" href="#">已售出的商品</a></li>
                                <li><a title="销售中的商品" target="_top" href="#">销售中的商品</a></li>
                            </ul>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="topNav_menu">
                        <a href="#" class="topNavHover">购物车<b>0</b>种商品<i></i></a>
                        <div class="topNav_menu_bd" style="display:none;">
                            <!--
                            <ul>
                              <li><a title="已售出的商品" target="_top" href="#">已售出的商品</a></li>
                              <li><a title="销售中的商品" target="_top" href="#">销售中的商品</a></li>
                            </ul>
                            -->
                            <p>还没有商品，赶快去挑选！</p>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="topNav_menu">
                        <a href="#" class="topNavHover">我的收藏<i></i></a>
                        <div class="topNav_menu_bd" style="display:none;">
                            <ul>
                                <li><a title="收藏的商品" target="_top" href="#">收藏的商品</a></li>
                                <li><a title="收藏的店铺" target="_top" href="#">收藏的店铺</a></li>
                            </ul>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="topNav_menu">
                        <a href="#">站内消息</a>
                    </div>
                </li>

            </ul>
        </div>
        <!-- Header TopNav Right End -->
    </div>
    <div class="clear"></div>
</div>
<div class="clear"></div>
<!-- Header TopNav End -->

<!-- TopHeader Center -->
<div class="shop_hd_header">
    <div class="shop_hd_header_logo"><h1 class="logo"><a href="/"><img src="${pageContext.servletContext.contextPath}/images/logo.png" alt="ShopCZ" /></a><span>ShopCZ</span></h1></div>
    <div class="shop_hd_header_search">
        <ul class="shop_hd_header_search_tab">
            <li id="search" class="current">商品</li>
            <li id="shop_search">店铺</li>
        </ul>
        <div class="clear"></div>
        <div class="search_form">
            <form method="post" action="index.php">
                <div class="search_formstyle">
                    <input type="text" class="search_form_text" name="search_content" value="搜索其实很简单！" />
                    <input type="submit" class="search_form_sub" name="secrch_submit" value="" title="搜索" />
                </div>
            </form>
        </div>
        <div class="clear"></div>
        <div class="search_tag">
            <a href="">李宁</a>
            <a href="">耐克</a>
            <a href="">Kappa</a>
            <a href="">双肩包</a>
            <a href="">手提包</a>
        </div>

    </div>
</div>
<div class="clear"></div>
<!-- TopHeader Center End -->

<!-- Header Menu -->
<div class="shop_hd_menu">
    <!-- 所有商品菜单 -->

    <div id="shop_hd_menu_all_category"
         class='shop_hd_menu_all_category ${pageContext.request.requestURI.endsWith("index.jsp")?"shop_hd_menu_hover":""}'>
        <!-- 首页去掉 id="shop_hd_menu_all_category" 加上clsss shop_hd_menu_hover -->
        <div class="shop_hd_menu_all_category_title"><h2 title="所有商品分类"><a href="javascript:void(0);">所有商品分类</a></h2><i></i></div>
        <div id="shop_hd_menu_all_category_hd" class="shop_hd_menu_all_category_hd">
            <ul class="shop_hd_menu_all_category_hd_menu clearfix">
                <!-- 单个菜单项 -->
                <li id="cat_1" class="">
                    <h3><a href="" title="男女服装">男女服装</a></h3>
                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                        <dl class="clearfix">
                            <dt><a href="女装" href="">女装</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>

                        <dl class="clearfix">
                            <dt><a href="男装" href="">男装</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>
                    </div>
                </li>
                <!-- 单个菜单项 End -->
                <li id="cat_2" class="">
                    <h3><a href="" title="鞋包配饰">鞋包配饰</a></h3>
                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                        <dl class="clearfix">
                            <dt><a href="鞋子" href="">鞋子</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>

                        <dl class="clearfix">
                            <dt><a href="包包" href="">包包</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>
                    </div>
                </li>

                <li id="cat_3" class="">
                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                        <dl class="clearfix">
                            <dt><a href="美容" href="">美容</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>

                        <dl class="clearfix">
                            <dt><a href="美妆" href="">美妆</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>
                    </div>
                </li>

                <li id="cat_4" class="">
                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                        <dl class="clearfix">
                            <dt><a href="美容" href="">美容</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>

                        <dl class="clearfix">
                            <dt><a href="美妆" href="">美妆</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>
                    </div>
                </li>

                <li id="cat_5" class="">
                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                        <dl class="clearfix">
                            <dt><a href="美容" href="">美容</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>

                        <dl class="clearfix">
                            <dt><a href="美妆" href="">美妆</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>
                    </div>
                </li>

                <li id="cat_6" class="">
                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                        <dl class="clearfix">
                            <dt><a href="美容" href="">美容</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>

                        <dl class="clearfix">
                            <dt><a href="美妆" href="">美妆</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>
                    </div>
                </li>
                <li id="cat_7" class="">
                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                        <dl class="clearfix">
                            <dt><a href="美容" href="">美容</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>

                        <dl class="clearfix">
                            <dt><a href="美妆" href="">美妆</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>
                    </div>
                </li>
                <li id="cat_8" class="">
                    <h3><a href="" title="美容美妆">美容美妆</a></h3>
                    <div id="cat_1_menu" class="cat_menu clearfix" style="">
                        <dl class="clearfix">
                            <dt><a href="美容" href="">美容</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>

                        <dl class="clearfix">
                            <dt><a href="美妆" href="">美妆</a></dt>
                            <dd>
                                <a href="">风衣</a>
                                <a href="">长袖连衣裙</a>
                                <a href="">毛呢连衣裙</a>
                                <a href="">半身裙</a>
                                <a href="">小脚裤</a>
                                <a href="">加绒打底裤</a>
                                <a href="">牛仔裤</a>
                                <a href="">打底衫</a>
                                <a href="">情侣装</a>
                                <a href="">棉衣</a>
                                <a href="">毛呢大衣</a>
                                <a href="">毛呢短裤</a>
                            </dd>
                        </dl>
                    </div>
                </li>
                <li class="more"><a href="">查看更多分类</a></li>
            </ul>
        </div>
    </div>
    <!-- 所有商品菜单 END -->

    <!-- 普通导航菜单 -->
    <ul class="shop_hd_menu_nav">
        <li class="current_link"><a href="${pageContext.servletContext.contextPath}/"><span>首页</span></a></li>
        <li class="link"><a href=""><span>团购</span></a></li>
        <li class="link"><a href="${pageContext.servletContext.contextPath}/product_list?pageIndex=1"><span>购物</span></a></li>
        <li class="link"><a href=""><span>优惠卷</span></a></li>
        <li class="link"><a href=""><span>积分中心</span></a></li>
        <li class="link"><a href=""><span>运动专场</span></a></li>
        <li class="link"><a href=""><span>微商城</span></a></li>
    </ul>
    <!-- 普通导航菜单 End -->
</div>
<!-- Header Menu End -->