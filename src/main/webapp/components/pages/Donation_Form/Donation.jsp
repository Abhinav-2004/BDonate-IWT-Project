<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Processing Donation Form</title>
</head>
<body>
    <% 
        // JDBC Connection parameters
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String username = "system";
        String password = "kittusingh";
        
        // Form data
        String name = request.getParameter("name");
        String dob = request.getParameter("datepicker");
        String bloodType = request.getParameter("bloodtype");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String gender = request.getParameter("gender");
        String donatedBefore = request.getParameter("y/n");
        String sufferedDisease = request.getParameter("y/n1");

        try {
            // Database Connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(url, username, password);

            // Insert data into donationform table
            String query = "INSERT INTO donationform (Name, DateOfBirth, BloodType, Email, PhoneNumber, Address1, Address2, City, State, Country, Gender, DonatedBefore, SufferedDisease) " +
                           "VALUES (?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, dob);
            preparedStatement.setString(3, bloodType);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, phoneNumber);
            preparedStatement.setString(6, address1);
            preparedStatement.setString(7, address2);
            preparedStatement.setString(8, city);
            preparedStatement.setString(9, state);
            preparedStatement.setString(10, country);
            preparedStatement.setString(11, gender);
            preparedStatement.setString(12, donatedBefore);
            preparedStatement.setString(13, sufferedDisease);

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the insertion was successful
            if (rowsAffected > 0) {
                response.sendRedirect("../signin/LandingPage/ProfilePage/index.jsp");
            } else {
                out.println("<h2>Error inserting data</h2>");
            }

            // Close resources
            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    %>
</body>
</html>
