USE streamvault;

CREATE TABLE actors(
actor_id INT AUTO_INCREMENT PRIMARY KEY,
actor_name VARCHAR(150) NOT NULL
);

CREATE TABLE content_actor(
act_cont_id INT AUTO_INCREMENT PRIMARY KEY,
content_id INT NOT NULL,
actor_id INT NOT NULL,
FOREIGN KEY (content_id) REFERENCES content(content_id),
FOREIGN KEY (actor_id) REFERENCES actors(actor_id),
UNIQUE (content_id, actor_id)
);

CREATE TABLE director(
dir_id INT AUTO_INCREMENT PRIMARY KEY,
dir_name VARCHAR(150) NOT NULL
);

CREATE TABLE content_directors(
cont_dir_id INT AUTO_INCREMENT PRIMARY KEY,
content_id INT NOT NULL,
dir_id INT NOT NULL,
FOREIGN KEY (content_id) REFERENCES content(content_id),
FOREIGN KEY (dir_id) REFERENCES director(dir_id),
UNIQUE (content_id, dir_id)
);

