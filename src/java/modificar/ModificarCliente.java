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

public class ModificarCliente extends HttpServlet {

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

                if (request.getParameter("boton").equals("Modificar Cliente")) {

                    try (PreparedStatement ps = con.prepareStatement("UPDATE cliente SET nombre=?, apellidos=?, empresa=?, telefono=?, celular=?, direccion=?, email=?, rfc=?, marca=? WHERE id = ?;")) {
                        ps.setString(1, request.getParameter("nombre"));
                        ps.setString(2, request.getParameter("apellidos"));
                        ps.setString(3, request.getParameter("empresa"));
                        ps.setInt(4, Integer.parseInt(request.getParameter("telefono")));
                        ps.setInt(5, Integer.parseInt(request.getParameter("celular")));
                        ps.setString(6, request.getParameter("direccion"));
                        ps.setString(7, request.getParameter("email"));
                        ps.setString(8, request.getParameter("rfc"));
                    ps.setString(9, request.getParameter("marca"));
                        ps.setInt(10, Integer.parseInt(request.getParameter("id_cliente")));

                        ps.executeUpdate();

                    }

                    request.setAttribute("res", "Cliente actualizado");
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/bienvenido.jsp");
                    disp.include(request, response);

                } else if (request.getParameter("boton").equals("Borrar")) {

                    try (PreparedStatement ps = con.prepareStatement("DELETE FROM cliente WHERE id = ?;")) {

                        ps.setInt(1, Integer.parseInt(request.getParameter("id_cliente")));

                        ps.executeUpdate();
                    }

                    request.setAttribute("res", "Cliente borrado exitosamente");
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/bienvenido.jsp");
                    disp.include(request, response);

                } else {

                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
                    disp.include(request, response);
                }

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(ModificarCliente.class.getName()).log(Level.SEVERE, null, ex);
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

                try (PreparedStatement ps = con.prepareStatement("SELECT * FROM cliente where id=?;")) {
                    ps.setInt(1, Integer.parseInt(request.getParameter("id_cliente")));

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
                        request.setAttribute("rfc", rs.getString("rfc"));
                        request.setAttribute("marca", rs.getString("marca"));

                    }
                }

                RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/modificarCliente.jsp");
                disp.include(request, response);

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(ModificarCliente.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }

}
