<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" /> <!-- we dont have to worry about the server we upload our app -->
<title>${param.title}</title> 
<link rel="shortcut icon" href="favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    
   <sql:setDataSource var="ds" dataSource="jdbc/stardate" /> 
     
 <div class="nav">
      <ul>
        <li class="home"><a class="active" href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
        <li class="about"><a href="${pageContext.request.contextPath}/About.jsp">About</a></li>        
        <li class="contact"><a href="${pageContext.request.contextPath}/Contact.jsp">Contact</a></li>        
        <li class="Login"><a href="#">Login</a></li>
        <li class="Sign_up"><a href="#">Sign up</a></li>
      </ul>
    </div>
    
    
  
    

 <div class="content">



    <div class="Sign_up_form">
        <form action="PopulateDB" method="post">
            
             <h1>Sign up</h1>
             
             <div id="form_fields">
                <label for="username" class="title">Username:</label>
                <input type="text" name="username" required="required" id="username" /> 
             </div>
             
             <div id="form_fields">
                <label for="email" class="title">E-mail:</label>
                <input type="email" name="email" required="required" id="email" /> 
             </div>
             
             <div id="form_fields">             
                <label for="password" class="title">Password:</label>
                <input type="password" name="password" required="required" id="password" />
             </div>
             
             <div >
                <input type="submit" value="Register" class="submit"  />
             </div>
             
        </form>
    </div>  
     
     
    <c:if test="${param.username != NULL}">   <!-- after the user clicks "register" we check the database to see if his username is already taken and if not we add him to the database-->
         
         <c:set var="Duplicate" scope="session" value="${0}" />
            <sql:query dataSource="${ds}" sql="select * from users" var="results" />
                <c:forEach var="user" items="${results.rows}" varStatus="row">
        
                     <c:if test="${user.username == param.username }">
                    
                          <c:set var="Duplicate" scope="session" value="${1}" />
                    
                     </c:if>
                
                </c:forEach>
                
                <c:if test="${Duplicate == 1}">               
     
                    
                    <c:redirect url="/sign_up_duplicate.jsp" />
                </c:if>
         
                 <c:if test="${Duplicate == 0}">               
     
                      <sql:update  dataSource="${ds}" var="count" sql="insert into users values(NULL,'${param.username}','${sessionScope.pass}','${param.email}')"  />
                      <c:set var="email" scope="session" value="${param.email}" />
                      <c:set var="username" scope="session" value="${param.username}" />  
                      <c:redirect url="/home_logged_in_user.jsp" />           
                      
                 </c:if>
    
    </c:if>
     
     
     
    <script> 
    $( document ).ready(function() {
            $(".Sign_up").click(function(){                  
                  $(".Sign_up_form").fadeIn(1000);                           
            });
                        
    });
    
    $(document).mouseup(function (e){
    var container = $(".Sign_up_form");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
    }
});
     
</script>
    
    
<div class="Login_form">
        <form action="CheckDB" method="post">
            
             <h1>Log in</h1>
             
             <div id="form_fields">
                <label for="username" class="title">Username:</label>
                <input type="text" name="username" required="required" id="username" />
             </div>
             
                          
             <div id="form_fields">             
                <label for="password" class="title">Password:</label>
                <input type="password" name="password" required="required" id="password" />
             </div>
             
             <div >
                <input type="submit" value="Login" class="submit"  />
             </div>
             
        </form>
</div> 
     
   
    
<script> 
    $( document ).ready(function() {
            $(".Login").click(function(){                  
                  $(".Login_form").fadeIn(1000);                           
            });
                        
    });
    
    $(document).mouseup(function (e){
    var container = $(".Login_form");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
    }
});
     
</script>
    
 