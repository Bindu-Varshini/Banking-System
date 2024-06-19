<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>
    <link rel="stylesheet" type="text/css" href="./css/register.css">
</head>
<body>

<div>
    <form id="registrationForm" method="post" action="customerregistrationservlet" onsubmit="return validateForm()">
        <br>
        <h2>Customer Registration</h2>
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" required>
        
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
        
        <label for="mobileNo">Mobile No:</label>
        <input type="text" id="mobileNo" name="mobileNo" required>
        
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>
        
        <label for="accountType">Account Type:</label>
        <select id="accountType" name="accountType" required>
            <option value="Saving">Saving</option>
            <option value="Current">Current</option>
        </select>
        
        <label for="initialBalance">Initial Balance:</label>
        <input type="number" id="initialBalance" name="initialBalance"  required>
        
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required>
        
        <label for="aadharNo">ID Proof(Aadhaar No):</label>
        <input type="text" id="aadharNo" name="aadharNo" placeholder="Aadhar Number" required>
        
        <input type="submit" value="Register">
    </form>
</div>

<script>
    function validateForm() {
        var fullName = document.getElementById("fullName").value;
        var address = document.getElementById("address").value;
        var mobileNo = document.getElementById("mobileNo").value;
        var email = document.getElementById("email").value;
        var initialBalance = document.getElementById("initialBalance").value;
        var dob = document.getElementById("dob").value;
        var aadharNo = document.getElementById("aadharNo").value;
        
        // Validation for Full Name: Should only contain alphabets and spaces
        var nameRegex = /^[A-Za-z\s]+$/;
        if (!nameRegex.test(fullName)) {
            alert("Please enter a valid full name.");
            return false;
        }

        // Validation for Mobile No: Should contain only digits and be 10 digits long
        var mobileRegex = /^\d{10}$/;
        if (!mobileRegex.test(mobileNo)) {
            alert("Please enter a valid 10-digit mobile number.");
            return false;
        }

        // Validation for Date of Birth: Should not be after the present date
        var currentDate = new Date();
        var dobDate = new Date(dob);
        if (dobDate > currentDate) {
            alert("Please enter a valid date of birth.");
            return false;
        }

        // Validation for Email
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }

        // Validation for Aadhar Number: Should be 12 digits
        var aadharRegex = /^\d{12}$/;
        if (!aadharRegex.test(aadharNo)) {
            alert("Please enter a valid 12-digit Aadhar number.");
            return false;
        }

        // Validation for Initial Balance: Should be a positive number
        if (initialBalance < 1000) {
            alert("Please enter a valid initial balance (minimum balance should be 1000).");
            return false;
        }
     // Basic validation for empty fields
        if (fullName == "" || address == "" || mobileNo == "" || email == "" || initialBalance == "" || dob == "" || aadharNo == "") {
            alert("All fields are required!");
            return false;
        }


        return true;
    }
</script>
</body>
</html>
