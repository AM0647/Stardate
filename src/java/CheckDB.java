import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException; 

public class CheckDB extends HttpServlet {

    
    
    
    
    public static String md5(String input) {
         
        String md5 = null;
         
        if(null == input) return null;
         
        try {
             
        //Create MessageDigest object for MD5
        MessageDigest digest = MessageDigest.getInstance("MD5");
         
        //Update input string in message digest
        digest.update(input.getBytes(), 0, input.length());
 
        //Converts message digest value in base 16 (hex)
        md5 = new BigInteger(1, digest.digest()).toString(16);
 
        } catch (NoSuchAlgorithmException e) {
        }
        return md5;
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
        String encryptedpassword = md5(pass);
       
        
        try{
            if(uname.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin")){
                HttpSession session = request.getSession();
                session.setAttribute("user",uname);
                RequestDispatcher rd = request.getRequestDispatcher("Second");
                rd.forward(request,response);
            }else{
                HttpSession session = request.getSession();
                
                session.setAttribute("pass",encryptedpassword );
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request,response);            
            }        
        }finally{
            out.close();
        }
            
    }

    

}
