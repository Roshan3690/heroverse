<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeroVerse - Characters</title>
    <link rel="stylesheet" href="css/style.css?v=5">
</head>
<body>

    <jsp:include page="header.jsp" />

    <%
        // Determine whether to show the pure stylish home page or the grid
        String universeParam = request.getParameter("universe");
        
        if (universeParam == null) { 
    %>
    
        <!-- Pure Home Page Landing State -->
        <div class="hero-section">
            <div class="hero-content">
                <h1>Welcome to HeroVerse</h1>
                <p>Your portal to the greatest champions from Marvel and DC Universes.</p>
                <a href="characters.jsp?universe=All" class="explore-btn">Explore Full Roster</a>
            </div>
        </div>

        <div class="container">
            <div class="universe-cards">
                <a href="characters.jsp?universe=Marvel" class="u-card marvel-card">
                    <h2>Marvel</h2>
                    <p>Discover the Avengers, X-Men, and more.</p>
                </a>
                <a href="characters.jsp?universe=DC" class="u-card dc-card">
                    <h2>DC Comics</h2>
                    <p>Explore the Justice League, Gotham, and beyond.</p>
                </a>
            </div>
        </div>

    <% } else { %>
    
        <!-- Character Grid Page State -->
        <div class="container" style="padding-top: 50px;">
            <h1 style="font-size: 3em; color: #fce38a; margin-bottom: 0;">Hero Roster</h1>
            
            <!-- Category Filters -->
            <div class="category-filters">
                <a href="characters.jsp?universe=All" class="filter-btn <%= "All".equals(universeParam) ? "active" : "" %>">All Heroes</a>
                <a href="characters.jsp?universe=Marvel" class="filter-btn <%= "Marvel".equals(universeParam) ? "active" : "" %>">Marvel</a>
                <a href="characters.jsp?universe=DC" class="filter-btn <%= "DC".equals(universeParam) ? "active" : "" %>">DC</a>
            </div>
            
            <div class="character-grid">
                <%
                    // Database Connection Parameters
                    String url = "jdbc:mysql://localhost:3306/heroverse_db";
                    String user = "root";
                    String password = ""; // Empty password as per requirement

                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        // Load Driver
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        // Establish Connection
                        conn = DriverManager.getConnection(url, user, password);
                        
                        String sql;
                        if ("Marvel".equals(universeParam) || "DC".equals(universeParam)) {
                            sql = "SELECT id, name, universe, image_url FROM characters WHERE universe = ?";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, universeParam);
                        } else {
                            sql = "SELECT id, name, universe, image_url FROM characters";
                            pstmt = conn.prepareStatement(sql);
                        }
                        
                        // Execute Query
                        rs = pstmt.executeQuery();
                        
                        // Iterate through results
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String universe = rs.getString("universe");
                            String imageUrl = rs.getString("image_url");
                %>
                
                <!-- Character Card -->
                <a href="details.jsp?id=<%= id %>" class="card">
                    <img src="<%= imageUrl %>" alt="<%= name %>">
                    <div class="card-content">
                        <div class="card-title"><%= name %></div>
                        <div class="card-subtitle"><%= universe %> Universe</div>
                    </div>
                </a>
                
                <%
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
                %>
            </div>
        </div>

    <% } %>

    <jsp:include page="footer.jsp" />

</body>
</html>
