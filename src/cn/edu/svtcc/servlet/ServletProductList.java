package cn.edu.svtcc.servlet;

import cn.edu.svtcc.btl.ProductBO;
import en.edu.svtcc.domain.ProductDO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/product_list")
public class ServletProductList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageIndex=1;
        if (req.getParameter("pageIndex")!=null){
            pageIndex=Integer.parseInt(req.getParameter("pageIndex"));
        }
        ArrayList<ProductDO> products= ProductBO.getAllProducts(pageIndex,12);
        int pageCount=ProductBO.getAllProductsPageCount(12);
        req.setAttribute("Products",products);
        req.setAttribute("PageIndex",pageIndex);
        req.setAttribute("PageCount",pageCount);
        req.getRequestDispatcher("list.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
