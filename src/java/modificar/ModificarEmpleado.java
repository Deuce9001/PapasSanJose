package modificar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class ModificarEmpleado extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("tipoUsuario") != null && (int) session.getAttribute("tipoUsuario") == 1) {

            String base = getInitParameter("base");
            String usuario_base = getInitParameter("user");
            String pass_base = getInitParameter("pass");
            String url = "jdbc:mysql://localhost:3306/" + base;

            try (Connection con = DriverManager.getConnection(url, usuario_base, pass_base)) {

                Class.forName("com.mysql.jdbc.Driver");

                try (PreparedStatement ps = con.prepareStatement("UPDATE empleado SET nombre=?, apellidos=?, telefono=?, celular=?, direccion=?, email=?, curp=? WHERE id = ?;")) {
                    ps.setString(1, request.getParameter("nombre"));
                    ps.setString(2, request.getParameter("apellidos"));
                    ps.setInt(3, Integer.parseInt(request.getParameter("telefono")));
                    ps.setInt(4, Integer.parseInt(request.getParameter("celular")));
                    ps.setString(5, request.getParameter("direccion"));
                    ps.setString(6, request.getParameter("email"));
                    ps.setString(7, request.getParameter("curp"));
                    ps.setInt(8, Integer.parseInt(request.getParameter("id_cliente")));

                    ps.executeUpdate();
                }

                request.setAttribute("res", "Empleado actualizado");
                RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/bienvenido.jsp");
                disp.include(request, response);

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(ModificarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("tipoUsuario") != null && (int) session.getAttribute("tipoUsuario") == 1) {

            String base = getInitParameter("base");
            String usuario_base = getInitParameter("user");
            String pass_base = getInitParameter("pass");
            String url = "jdbc:mysql://localhost:3306/" + base;

            try (Connection con = DriverManager.getConnection(url, usuario_base, pass_base)) {

                Class.forName("com.mysql.jdbc.Driver");

                if (request.getParameter("boton").equals("Modificar Cliente")) {

                    try (PreparedStatement ps = con.prepareStatement("SELECT * FROM empleado where id=?;")) {
                        ps.setInt(1, Integer.parseInt(request.getParameter("id_empleado")));

                        ps.executeQuery();

                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {

                            request.setAttribute("id", rs.getInt("id"));
                            request.setAttribute("nombre", rs.getString("nombre"));
                            request.setAttribute("apellidos", rs.getString("apellidos"));
                            request.setAttribute("telefono", rs.getInt("telefono"));
                            request.setAttribute("celular", rs.getInt("celular"));
                            request.setAttribute("direccion", rs.getString("direccion"));
                            request.setAttribute("email", rs.getString("email"));
                            request.setAttribute("curp", rs.getString("curp"));

                        }
                    }

                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/modificarEmpleado.jsp");
                    disp.include(request, response);

                } else if (request.getParameter("boton").equals("Borrar")) {

                    try (PreparedStatement ps = con.prepareStatement("DELETE FROM empleado WHERE id = ?;")) {

                        ps.setInt(1, Integer.parseInt(request.getParameter("id_empleado")));

                        ps.executeUpdate();
                    }

                    try (PreparedStatement ps = con.prepareStatement("SELECT usuario FROM empleado where id=?;")) {
                        ps.setInt(1, Integer.parseInt(request.getParameter("id_empleado")));

                        ps.executeQuery();

                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {

                            try (PreparedStatement ps1 = con.prepareStatement("DELETE FROM usuarios WHERE id = ?;")) {

                                ps1.setInt(1, rs.getInt("usuario"));

                                ps1.executeUpdate();
                            }

                        }
                    }

                    request.setAttribute("res", "Empleado borrado exitosamente");
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/bienvenido.jsp");
                    disp.include(request, response);

                } else {

                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
                    disp.include(request, response);
                }

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(ModificarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }
}
