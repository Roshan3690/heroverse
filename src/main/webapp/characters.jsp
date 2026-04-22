<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HeroVerse - Characters</title>
    <link rel="stylesheet" href="css/style.css?v=9">
</head>
<body>

    <jsp:include page="header.jsp" />

    <%
        // Determine whether to show the pure stylish home page or the grid
        String universeParam = request.getParameter("universe");
        
        if (universeParam == null) { 
    %>
    
        <!-- ═══════════════════════════════════════════════════ -->
        <!-- CINEMATIC HERO — Full-Screen Immersive Landing      -->
        <!-- ═══════════════════════════════════════════════════ -->
        <div class="hero-cinematic" id="heroCinematic">
            
            <!-- Animated particle canvas -->
            <canvas id="particleCanvas"></canvas>
            
            <!-- Background layers -->
            <div class="hero-bg-layer hero-bg-primary" id="heroBgPrimary"></div>
            <div class="hero-bg-layer hero-bg-secondary"></div>
            <div class="hero-scanlines"></div>
            
            <!-- Floating energy orbs -->
            <div class="energy-orb orb-1"></div>
            <div class="energy-orb orb-2"></div>
            <div class="energy-orb orb-3"></div>
            <div class="energy-orb orb-4"></div>
            
            <!-- Rotating ring systems -->
            <div class="ring-system">
                <div class="ring ring-1"></div>
                <div class="ring ring-2"></div>
                <div class="ring ring-3"></div>
            </div>
            
            <!-- Floating hero silhouettes -->
            <div class="hero-silhouettes">
                <div class="silhouette sil-1">
                    <img src="images/downloaded/c1c301_marvel-black-panther.jpg" alt="" />
                </div>
                <div class="silhouette sil-2">
                    <img src="images/downloaded/358a8b_dc-batman-dark-knight.jpg" alt="" />
                </div>
                <div class="silhouette sil-3">
                    <img src="images/downloaded/ebf84a_marvel-ironman-glove.jpg" alt="" />
                </div>
            </div>
            
            <!-- Main hero content -->
            <div class="hero-cin-content">
                
                <!-- Eyebrow tag -->
                <div class="hero-eyebrow" id="heroEyebrow">
                    <span class="eyebrow-dot"></span>
                    <span class="eyebrow-text">THE ULTIMATE CHARACTER DATABASE</span>
                    <span class="eyebrow-dot"></span>
                </div>
                
                <!-- Split-text animated title -->
                <div class="hero-title-wrap" id="heroTitle">
                    <div class="hero-line line-1">
                        <span class="word w1">HERO</span>
                        <span class="word hero-word-red w2">VERSE</span>
                    </div>
                    <div class="hero-line line-2">
                        <span class="word w3">MULTIVERSE</span>
                        <span class="word hero-word-outline w4">ARCHIVE</span>
                    </div>
                </div>
                
                <!-- Animated subtitle -->
                <p class="hero-cin-sub" id="heroCinSub">
                    Marvel. DC. Anime. <em>One Universe to Rule Them All.</em>
                </p>
                
                <!-- CTA buttons -->
                <div class="hero-ctas" id="heroCTAs">
                    <a href="characters.jsp?universe=All" class="cta-primary">
                        <span class="cta-icon">⚡</span>
                        Explore Full Roster
                        <span class="cta-arrow">→</span>
                    </a>
                    <a href="characters.jsp?universe=Marvel" class="cta-secondary">
                        <span>Marvel Universe</span>
                    </a>
                    <a href="characters.jsp?universe=Anime" class="cta-secondary">
                        <span>Anime Universe</span>
                    </a>
                </div>
                
                <!-- Stats bar -->
                <div class="hero-stats" id="heroStats">
                    <div class="stat-item">
                        <span class="stat-num" data-target="60">0</span>
                        <span class="stat-label">Heroes</span>
                    </div>
                    <div class="stat-divider"></div>
                    <div class="stat-item">
                        <span class="stat-num" data-target="3">0</span>
                        <span class="stat-label">Universes</span>
                    </div>
                    <div class="stat-divider"></div>
                    <div class="stat-item">
                        <span class="stat-num" data-target="100">0</span>
                        <span class="stat-label">Power Stats</span>
                    </div>
                </div>
                
            </div>
            
            <!-- Scroll indicator -->
            <div class="scroll-indicator" id="scrollIndicator">
                <span class="scroll-label">Scroll to explore</span>
                <div class="scroll-mouse">
                    <div class="scroll-wheel"></div>
                </div>
            </div>
            
        </div><!-- end .hero-cinematic -->

        <!-- ═══════════════════════════════════════════════════ -->
        <!-- UNIVERSE PORTALS SECTION                            -->
        <!-- ═══════════════════════════════════════════════════ -->
        <div class="portals-section">
            <div class="portals-header">
                <span class="section-tag">⬡ CHOOSE YOUR UNIVERSE</span>
                <h2>Enter a Realm</h2>
            </div>
            <div class="portal-cards">
                <a href="characters.jsp?universe=Marvel" class="portal-card portal-marvel">
                    <div class="portal-glow"></div>
                    <div class="portal-bg"></div>
                    <div class="portal-content">
                        <div class="portal-icon">🦸</div>
                        <h3>Marvel Universe</h3>
                        <p>Avengers, X-Men, Spider-Man & more</p>
                        <span class="portal-cta">Explore →</span>
                    </div>
                    <div class="portal-particles">
                        <span></span><span></span><span></span><span></span><span></span>
                    </div>
                </a>
                <a href="characters.jsp?universe=DC" class="portal-card portal-dc">
                    <div class="portal-glow"></div>
                    <div class="portal-bg"></div>
                    <div class="portal-content">
                        <div class="portal-icon">🦇</div>
                        <h3>DC Universe</h3>
                        <p>Justice League, Gotham, Metropolis</p>
                        <span class="portal-cta">Explore →</span>
                    </div>
                    <div class="portal-particles">
                        <span></span><span></span><span></span><span></span><span></span>
                    </div>
                </a>
                <a href="characters.jsp?universe=Anime" class="portal-card portal-anime">
                    <div class="portal-glow"></div>
                    <div class="portal-bg"></div>
                    <div class="portal-content">
                        <div class="portal-icon">⚡</div>
                        <h3>Anime Universe</h3>
                        <p>Naruto, Goku, Luffy & legendary warriors</p>
                        <span class="portal-cta">Explore →</span>
                    </div>
                    <div class="portal-particles">
                        <span></span><span></span><span></span><span></span><span></span>
                    </div>
                </a>
            </div>
        </div>

        <!-- Hero animation script -->
        <script>
        (function() {
            /* ── Particle Canvas System ── */
            const canvas = document.getElementById('particleCanvas');
            const ctx = canvas.getContext('2d');
            let W, H, particles = [], animFrame;

            function resize() {
                W = canvas.width = window.innerWidth;
                H = canvas.height = window.innerHeight;
            }
            resize();
            window.addEventListener('resize', resize);

            function Particle() {
                this.reset();
            }
            Particle.prototype.reset = function() {
                this.x = Math.random() * W;
                this.y = Math.random() * H;
                this.r = Math.random() * 2 + 0.3;
                this.vx = (Math.random() - 0.5) * 0.6;
                this.vy = (Math.random() - 0.5) * 0.6;
                this.alpha = Math.random() * 0.7 + 0.1;
                this.color = Math.random() > 0.6 ? '#E23636' : Math.random() > 0.5 ? '#ff9d00' : '#fff';
                this.pulse = Math.random() * Math.PI * 2;
                this.pulseSpeed = 0.02 + Math.random() * 0.03;
            };
            Particle.prototype.update = function() {
                this.x += this.vx;
                this.y += this.vy;
                this.pulse += this.pulseSpeed;
                this.alpha = (Math.sin(this.pulse) * 0.3 + 0.5) * 0.8;
                if (this.x < 0 || this.x > W || this.y < 0 || this.y > H) this.reset();
            };

            for (let i = 0; i < 140; i++) particles.push(new Particle());

            /* Draw connecting lines */
            function drawConnections() {
                for (let i = 0; i < particles.length; i++) {
                    for (let j = i + 1; j < particles.length; j++) {
                        const dx = particles[i].x - particles[j].x;
                        const dy = particles[i].y - particles[j].y;
                        const dist = Math.sqrt(dx*dx + dy*dy);
                        if (dist < 120) {
                            ctx.beginPath();
                            ctx.strokeStyle = `rgba(226, 54, 54, ${(1 - dist/120) * 0.15})`;
                            ctx.lineWidth = 0.5;
                            ctx.moveTo(particles[i].x, particles[i].y);
                            ctx.lineTo(particles[j].x, particles[j].y);
                            ctx.stroke();
                        }
                    }
                }
            }

            function loop() {
                ctx.clearRect(0, 0, W, H);
                drawConnections();
                particles.forEach(p => {
                    p.update();
                    ctx.beginPath();
                    ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
                    ctx.fillStyle = p.color;
                    ctx.globalAlpha = p.alpha;
                    ctx.shadowBlur = 6;
                    ctx.shadowColor = p.color;
                    ctx.fill();
                    ctx.globalAlpha = 1;
                    ctx.shadowBlur = 0;
                });
                animFrame = requestAnimationFrame(loop);
            }
            loop();

            /* ── Parallax Mouse Tracking ── */
            const bg = document.getElementById('heroBgPrimary');
            document.addEventListener('mousemove', function(e) {
                const xPct = (e.clientX / window.innerWidth - 0.5) * 20;
                const yPct = (e.clientY / window.innerHeight - 0.5) * 10;
                if (bg) bg.style.transform = `translate(${xPct}px, ${yPct}px) scale(1.12)`;
                /* Move silhouettes in opposite direction */
                const sils = document.querySelectorAll('.silhouette');
                sils.forEach((s, i) => {
                    const factor = (i + 1) * 0.4;
                    s.style.transform += ` translate(${-xPct * factor}px, ${-yPct * factor}px)`;
                });
            });

            /* ── Entrance Animations (staggered) ── */
            function revealEntrance() {
                const eyebrow = document.getElementById('heroEyebrow');
                const title   = document.getElementById('heroTitle');
                const sub     = document.getElementById('heroCinSub');
                const ctas    = document.getElementById('heroCTAs');
                const stats   = document.getElementById('heroStats');
                const scroll  = document.getElementById('scrollIndicator');

                setTimeout(() => eyebrow && eyebrow.classList.add('revealed'), 200);
                setTimeout(() => title   && title.classList.add('revealed'), 600);
                setTimeout(() => sub     && sub.classList.add('revealed'), 1200);
                setTimeout(() => ctas    && ctas.classList.add('revealed'), 1600);
                setTimeout(() => stats   && stats.classList.add('revealed'), 2000);
                setTimeout(() => scroll  && scroll.classList.add('revealed'), 2400);
            }
            window.addEventListener('load', revealEntrance);

            /* ── Counter Animation ── */
            function animateCounters() {
                document.querySelectorAll('.stat-num').forEach(el => {
                    const target = parseInt(el.getAttribute('data-target'));
                    let current = 0;
                    const step = target / 60;
                    const interval = setInterval(() => {
                        current += step;
                        if (current >= target) { current = target; clearInterval(interval); }
                        el.textContent = Math.floor(current) + (target === 100 ? '+' : '');
                    }, 25);
                });
            }
            setTimeout(animateCounters, 2200);

            /* ── Scroll Parallax ── */
            window.addEventListener('scroll', function() {
                const scrollY = window.scrollY;
                const hero = document.getElementById('heroCinematic');
                if (hero && scrollY < window.innerHeight) {
                    const content = hero.querySelector('.hero-cin-content');
                    if (content) content.style.transform = `translateY(${scrollY * 0.3}px)`;
                    if (bg) bg.style.transform = (bg.style.transform || '') + ` translateY(${scrollY * 0.15}px)`;
                }
            });

        })();
        </script>

    <% } else { %>
    
        <!-- Character Grid Page State -->
        <div class="container" style="padding-top: 50px;">
            <h1 style="font-size: 3em; color: #fce38a; margin-bottom: 0;">Hero Roster</h1>
            
            <!-- Category Filters -->
            <div class="category-filters">
                <a href="characters.jsp?universe=All" class="filter-btn <%= "All".equals(universeParam) ? "active" : "" %>">All Heroes</a>
                <a href="characters.jsp?universe=Marvel" class="filter-btn <%= "Marvel".equals(universeParam) ? "active" : "" %>">Marvel</a>
                <a href="characters.jsp?universe=DC" class="filter-btn <%= "DC".equals(universeParam) ? "active" : "" %>">DC</a>
                <a href="characters.jsp?universe=Anime" class="filter-btn <%= "Anime".equals(universeParam) ? "active" : "" %>">Anime</a>
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
                        if ("Marvel".equals(universeParam) || "DC".equals(universeParam) || "Anime".equals(universeParam)) {
                            sql = "SELECT id, name, universe, category, image FROM characters WHERE universe = ?";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, universeParam);
                        } else {
                            sql = "SELECT id, name, universe, category, image FROM characters";
                            pstmt = conn.prepareStatement(sql);
                        }
                        
                        // Execute Query
                        rs = pstmt.executeQuery();
                        
                        // Iterate through results
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String universe = rs.getString("universe");
                            String category = rs.getString("category");
                            String imageUrl = rs.getString("image");
                %>
                
                <!-- Character Card -->
                <a href="details.jsp?id=<%= id %>" class="card">
                    <img src="<%= imageUrl %>" alt="<%= name %>" onerror="this.onerror=null; this.src='images/placeholder.jpg'">
                    <div class="card-content">
                        <div class="card-title"><%= name %></div>
                        <div class="card-subtitle"><%= universe %> Universe | <%= category %></div>
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

    <% } %>

    <jsp:include page="footer.jsp" />

</body>
</html>
