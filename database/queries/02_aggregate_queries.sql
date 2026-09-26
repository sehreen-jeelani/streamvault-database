USE streamvault;

SELECT COUNT(*) FROM CONTENT;
SELECT COUNT(*) FROM CONTENT WHERE type = 'Movie';
SELECT COUNT(*) FROM CONTENT WHERE type = 'TV Show';
SELECT COUNT(*) FROM user;
SELECT COUNT(*) FROM profiles;
SELECT COUNT(*) FROM actors;
SELECT COUNT(*) FROM director;
SELECT COUNT(*) FROM content WHERE language = 'English';
SELECT COUNT(*) FROM content WHERE language = 'Hindi';
SELECT COUNT(*) FROM content WHERE rel_date > '2020-01-01';
SELECT COUNT(*) FROM content WHERE duration_min > 115;
SELECT COUNT(*) FROM content WHERE duration_min IS NULL;
SELECT MAX(duration_min) FROM content;
SELECT MIN(duration_min) FROM content;
SELECT AVG(duration_min) FROM content;
SELECT MIN(rel_date) FROM content;
SELECT MAX(rel_date) FROM content;

SELECT type,COUNT(*) AS Group_count FROM CONTENT GROUP BY type ;

SELECT country,COUNT(*) AS Group_count FROM CONTENT GROUP BY country;

SELECT subscription_plans.plan_name,COUNT(user.user_id)
FROM user
INNER JOIN subscription ON user.user_id = subscription.user_id
INNER JOIN subscription_plans ON subscription.plan_id = subscription_plans.plan_id
GROUP BY subscription_plans.plan_name;

SELECT user.user_id, COUNT(profiles.profile_id) AS profile_count
FROM user
INNER JOIN profiles ON user.user_id = profiles.user_id
GROUP BY user.user_id;

SELECT genres.gen_name,COUNT(content.content_id)
FROM content
INNER JOIN content_genres ON content.content_id = content_genres.content_id
INNER JOIN genres ON content_genres.gen_id = genres.gen_id
GROUP BY genres.gen_name;

SELECT language,AVG(duration_min) AS AVG_D FROM content 
WHERE type = 'Movie' GROUP BY language;

SELECT language,MAX(duration_min) FROM content 
WHERE type = 'Movie' GROUP BY language;

SELECT content.title, COUNT(ratings.rate)
FROM content
INNER JOIN ratings ON content.content_id = ratings.content_id
GROUP BY content.title;

SELECT AVG(ratings.rate),content.title 
FROM content 
INNER JOIN ratings ON content.content_id = ratings.content_id
GROUP BY content.title;

SELECT COUNT(watch_history.content_id),content.title
FROM content
INNER JOIN watch_history ON content.content_id = watch_history.content_id
GROUP BY content.title ;

SELECT COUNT(watchlist.content_id),user.user_id
FROM user
INNER JOIN profiles ON user.user_id = profiles.user_id
INNER JOIN watchlist ON profiles.profile_id = watchlist.profile_id
GROUP BY user.user_id;

SELECT language,COUNT(*) FROM content 
GROUP BY language HAVING COUNT(*) > 2;

SELECT COUNT(ratings.rate),content.title
FROM content 
INNER JOIN ratings ON content.content_id = ratings.content_id
GROUP BY content.title HAVING COUNT(ratings.rate) > 1;
 
SELECT COUNT(watch_history.content_id),content.title
FROM content 
INNER JOIN watch_history ON content.content_id = watch_history.content_id
GROUP BY content.title  HAVING COUNT(watch_history.content_id) > 1;

SELECT COUNT(profiles.user_id),user.user_id
FROM user
INNER JOIN profiles ON user.user_id = profiles.user_id
GROUP BY user.user_id  HAVING COUNT(profiles.user_id) > 1;

SELECT genres.gen_name,COUNT(content.content_id)
FROM content
INNER JOIN content_genres ON content.content_id = content_genres.content_id
INNER JOIN genres ON content_genres.gen_id = genres.gen_id
GROUP BY genres.gen_name HAVING COUNT(content.content_id) > 2;

SELECT type,COUNT(title)
FROM content GROUP BY type;

SELECT language,COUNT(title)
FROM content GROUP BY language;

SELECT AVG(rate) AS average_rating
FROM ratings;

SELECT MAX(ratings.rate),content.title 
FROM content 
INNER JOIN ratings ON content.content_id = ratings.content_id
GROUP BY content.title;

SELECT SUM(amount) AS total_revenue
FROM payment
WHERE pay_status = 'Successful';

SELECT AVG(amount) FROM payment;

SELECT subscription_plans.plan_name,SUM(payment.amount) AS total_revenue
FROM payment
INNER JOIN subscription ON payment.subs_id = subscription.subs_id
INNER JOIN subscription_plans ON subscription.plan_id = subscription_plans.plan_id
GROUP BY subscription_plans.plan_name;

SELECT pay_method,COUNT(pay_status) FROM payment
WHERE pay_status = 'Successful' 
GROUP BY pay_method ;
