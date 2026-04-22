<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeroVerse - Contact</title>
    <link rel="stylesheet" href="css/style.css?v=7">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="container contact-container">
        <h1>Contact Us</h1>
        <div class="card contact-card">
            <div class="card-content">
                
                <%
                    // Handle Form Submission and Insert Operation
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String message = request.getParameter("message");
                    String formStatus = "";

                    if (request.getMethod().equalsIgnoreCase("POST") && name != null && email != null && message != null) {
                        String url = "jdbc:mysql://localhost:3306/heroverse_db";
                        String dbUser = "root";
                        String dbPassword = "";

                        Connection conn = null;
                        Statement stmt = null;
                        PreparedStatement pstmt = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection(url, dbUser, dbPassword);
                            
                            // 1. Ensure the 'contacts' table exists
                            stmt = conn.createStatement();
                            String createTableSQL = "CREATE TABLE IF NOT EXISTS contacts (" +
                                                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                                                    "name VARCHAR(100) NOT NULL, " +
                                                    "email VARCHAR(100) NOT NULL, " +
                                                    "message TEXT NOT NULL, " +
                                                    "submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP" +
                                                    ")";
                            stmt.execute(createTableSQL);

                            // 2. Perform the INSERT Operation
                            String insertSQL = "INSERT INTO contacts (name, email, message) VALUES (?, ?, ?)";
                            pstmt = conn.prepareStatement(insertSQL);
                            pstmt.setString(1, name);
                            pstmt.setString(2, email);
                            pstmt.setString(3, message);
                            
                            int rowsInserted = pstmt.executeUpdate();
                            if (rowsInserted > 0) {
                                formStatus = "<p style='color: #4CAF50; font-weight: bold; text-align: center; margin-bottom: 15px;'>Thank you! Your message has been inserted into the database.</p>";
                            }

                        } catch (Exception e) {
                            formStatus = "<p style='color: red; text-align: center;'>Error inserting data: " + e.getMessage() + "</p>";
                            e.printStackTrace();
                        } finally {
                            if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
                            if (stmt != null) try { stmt.close(); } catch(SQLException e) {}
                            if (conn != null) try { conn.close(); } catch(SQLException e) {}
                        }
                    }
                %>

                <%= formStatus %>

                <form action="contact.jsp" method="post">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" required placeholder="Your Name">
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required placeholder="Your Email">
                    </div>
                    <div class="form-group">
                        <label for="message">Message:</label>
                        <textarea id="message" name="message" rows="5" required placeholder="Your Message"></textarea>
                    </div>
                    <button type="submit" class="back-btn" style="border:none; cursor:pointer; width: 100%;">Send Message</button>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
