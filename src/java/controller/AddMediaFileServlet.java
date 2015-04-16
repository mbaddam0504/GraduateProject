/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
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
import model.Image;
import model.Video;

/**
 *
 * @author S519295
 */
@WebServlet(name = "AddMediaFileServlet", urlPatterns = {"/AddMediaFileServlet"})
@MultipartConfig(location = "", fileSizeThreshold = 26246533,
        maxFileSize = 26246533, maxRequestSize = 26246533)
public class AddMediaFileServlet extends HttpServlet {

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
                System.out.println(s.substring(s.indexOf("=") + 2, s.length() - 1));
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
        RequestDispatcher rd = request.getRequestDispatcher("EditEnterprise.jsp");
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
        HttpSession session = request.getSession();
        String fileType = request.getParameter("fileType");
        String fileName = request.getParameter("fileName").trim();
        String fileDescription = request.getParameter("fileDescription");

        Facility selectedFacility = (Facility) session.getAttribute("selectedFacilityDetails");
        Enterprise selectedEnterprise = (Enterprise) session.getAttribute("selectedEnterpriseDetails");

        Part part = request.getPart("fileAddress");
        if (part != null) {

            DBActions dbActions = new DBActions();
            session.setAttribute("mediafileChecker", "");
            if (fileType.equals("image")) {
//                File fileSaveDir = new File(getServletContext().getRealPath("../../web/" + selectedFacility.getFacilityID() + "/" + selectedEnterprise.getEnterpriseID()));
//                if (!fileSaveDir.exists()) {
//                    fileSaveDir.mkdir();
//                }
//                     String testFileName = extractFileName(part);
//                     testFileName.replace(' ', '*');
                 String str = extractFileName(part).replace(' ', 'x');
                    String str2 = str.replace("\\", ">");
                    String[] strArr = str2.split(">");
                    String mediaFileName = strArr[strArr.length-1];
                System.out.println("mediafileName1----" + mediaFileName);
                part.write(getServletContext().getRealPath("../../web/" + selectedFacility.getFacilityID() + "/" + selectedEnterprise.getEnterpriseID() + "/" + mediaFileName));
                String filePath = selectedFacility.getFacilityID() + "/" + selectedEnterprise.getEnterpriseID() + "/" + mediaFileName;
                Image image = new Image();
                image.setEnterpriseID(selectedEnterprise.getEnterpriseID());
                image.setImageName(fileName);
                image.setImagePath(filePath);
                image.setImageDesc(fileDescription);
                ArrayList<String> imagesListToCheck = (ArrayList<String>) session.getAttribute("imagesList");
                if (!imagesListToCheck.contains(fileName)) {
                    dbActions.addImageToEnterprise(selectedEnterprise.getEnterpriseID(), image);
                    ArrayList<String> imagesList = dbActions.getImageNamesOfSelectedEnterprise(selectedEnterprise.getEnterpriseID());
                    session.setAttribute("imagesList", imagesList);
                    session.setAttribute("mediafileChecker", "");
response.sendRedirect("ExtraMediaFileServlet?isMediafileDuplicated=no");
                } else {
                    System.out.println("enterprise contains this image already");
                    response.sendRedirect("ExtraMediaFileServlet?isMediafileDuplicated=yes");
                }
            } else {
                File fileSaveDir = new File(getServletContext().getRealPath("../../web/" + selectedFacility.getFacilityID() + "/" + selectedEnterprise.getEnterpriseID()));
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }
//                     String testFileName = extractFileName(part);
//                     testFileName.replace(' ', '*');
                 String str = extractFileName(part).replace(' ', 'x');
                    String str2 = str.replace("\\", ">");
                    String[] strArr = str2.split(">");
                    String mediaFileName = strArr[strArr.length-1];
                System.out.println("mediafileName----" + mediaFileName);
//                String mediaFileType = mediaFileName.substring(mediaFileName.lastIndexOf(".")+1);
//                System.out.println("mediaFileType" + mediaFileType);
                part.write(getServletContext().getRealPath("../../web/" + selectedFacility.getFacilityID() + "/" + selectedEnterprise.getEnterpriseID() + "/" + mediaFileName));
                String filePath = selectedFacility.getFacilityID() + "/" + selectedEnterprise.getEnterpriseID() + "/" + mediaFileName;
                Video video = new Video();
                video.setEnterpriseID(selectedEnterprise.getEnterpriseID());
                video.setVideoName(fileName);
                video.setVideoPath(filePath);
                video.setVideoDesc(fileDescription);
//                video.setVideoType(mediaFileType);
                ArrayList<String> videosListToCheck = (ArrayList<String>) session.getAttribute("videosList");
                if (!videosListToCheck.contains(fileName)) {
                    dbActions.addVideoToEnterprise(selectedEnterprise.getEnterpriseID(), video);
                    ArrayList<String> videosList = dbActions.getVideoNamesOfSelectedEnterprise(selectedEnterprise.getEnterpriseID());
                    session.setAttribute("videosList", videosList);
                    session.setAttribute("mediafileChecker", "");
                    response.sendRedirect("ExtraMediaFileServlet?isMediafileDuplicated=no");
                } else {
                    System.out.println("enterprise already had that video");
                    response.sendRedirect("ExtraMediaFileServlet?isMediafileDuplicated=yes");
                }
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
