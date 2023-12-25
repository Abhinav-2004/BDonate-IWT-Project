<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Sign in</title>
    <!-- Add your CSS and other head elements -->
</head>
<body>
<%
    // Database connection details
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "system";
    String dbPassword = "kittusingh";

    // Retrieve user input
    String userEmail = request.getParameter("email");
    String userPassword = request.getParameter("password");

    // JDBC variables
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        Class.forName("oracle.jdbc.driver.OracleDriver");
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Prepare SQL query
        String sql = "SELECT * FROM UserTable WHERE email=? AND password=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, userEmail);
        preparedStatement.setString(2, userPassword);
        
        // Execute query
        rs = preparedStatement.executeQuery();

        // Check if the user exists
        if (rs.next()) {
            // User authenticated, redirect to homepage
            out.print("---");
            session = request.getSession();
            session.setAttribute("userEmail", userEmail);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            // Invalid credentials, handle accordingly (e.g., show an error message)
            out.println("Invalid email or password. Please try again.");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database connections
        try {
            if (rs != null) rs.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
