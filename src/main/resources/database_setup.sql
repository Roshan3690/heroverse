-- Create Database
CREATE DATABASE IF NOT EXISTS heroverse_db;
USE heroverse_db;

-- Create Characters Table
DROP TABLE IF EXISTS characters;
CREATE TABLE characters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    real_name VARCHAR(100),
    universe VARCHAR(50) NOT NULL,
    total_movies INT DEFAULT 0,
    description TEXT,
    image_url VARCHAR(255)
);

-- Insert Character Data
-- Note: Image URLs are relative to the webapp root, so 'images/filename'

-- Marvel Characters
INSERT INTO characters (name, real_name, universe, total_movies, description, image_url) VALUES 
('Ant-Man', 'Scott Lang', 'Marvel', 4, 'A master thief who acquires a suit that allows him to shrink in scale but increase in strength.', 'images/ant-man.jpeg'),
('Black Panther', 'T''Challa', 'Marvel', 4, 'King of the African nation of Wakanda, who gains enhanced strength by ingesting the Heart-Shaped Herb.', 'images/black-panther.jpeg'),
('Black Widow', 'Natasha Romanoff', 'Marvel', 8, 'A former KGB agent and assassin who became a founding member of the Avengers.', 'images/black-widow.jpeg'),
('Captain America', 'Steve Rogers', 'Marvel', 9, 'A World War II veteran who was enhanced to the peak of human physicality by an experimental serum.', 'images/captain-america.jpg'),
('Captain Marvel', 'Carol Danvers', 'Marvel', 2, 'A former U.S. Air Force pilot who gained cosmic powers after being exposed to the energy of the Tesseract.', 'images/captain-marvel.jpeg'),
('Doctor Strange', 'Stephen Strange', 'Marvel', 3, 'A neurosurgeon who becomes the Sorcerer Supreme, the primary protector of Earth against magical and mystical threats.', 'images/doctor-strange.jpeg'),
('Hawkeye', 'Clint Barton', 'Marvel', 5, 'A master archer and marksman who is a founding member of the Avengers.', 'images/hawkeye.jpeg'),
('Hulk', 'Bruce Banner', 'Marvel', 7, 'A scientist who transforms into a giant, green-skinned, irradiated monster when enraged.', 'images/hulk.jpeg'),
('Iron Man', 'Tony Stark', 'Marvel', 10, 'A billionaire industrialist and genius inventor who created a powered suit of armor to save his life and fight crime.', 'images/ironman.jpg'),
('Loki', 'Loki Laufeyson', 'Marvel', 6, 'The God of Mischief and Thor''s adopted brother.', 'images/loki.jpeg'),
('Scarlet Witch', 'Wanda Maximoff', 'Marvel', 5, 'A powerful sorceress who can alter reality and manipulate chaos magic.', 'images/scarlet-witch.jpeg'),
('Spider-Man', 'Peter Parker', 'Marvel', 6, 'A high school student who gained spider-like abilities after being bitten by a radioactive spider.', 'images/spiderman.jpeg'),
('Thanos', 'Thanos', 'Marvel', 4, 'A powerful warlord from Titan whose main objective was to bring stability to the universe by wiping out half of all life.', 'images/thanos.jpeg'),
('Thor', 'Thor Odinson', 'Marvel', 8, 'The God of Thunder and former king of Asgard.', 'images/thor.jpeg');

-- DC Characters
INSERT INTO characters (name, real_name, universe, total_movies, description, image_url) VALUES 
('Aquaman', 'Arthur Curry', 'DC', 2, 'The half-Atlantean, half-human king of Atlantis who can communicate with marine life.', 'images/aquaman.jpeg'),
('Batman', 'Bruce Wayne', 'DC', 12, 'A wealthy socialite who fights crime in Gotham City as a vigilante bat-themed hero.', 'images/batman.jpeg'),
('Cyborg', 'Victor Stone', 'DC', 2, 'A former college athlete who was cybernetically enhanced after a near-fatal accident.', 'images/cyborg.jpeg'),
('Darkseid', 'Uxas', 'DC', 1, 'The tyrannical ruler of Apokolips who seeks to conquer the universe and eliminate free will.', 'images/darkseid.jpeg'),
('The Flash', 'Barry Allen', 'DC', 2, 'A forensic scientist who gained the ability to move at superhuman speeds after being struck by lightning.', 'images/flash.jpeg'),
('Green Lantern', 'Hal Jordan', 'DC', 1, 'A test pilot who was chosen by an alien ring to become a member of the Green Lantern Corps.', 'images/green-lantern.jpeg'),
('Harley Quinn', 'Harleen Quinzel', 'DC', 3, 'A former psychiatrist who became the Joker''s sidekick and later a member of the Suicide Squad.', 'images/harley-quinn.jpeg'),
('Joker', 'Unknown', 'DC', 5, 'A criminal mastermind and Batman''s arch-nemesis.', 'images/joker.jpeg'),
('Superman', 'Kal-El / Clark Kent', 'DC', 9, 'A Kryptonian survivor with superhuman abilities who protects Earth.', 'images/superman.jpeg'),
('Wonder Woman', 'Diana Prince', 'DC', 4, 'An Amazonian warrior princess who fights for justice and peace.', 'images/wonder-woman.jpeg');
