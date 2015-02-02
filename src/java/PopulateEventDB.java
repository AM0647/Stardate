import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class PopulateEventDB extends HttpServlet {

    
    
    
    
    
   

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String event_username = request.getParameter("username");        
        String event_email = request.getParameter("email");
        String event_date = request.getParameter("date");
        String event_year = request.getParameter("year");
        String event_title = request.getParameter("title1");
        String event_description = request.getParameter("description");
        
        
        
        String event_complete_date = event_date + " " + event_year;
        int valid = 1;
        try{
                HttpSession session = request.getSession();
                
                session.setAttribute("the_name",event_username );
                session.setAttribute("the_email",event_email );
                session.setAttribute("the_date",event_complete_date );
                session.setAttribute("the_title",event_title );
                session.setAttribute("the_description",event_description );
                session.setAttribute("the_valid",valid );
                RequestDispatcher rd = request.getRequestDispatcher("header_logged_in_user.jsp");
                rd.forward(request,response);
        }
        finally{
                out.close();
        }        
                
                              
        
            
       
            
    }

    

}
