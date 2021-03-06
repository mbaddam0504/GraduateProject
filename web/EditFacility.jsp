<%-- 
    Document   : EditFacility
    Created on : Jan 24, 2015, 4:30:04 PM
    Author     : S519295
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Editing Facility</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" rel ="stylesheet" href="editFacility.css"> 
        <link type="text/css" rel ="stylesheet" href="project.css">
    </head>
    
        
        <h1 align="center">Edit Facility ${selectedFacilityDetails.facilityName}</h1>
        <script src="Settings.js"></script>
        <div id="editFacilitydiv">
            <br>
            <form action="AddOrEditOrDeleteEnterpriseServlet" >
               ${isFacilityDuplicated} 
            <table>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <input type="text" name="facilityName" value="${selectedFacilityDetails.facilityName}" required maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td>
                        Description
                    </td>
                    <td>
                        <textarea rows="05" cols="23" name="facilityDescription" required maxlength="2000">${selectedFacilityDetails.facilityDescription}</textarea>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Latitude
                    </td>
                    <td>
                        <input type="text" name="latitude" value="${selectedFacilityDetails.latitude}" required  pattern="^\-?[0-9]{1,3}(\.[0-9]{1,9})?$" title="Ex.12.3456">
                    </td>
                </tr>
                <tr>
                    <td>
                        Longitude
                    </td>
                    <td>
                        <input type="text" name="longitude" value="${selectedFacilityDetails.longitude}" required pattern="^\-?[0-9]{1,3}(\.[0-9]{1,9})?$" title="Ex.12.3456">
                    </td>
                </tr>
                 <tr>
                    <td>
                        Directions
                    </td>
                    <td>
                        <textarea rows="05" cols="23" name="directions" required="required" maxlength="2000">${selectedFacilityDetails.directions}</textarea>
                    </td>
                </tr>
                <tr>
                    <td>Enterprises</td>
                    <td>
         
             
                <select name="Enterprises" size="5" id="enterpriselist">
                    <c:forEach var="enterprises" items="${selectedFacilityDetails.enterprisesList}">
                   
                    <option value="${enterprises.enterpriseName}" selected>${enterprises.enterpriseName}</option>
                </c:forEach>
                    
                </select>
         
                    </td> 
             <td>
             <div id="threeButtons">
             
                 <input type="submit" value="Add Enterprise" id="enterpriseSideButton" name="addOrEditOrDeleteEnterprise">
          
                 <input type="submit" value="Edit Enterprise" id="enterpriseSideButton" name="addOrEditOrDeleteEnterprise" ${enterpriseChecker}>
           
                <input type="submit" value="Delete Enterprise" id="deleteenterpriseSideButton" name="addOrEditOrDeleteEnterprise" onclick="return confirm('Are you sure you want to Delete?');" ${enterpriseChecker}>
           
             </div>
                  

                </tr>
            </table>
            <br>
          
            <input type="submit" value="Save" id="savefacilitychangesbutton" name="addOrEditOrDeleteEnterprise">
           
          
            <input type="submit" value="Cancel" id="cancelfacilitychangesbutton" name="addOrEditOrDeleteEnterprise">
            </form>
        </div>
    </body>
</html>
