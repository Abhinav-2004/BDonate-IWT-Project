<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome</title>
    <link rel="stylesheet" href="./index.css" />
    <link rel="stylesheet" href="../../../../index.css" />
    <link rel="icon" href="../../../assets/images/drops.png" />
    <style>
    	table {
		    width: 100%;
		    border-collapse: collapse;
		    margin-top: 20px;
		}
		
		th, td {
		    border: 1px solid #ddd;
		    padding: 8px;
		    text-align: left;
		}
		
		th {
		    background-color: #f2f2f2;
		}
		
		tr:hover {
		    background-color: #f5f5f5;
		}
    </style>
  </head>
  <body>
    <nav id="nav">
      <div>
        <a href="">
          <img
            src="../../../assets/images/logo.png"
            class="nav-img"
            alt="Error"
          />
        </a>
      </div>
      <div class="nav_container">
        <div class="borderCSS">
          <a href="../../../../index.jsp#nav" id="home">HOME</a>
          <a href="../../../../index.jsp#division-2" id="articles">ARTICLES</a>
          <a href="../../../../index.jsp#division-3" id="portfolio">SUMMARY</a>
          <a href="../../../../index.jsp#division-4" id="about">TEAM</a>
          <a href="../../../../index.jsp#division-5" id="contact">ABOUT</a>
        </div>
      </div>
      
      <%
      	session = request.getSession();
      	boolean isValid = false;
      	if(session != null && session.getAttribute("userEmail") != null) {
      		isValid = true;
      %>
      <div class="tools">
        	<a href="../../Donation_Form/index.jsp" id="Donate_now"
          ><button>DONATE NOW</button></a
        	>
        	<a href="../../Signout.jsp" id="sign-out"
          	><button>SIGN OUT</button></a
        	>
      	</div>
      <% } else { %>
      	<div class="tools">
        	<a onclick="redirectToDonationForm()" id="Donate_now" ><button id="donate">DONATE NOW</button></a>
        	<a href="components/pages/signin/index.jsp" id="login"><button>LOGIN</button></a>
        	<a href="components/pages/signup/index.jsp" id="signup"><button>SIGNUP</button></a>
      	</div>
      <% } %>
      
    </nav>
    <div class="main">
      <div class="user">
        <span class="title">User Details</span>
      </div>
      <div class="details" id="table"></div>
      <%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","kittusingh");
        // Execute SQL query
        String sql = "SELECT * FROM UserTable";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(sql);
%>
    <table border="1">
        <tr>
            <th>Email</th>
            <th>Password</th>
            <th>Name</th>
            <th>Blood Group</th>
            <th>Address</th>
        </tr>
<%
        // Iterate through the result set and display data
        while (resultSet.next()) {
%>
        <tr>
            <td><%= resultSet.getString("email") %></td>
            <td><%= resultSet.getString("password") %></td>
            <td><%= resultSet.getString("name") %></td>
            <td><%= resultSet.getString("BloodGroup") %></td>
            <td><%= resultSet.getString("Address") %></td>
        </tr>
<%
        }
%>
    </table>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>   
    </div>
  </body>
  <script src="index.js"></script>
</html>
