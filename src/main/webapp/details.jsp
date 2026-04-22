<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeroVerse - Character Details</title>
    <link rel="stylesheet" href="css/style.css?v=7">
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
            PreparedStatement pstmtPower = null;
            ResultSet rs = null;
            ResultSet rsPower = null;

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
                    
                    // Main character query with team join
                    String sql = "SELECT c.*, t.name AS team_name FROM characters c " +
                                 "LEFT JOIN character_teams ct ON c.id = ct.character_id " +
                                 "LEFT JOIN teams t ON ct.team_id = t.id " +
                                 "WHERE c.id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, id);
                    rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        String name = rs.getString("name");
                        String realName = rs.getString("real_name");
                        String universe = rs.getString("universe");
                        String category = rs.getString("category");
                        String origin = rs.getString("origin");
                        String birthYear = rs.getString("birth_year");
                        String gender = rs.getString("gender");
                        String status = rs.getString("status");
                        String fullDescription = rs.getString("full_description");
                        String imageUrl = rs.getString("image");
                        String teamName = rs.getString("team_name");
                        
                        if (teamName == null) teamName = "None";
                        
                        // Fetch powers
                        List<String> powers = new ArrayList<>();
                        String powerSql = "SELECT power FROM powers WHERE character_id = ?";
                        pstmtPower = conn.prepareStatement(powerSql);
                        pstmtPower.setInt(1, id);
                        rsPower = pstmtPower.executeQuery();
                        while (rsPower.next()) {
                            powers.add(rsPower.getString("power"));
                        }
        %>
        
        <div class="details-container">
            <div class="details-image">
                <img src="<%= imageUrl %>" alt="<%= name %>" onerror="this.onerror=null; this.src='images/placeholder.jpg'">
            </div>
            <div class="details-info">
                <h2><%= name %></h2>
                <div class="info-item">
                    <span class="info-label">Universe:</span> <%= universe %> | <%= category %>
                </div>
                <div class="info-item">
                    <span class="info-label">Real Name:</span> <%= realName %>
                </div>
                <div class="info-item">
                    <span class="info-label">Team:</span> <%= teamName %>
                </div>
                <div class="info-item">
                    <span class="info-label">Origin:</span> <%= origin %> (<%= status %>)
                </div>
                
                <% if (!powers.isEmpty()) { %>
                <div class="info-item" style="flex-wrap: wrap;">
                    <span class="info-label">Powers:</span> 
                    <span style="color: var(--primary); font-weight: 700;">
                        <%= String.join(" &bull; ", powers) %>
                    </span>
                </div>
                <% } %>
                
                <div class="description">
                    <%= fullDescription %>
                </div>
                
                <br>
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
                    if (rsPower != null) try { rsPower.close(); } catch (SQLException e) { }
                    if (pstmtPower != null) try { pstmtPower.close(); } catch (SQLException e) { }
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
