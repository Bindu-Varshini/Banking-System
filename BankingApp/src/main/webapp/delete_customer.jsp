<%@ page import="java.sql.*" %>
<%@ page import="bank.DatabaseConnection" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>
<%
    String account_no = request.getParameter("account_no");
    try {
    	
    	Connection con = DatabaseConnection.getConnection();
    	String deleteTransactionsQuery = "DELETE FROM transaction WHERE account_no = ?";
        PreparedStatement deleteTransactionsStmt = con.prepareStatement(deleteTransactionsQuery);
        deleteTransactionsStmt.setString(1, account_no);
        int rowsDeleted = deleteTransactionsStmt.executeUpdate();
        
        String deleteCustomerQuery = "DELETE FROM customer WHERE account_no = ?";
        PreparedStatement deleteCustomerStmt = con.prepareStatement(deleteCustomerQuery);
        deleteCustomerStmt.setString(1, account_no);
        int result = deleteCustomerStmt.executeUpdate();
    	
        if(result > 0) {
            out.println("Customer with account number " + account_no + " deleted successfully.");
            response.sendRedirect("admin_dashboard.jsp?status=deleteSuccess");
        } 
        else {
            out.println("Error in deleting the customer.");
        }
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
