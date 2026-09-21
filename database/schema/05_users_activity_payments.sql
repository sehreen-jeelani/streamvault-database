USE streamvault;

CREATE TABLE watch_history(
watch_hist_id INT AUTO_INCREMENT PRIMARY KEY,
content_id INT NOT NULL,
profile_id INT NOT NULL,
epi_id INT,
watched_at DATETIME DEFAULT CURRENT_TIMESTAMP,
watch_dura_min INT,
completed ENUM ("Yes","No"),
FOREIGN KEY (content_id) REFERENCES content(content_id),
FOREIGN KEY (epi_id) REFERENCES episodes(epi_id),
FOREIGN KEY (profile_id) REFERENCES profiles(profile_id)
);

CREATE TABLE ratings(
rate_id INT AUTO_INCREMENT PRIMARY KEY,
content_id INT NOT NULL,
profile_id INT NOT NULL,
rate INT NOT NULL CHECK (rate BETWEEN 1 AND 5),
FOREIGN KEY (profile_id) REFERENCES profiles(profile_id),
FOREIGN KEY (content_id) REFERENCES content(content_id),
UNIQUE (content_id, profile_id)
);

CREATE TABLE watchlist(
w_list_id INT AUTO_INCREMENT PRIMARY KEY,
content_id INT NOT NULL,
profile_id INT NOT NULL,
FOREIGN KEY (profile_id) REFERENCES profiles(profile_id),
FOREIGN KEY (content_id) REFERENCES content(content_id),
UNIQUE (content_id, profile_id)
);

CREATE TABLE payment(
pay_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
subs_id INT NOT NULL,
amount DECIMAL(10,2) NOT NULL,
paid_at DATETIME DEFAULT CURRENT_TIMESTAMP,
pay_status ENUM("Successful","Failed","Refunded") NOT NULL,
pay_method ENUM("Online","Offline") NOT NULL,
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (subs_id) REFERENCES subscription(subs_id)
);


