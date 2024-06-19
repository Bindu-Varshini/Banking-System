package bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteAccount")
public class DeleteAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String accountNo = request.getSession().getAttribute("accountNo").toString();

        if (accountNo == null || accountNo.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("Account number is required.");
            return;
        }

        HttpSession session = request.getSession(false); // Get the session without creating a new one
        if (session != null) {
            session.invalidate(); // Invalidate the current session
        }

        try {
        	Connection con = DatabaseConnection.getConnection();
            PreparedStatement balanceStmt = con.prepareStatement("SELECT initial_balance FROM customer WHERE account_no = ?");
            balanceStmt.setString(1, accountNo);
            ResultSet balanceResult = balanceStmt.executeQuery();

            if (balanceResult.next()) {
                double balance = balanceResult.getDouble("initial_balance");
                if (balance == 0) {
                	 // First, delete related rows from the transaction table
                    String deleteTransactionsQuery = "DELETE FROM transaction WHERE account_no = ?";
                    PreparedStatement deleteTransactionsStmt = con.prepareStatement(deleteTransactionsQuery);
                    deleteTransactionsStmt.setString(1, accountNo);
                    int rowsDeleted = deleteTransactionsStmt.executeUpdate();
                    
                    // Now, delete the customer
                    String deleteCustomerQuery = "DELETE FROM customer WHERE account_no = ?";
                    PreparedStatement deleteCustomerStmt = con.prepareStatement(deleteCustomerQuery);
                    deleteCustomerStmt.setString(1, accountNo);
                    int result = deleteCustomerStmt.executeUpdate();
                	
                	
                 
                    if (result > 0) {
                        response.setStatus(HttpServletResponse.SC_OK);
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().println("Failed to delete account.");
                    }
                    con.close();
                } else {
                    response.setStatus(HttpServletResponse.SC_CONFLICT);
                    response.getWriter().println("Cannot delete account. Account balance is not zero.");
                }
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().println("Account not found.");
            }
        } catch (SQLException e) {
            // Log the exception for debugging purposes
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("Error occurred while processing the request.");
        }
    }
}
