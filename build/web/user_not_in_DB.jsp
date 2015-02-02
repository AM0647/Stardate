<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
        <li class="home"><a class="active" href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
        <li class="about"><a href="${pageContext.request.contextPath}/About.jsp">About</a></li>        
        <li class="contact"><a href="${pageContext.request.contextPath}/Contact.jsp">Contact</a></li>        
      </ul>
    </div>
    
    
  
    

 <div class="exception_content">
     <div id="Duplicate">
         <h1>No such user !!</h1>
         <p>It looks like there is something wrong with the username or password.</p>
         <p>Please return to the previous page and make sure you use the correct input</p>
         
         
         <div id="button">
             
             <a  href="${pageContext.request.contextPath}/home.jsp">Return</a>
             
         </div>
     </div>


 </div>  
    
<div id="footer"> 
    <p><span class="copy-left">&copy;</span><span>&nbsp;Copyleft 2014 Sotiris Magionas</span></p>
</div>



</body>
</html>