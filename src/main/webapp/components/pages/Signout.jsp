<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    try {
        // Get the session, if it exists
        session = request.getSession(true);
		
        if (session != null) {
            // Invalidate the session
            session.setAttribute("userEmail", null);
            session.invalidate();
        }

        // Redirect to the home page
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        // Handle exceptions or log them as needed
        // You may redirect to an error page if necessary
    }
%>
