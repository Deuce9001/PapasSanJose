package inventario;

import java.io.IOException;
import java.sql.*;
import java.util.Vector;
import java.util.logging.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MostrarInventario extends HttpServlet {

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

                Vector<Producto> inv = new Vector<Producto>();
                Class.forName("com.mysql.jdbc.Driver");
                int totalBultos = 0;
                int totalKg = 0;

                try (PreparedStatement ps = con.prepareStatement("SELECT bultos, kilogramos, tipo FROM producto;")) {

                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {

                        Producto aux = new Producto();

                        aux.setBultos(rs.getInt("bultos"));
                        aux.setKg(rs.getInt("kilogramos"));
                        aux.setTipo(rs.getString("tipo"));

                        inv.add(aux);
                        totalBultos += rs.getInt("bultos");
                        totalKg += rs.getInt("kilogramos");

                    }

                }

                request.setAttribute("inventario", inv);
                request.setAttribute("tBultos", totalBultos);
                request.setAttribute("tKg", totalKg);
                RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/inventario.jsp");
                if (disp != null) {
                    disp.forward(request, response);
                }

            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(MostrarInventario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }
}
