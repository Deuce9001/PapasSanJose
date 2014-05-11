
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Error extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("tipoUsuario") != null) {

            request.setAttribute("res", "Ha ocurrido un error");
            if ((int) session.getAttribute("tipoUsuario") == 0) {
                RequestDispatcher disp = getServletContext().getRequestDispatcher("/empleado/bienvenido.jsp");
                disp.include(request, response);
            } else {
                RequestDispatcher disp = getServletContext().getRequestDispatcher("/gerente/bienvenido.jsp");
                disp.include(request, response);
            }

        } else {
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/index.jsp");
            disp.include(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
