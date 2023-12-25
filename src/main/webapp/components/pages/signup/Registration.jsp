<%@ page import="java.sql.*,java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>

<%
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    String jdbcUsername = "system";
    String jdbcPassword = "kittusingh";

    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String bloodGroup = request.getParameter("blood_selector");
    String rh = request.getParameter("rh-selector");
    String address = request.getParameter("address");

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

        String sql = "INSERT INTO UserTable (email, password, name, BloodGroup, Address) VALUES (?, ?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, email);
        preparedStatement.setString(2, password);
        preparedStatement.setString(3, name);
        preparedStatement.setString(4, bloodGroup + rh);
        preparedStatement.setString(5, address);

        preparedStatement.executeUpdate();
%>
    <p>User registered successfully!</p>
<%
        // Redirect to the signin page
        response.sendRedirect(request.getContextPath() + "/components/pages/signin/index.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            out.println("Error closing database resources: " + e.getMessage());
        }
    }
%>


