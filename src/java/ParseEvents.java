import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jsoup.Jsoup;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;









public class ParseEvents extends HttpServlet {

    
    
    
    
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String req_month = request.getParameter("month");
        String req_year = request.getParameter("year");
        String req_country = request.getParameter("country");
        String req_address = "http://www.seasky.org/astronomy/astronomy-calendar-" + req_year + ".html" ;
        
        try{
                HttpSession session = request.getSession();
                session.setAttribute("month", req_month);
                session.setAttribute("year", req_year);
                session.setAttribute("country", req_country);
                session.setAttribute("address", req_address);
                Document doc = Jsoup.connect(req_address).userAgent("Mozilla").get();
                
                
                
                
                
                Elements req_contents = doc.getElementsByClass("date-text");
                List myListdates = new ArrayList();
                List myListtitles = new ArrayList();
                List myListdescription = new ArrayList();
                 
                
                    for (Element req_content : req_contents) {
                        if(req_content.text().contains(req_month)){
                            myListdates.add(req_content.text());
                            myListtitles.add(req_content.nextElementSibling().text());
                            myListdescription.add(req_content.parent().text());
                        }
                         
                    }
                             
                
                
                session.setAttribute("dates", myListdates);
                session.setAttribute("titles", myListtitles);     
                session.setAttribute("description", myListdescription);     
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request,response);
        }
        finally{
                out.close();
        }        
                
                              
        
            
       
            
    }

    

}







