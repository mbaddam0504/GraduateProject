<%-- 
    Document   : LoginPage
    Created on : Jan 17, 2015, 5:21:02 PM
    Author     : S519459
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Welcome</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel ="stylesheet" href="dummy.css"> 
        <link type="text/css" rel ="stylesheet" href="project.css">
       
    </head>
    <body>
       
        <h1 align="center">Northwest Missouri State University<br> Agricultural Farm</h1>
        <br><br><br><br><br><br><br><br>
        <div id="rdiv">
            <form action="LoginServlet" method="POST" >
                <table> 
                    <th align="center">Sign In</th>
                    <tr><td></td></tr><tr><td></td></tr>
                   <tr>
                        <td><label >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp User Id </label></td>
                    </tr>
                    <tr  align="center">
                        <td><input type="text" name="userid1" ></td>
                    </tr>
                    <tr>
                        <td><label> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspPassword </label></td>
                    </tr>
                    <tr  align="center">
                        <td><input type="password" name="password1"></td>
                    </tr>
                </table>
            <br><br><br><br><br><br><br><br><br><br><br>
         <div id="error">
<c:choose>
    <c:when test="${message12 != null}">
<c:out value="${message12}"/>
    </c:when>
<c:otherwise>
    <c:out value=""/>
</c:otherwise>
</c:choose>
    <br>            
        </div>            
              
              <input type="submit" value ="Log In" id="addButton">
            </form>
<br><br>
           <div id="pwd">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;
              <a href="ForgotPassword.jsp" >Forgot Password?</a>
                        
            
        </div>
    </body>
</html>