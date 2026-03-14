<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeroVerse - Contact</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="container contact-container">
        <h1>Contact Us</h1>
        <div class="card contact-card">
            <div class="card-content">
                <form action="#" method="post">
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
                    <button type="submit" class="back-btn" style="border:none; cursor:pointer;">Send Message</button>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>
</html>
