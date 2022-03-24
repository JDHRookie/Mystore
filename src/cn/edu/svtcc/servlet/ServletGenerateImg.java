package cn.edu.svtcc.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;


@WebServlet("/generateimg")
public class ServletGenerateImg extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1、生成图片
        BufferedImage image=new BufferedImage(90,26,BufferedImage.TYPE_INT_RGB);
        Graphics g=image.getGraphics(); //g相当于一个画板
        g.setColor(new Color(0xDCDC));
        //3、随机生成字符串
        String chars="0123456789";
        String code="";
        for (int i=0;i<6;i++){
            int index=(int)(Math.random()*chars.length());//产生随机数
            code=code+chars.charAt(index);
        }
        //将生成的验证码存到服务器
        HttpSession session=req.getSession();
        session.setAttribute("code",code);   //前面那个是一个key（键），后面那个则是值


        g.setFont(new Font("宋体",Font.BOLD,20));
        g.drawString(code,10,15);
        //随机生成200个干扰点
        for (int i=0;i<100;i++){
            int x=(int)(Math.random()*90);
            int y=(int)(Math.random()*26);
            g.drawOval(x,y,1,1);
        }
        g.dispose();
        //2、发送给浏览器
        ByteArrayOutputStream bos=new ByteArrayOutputStream();
        ImageIO.write(image,"JPEG",bos); //image转换成bos对象
        byte[] buf=bos.toByteArray();//在将bos对象转换为二进制输出流输出来
        resp.getOutputStream().write(buf);
    }
}
