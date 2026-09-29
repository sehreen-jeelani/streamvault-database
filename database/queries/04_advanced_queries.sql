USE streamvault;

SELECT  * FROM content 
WHERE duration_min = (SELECT MAX(duration_min) FROM content); 

SELECT  * FROM content 
WHERE duration_min > (SELECT AVG(duration_min) FROM content); 

SELECT user.user_id,user.full_name
FROM user
INNER JOIN profiles ON user.user_id = profiles.user_id
GROUP BY user.user_id,user.full_name HAVING COUNT(profiles.profile_id) > 1 ;

SELECT content.title, ratings.rate
FROM content
INNER JOIN ratings ON content.content_id = ratings.content_id
WHERE ratings.rate > (SELECT AVG(rate) FROM ratings);

SELECT plan_name,price FROM subscription_plans
WHERE price = (SELECT MAX(price) FROM subscription_plans);

SELECT user.user_id,user.full_name
FROM user
INNER JOIN subscription ON user.user_id = subscription.user_id
GROUP BY user.user_id,user.full_name HAVING (subscription.status = 'Active');

SELECT content_id, COUNT(*) AS watch_count
FROM watch_history
GROUP BY content_id;

SELECT title,duration_min,
CASE WHEN duration_min < 110 THEN 'Short' 
WHEN duration_min BETWEEN 110 AND 120 THEN 'Medium' 
WHEN duration_min > 120 THEN 'Long' 
END AS duration_category
FROM content 
WHERE type = 'Movie';

SELECT title,type,
CASE WHEN type = 'Movie' THEN 'Movie Content' 
WHEN type = 'TV Show'THEN 'TV Shows' 
END AS content_category
FROM content; 

SELECT content.title, ratings.rate,
CASE WHEN rate IN (1,2) THEN 'Poor' 
WHEN rate = 3 THEN 'Average' 
WHEN rate = 4 THEN 'Good'
WHEN rate = 5 THEN 'Excellent'
END AS rating_category
FROM content
INNER JOIN ratings ON content.content_id = ratings.content_id;

SELECT pay_id,pay_status,
CASE WHEN pay_status = 'Successful' THEN 'Completed'
WHEN pay_status = 'Failed' THEN 'Unsuccessful'
WHEN pay_status = 'Refunded' THEN 'Returned'
END AS status_category
FROM payment;

SELECT user_id,full_name
FROM user u
WHERE EXISTS (
 SELECT 1
 FROM profiles p
 WHERE p.user_id = u.user_id);

SELECT content_id,title
FROM content c
WHERE EXISTS (
 SELECT 1 
 FROM watchlist l
 WHERE l.content_id = c.content_id);

SELECT user_id,full_name
FROM user u
WHERE EXISTS (
 SELECT 1
 FROM payment p
 WHERE p.user_id = u.user_id 
 AND p.pay_status = 'Successful' );

SELECT content_id,title
FROM content c
WHERE EXISTS (
SELECT 1 
FROM ratings r
WHERE r.content_id = c.content_id
AND r.rate = '5' );

WITH ContentRatings AS (
SELECT content_id, AVG(rate) AS avg_rating
FROM ratings
GROUP BY content_id)
SELECT c.title,ROUND(r.avg_rating, 2) AS average_rating
FROM content c
JOIN ContentRatings r ON c.content_id = r.content_id;

WITH WatchCOUNT AS(
SELECT content_id,COUNT(watch_hist_id) AS watchCOUNT
FROM watch_history
GROUP BY content_id)
SELECT c.title, w.watchCOUNT 
FROM content c
JOIN WatchCOUNT w ON c.content_id = w.content_id;

WITH profit AS (
SELECT subs_id, SUM(amount) AS total_revenue
FROM payment
WHERE pay_status = 'Successful'
GROUP BY subs_id
)
SELECT subscription_plans.plan_name,profit.total_revenue
FROM profit
INNER JOIN subscription ON profit.subs_id = subscription.subs_id
INNER JOIN subscription_plans ON subscription.plan_id = subscription_plans.plan_id;

WITH profileCOUNT AS(
SELECT user_id, COUNT(profile_id) AS profile_count
FROM profiles
GROUP BY user_id)
SELECT u.full_name,p.profile_count
FROM user u
JOIN profileCOUNT p ON u.user_id = p.user_id
AND p.profile_count > 1;
