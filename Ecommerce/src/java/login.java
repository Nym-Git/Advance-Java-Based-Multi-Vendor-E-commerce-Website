/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author admin
 */
public class login extends HttpServlet {

    /**
     * Processes requests             throws ServletException, IOException {
for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        try
        {
            Connection con=data.c();
            String fn=(String)request.getParameter("t1");
            String ln=(String)request.getParameter("t2");
            String ad=(String)request.getParameter("t3");
            String e=(String)request.getParameter("t4");
            String p=(String)request.getParameter("t5");
            String nu= request.getParameter("t6");
            String cp=request.getParameter("t7");
            if(p.equals(cp))
            {
            PreparedStatement s= con.prepareStatement("INSERT INTO LOGIN(EMAIL,NUM,PASS,FNAME,LNAME,ADDRESS) VALUES (?,?,?,?,?,?)");
            s.setString(1, e);
            s.setString(2, nu);
            s.setString(3, p);
            s.setString(4, fn);
            s.setString(5, ln);
            s.setString(6, ad);
            s.executeUpdate();
            request.getRequestDispatcher("loghome.html").include(request, response);
            }
            else
            {
                out.println("<meta http-equiv='refresh' content='0;URL=Signup.html'>");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Something Went Wrong !!');");
                out.println("</script>");
            }
        }
        catch(Exception e)
        {
            System.out.print(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
