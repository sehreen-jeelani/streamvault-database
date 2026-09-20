USE streamvault;

CREATE TABLE content (
content_id INT AUTO_INCREMENT PRIMARY KEY,
language VARCHAR(150) NOT NULL,
title VARCHAR(150) NOT NULL,
type ENUM('Movie', 'TV Show') NOT NULL,
rel_date DATE,
duration_min INT,
country VARCHAR(100)
);

CREATE TABLE genres(
gen_id INT AUTO_INCREMENT PRIMARY KEY,
gen_name VARCHAR(250) NOT NULL
);

CREATE TABLE content_genres(
cont_gen_id INT AUTO_INCREMENT PRIMARY KEY,
content_id INT NOT NULL,
gen_id INT NOT NULL,
FOREIGN KEY (content_id) REFERENCES content(content_id),
FOREIGN KEY (gen_id) REFERENCES genres(gen_id),
UNIQUE (content_id, gen_id)
);

CREATE TABLE episodes(
epi_id INT AUTO_INCREMENT PRIMARY KEY,
epi_name VARCHAR(100) NOT NULL,
epi_no INT,
season_no INT,
content_id INT NOT NULL,
rel_date DATE,
duration_min INT,
FOREIGN KEY (content_id) REFERENCES content(content_id),
UNIQUE (content_id, season_no, epi_no)
);

