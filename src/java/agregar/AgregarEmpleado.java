package agregar;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AgregarEmpleado extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("tipoUsuario") != null && ((int) session.getAttribute("tipoUsuario") == 0 || (int) session.getAttribute("tipoUsuario") == 1)) {

            String base = getInitParameter("base");         
            String usuario_base = getInitParameter("user"); 
            String pass_base = getInitParameter("pass");  
            String url = "jdbc:mysql://localhost:3306/" + base; 
            int id;

            try (Connection con = DriverManager.getConnection(url, usuario_base, pass_base)) {

                Class.forName("com.mysql.jdbc.Driver");

                try (PreparedStatement ps = con.prepareStatement("INSERT INTO USUARIOS (usuario, contrasena) VALUES (?, ?);")) {
                    ps.setString(1, request.getParameter("usuario"));
                    ps.setString(2, request.getParameter("pwd1"));
                    ps.executeUpdate();
                }

                try (PreparedStatement ps = con.prepareStatement("SELECT id FROM USUARIOS WHERE usuario=? AND contrasena=?;")) {
                    ps.setString(1, request.getParameter("usuario"));
                    ps.setString(2, request.getParameter("pwd1"));
                    ResultSet rs = ps.executeQuery();
                    rs.next();
                    id = rs.getInt(1);
                    
                }

                try (PreparedStatement ps = con.prepareStatement("INSERT INTO EMPLEADO (nombre, apellidos, telefono, celular, direccion, email, curp, usuario) VALUES (?, ?, ?, ?, ?, ?, ?, ?);")) {

                    ps.setString(1, request.getParameter("nombre"));
                    ps.setString(2, request.getParameter("apellidos"));
                    ps.setInt(3, Integer.parseInt(request.getParameter("telefono")));
                    ps.setInt(4, Integer.parseInt(request.getParameter("celular")));
                    ps.setString(5, request.getParameter("direccion"));
                    ps.setString(6, request.getParameter("email"));
                    ps.setString(7, request.getParameter("curp"));
                    ps.setInt(8, id);
                    ps.executeUpdate();
                }

                request.setAttribute("res", "Empleado registrado");
                RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/bienvenido.jsp");
                disp.include(request, response);

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(AgregarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }

}
