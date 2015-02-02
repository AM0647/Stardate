
import static java.lang.System.out;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.*;
import static java.lang.System.out;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Transport;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import java.sql.*;
import org.joda.time.*;



public class UpdateCounts implements Runnable {

    @Override
    public void run() {
        
        LocalDate tomorrow = LocalDate.now().plusDays( 1 );
        String tomorrow_string = tomorrow.toString("MMMMMMMMMM dd YYYY ");
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
        }

 	 
        try {
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stardate","stardate_admin","star9DATE%");
            PreparedStatement ps =con.prepareStatement
                             ("select * from events where date=? ");
            ps.setString(1, tomorrow_string);
            
            ResultSet rs =ps.executeQuery();
            
            
            
            while( rs.next()){
                try {
                    
                    
        String host = "smtp.gmail.com";
        String from = "StarDateMailing@gmail.com";
        String pass = "%star89date";
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.debug", "true");

            
            Session session = Session.getInstance(props, new MailAuthenticator(from, pass));
            MimeMessage message = new MimeMessage(session);
            Address fromAddress = new InternetAddress(from);
            Address toAddress = new InternetAddress(rs.getNString("email"));
            
            try {
                message.setFrom(fromAddress);
            } catch (MessagingException ex) {
                Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                message.setRecipient(Message.RecipientType.TO, toAddress);
            } catch (MessagingException ex) {
                Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                message.setSubject("The event you wanted to see will happen soon!");
            } catch (MessagingException ex) {
                Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                message.setText(rs.getNString("description") + "        So don't forget! Look up");
            } catch (MessagingException ex) {
                Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
            }
            Transport transport = null;
            try {
                transport = session.getTransport("smtp");
            } catch (NoSuchProviderException ex) {
                Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                transport.connect(host, from, pass);
            } catch (MessagingException ex) {
                Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                message.saveChanges();
            } catch (MessagingException ex) {
                Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                Transport.send(message);
            } catch (MessagingException ex) {
                Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                transport.close();
            } catch (MessagingException ex) {
                Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (AddressException ex) {
            Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
        }

            
                
                       
                
            
            
            
            }
            
            
            
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UpdateCounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        
                           
    }

}


class MailAuthenticator extends Authenticator {
     String user;
     String pw;
     public MailAuthenticator (String username, String password)
     {
        super();
        this.user = username;
        this.pw = password;
     }
    public PasswordAuthentication getPasswordAuthentication()
    {
       return new PasswordAuthentication(user, pw);
    }
}