import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UnPopulateDB extends HttpServlet {

    
    
    
    
    
   

    
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String user_to_delete = request.getParameter("username");
        
        
       
        
        try{
            HttpSession session = request.getSession(false);
            session.setAttribute("user_to_delete",user_to_delete );
            RequestDispatcher rd = request.getRequestDispatcher("home_logged_in_user.jsp");
            rd.forward(request,response);
        }
        finally{
                out.close();
        }        
                
                              
        
            
       
            
    }

    
}
