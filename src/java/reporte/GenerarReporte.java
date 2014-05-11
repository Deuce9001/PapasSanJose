package reporte;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class GenerarReporte extends HttpServlet {

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

                String fIni = request.getParameter("anoIni") + request.getParameter("mesIni") + request.getParameter("diaIni");
                String fFin = request.getParameter("anoFin") + request.getParameter("mesFin") + request.getParameter("diaFin");

                String tiempo = getTiempo(fIni, fFin, request.getParameter("fecha"));
                String tiempo2 = getTiempo2(fIni, fFin, request.getParameter("fecha"));
                int total = 0;
                Producto[] p = new Producto[5];

                try (PreparedStatement ps = con.prepareStatement("SELECT id, tipo FROM producto;")) {

                    ResultSet rs = ps.executeQuery();
                    int x;
                    while (rs.next()) {

                        x = rs.getInt("id") - 1;
                        p[x] = new Producto();
                        p[x].setId(rs.getInt("id"));
                        p[x].setTipo(rs.getString("tipo"));

                    }
                }

                try (PreparedStatement ps = con.prepareStatement("SELECT id_producto, sum(kilogramos) as kg, sum(costo) as Costo_Total, sum(merma) as Total_Merma\n"
                        + "FROM entrega\n"
                        + tiempo
                        + "GROUP BY id_producto;")) {

                    ResultSet rs = ps.executeQuery();
                    int x = 0;
                    while (rs.next()) {
                        System.out.println(rs.getInt("id_producto"));

                        x = rs.getInt("id_producto") - 1;
                        p[x] = new Producto();
                        p[x].setId(rs.getInt("id_producto"));
                        p[x].setKgEntregados(rs.getInt("kg"));
                        p[x].setMerma(rs.getInt("Total_Merma"));

                    }
                }

                try (PreparedStatement ps = con.prepareStatement("SELECT id_producto, sum(kg_comprados) as kg, sum(total_compra) as Costo_Total\n"
                        + "FROM detalles_compra as dc\n"
                        + "LEFT JOIN compra ON compra.id = dc.id_compra\n"
                        + tiempo2
                        + "GROUP BY id_producto;")) {
                    
                    ResultSet rs = ps.executeQuery();

                    int x = 0;

                    while (rs.next()) {

                        x = rs.getInt("id_producto") - 1;
                        p[x].setKgVendidos(rs.getInt("kg"));
                        p[x].setTotalVentas(rs.getInt("Costo_Total"));
                        total += rs.getInt("Costo_Total");

                    }
                }

                request.setAttribute("inf", p);
                request.setAttribute("tot", total);
                RequestDispatcher disp = request.getRequestDispatcher("/gerente/reporte.jsp");
                disp.include(request, response);

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(GenerarReporte.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }

    private String getTiempo(String fIni, String fFin, String caso) {

        switch (caso) {

            case "Generar Reporte":
                return "WHERE fecha_llegada between '" + fIni + "' and '" + fFin + "'\n";

            case "Dia":
                return "WHERE fecha_llegada = CURDATE()\n";

            case "Mes":
                return "Where fecha_llegada between DATE_FORMAT(NOW() ,'%Y-%m-01') AND NOW()\n";

        }
        return "WHERE fecha_llegada between '" + fIni + "' and '" + fFin + "'\n";
    }
    
    private String getTiempo2(String fIni, String fFin, String caso) {

        switch (caso) {

            case "Generar Reporte":
                return "WHERE fecha_compra between '" + fIni + "' and '" + fFin + "'\n";

            case "Dia":
                return "WHERE fecha_compra = CURDATE()\n";

            case "Mes":
                return "Where fecha_compra between DATE_FORMAT(NOW() ,'%Y-%m-01') AND NOW()\n";

        }
        return "WHERE fecha_compra between '" + fIni + "' and '" + fFin + "'\n";
    }
}
