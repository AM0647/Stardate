<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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
    
   <c:set var="valid" scope="session"  value="${sessionScope.the_valid}" /> 
   
   
    <c:if test="${valid == 1}" >
        <sql:setDataSource var="ds" dataSource="jdbc/stardate" />
        <sql:query dataSource="${ds}" sql="select * from events" var="results1" />  
        <c:set var="Unique" scope="session" value="${1}" />
        
        <c:forEach var="event" items="${results1.rows}" varStatus="row">
        
                     <c:if test="${event.username == sessionScope.the_name && event.date == sessionScope.the_date }">
                    
                          <c:set var="Unique" scope="session" value="${0}" />
                    
                     </c:if>
                
        </c:forEach>
        
                           
                    <c:if test="${Unique == 1}">
                    
                        <sql:update  dataSource="${ds}" var="count1" sql="insert into events values(NULL,'${sessionScope.the_name}','${sessionScope.the_email}','${sessionScope.the_date}','${sessionScope.the_title}','${sessionScope.the_description}' )" />
                    
                    </c:if>           
             
        
     </c:if>  
   
   
   
   
   
   
   
    
     
 <div class="nav">
      <ul>
        <li class="logged_in_user"><strong>Welcome ${username}</strong></li>
        <li class="home"><a class="active" href="${pageContext.request.contextPath}/home_logged_in_user.jsp">Home</a></li>
        <li class="about"><a href="${pageContext.request.contextPath}/About_logged_in_user.jsp">About</a></li>        
        <li class="contact"><a href="${pageContext.request.contextPath}/Contact_logged_in_user.jsp">Contact</a></li>        
        <li class="Sign_out"><a href="#">Sign out</a></li>
      </ul>
 </div>
    
    
  
    

 <div class="content">

    <div class="Sign_out_form">
        
            
            <h1>Sign out</h1><hr><br>
                                   
                <div class="sign_out_button" >
                    <a  href="${pageContext.request.contextPath}/KillSession">Sign out</a>
                </div>
    
         
             
                <p>If you would like to delete your account click this button</p>
           
             
             
                <form action="UnPopulateDB" method="post">
                        
                    <div>
                        <input type="hidden" name="username" value="${username}"  />
                        <input type="submit" value="Delete account" class="delete_account_button"  />
                    </div>
             
                </form>
             
             
        
    </div>  

    
    
       
   
<script> 
    $( document ).ready(function() {
            $(".Sign_out").click(function(){                  
                  $(".Sign_out_form").fadeIn(1000);                           
            });
                        
    });
    
    $(document).mouseup(function (e){
    var container = $(".Sign_out_form");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
    }
});
     
</script>
 