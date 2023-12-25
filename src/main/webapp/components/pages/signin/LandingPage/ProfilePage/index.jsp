<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile</title>
    <link rel="stylesheet" href="./index.css" />
    <link rel="stylesheet" href="../../../../../index.css" />
    <link rel="icon" href="../../../../assets/images/drops.png" />
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
    <nav>
      <div>
        <a href="">
          <img
            src="../../../../assets/images/logo.png"
            class="nav-img"
            alt="Error"
          />
        </a>
      </div>
      <div class="nav_container">
        <div class="borderCSS">
          <a href="../../../../../index.jsp#nav">HOME</a>
          <a href="../../../../../index.jsp#division-2">ARTICLES</a>
          <a href="../../../../../index.jsp#division-3">SUMMARY</a>
          <a href="../../../../../index.jsp#division-4">TEAM</a>
          <a href="../../../../../index.jsp#division-5">ABOUT</a>
        </div>
      </div>
      <div class="tools">
        <a href="../../../Donation_Form/index.jsp" id="Donate_now"
          ><button>DONATE NOW</button></a
        >
        <a href="../index.jsp" id="login"><button>USER DETAILS</button></a>
        <a href="../../../Signout.jsp" id="sign-out"
          ><button>SIGN OUT</button></a
        >
      </div>
    </nav>
    <div class="main">
      <div class="content">
        <div class="heading"><span>Profile</span></div>
      </div>
      <div class="underline"></div>
      <div id="donationdiv">
      	<%
    	Connection connection = null;
    	Statement statement = null;
    	ResultSet resultSet = null;
    try {
        // Establish the database connection (Assuming you have a DataSource named "jdbc/yourDataSource")
       	Class.forName("oracle.jdbc.driver.OracleDriver");
        connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","kittusingh");

        // Execute SQL query
        String email = session.getAttribute("userEmail").toString();
        // out.println(email);
        PreparedStatement sm = connection.prepareStatement("SELECT * FROM donationform where email = ?");
        sm.setString(1,email);
        resultSet = sm.executeQuery();
%>
    <table border="1">
        <tr>
	        <th>Name</th>
	        <th>Date of Birth</th>
	        <th>Blood Type</th>
	        <th>Email</th>
	        <th>Phone Number</th>
	        <th colspan=2>Address</th>
	        <th>City</th>
	        <th>State</th>
	        <th>Country</th>
	        <th>Gender</th>
	        <th>Donated Before</th>
	        <th>Suffered Disease</th>
    </tr>
        </tr>
<%
        while (resultSet.next()) {
%>
        <tr>
    		<td><%= resultSet.getString("Name") %></td>
		    <td><%= resultSet.getDate("DateOfBirth") %></td>
		    <td><%= resultSet.getString("BloodType") %></td>
		    <td><%= resultSet.getString("Email") %></td>
		    <td><%= resultSet.getString("PhoneNumber") %></td>
		    <td><%= resultSet.getString("Address1") %></td>
		    <td><%= resultSet.getString("Address2") %></td>
		    <td><%= resultSet.getString("City") %></td>
		    <td><%= resultSet.getString("State") %></td>
		    <td><%= resultSet.getString("Country") %></td>
		    <td><%= resultSet.getString("Gender") %></td>
		    <td><%= resultSet.getString("DonatedBefore") %></td>
		    <td><%= resultSet.getString("SufferedDisease") %></td>
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
