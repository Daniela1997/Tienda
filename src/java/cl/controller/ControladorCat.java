/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.controller;

import cl.beans.ServicioBeanLocal;
import java.io.IOException;
import cl.entities.*;

import cl.util.Hash;
import javax.ejb.EJB;
import javax.persistence.metamodel.SingularAttribute;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 25597723-7
 */
@WebServlet(name = "ControladorCat", urlPatterns = {"/controcatl.do"})
public class ControladorCat extends HttpServlet {

   @EJB
    private ServicioBeanLocal servicio;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bt = request.getParameter("bt");
        switch (bt){
            case "nuevacategoria":
                nuevaCategoria(request, response);
                break;
            case "adduser":
                adduser(request,response);
                break;
           
        }
    }
    
    private void adduser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rutUser = request.getParameter("rutUser");
        String nombreUser = request.getParameter("nombreUser");
        String apellidoUser = request.getParameter("apellidoUser");
        String emailUser = request.getParameter("emailUser");
        String clave = request.getParameter("clave");
        String perfil = request.getParameter("perfil");
        
        
        
        if (servicio.buscarUsuario(rutUser)==null){
            Usuario newuser = new Usuario();
            newuser.setRutUser(rutUser);
            newuser.setNombreUser(nombreUser);
            newuser.setApellidoUser(apellidoUser);
            newuser.setEmailUser(emailUser);
            newuser.setClave(Hash.md5(clave));
            newuser.setidPerfil(perfil);
            servicio.guardar(newuser);
            response.sendRedirect("usuario.jsp");
        }else{
            request.setAttribute("msg", "Usuario ya está registrado");
            request.getRequestDispatcher("usuario.jsp").forward(request,response);
            
        }
        
    }
    
    private void nuevaCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        if (nombre.isEmpty()) {
            request.setAttribute("msg", "completa el nombre");
        } else {
            Categoria nueva = new Categoria();
            nueva.setNombreCategoria(nombre);
            servicio.guardar(nueva);
            request.setAttribute("msg", "Especie ingresada con exito!");
        }
        request.getRequestDispatcher("Categorias.jsp").forward(request, response);

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
        processRequest(request, response);
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
        processRequest(request, response);
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
