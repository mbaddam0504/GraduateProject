<%-- 
    Document   : ChangeProfile
    Created on : Feb 2, 2015, 12:24:37 AM
    Author     : S519459
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="farm.LoginBean" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel ="stylesheet" href="project.css">
        <link type="text/css" rel="stylesheet" href="register.css">
          <title>Change Profile Page</title>
    </head>
    <body>
        <br><br><br>
        <!--<h1 align="center">Northwest  Agricultural Farm</h1>-->
        <div id="profilediv">
            <form action="ChangeProfileServlet" method="POST">
        
                <table> 
                    <th align="center">Your Profile</th>
                    <tr>
                        <td><label >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspFirst Name </label></td>
                    </tr>
                    <tr  align="center">
                        <td><input type="text" name="firstname" value="${profile.getFirstName()}"></td>
                    </tr>
                    <tr>
                        <td><label >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Last Name </label></td>
                    </tr>
                    <tr  align="center">
                        <td><input type="text" name="lastname" value="${profile.getLastName()}"></td>
                    </tr>
                    <tr>
                        <td><label >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Email Id </label></td>
                    </tr>
                    <tr  align="center">
                        <td><input type="text" name="emailid" value="${profile.getEmailid()}"></td>
                    </tr>
                   
                    <tr>
     <div id="error">
<c:choose>
    <c:when test="${error != null}">
<c:out value="${error}"/>
    </c:when>
<c:otherwise>
    <c:out value=""/>
</c:otherwise>
</c:choose>    
                    </tr>
                    <tr>
                        <td><br></td>
                    </tr>
                    <tr>
                        
                        <td>
                            <input type="submit" value ="Save" id="addButton">
                            </form>
                            <form action="Facilities.jsp">
                            <input type="submit" value ="Cancel" id="clearButton" name="cancel">
                            </form>
                          </td>
                   </tr>
                </table>

        </div>
        </form>
    </body>
</html>
