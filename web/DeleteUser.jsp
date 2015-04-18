<%-- 
    Document   : DeleteUser
    Created on : Jan 26, 2015, 3:35:19 AM
    Author     : S519459
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="farm.DeleteUserBean" %>
<%@ page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete User Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link  type="text/css" href="deleteUsers.css" rel="stylesheet">-->
        <link type="text/css" rel ="stylesheet" href="project.css">
        <!--<link type="text/css" rel ="stylesheet" href="deleteusers.css">-->
        <!--<script type="text/javascript" src="Settings.js"></script>-->

    </head>
    <body>
        
        <h1 align="center" style="color: white; font-family: calibri; font-size: 40px;">List Of Users</h1>
        <div id="deleteusersdiv"></div>
        <div class="users">
            <form  action="DeleteUserServlet" method="POST">
                <table align="center">
     <c:choose>
    <c:when test="${fn:length(list) gt 0}">
 <c:forEach var="userid" items="${list}">
     <tr> <td> <input type="checkbox" value="${userid}" id="users" name="users"><c:out value="${userid}"/></tr>
 </c:forEach>
    </c:when>
<c:otherwise>
         <p id="nousers"> <c:out value="Oops!! No Users To Delete"/></p>
</c:otherwise>
</c:choose> 

                     </table>
     </div>     
<div id="error">
<c:choose>
    <c:when test="${error != null}">
<c:out value="${error}"/>
    </c:when>
<c:otherwise>
    <c:out value=""/>
</c:otherwise>
</c:choose>        
        </div> 
  <table align="center">
      <tr> <td>  
              <input type="submit" Value="Delete" id="deleteuserbutton" onclick="danger()"/>
                    </form>
        </td>
<td> 
    <form  action="Facilities.jsp" method=""POST>
             <input type="submit" Value="Cancel" id="canceldeleteuserbutton">
            </form></td> 
  </tr>
</table>
</div>

    </body>
</html>
