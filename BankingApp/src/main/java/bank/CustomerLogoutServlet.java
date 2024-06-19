package bank;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CustomerLogoutServlet")
public class CustomerLogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the session
        HttpSession session = request.getSession(false); // Do not create a new session if it doesn't exist
        if (session != null) {
            // Set the session attribute to null
            session.setAttribute("accountNo", null); // Assuming "accountNo" is the session attribute holding the account number
        }
        
        // Redirect back to the customer login page
        response.sendRedirect("index.jsp");
    }
}
