package Controlador;

import dao.MensajeDAO;
import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Mensaje;

public class MensajeM extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idU1 = Integer.parseInt(request.getParameter("idU1"));
        int idU2 = Integer.parseInt(request.getParameter("idU2"));
        MensajeDAO m = null;
        try {
            m = new MensajeDAO();
        } catch (URISyntaxException ex) {
            Logger.getLogger(MensajeM.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            m.deleteMensaje(idU1, idU2);
        } catch (SQLException ex) {
            Logger.getLogger(MensajeM.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("menu.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idU1 = Integer.parseInt(request.getParameter("idU1"));
        int idU2 = Integer.parseInt(request.getParameter("idU2"));
        String asunto = request.getParameter("asunto");
        String texto = request.getParameter("texto");
        MensajeDAO m = null;
        try {
            m = new MensajeDAO();
        } catch (URISyntaxException ex) {
            Logger.getLogger(MensajeM.class.getName()).log(Level.SEVERE, null, ex);
        }
        Mensaje mensajeU = new Mensaje();
        try {
            mensajeU = m.getAllMensajesByIds(idU1, idU2);
        } catch (SQLException ex) {
            Logger.getLogger(MensajeM.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (mensajeU != null) {
            if (!asunto.equals("")) {
                mensajeU.setAsunto(asunto);
            }
            if (!texto.equals("")) {
                mensajeU.setTexto(texto);
            }
            try {
                m.updateMensaje(mensajeU);
            } catch (SQLException ex) {
                Logger.getLogger(MensajeM.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("menu.jsp");
        } else {
            request.setAttribute("respuesta", "algooo");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/MensajeU.jsp");
            rd.forward(request, response);
        }

    }
}
