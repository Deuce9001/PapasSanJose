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

public class ModificarProveedor extends HttpServlet {

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

                if (request.getParameter("boton").equals("Modificar Proveedor")) {

                    try (PreparedStatement ps = con.prepareStatement("UPDATE proveedor SET nombre=?, apellidos=?, empresa=?, telefono=?, celular=?, direccion=?, email=? WHERE id = ?;")) {
                        ps.setString(1, request.getParameter("nombre"));
                        ps.setString(2, request.getParameter("apellidos"));
                        ps.setString(3, request.getParameter("empresa"));
                        ps.setInt(4, Integer.parseInt(request.getParameter("telefono")));
                        ps.setInt(5, Integer.parseInt(request.getParameter("celular")));
                        ps.setString(6, request.getParameter("direccion"));
                        ps.setString(7, request.getParameter("email"));
                        ps.setInt(8, Integer.parseInt(request.getParameter("id_cliente")));

                        ps.executeUpdate();
                    }

                    request.setAttribute("res", "Proveedor actualizado");
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/bienvenido.jsp");
                    disp.include(request, response);

                } else if (request.getParameter("boton").equals("Borrar")) {

                    try (PreparedStatement ps = con.prepareStatement("DELETE FROM proveedor WHERE id = ?;")) {

                        ps.setInt(1, Integer.parseInt(request.getParameter("id_proveedor")));

                        ps.executeUpdate();
                    }

                    request.setAttribute("res", "Proveedor borrado exitosamente");
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/bienvenido.jsp");
                    disp.include(request, response);

                } else {

                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
                    disp.include(request, response);
                }

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(ModificarProveedor.class.getName()).log(Level.SEVERE, null, ex);
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

                try (PreparedStatement ps = con.prepareStatement("SELECT * FROM proveedor where id=?;")) {
                    ps.setInt(1, Integer.parseInt(request.getParameter("id_proveedor")));

                    ps.executeQuery();

                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {

                        request.setAttribute("id", rs.getInt("id"));
                        request.setAttribute("nombre", rs.getString("nombre"));
                        request.setAttribute("apellidos", rs.getString("apellidos"));
                        request.setAttribute("empresa", rs.getString("empresa"));
                        request.setAttribute("telefono", rs.getInt("telefono"));
                        request.setAttribute("celular", rs.getInt("celular"));
                        request.setAttribute("direccion", rs.getString("direccion"));
                        request.setAttribute("email", rs.getString("email"));

                    }
                }

                RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/modificarProveedor.jsp");
                disp.include(request, response);

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(ModificarProveedor.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }
}
