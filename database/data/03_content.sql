USE streamvault;

-- 1. CONTENT
INSERT INTO content
(language, title, type, rel_date, duration_min, country)
VALUES
('English', 'The Last Horizon', 'Movie', '2024-03-15', 128, 'USA'),
('Hindi', 'The Silent Valley', 'Movie', '2023-07-21', 115, 'India'),
('English', 'Code of Shadows', 'TV Show', '2025-01-10', NULL, 'USA'),
('Korean', 'Beyond the Moon', 'TV Show', '2024-09-05', NULL, 'South Korea'),
('Hindi', 'City Lights', 'Movie', '2022-11-18', 132, 'India'),
('English', 'Ocean Depths', 'Movie', '2025-02-14', 110, 'UK'),
('Spanish', 'The Forgotten Road', 'Movie', '2023-05-09', 124, 'Spain'),
('English', 'Digital Minds', 'TV Show', '2025-06-01', NULL, 'USA'),
('Japanese', 'Midnight Train', 'Movie', '2024-12-20', 105, 'Japan'),
('Hindi', 'Kashmir Diaries', 'TV Show', '2025-03-12', NULL, 'India'),
('English', 'The Last Signal', 'Movie', '2021-08-30', 119, 'Canada'),
('Korean', 'Parallel Hearts', 'TV Show', '2023-10-11', NULL, 'South Korea');

SELECT * FROM content;

-- 2. GENRES
INSERT INTO genres
(gen_name)
VALUES
('Action'),
('Drama'),
('Comedy'),
('Thriller'),
('Science Fiction'),
('Romance'),
('Adventure'),
('Mystery'),
('Documentary'),
('Crime');

SELECT * FROM genres;

-- 3. CONTENT-GENRE RELATIONSHIP
INSERT INTO content_genres
(content_id, gen_id)
VALUES
(1, 1),   -- The Last Horizon → Action
(1, 7),   -- The Last Horizon → Adventure

(2, 2),   -- The Silent Valley → Drama
(2, 8),   -- The Silent Valley → Mystery

(3, 4),   -- Code of Shadows → Thriller
(3, 5),   -- Code of Shadows → Science Fiction

(4, 6),   -- Beyond the Moon → Romance
(4, 2),   -- Beyond the Moon → Drama

(5, 2),   -- City Lights → Drama
(5, 3),   -- City Lights → Comedy

(6, 7),   -- Ocean Depths → Adventure
(6, 9),   -- Ocean Depths → Documentary

(7, 4),   -- The Forgotten Road → Thriller
(7, 8),   -- The Forgotten Road → Mystery

(8, 5),   -- Digital Minds → Science Fiction
(8, 4),   -- Digital Minds → Thriller

(9, 4),   -- Midnight Train → Thriller
(9, 8),   -- Midnight Train → Mystery

(10, 2),  -- Kashmir Diaries → Drama
(10, 6),  -- Kashmir Diaries → Romance

(11, 4),  -- The Last Signal → Thriller
(11, 5),  -- The Last Signal → Science Fiction

(12, 6),  -- Parallel Hearts → Romance
(12, 2);  -- Parallel Hearts → Drama

SELECT
    c.title,
    g.gen_name
FROM content_genres cg
JOIN content c
    ON cg.content_id = c.content_id
JOIN genres g
    ON cg.gen_id = g.gen_id
ORDER BY c.content_id;

-- 4. EPISODES
INSERT INTO episodes
(epi_name, epi_no, season_no, content_id, rel_date, duration_min)
VALUES

-- Code of Shadows
('The Beginning', 1, 1, 3, '2025-01-10', 48),
('Hidden Code', 2, 1, 3, '2025-01-17', 51),
('The Discovery', 3, 1, 3, '2025-01-24', 46),

-- Beyond the Moon
('First Encounter', 1, 1, 4, '2024-09-05', 52),
('The Secret', 2, 1, 4, '2024-09-12', 49),
('Beyond the Moon', 3, 1, 4, '2024-09-19', 55),

-- Digital Minds
('The Algorithm', 1, 1, 8, '2025-06-01', 45),
('Human or Machine', 2, 1, 8, '2025-06-08', 48),
('The Experiment', 3, 1, 8, '2025-06-15', 50),

-- Kashmir Diaries
('Arrival', 1, 1, 10, '2025-03-12', 44),
('The Journey', 2, 1, 10, '2025-03-19', 47),
('The Valley', 3, 1, 10, '2025-03-26', 49),

-- Parallel Hearts
('Two Paths', 1, 1, 12, '2023-10-11', 50),
('Unexpected Meeting', 2, 1, 12, '2023-10-18', 52),
('The Choice', 3, 1, 12, '2023-10-25', 54);

SELECT * FROM episodes;

SELECT
    e.epi_id,
    c.title,
    e.season_no,
    e.epi_no,
    e.epi_name,
    e.duration_min
FROM episodes e
JOIN content c
    ON e.content_id = c.content_id
ORDER BY c.content_id, e.season_no, e.epi_no;

-- 4. EPISODES
INSERT INTO episodes
(epi_name, epi_no, season_no, content_id, rel_date, duration_min)
VALUES

-- Code of Shadows
('The Beginning', 1, 1, 3, '2025-01-10', 48),
('Hidden Code', 2, 1, 3, '2025-01-17', 51),
('The Discovery', 3, 1, 3, '2025-01-24', 46),

-- Beyond the Moon
('First Encounter', 1, 1, 4, '2024-09-05', 52),
('The Secret', 2, 1, 4, '2024-09-12', 49),
('Beyond the Moon', 3, 1, 4, '2024-09-19', 55),

-- Digital Minds
('The Algorithm', 1, 1, 8, '2025-06-01', 45),
('Human or Machine', 2, 1, 8, '2025-06-08', 48),
('The Experiment', 3, 1, 8, '2025-06-15', 50),

-- Kashmir Diaries
('Arrival', 1, 1, 10, '2025-03-12', 44),
('The Journey', 2, 1, 10, '2025-03-19', 47),
('The Valley', 3, 1, 10, '2025-03-26', 49),

-- Parallel Hearts
('Two Paths', 1, 1, 12, '2023-10-11', 50),
('Unexpected Meeting', 2, 1, 12, '2023-10-18', 52),
('The Choice', 3, 1, 12, '2023-10-25', 54);

SELECT * FROM episodes;

SELECT
    e.epi_id,
    c.title,
    e.season_no,
    e.epi_no,
    e.epi_name,
    e.duration_min
FROM episodes e
JOIN content c
    ON e.content_id = c.content_id
ORDER BY c.content_id, e.season_no, e.epi_no;