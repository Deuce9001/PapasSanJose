package entrega;

import java.io.IOException;

import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegistrarEntrega extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("tipoUsuario") != null && (int) session.getAttribute("tipoUsuario") == 0) {

            String base = getInitParameter("base");
            String usuario_base = getInitParameter("user");
            String pass_base = getInitParameter("pass");
            String url = "jdbc:mysql://localhost:3306/" + base;

            Vector<Entrega> datos = new Vector<>();

            try (Connection con = DriverManager.getConnection(url, usuario_base, pass_base)) {

                Class.forName("com.mysql.jdbc.Driver");

                String idCamion = request.getParameter("id_camion");
                String fSalida = request.getParameter("anoSalida") + request.getParameter("mesSalida") + request.getParameter("diaSalida");
                String fLlegada = request.getParameter("anoLlegada") + request.getParameter("mesLlegada") + request.getParameter("diaLlegada");
                int merma = Integer.parseInt(request.getParameter("merma"));
                int costo = Integer.parseInt(request.getParameter("costo"));

                for (int i = 1; i <= 5; i++) {

                    String[] a = request.getParameterValues("v" + i);

                    if (request.getParameter("b" + i) != null) {
                        Entrega aux = new Entrega();
                        aux.setProducto(i);
                        aux.setBultos(Integer.parseInt(a[0]));
                        aux.setKg(Integer.parseInt(a[1]));
                        datos.add(aux);
                    }
                }

                try (PreparedStatement ps = con.prepareStatement("INSERT INTO CAMION (id, nombre_chofer) VALUES (?, ?);")) {

                    ps.setString(1, idCamion);
                    ps.setString(2, request.getParameter("nChofer"));

                    ps.executeUpdate();

                }

                try (PreparedStatement ps = con.prepareStatement("INSERT INTO PROVEEDOR_CAMION (id_proveedor, id_camion) VALUES (?, ?);")) {

                    ps.setInt(1, Integer.parseInt(request.getParameter("id_proveedor")));
                    ps.setString(2, idCamion);

                    ps.executeUpdate();

                }

                try (PreparedStatement ps = con.prepareStatement("INSERT INTO ENTREGA (id_camion, id_producto, fecha_salida, fecha_llegada, bultos, kilogramos, merma, costo) VALUES (?, ?, ?, ?, ?, ?, ?, ?);")) {

                    for (int x = 0; x < datos.size(); x++) {
                        ps.setString(1, idCamion);
                        ps.setInt(2, datos.elementAt(x).getProducto());
                        ps.setString(3, fSalida);
                        ps.setString(4, fLlegada);
                        ps.setInt(5, datos.elementAt(x).getBultos());
                        ps.setInt(6, datos.elementAt(x).getKg());
                        ps.setInt(7, merma);
                        ps.setInt(8, costo);

                        ps.executeUpdate();
                    }

                }

                try (PreparedStatement ps = con.prepareStatement("UPDATE PRODUCTO SET bultos = bultos + ?, kilogramos = kilogramos + ? WHERE id = ?;")) {

                    for (int x = 0; x < datos.size(); x++) {
                        ps.setInt(1, datos.elementAt(x).getBultos());
                        ps.setInt(2, datos.elementAt(x).getKg());
                        ps.setInt(3, datos.elementAt(x).getProducto());

                        ps.executeUpdate();
                    }
                }

                request.setAttribute("res", "Base de Datos Actualizada");
                RequestDispatcher disp = request.getRequestDispatcher("/empleado/bienvenido.jsp");
                disp.include(request, response);

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(RegistrarEntrega.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
