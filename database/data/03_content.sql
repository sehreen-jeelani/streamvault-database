USE streamvault;

-- content
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

-- genres
INSERT INTO genres (gen_name) VALUES
('Action'), ('Drama'), ('Comedy'), ('Thriller'), ('Science Fiction'),
('Romance'), ('Adventure'), ('Mystery'), ('Documentary'), ('Crime');

SELECT * FROM genres;

-- content_genre reltionship
INSERT INTO content_genres (content_id, gen_id) VALUES
(1, 1), (1, 7),
(2, 2), (2, 8),
(3, 4), (3, 5),
(4, 6), (4, 2),
(5, 2), (5, 3),
(6, 7), (6, 9),
(7, 4), (7, 8),
(8, 5), (8, 4),
(9, 4), (9, 8),
(10, 2), (10, 6),
(11, 4), (11, 5),
(12, 6), (12, 2);

-- episode
INSERT INTO episodes (epi_name, epi_no, season_no, content_id, rel_date, duration_min) VALUES
('The Beginning', 1, 1, 3, '2025-01-10', 48),
('Hidden Code', 2, 1, 3, '2025-01-17', 51),
('The Discovery', 3, 1, 3, '2025-01-24', 46),
('First Encounter', 1, 1, 4, '2024-09-05', 52),
('The Secret', 2, 1, 4, '2024-09-12', 49),
('Beyond the Moon', 3, 1, 4, '2024-09-19', 55),
('The Algorithm', 1, 1, 8, '2025-06-01', 45),
('Human or Machine', 2, 1, 8, '2025-06-08', 48),
('The Experiment', 3, 1, 8, '2025-06-15', 50),
('Arrival', 1, 1, 10, '2025-03-12', 44),
('The Journey', 2, 1, 10, '2025-03-19', 47),
('The Valley', 3, 1, 10, '2025-03-26', 49),
('Two Paths', 1, 1, 12, '2023-10-11', 50),
('Unexpected Meeting', 2, 1, 12, '2023-10-18', 52),
('The Choice', 3, 1, 12, '2023-10-25', 54);

SELECT * FROM episodes;

