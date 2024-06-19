<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="./css/AdminLogin.css">

</head>
<body>

    <div style="position: relative; display: flex; justify-content: flex-start;">
    <img src="./img/admin.jpg" style="max-height: 80vh; max-width: 60vw; margin-top: 50px;">
    <div style="
        background-color: white;
        height: 58vh;
        width: 26vw;
        margin-top: 20vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        border-radius: 6px;
        margin-left: 20px; /* Add spacing between image and form */
        padding: 20px; /* Add padding for better spacing */
    ">
        <h2 style="
            margin-top: 0;
            font-size: 38px;
            color: #0010f0;
            font-family: Arial,sans-serif;
            font-size: 42px;
        ">Admin Login</h2>
        <form action="AdminOperations.jsp" method="post">
            <label for="adminUsername">Username:</label>
            <input type="text" id="adminUsername" name="adminUsername" required=""><br>
            <label for="adminPassword">Password:</label>
            <input type="password" id="adminPassword" name="adminPassword" required=""><br>
            <input type="submit" value="Login">
        </form>
    </div>
</div>
    

    <script>
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
    </script>
</body>
</html>
