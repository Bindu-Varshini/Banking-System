<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

<html>
<head>
    <title>Update Customer</title>
    <link rel="stylesheet" type="text/css" href="./css/update_customer.css">

</head>
<body>

<%
    String account_no = request.getParameter("account_no");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "Bindu@59");
    Statement stmt = con.createStatement();
    String query = "SELECT * FROM customer WHERE account_no = " + account_no;
    ResultSet rs = stmt.executeQuery(query);
    if(rs.next()) {
%>

<div style="position: relative; display: flex; justify-content: flex-start;">
    <img src="./img/register.png" style="max-height: 80vh; max-width: 30vw;">
    <div style="
        background-color: white;
        height: 50vh;
        width: 26vw;
        margin-top: 30vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        border-radius: 6px;
        margin-left: 2px; /* Add spacing between image and form */
        padding: 5px; /* Add padding for better spacing */
        
    ">
	</div>
<form action="update_process.jsp" method="post" onsubmit="return validateForm()">

<div>
    <input type="hidden" name="account_no" value="<%= rs.getString("account_no") %>" />
    <label for="fullName">Full Name:</label>
    <input type="text" id="fullName" name="full_name" value="<%= rs.getString("full_name") %>" /><br />

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" value="<%= rs.getString("address") %>" /><br />

    <label for="mobileNo">Mobile No:</label>
    <input type="text" id="mobileNo" name="mobile_no" value="<%= rs.getString("mobile_no") %>" /><br />

    <label for="email">Email ID:</label>
    <input type="text" id="email" name="email" value="<%= rs.getString("email") %>" /><br />

    <label for="accountType">Account Type:</label>
    <input type="text" id="accountType" name="account_type" value="<%= rs.getString("account_type") %>" /><br />

    <label>Date of Birth:</label>
    <input type="text" id="dob" name="dob" value="<%= rs.getString("dob") %>" /><br />
<label for="aadharNo">ID Proof(Aadhaar No):</label>
        <input type="text" id="aadharNo" name="aadharNo" value="<%= rs.getString("id_proof ") %>" /><br />

    <input type="submit" value="Update Customer" />
</form>
<%
    }
    con.close();
%>

<script>
    function validateForm() {
        var fullName = document.getElementById("fullName").value;
        var address = document.getElementById("address").value;
        var mobileNo = document.getElementById("mobileNo").value;
        var email = document.getElementById("email").value;
        var dob = document.getElementById("dob").value;

        // Additional validation for ID Proof radio buttons
        var aadharChecked = document.getElementById("aadhar").checked;
        var panChecked = document.getElementById("pan").checked;
        if (!aadharChecked && !panChecked) {
            alert("Please select an ID Proof option.");
            return false;
        }

        // Basic validation for empty fields
        if (fullName == "" || address == "" || mobileNo == "" || email == "" || dob == "") {
            alert("All fields are required!");
            return false;
        }

        return true;
    }
</script>

<script>
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
</script>

</body>
</html>
