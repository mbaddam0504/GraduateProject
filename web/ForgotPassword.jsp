<%-- 
    Document   : LoginPage
    Created on : Jan 17, 2015, 5:21:02 PM
    Author     : S519459
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>Welcome</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
        <link type="text/css" rel ="stylesheet" href="project.css">
        <link type="text/css" rel="stylesheet" href="forgotPassword.css">
        
    </head>
    <body>
        <br>
       <h1 align='center'>Please Enter your Mail Id so that We can send a New Password </h1>
        <div id="forgotpwddivison">
            <form action="ForgotPwdServlet"  method="POST">
                <table> 
                    <th align="center">Forgot Password </th>
                    <tr><td></td></tr><tr><td></td></tr>
                   <tr>
                        <td><label >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp User Id </label></td>
                    </tr>
                    <tr  align="center">
                        <td><input type="text" name="username" ></td>
                    </tr>
                    <tr>
                        <td><label> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspMail Id </label></td>
                    </tr>
                    <tr  align="center">
                        <td><input type="email" name="mailid"></td>
                    </tr>
                </table>
            <br><br><br><br><br><br><br><br><br><br><br>
<div id="error">
<c:choose>
    <c:when test="${message != null}">
<c:out value="${message}"/>
    </c:when>
<c:otherwise>
    <c:out value=""/>
</c:otherwise>
</c:choose>        
        </div> 
<br>
<table id="tbottom">
    <tr>   <input type="submit" value ="Send" id="addButton">
            </form>

      
 <form action="LoginPage.jsp">
         <input type="submit" value ="Cancel" id="addButton">
</form>
     </tr>
</table>
<br><br>
 </div>
    </body>
</html>