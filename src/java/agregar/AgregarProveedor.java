package agregar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class AgregarProveedor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("tipoUsuario") != null && ((int) session.getAttribute("tipoUsuario") == 0 || (int) session.getAttribute("tipoUsuario") == 1)) {

            String base = getInitParameter("base");
            String usuario_base = getInitParameter("user");
            String pass_base = getInitParameter("pass");
            String url = "jdbc:mysql://localhost:3306/" + base;

            try (Connection con = DriverManager.getConnection(url, usuario_base, pass_base)) {

                Class.forName("com.mysql.jdbc.Driver");

                try (PreparedStatement ps = con.prepareStatement("INSERT INTO PROVEEDOR (nombre, apellidos, empresa, telefono, celular, direccion, email) VALUES (?, ?, ?, ?, ?, ?, ?);")) {
                    ps.setString(1, request.getParameter("nombre"));
                    ps.setString(2, request.getParameter("apellidos"));
                    ps.setString(3, request.getParameter("empresa"));
                    ps.setInt(4, Integer.parseInt(request.getParameter("telefono")));
                    ps.setInt(5, Integer.parseInt(request.getParameter("celular")));
                    ps.setString(6, request.getParameter("direccion"));
                    ps.setString(7, request.getParameter("email"));

                    ps.executeUpdate();
                }

                request.setAttribute("res", "Proveedor registrado");
                if ((int) session.getAttribute("tipoUsuario") == 0) {
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/empleado/bienvenido.jsp");
                    disp.include(request, response);
                } else {
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/bienvenido.jsp");
                    disp.include(request, response);
                }

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(AgregarProveedor.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }
    
}
