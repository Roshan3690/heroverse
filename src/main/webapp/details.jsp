<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeroVerse - Character Details</title>
    <link rel="stylesheet" href="css/style.css?v=5">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="container">
        
        <%
            // Database Connection Parameters
            String url = "jdbc:mysql://localhost:3306/heroverse_db";
            String user = "root";
            String password = "";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String idStr = request.getParameter("id");
            
            if (idStr == null || idStr.isEmpty()) {
                out.println("<p style='text-align:center;'>Character ID not provided.</p>");
                out.println("<div style='text-align:center;'><a href='characters.jsp' class='back-btn'>Back to Home</a></div>");
            } else {
                try {
                    int id = Integer.parseInt(idStr);

                    // Load Driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    // Establish Connection
                    conn = DriverManager.getConnection(url, user, password);
                    
                    // Create PreparedStatement
                    String sql = "SELECT * FROM characters WHERE id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, id);
                    
                    // Execute Query
                    rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        String name = rs.getString("name");
                        String universe = rs.getString("universe");
                        String realName = rs.getString("real_name");
                        int totalMovies = rs.getInt("total_movies");
                        String description = rs.getString("description");
                        String imageUrl = rs.getString("image_url");
        %>
        
        <div class="details-container">
            <div class="details-image">
                <img src="<%= imageUrl %>" alt="<%= name %>">
            </div>
            <div class="details-info">
                <h2><%= name %></h2>
                <div class="info-item">
                    <span class="info-label">Universe:</span> <%= universe %>
                </div>
                <div class="info-item">
                    <span class="info-label">Real Name:</span> <%= realName %>
                </div>
                <div class="info-item">
                    <span class="info-label">Total Movies:</span> <%= totalMovies %>
                </div>
                <div class="description">
                    <%= description %>
                </div>
                
                <a href="characters.jsp" class="back-btn">Back to Characters</a>
            </div>
        </div>

        <%
                    } else {
                        out.println("<p style='text-align:center;'>Character not found.</p>");
                        out.println("<div style='text-align:center;'><a href='characters.jsp' class='back-btn'>Back to Home</a></div>");
                    }

                } catch (Exception e) {
                    out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                } finally {
                    // Close resources
                    if (rs != null) try { rs.close(); } catch (SQLException e) { }
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { }
                }
            }
        %>
        
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
