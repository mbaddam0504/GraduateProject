<%-- 
    Document   : AddNewFacility
    Created on : Feb 1, 2015, 10:07:29 PM
    Author     : S519295
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adding Facility</title>
        <link type="text/css" rel ="stylesheet" href="addFacility.css"> 
        <link type="text/css" rel ="stylesheet" href="project.css">
    </head>
    <body>
        <form action="AddNewFacilityServlet">
                    <h1 align="center">Add Facility</h1>
       
        <div id="addFacilitydiv">
             <br>
                 ${isFacilityDuplicated}
            <table>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <input type="text" name="facilityName" required maxlength="50"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Description
                    </td>
                    <td>
                        <textarea rows="05" cols="23" name="facilityDescription" required maxlength="2000"/></textarea>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Latitude
                    </td>
                    <td>
                        <input type="text" name="latitude" required pattern="^[0-9]{1,3}(\.[0-9]{1,9})?$" title="Ex.12.3456"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Longitude
                    </td>
                    <td>
                        <input type="text" name="longitude" required pattern="^[0-9]{1,3}(\.[0-9]{1,9})?$" title="Ex.12.3456">
                    </td>
                </tr>
                 <tr>
                    <td>
                        Directions
                    </td>
                    <td>
                        <textarea rows="05" cols="23" name="directions" maxlength="2000" required maxlength="2000"></textarea>
                        
                    </td>
                </tr>
                
                <tr>
                    <td><input type="submit" value="Add" id="addingfacilitybutton"></td>
                    </form>
    <td>
        <form action="Facilities.jsp">
            <input type="submit" value="Cancel" id="cancelfacilitybutton">
            </form>
    </td>
                </tr>
                </table>
        </div>  
    </body>
</html>
