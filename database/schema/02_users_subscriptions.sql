USE streamvault;

CREATE TABLE user(
user_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(150) NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE,
password_hash VARCHAR(255) NOT NULL,
contact VARCHAR(50) NOT NULL,
date_of_birth DATE,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE profiles(
profile_id  INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL, 
profile_name VARCHAR(150) NOT NULL,
FOREIGN KEY (user_id) REFERENCES user(user_id),
UNIQUE(user_id,profile_name)
);

CREATE TABLE subscription_plans(
plan_id INT AUTO_INCREMENT PRIMARY KEY,
plan_name VARCHAR(60) NOT NULL,
price DECIMAL(10,2) NOT NULL,
duration VARCHAR(50) DEFAULT 'Monthly',
max_devices INT NOT NULL DEFAULT 1,
video_quality VARCHAR(40) NOT NULL
);

CREATE TABLE subscription(
subs_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
plan_id INT NOT NULL,
start_date DATETIME DEFAULT CURRENT_TIMESTAMP,
end_date DATETIME NOT NULL,
status ENUM("Active","Cancelled","Expired") NOT NULL,
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id)
);

