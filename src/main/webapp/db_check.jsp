<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/heroverse_db";
    String user = "root";
    String password = ""; 

    try (Connection conn = DriverManager.getConnection(url, user, password);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM characters")) {
        
        ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();
        out.println("COLUMNS: ");
        for (int i = 1; i <= columnCount; i++) {
            out.print(metaData.getColumnName(i) + " | ");
        }
        out.println("\nROWS:");
        while (rs.next()) {
            for (int i = 1; i <= columnCount; i++) {
                out.print(rs.getString(i) + " || ");
            }
            out.println("<br>");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
