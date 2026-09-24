USE streamvault;

-- actors
INSERT INTO actors
(actor_name)
VALUES
('Raj Malhotra'),('Ananya Kapoor'),
('Daniel Brooks'),('Sofia Miller'),
('Kim Min-Jae'),('Park Ji-Woo'),
('Arjun Khanna'),('Sara Williams'),
('Diego Torres'),('Yuki Tanaka');

SELECT * FROM actors;

-- content_actor relationship
INSERT INTO content_actor (content_id, actor_id) VALUES
(1, 1), (1, 2),   -- The Last Horizon
(2, 7), (2, 8),   -- The Silent Valley
(3, 3), (3, 4),   -- Code of Shadows
(4, 5), (4, 6),   -- Beyond the Moon
(5, 7), (5, 2),   -- City Lights
(6, 3), (6, 8),   -- Ocean Depths
(7, 9), (7, 4),   -- The Forgotten Road
(8, 3), (8, 10),  -- Digital Minds
(9, 10), (9, 6),  -- Midnight Train
(10, 7), (10, 8), -- Kashmir Diaries
(11, 3), (11, 1), -- The Last Signal
(12, 5), (12, 2); -- Parallel Hearts

-- director
INSERT INTO director
(dir_name)
VALUES
('Vikram Mehra'),('Nisha Kapoor'),
('James Anderson'),('Emily Carter'),
('Lee Joon-Ho'),('Maya Sharma'),
('Robert Wilson'),('Aisha Khan'),
('Carlos Mendes'),('Hiroshi Sato');

SELECT * FROM director;

-- content_director relationship
INSERT INTO content_directors (content_id, dir_id) VALUES
(1, 1),   -- The Last Horizon
(2, 2),   -- The Silent Valley
(3, 3),   -- Code of Shadows
(4, 5),   -- Beyond the Moon
(5, 6),   -- City Lights
(6, 7),   -- Ocean Depths
(7, 9),   -- The Forgotten Road
(8, 4),   -- Digital Minds
(9, 10),  -- Midnight Train
(10, 8),  -- Kashmir Diaries
(11, 3),  -- The Last Signal
(12, 5);  -- Parallel Hearts



