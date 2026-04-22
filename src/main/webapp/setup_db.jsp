<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Database Setup</title>
    <style>body { background: #131313; color: #fff; font-family: sans-serif; padding: 40px; }</style>
</head>
<body>
    <h2>Running Database Setup...</h2>
    <%
        String url = "jdbc:mysql://localhost:3306/heroverse_db";
        String user = "root";
        String password = "";
        
        Connection conn = null;
        Statement stmt = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            
            // DROP EXISTING TABLES
            stmt.executeUpdate("DROP TABLE IF EXISTS powers");
            stmt.executeUpdate("DROP TABLE IF EXISTS character_teams");
            stmt.executeUpdate("DROP TABLE IF EXISTS characters");
            stmt.executeUpdate("DROP TABLE IF EXISTS teams");
            out.println("<p>Dropped old tables.</p>");
            
            // CREATE TEAMS
            stmt.executeUpdate("CREATE TABLE teams (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), universe VARCHAR(50))");
            out.println("<p>Created teams table.</p>");
            
            // CREATE CHARACTERS
            stmt.executeUpdate("CREATE TABLE characters (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), real_name VARCHAR(100), universe VARCHAR(50), category VARCHAR(50), origin VARCHAR(100), birth_year VARCHAR(50), gender VARCHAR(20), status VARCHAR(50), short_description TEXT, full_description TEXT, image VARCHAR(255))");
            out.println("<p>Created characters table.</p>");
            
            // CREATE POWERS
            stmt.executeUpdate("CREATE TABLE powers (id INT AUTO_INCREMENT PRIMARY KEY, character_id INT, power TEXT, FOREIGN KEY (character_id) REFERENCES characters(id) ON DELETE CASCADE)");
            out.println("<p>Created powers table.</p>");
            
            // CREATE CHARACTER_TEAMS
            stmt.executeUpdate("CREATE TABLE character_teams (id INT AUTO_INCREMENT PRIMARY KEY, character_id INT, team_id INT, FOREIGN KEY (character_id) REFERENCES characters(id), FOREIGN KEY (team_id) REFERENCES teams(id))");
            out.println("<p>Created character_teams table.</p>");
            
            // INSERT TEAMS
            stmt.executeUpdate("INSERT INTO teams (name, universe) VALUES " +
                "('Avengers', 'Marvel'), ('Justice League', 'DC'), ('Akatsuki', 'Anime'), " +
                "('Straw Hat Pirates', 'Anime'), ('Z Fighters', 'Anime'), ('Demon Slayer Corps', 'Anime'), " +
                "('X-Men', 'Marvel'), ('Survey Corps', 'Anime'), ('Konoha Shinobi', 'Anime')");
            out.println("<p>Inserted teams.</p>");
            
            // INSERT CHARACTERS (60 Total)
            String insertChars = "INSERT INTO characters (name, real_name, universe, category, origin, birth_year, gender, status, short_description, full_description, image) VALUES " +
                // ORIGINAL 1-18
                "('Thor','Thor Odinson','Marvel','Hero','Asgard','Unknown','Male','Alive','God of Thunder','Thor is the Norse god of thunder and a powerful Avenger who protects both Asgard and Earth.','images/marvel/marvel_thor_wakanda.jpg'), " +
                "('Hulk','Bruce Banner','Marvel','Hero','Earth','1969','Male','Alive','Green rage monster','Bruce Banner transforms into Hulk when angry, gaining immense strength.','images/placeholder.jpg'), " +
                "('Black Widow','Natasha Romanoff','Marvel','Hero','Russia','1984','Female','Deceased','Elite spy','Highly trained assassin and Avenger known for espionage skills.','images/marvel/marvel-black-widow.jpeg'), " +
                "('Thanos','Thanos','Marvel','Villain','Titan','Unknown','Male','Deceased','Mad Titan','Thanos seeks balance by eliminating half the universe using Infinity Stones.','images/marvel/marvel-thanos-mad-titan-wallpaper.jpg'), " +
                "('Loki','Loki Laufeyson','Marvel','Villain','Asgard','Unknown','Male','Alive','God of Mischief','Loki is Thor’s brother known for trickery and magic.','images/marvel/marvel-loki-throne.jpg'), " +
                "('Flash','Barry Allen','DC','Hero','Central City','1990','Male','Alive','Fastest man alive','Barry Allen gained super speed and became Flash.','images/placeholder.jpg'), " +
                "('Wonder Woman','Diana Prince','DC','Hero','Themyscira','Unknown','Female','Alive','Amazon warrior','Diana is a powerful Amazon princess and warrior.','images/placeholder.jpg'), " +
                "('Joker','Unknown','DC','Villain','Gotham','Unknown','Male','Alive','Agent of chaos','Joker is Batman’s greatest enemy, known for insanity.','images/dc/dc-joker.jpeg'), " +
                "('Darkseid','Darkseid','DC','Villain','Apokolips','Unknown','Male','Alive','God of tyranny','Darkseid seeks to conquer the universe.','images/placeholder.jpg'), " +
                "('Naruto Uzumaki','Naruto Uzumaki','Anime','Hero','Konoha','2000','Male','Alive','Hokage ninja','Naruto is a ninja who dreams of becoming Hokage.','images/anime/anime-naruto.png'), " +
                "('Pain','Nagato','Anime','Villain','Rain Village','Unknown','Male','Deceased','Leader of Akatsuki','Pain believes suffering brings peace.','images/downloaded/b9e934_562405.jpg'), " +
                "('Monkey D. Luffy','Monkey D. Luffy','Anime','Hero','East Blue','1997','Male','Alive','Rubber pirate','Luffy aims to become Pirate King.','images/anime/anime-luffy.png'), " +
                "('Blackbeard','Marshall D. Teach','Anime','Villain','Grand Line','Unknown','Male','Alive','Dark pirate','Blackbeard is one of the most dangerous pirates.','images/downloaded/f44e8d_522819.jpg'), " +
                "('Goku','Kakarot','Anime','Hero','Saiyan','Unknown','Male','Alive','Strongest Saiyan','Goku protects Earth from powerful enemies.','images/anime/anime-goku.png'), " +
                "('Cell','Cell','Anime','Villain','Lab Creation','Unknown','Male','Deceased','Perfect bio android','Cell seeks perfection and power.','images/downloaded/33c89b_435129.jpg'), " +
                "('Ichigo Kurosaki','Ichigo','Anime','Hero','Karakura','1995','Male','Alive','Soul reaper','Ichigo fights evil spirits and protects humans.','images/downloaded/67def1_512788.jpg'), " +
                "('Tanjiro Kamado','Tanjiro','Anime','Hero','Japan','2003','Male','Alive','Demon slayer','Tanjiro fights demons to save his sister.','images/downloaded/491e47_386735.jpg'), " +
                "('Gojo Satoru','Gojo','Anime','Hero','Japan','1989','Male','Alive','Strongest sorcerer','Gojo is the most powerful jujutsu sorcerer.','images/anime/anime-gojo.png'), " +
                
                // NEW MARVEL (19-27)
                "('Iron Man','Tony Stark','Marvel','Hero','Earth','1970','Male','Deceased','Genius Billionaire','Tony Stark constructed his own cybernetic armada of armor suits.','images/marvel/marvel-iron-man-pizza.jpg'), " +
                "('Captain America','Steve Rogers','Marvel','Hero','Brooklyn','1918','Male','Alive','Super Soldier','Steve Rogers is World War 2 hero transported into the modern era.','images/marvel/marvel-captain-america-midnight-shield.jpg'), " +
                "('Spider-Man','Peter Parker','Marvel','Hero','Queens','2001','Male','Alive','Web-slinger','Bitten by a radioactive spider, Peter protects New York.','images/marvel/marvel-spiderman-animated.jpg'), " +
                "('Deadpool','Wade Wilson','Marvel','Hero','Canada','Unknown','Male','Alive','Merc with a Mouth','Wade heals from any wound and is aware he is in a comic.','images/marvel/marvel-deadpool-redblack.jpeg'), " +
                "('Venom','Eddie Brock','Marvel','Villain','New York','Unknown','Male','Alive','Symbiote','Eddie bonded with an alien symbiote to become Venom.','images/marvel/marvel-venom-dark-symbiote.jpg'), " +
                "('Spider-Gwen','Gwen Stacy','Marvel','Hero','Earth-65','Unknown','Female','Alive','Ghost-Spider','In her universe, Gwen was bitten by the spider.','images/marvel/marvel-spider-gwen-stacy-wallpaper.jpg'), " +
                "('Hawkeye','Clint Barton','Marvel','Hero','Iowa','Unknown','Male','Alive','Master Archer','Clint never misses his mark and is a core Avenger.','images/marvel/marvel-hawkeye-arrowstorm.jpg'), " +
                "('Black Panther','T\\'Challa','Marvel','Hero','Wakanda','Unknown','Male','Deceased','King of Wakanda','King of a secretive, highly advanced African nation.','images/marvel/marvel-black-panther.jpg'), " +
                "('Wolverine','Logan','Marvel','Hero','Canada','1832','Male','Alive','Adamantium Mutant','Logan has a regenerative healing factor and metal claws.','images/placeholder.jpg'), " +
                
                // NEW DC (28-36)
                "('Batman','Bruce Wayne','DC','Hero','Gotham','1972','Male','Alive','The Dark Knight','Bruce uses fear and high-tech gadgets to fight crime in Gotham.','images/dc/dc-batman-dark-knight.jpg'), " +
                "('Superman','Clark Kent','DC','Hero','Krypton','1980','Male','Alive','Man of Steel','Kal-El was sent to Earth and is humanity\\'s greatest protector.','images/dc/dc-superman.jpeg'), " +
                "('Harley Quinn','Harleen Quinzel','DC','Villain','Gotham','1990','Female','Alive','Maid of Mischief','The Joker\\'s chaotic former partner.','images/dc/dc-harley-quinn-baseball-bat.jpg'), " +
                "('Aquaman','Arthur Curry','DC','Hero','Atlantis','1986','Male','Alive','King of Atlantis','Arthur defends the ocean and commands marine life.','images/placeholder.jpg'), " +
                "('Cyborg','Victor Stone','DC','Hero','Detroit','1994','Male','Alive','Cybernetic Titan','Part man, part machine, all hero.','images/placeholder.jpg'), " +
                "('Green Lantern','Hal Jordan','DC','Hero','Coast City','Unknown','Male','Alive','Emerald Knight','Hal wields a power ring driven by his will.','images/placeholder.jpg'), " +
                "('Shazam','Billy Batson','DC','Hero','Fawcett City','2005','Male','Alive','Mighty Mortal','A child who transforms into an adult superhero.','images/placeholder.jpg'), " +
                "('Nightwing','Dick Grayson','DC','Hero','Gotham','1995','Male','Alive','Former Robin','Batman\\'s first Robin, who struck out on his own.','images/placeholder.jpg'), " +
                "('Lex Luthor','Lex Luthor','DC','Villain','Metropolis','1975','Male','Alive','Billionaire Genius','Superman\\'s intellectual rival and corporate mogul.','images/placeholder.jpg'), " +
                
                // NEW ANIME (37-50)
                "('Sasuke Uchiha','Sasuke','Anime','Hero','Konoha','2000','Male','Alive','Shadow Hokage','The last surviving member of the Uchiha clan.','images/anime/anime-sasuke.png'), " +
                "('Itachi Uchiha','Itachi','Anime','Villain','Konoha','1995','Male','Deceased','Akatsuki Prodigy','Wiped out his entire clan to protect his brother.','images/anime/anime-itachi.png'), " +
                "('Vegeta','Vegeta','Anime','Hero','Planet Vegeta','Unknown','Male','Alive','Saiyan Prince','Goku\\'s greatest rival and prince of all Saiyans.','images/anime/anime-vegeta.png'), " +
                "('Roronoa Zoro','Zoro','Anime','Hero','Shimotsuki','1996','Male','Alive','Master Swordsman','First mate of the Straw Hat pirates and a 3-sword master.','images/anime/anime-zoro.png'), " +
                "('Saitama','Saitama','Anime','Hero','Z-City','Unknown','Male','Alive','One Punch Man','He trained so hard he went bald, and can defeat anyone in 1 punch.','images/anime/anime-saitama.png'), " +
                "('Levi Ackerman','Levi','Anime','Hero','Underground','Unknown','Male','Alive','Humanity\\'s Strongest','The most skilled soldier in the Survey Corps.','images/anime/anime-levi.png'), " +
                "('Eren Yeager','Eren','Anime','Villain','Shiganshina','Unknown','Male','Deceased','Attack Titan','Vowed to destroy all enemies outside the island.','images/downloaded/3dd2b3_216895.jpg'), " +
                "('Killua Zoldyck','Killua','Anime','Hero','Padokea','Unknown','Male','Alive','Lightning Assassin','Heir to a family of deadly assassins who ran away.','images/downloaded/d94b2d_327920.jpg'), " +
                "('Edward Elric','Edward','Anime','Hero','Resembool','1899','Male','Alive','Fullmetal Alchemist','Lost his arm and leg trying to resurrect his mother.','images/downloaded/5b50a4_72533.jpg'), " +
                "('Light Yagami','Light','Anime','Villain','Japan','1986','Male','Deceased','Kira','Found a notebook that kills anyone whose name is written in it.','images/downloaded/94c079_63870.jpg'), " +
                "('Lelouch vi Britannia','Lelouch','Anime','Villain','Britannia','Unknown','Male','Deceased','Zero','Given the power of Geass to command anyone to do his bidding.','images/downloaded/a10762_545933.jpg'), " +
                "('Gon Freecss','Gon','Anime','Hero','Whale Island','Unknown','Male','Alive','Rookie Hunter','On a journey to find his father.','images/downloaded/7afeec_174517.jpg'), " +
                "('Guts','Guts','Anime','Hero','Midland','Unknown','Male','Alive','The Black Swordsman','Wanders the world seeking revenge with a giant sword.','images/downloaded/0fb05c_284125.jpg'), " +
                "('Mob','Shigeo Kageyama','Anime','Hero','Seasoning City','Unknown','Male','Alive','Psychic Prodigy','A quiet middle schooler with explosive psychic powers.','images/downloaded/632d3c_343344.jpg'), " +
                
                // EXCLUSIVE NARUTO EXPANSION (51-60)
                "('Hinata Hyuga','Hinata','Anime','Hero','Konoha','2000','Female','Alive','Byakugan Princess','Naruto\\'s supportive wife and powerful Hyuga heiress.','images/downloaded/032362_598689.jpg'), " +
                "('Kakashi Hatake','Kakashi','Anime','Hero','Konoha','1980','Male','Alive','Copy Ninja','Naruto\\'s sensei who has copied over a thousand jutsus.','images/downloaded/8b7151_284129.jpg'), " +
                "('Sakura Haruno','Sakura','Anime','Hero','Konoha','2000','Female','Alive','Medical Ninja','One of the world\\'s greatest medical ninjas and possessing monstrous strength.','images/downloaded/7d0464_172327.jpg'), " +
                "('Jiraiya','Jiraiya','Anime','Hero','Konoha','1960','Male','Deceased','Toad Sage','Legendary Sannin and Naruto\\'s eccentric but wise mentor.','images/placeholder.jpg'), " +
                "('Minato Namikaze','Minato','Anime','Hero','Konoha','1976','Male','Deceased','Yellow Flash','The 4th Hokage and Naruto\\'s heroic father.','images/downloaded/0a3921_515666.jpg'), " +
                "('Tsunade Senju','Tsunade','Anime','Hero','Konoha','1960','Female','Alive','Fifth Hokage','Legendary Sannin and exceptionally powerful medical ninja.','images/placeholder.jpg'), " +
                "('Gaara','Gaara','Anime','Hero','Sand Village','2000','Male','Alive','Kazekage','Former jinchuriki who commands sand to protect his village.','images/downloaded/6c9fba_293375.jpg'), " +
                "('Shikamaru Nara','Shikamaru','Anime','Hero','Konoha','2000','Male','Alive','Lazy Genius','A tactical genius who uses shadow possession jutsu.','images/downloaded/747867_131315.jpg'), " +
                "('Rock Lee','Lee','Anime','Hero','Konoha','1999','Male','Alive','Taijutsu Master','A ninja who cannot use ninjutsu but relies entirely on pure martial arts.','images/downloaded/b9f3fa_433353.jpg'), " +
                "('Madara Uchiha','Madara','Anime','Villain','Konoha','1880','Male','Deceased','Ghost of the Uchiha','Legendary leader of the Uchiha clan who seeks to cast the infinite Tsukuyomi.','images/downloaded/c74cad_450359.jpg')";
                
            stmt.executeUpdate(insertChars);
            out.println("<p>Inserted 60 total characters.</p>");
            
            // INSERT POWERS
            String insertPowers = "INSERT INTO powers (character_id, power) VALUES " +
                "(1,'Thunder control'), (1,'Flight'), (2,'Super strength'), (4,'Infinity Gauntlet'), (6,'Speed force'), " +
                "(11,'Rinnegan'), (12,'Gear transformations'), " +
                "(19, 'Advanced Technology Suit'), (20, 'Vibranium Shield'), (21, 'Spider-Sense'), " +
                "(22, 'Healing Factor'), (23, 'Shape-shifting'), (26, 'Vibranium Claws'), (27, 'Adamantium Claws'), " +
                "(28, 'Martial Arts'), (28, 'Extensive Wealth'), (29, 'Heat Vision'), (29, 'Invulnerability'), " +
                "(37, 'Sharingan'), (38, 'Mangekyo Sharingan'), (39, 'Super Saiyan'), (40, 'Haki'), " +
                "(41, 'Invincible Punch'), (42, 'ODM Gear Mastery'), (50, 'Telekinesis'), " +
                "(51, 'Byakugan'), (51, 'Gentle Fist'), (52, 'Sharingan'), (52, 'Chidori'), " +
                "(53, 'Monstrous Strength'), (53, 'Medical Ninjutsu'), (54, 'Rasengan'), (54, 'Toad Summoning'), " +
                "(55, 'Flying Thunder God'), (56, 'Hundred Healings'), (57, 'Sand Manipulation'), " +
                "(58, 'Shadow Possession'), (59, 'Eight Inner Gates'), (60, 'Susanoo'), (60, 'Rinnegan')";
            stmt.executeUpdate(insertPowers);
            out.println("<p>Inserted dynamic powers.</p>");
            
            // INSERT CHARACTER_TEAMS
            String insertTeams = "INSERT INTO character_teams (character_id, team_id) VALUES " +
                // Base
                "(1,1), (2,1), (6,2), (11,3), (12,4), (14,5), " +
                // New additions
                "(19,1), (20,1), (21,1), (25,1), (26,1), (27,7), " +
                "(28,2), (29,2), (31,2), (32,2), (33,2), " +
                "(37,9), (38,3), (39,5), (40,4), (42,8), (43,8), " +
                "(10,9), (51,9), (52,9), (53,9), (54,9), (55,9), (56,9), (58,9), (59,9)";
            stmt.executeUpdate(insertTeams);
            out.println("<p>Inserted character_teams linkages.</p>");
            
            out.println("<h3 style='color:#0f0'>Massive database expansion complete (60 characters)!</h3>");
        } catch (Exception e) {
            out.println("<h3 style='color:#f00'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            if (stmt != null) try { stmt.close(); } catch(SQLException e) {}
            if (conn != null) try { conn.close(); } catch(SQLException e) {}
        }
    %>
    <br><br>
    <a href="characters.jsp" style="color: #E23636; text-decoration: none; border: 1px solid #E23636; padding: 10px 20px;">Return to HeroVerse Roster</a>
</body>
</html>
