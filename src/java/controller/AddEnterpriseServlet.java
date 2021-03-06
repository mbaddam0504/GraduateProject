/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.DBActions;
import model.Enterprise;
import model.Facility;

/**
 *
 * @author S519295
 */
@WebServlet(name = "AddEnterpriseServlet", urlPatterns = {"/AddEnterpriseServlet"})
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024 * 5 * 5 * 5 * 5,
        maxFileSize = 1024 * 1024 * 5 * 5, maxRequestSize = 1024 * 1024 * 5 * 5 * 5)
public class AddEnterpriseServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        

    }

    private String extractFileName(Part part) {

        String contentDisp = part.getHeader("content-disposition");
        System.out.println("contentdisp----" + contentDisp);
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }

        return "";
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          RequestDispatcher rd = request.getRequestDispatcher("EditFacility.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         DBActions dbActions = new DBActions();
            HttpSession session = request.getSession();
            ServletContext context = session.getServletContext();
            Facility facility = (Facility) session.getAttribute("selectedFacilityDetails");
            System.out.println("facility Id----" + facility.getFacilityID());
            //String saveOrCancel = request.getParameter("saveOrCancelEnterprise");
            if (facility.getFacilityName() != null) {
//                File fileSaveDir = new File(getServletContext().getRealPath("../../web/" + facility.getFacilityID()));
//                if (!fileSaveDir.exists()) {
//                    fileSaveDir.mkdir();
//                }
String enterpriseName = request.getParameter("enterpriseName").trim();
                
                
                String enterpriseDescription = request.getParameter("enterpriseDescription");
                Part part = request.getPart("enterpriseIcon");
                if (part != null) {
                    String str = extractFileName(part).replace(' ', 'x');
                    String str2 = str.replace("\\", ">");
                    String[] strArr = str2.split(">");
                    String fileName = strArr[strArr.length-1];
                    System.out.println("fileName----" + fileName);
                    String realContextPath = context.getRealPath(request.getContextPath())+"\\..\\..\\..\\web\\"+facility.getFacilityID()+"\\"+fileName;
                    part.write(realContextPath);
                    String filePath = facility.getFacilityID() + "/" + fileName;
                    Enterprise newEnterprise = new Enterprise();
                    newEnterprise.setEnterpriseName(enterpriseName);
                    newEnterprise.setEnterpriseIcon(filePath);
                    newEnterprise.setFacilityID(facility.getFacilityID());
                    newEnterprise.setEnterpriseDescription(enterpriseDescription);

                    int z = 0;
                    for (int i = 0; i < facility.getEnterprisesList().size(); i++) {
                        if (facility.getEnterprisesList().get(i).getEnterpriseName().equals(enterpriseName)) {
                            z++;
                        }
                    }

                   
                    if (z == 0) {
                        dbActions.addNewEnterprise(newEnterprise);
//create directory to store mediafiles of enterprise
                             //creating directory for created facility
        
String realContextPath1 = context.getRealPath(request.getContextPath())+"\\..\\..\\..\\web\\"+facility.getFacilityID()+"\\"+dbActions.getEnterpriseId(facility.getFacilityID(), enterpriseName);
                      System.out.println("facility directory path...........:"+ realContextPath);
        File fileSaveDir = new File(realContextPath1);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                    System.out.println("directory created");
                }     
//                File fileSaveDir = new File(getServletContext().getRealPath("../../web/" + facility.getFacilityID() + "/" + dbActions.getEnterpriseId(facility.getFacilityID(), enterpriseName)));
//                if (!fileSaveDir.exists()) {
//                    fileSaveDir.mkdir();
//                }
                        session.setAttribute("selectedFacilityDetails", dbActions.getFacilityDetails(facility.getFacilityID()));
                        session.setAttribute("enterpriseChecker", dbActions.getFacilityDetails(facility.getFacilityID()).getEnterprisesList().isEmpty() ? "disabled" : "");
                        response.sendRedirect("ExtraEnterpriseServlet?isEnterpriseDuplicated=no");
                    } else {
                        
                        System.out.println("already the facility contains this enterprise");
                        response.sendRedirect("ExtraEnterpriseServlet?isEnterpriseDuplicated=yes");
                    }
                    
                    
                    System.out.println("part is not null");

                }else{
                    System.out.println("part is null");
                }

            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
