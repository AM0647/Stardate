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
        <li class="home"><a  href="${pageContext.request.contextPath}/home.jsp">Home</a></li>
        <li class="about"><a class="active" href="${pageContext.request.contextPath}/About.jsp">About</a></li>        
        <li class="contact"><a href="${pageContext.request.contextPath}/Contact.jsp">Contact</a></li>        
      </ul>
    </div>
      
    <div id ="About_contents " >
      <div id="About_content">
          <h1> What is Stardate? </h1>
          <p> Stardate is a web application for finding celestial events such as <strong>moon phases, meteor showers, eclipses, oppositions, conjunctions</strong>, and other interesting events.Most of the astronomical events can be seen with unaided eye, although some may require a good pair of binoculars for best viewing.</p>
      </div> 
      <div id="About_content">  
          <h1>How does StarDate work?</h1>
          <p>StarDate automatically searches for celestial events of the current month and displays them on the home page. If an astronomical event is about to take place today, StarDate displays that event on the top of the page. If you would like to search for events that will take place on an other month, simply <strong>fill out the 3-step form</strong> on the left and the events for this month will be displayed replacing the ones for the current month.  </p>
      </div>
      <div id="About_content">    
          <h1>Why should i Sign up?</h1>
          <p>By signing up you are able to <strong>declare</strong> that you want to watch a particular event/events and <strong>StarDate will notify you 12 hours before the event/events take place</strong> by e-mail so you never lose this awesome experience.</p>
      </div>
      <div id="About_content">   
          <h1>How can i declare i want to watch an event?</h1>
          <p>Simply click the <strong>"Remind me"</strong> button on the back side of the event you would like to watch and StarDate will notify you before the event takes place.</p>
          <p>Note: The "Remind me" button will only be visible if you have registered and are currently logged in.</p>
      </div>
    </div>
    
    
    
    
        
        
        <c:import url="footer.jsp"></c:import>

    
    
