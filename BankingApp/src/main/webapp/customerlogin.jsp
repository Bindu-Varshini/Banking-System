<!DOCTYPE html>
<html>
<head>
    <title>Customer Login</title>
    <link rel="stylesheet" type="text/css" href="./css/customerlogin.css">

    <script>
        function saveAccountNumber() {
            // Get the account number from the input field
            var accountNo = document.getElementById("accountNo").value;
            
            // Check if the account number is not empty
            if (accountNo.trim() !== "") {
                // Save the account number to local storage
                localStorage.setItem("accountNo", accountNo);
            } else {
                // Handle the case when the account number is empty
                alert("Please enter your account number.");
            }
        }
    </script>
</head>
<body>

    <img src="./img/register.png" style="max-height: 80vh; max-width: 50vw; margin-left: 70px;">
    
    <div class="container">
    <h2 style="
            margin-top: 100px;
            font-size: 10px;
            color: #0010f0;
            font-family: Arial,sans-serif;
            font-size: 35px;
        ">Customer Login</h2>
    
    <form action="CustomerLogin" method="post" onsubmit="return saveAccountNumber()" style="">
   
        <label for="accountNo">Account Number:</label>
        <input type="text" id="accountNo" name="accountNo" required=""><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required=""><br>
        
        <input type="submit" value="Login">
    </form>
    </div>    
    
  
    
    
    <script>
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
    </script>
</body>
</html>


