package compra;

import java.io.IOException;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class Registrar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("tipoUsuario") != null && (int) session.getAttribute("tipoUsuario") == 0) {

            String base = getInitParameter("base");
            String usuario_base = getInitParameter("user");
            String pass_base = getInitParameter("pass");
            String url = "jdbc:mysql://localhost:3306/" + base;

            Vector<Compra> datos = new Vector<>();
            int totalCompra = 0;
            int totalKg = 0;
            int id = 0;
            String cliente = null;

            try (Connection con = DriverManager.getConnection(url, usuario_base, pass_base)) {

                Class.forName("com.mysql.jdbc.Driver");

                for (int i = 1; i <= 5; i++) {

                    String[] a = request.getParameterValues("v" + i);

                    if (request.getParameter("b" + i) != null) {
                        Compra aux = new Compra();
                        aux.setProducto(i);
                        aux.setBultos(Integer.parseInt(a[0]));
                        aux.setKg(Integer.parseInt(a[1]));
                        aux.setPu(Integer.parseInt(a[2]));
                        datos.add(aux);
                        totalKg += aux.getKg();
                        totalCompra += aux.precioTotal();
                    }
                }

                try (PreparedStatement ps = con.prepareStatement("INSERT INTO COMPRA (id_cliente, fecha_compra, total_kilogramos, total_compra) VALUES (?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS)) {

                    ps.setInt(1, Integer.parseInt(request.getParameter("id_cliente")));
                    ps.setDate(2, getCurrentDate());
                    ps.setInt(3, totalKg);
                    ps.setInt(4, totalCompra);

                    ps.executeUpdate();
                    ResultSet rs = ps.getGeneratedKeys();
                    if (rs.next()) {
                        id = rs.getInt(1);
                    }

                }

                try (PreparedStatement ps = con.prepareStatement("INSERT INTO DETALLES_COMPRA (id_producto, id_compra, kg_comprados, bultos_comprados) VALUES (?, ?, ?, ?);")) {

                    for (int x = 0; x < datos.size(); x++) {
                        ps.setInt(1, datos.elementAt(x).getProducto());
                        ps.setInt(2, id);
                        ps.setInt(3, datos.elementAt(x).getKg());
                        ps.setInt(4, datos.elementAt(x).getBultos());

                        ps.executeUpdate();
                    }
                }

                try (PreparedStatement ps = con.prepareStatement("UPDATE PRODUCTO SET bultos = bultos - ?, kilogramos = kilogramos - ? WHERE id = ?;")) {

                    for (int x = 0; x < datos.size(); x++) {
                        ps.setInt(1, datos.elementAt(x).getBultos());
                        ps.setInt(2, datos.elementAt(x).getKg());
                        ps.setInt(3, datos.elementAt(x).getProducto());

                        ps.executeUpdate();
                    }
                }

                try (PreparedStatement ps = con.prepareStatement("SELECT id, nombre, apellidos FROM cliente WHERE id = ?;")) {

                    ps.setInt(1, Integer.parseInt(request.getParameter("id_cliente")));

                    ResultSet res = ps.executeQuery();
                    if (res.next()) {
                        cliente = res.getString("nombre") + " " + res.getString("apellidos");
                    }
                }

                RequestDispatcher disp = request.getRequestDispatcher("/empleado/detallesVenta.jsp");
                request.setAttribute("total", totalCompra);
                request.setAttribute("totalKg", totalKg);
                request.setAttribute("cliente", cliente);
                disp.include(request, response);

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(Registrar.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }

    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }
}
