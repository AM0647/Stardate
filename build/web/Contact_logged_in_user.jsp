<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" /> <!-- we dont have to worry about the server we upload our app -->
        <title>Stardate | Your dates with the universe</title>
        <link rel="shortcut icon" href="favicon.ico" />
        <meta name="viewport" content="width=device-width, initial-scale=1">         
    </head>
    
    
    
    <body>
        
    <div class="nav">
      <ul>
        <li class="logged_in_user"><strong>Welcome ${username}</strong></li>
        <li class="home"><a  href="${pageContext.request.contextPath}/home_logged_in_user.jsp">Home</a></li>
        <li class="about"><a  href="${pageContext.request.contextPath}/About_logged_in_user.jsp">About</a></li>        
        <li class="contact"><a class="active" href="${pageContext.request.contextPath}/Contact_logged_in_user.jsp">Contact</a></li>        
      </ul>
    </div>
    
    
    <div id="contact_content">
          <h1> Want to say something? </h1>
          <p>You can e-mail me at  somagion@outlook.com </p> 
          <p>Or visit my facebook,twitter or github page </p> 
      </div>
      
      
      
    
    <div id="social_accounts">
      <div id="social_account">
          
          <a  href="https://www.facebook.com/sotiris.magionas"><img style="width:160px; height:160px;" src="style/images/facebook.png"  /></a>
          
      </div>
      
      <div id="social_account">
          
          <a  href="https://twitter.com/SotirisMagionas"><img style="width:140px; height:140px;" src="style/images/twitter.png" /></a>
          
      </div>
      
      <div id="social_account">
          
          <a  href="https://github.com/AM0647"><img style="width:130px; height:130px;" src="style/images/github.png" /></a>
          
      </div>
    
    </div>   
        
        

    
    
        
        
        <c:import url="footer.jsp"></c:import>

    
    </body>
</html>