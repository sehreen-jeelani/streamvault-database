USE streamvault;

SELECT COUNT(*) FROM user;
SELECT COUNT(*) FROM profiles;

SELECT AVG(profile_count) AS average_profiles_per_user
FROM (SELECT user_id, COUNT(*) AS profile_count
FROM profiles GROUP BY user_id) AS user_profiles;

SELECT COUNT(DISTINCT user_id) AS active_users
FROM subscription
WHERE status = 'Active';

SELECT subscription_plans.plan_name,
COUNT(DISTINCT subscription.user_id) AS users
FROM subscription_plans
LEFT JOIN subscription ON subscription.plan_id = subscription_plans.plan_id
GROUP BY subscription_plans.plan_id,subscription_plans.plan_name;

SELECT ROUND(COUNT(DISTINCT CASE
WHEN s.status = 'Active' THEN s.user_id
END) * 100.0 / COUNT(u.user_id),2) AS active_subs_percent
FROM user u
LEFT JOIN subscription s ON u.user_id = s.user_id;

SELECT subscription_plans.plan_name,
COUNT(DISTINCT subscription.user_id) AS subs_count
FROM subscription
INNER JOIN subscription_plans ON subscription.plan_id = subscription_plans.plan_id
GROUP BY subscription_plans.plan_id,subscription_plans.plan_name
ORDER BY subs_count DESC
LIMIT 1;

SELECT AVG(price) AS average_price
FROM subscription_plans;

SELECT COUNT(*) AS total_content
FROM content;

SELECT type,COUNT(*) AS content_count
FROM content
GROUP BY type ORDER BY content_count DESC;

SELECT language,COUNT(*) AS title_count
FROM content
GROUP BY language ORDER BY title_count DESC;

SELECT country,COUNT(*) AS title_count
FROM content
GROUP BY country ORDER BY title_count DESC;

SELECT ROUND(AVG(duration_min), 2) AS avg_duration
FROM content
WHERE type = 'Movie';

SELECT title,duration_min
FROM content
WHERE type = 'Movie' AND duration_min IS NOT NULL
ORDER BY duration_min DESC LIMIT 1;

SELECT title, duration_min
FROM content
WHERE type = 'Movie' AND duration_min IS NOT NULL
ORDER BY duration_min ASC LIMIT 1;

SELECT YEAR(rel_date) AS rel_year,COUNT(*) AS title_count
FROM content
WHERE rel_date IS NOT NULL GROUP BY YEAR(rel_date) ORDER BY rel_year;

SELECT g.gen_name,COUNT(cg.content_id) AS title_count
FROM genres g
LEFT JOIN content_genres cg ON g.gen_id = cg.gen_id
GROUP BY g.gen_id, g.gen_name
ORDER BY title_count DESC;

SELECT ROUND(AVG(genre_count), 2) AS avg_gen_title
FROM ( SELECT c.content_id,COUNT(cg.gen_id) AS genre_count
FROM content c 
LEFT JOIN content_genres cg ON c.content_id = cg.content_id
GROUP BY c.content_id) AS content_genres_count;

SELECT COUNT(*) AS total_watch
FROM watch_history;

SELECT COUNT(*) AS complt_watches
FROM watch_history WHERE completed = 'Yes';

SELECT ROUND(COUNT(CASE WHEN completed = 'Yes' THEN 1 END)
* 100.0 / COUNT(*),2) AS complt_rate_percent
FROM watch_history;

SELECT c.title,COUNT(w.watch_hist_id) AS watch_count
FROM content c
INNER JOIN watch_history w ON c.content_id = w.content_id
GROUP BY c.content_id, c.title ORDER BY watch_count DESC LIMIT 1;

SELECT c.title,COUNT(w.watch_hist_id) AS watch_count
FROM content c
INNER JOIN watch_history w ON c.content_id = w.content_id
GROUP BY c.content_id, c.title ORDER BY watch_count DESC LIMIT 3;

SELECT p.profile_name,COUNT(w.watch_hist_id) AS watch_count
FROM profiles p
INNER JOIN watch_history w ON p.profile_id = w.profile_id
GROUP BY p.profile_id, p.profile_name ORDER BY watch_count DESC LIMIT 1;

SELECT ROUND(AVG(watch_dura_min), 2) AS avg_watch_dur_min
FROM watch_history;

SELECT c.title,ROUND(AVG(r.rate), 2) AS average_rating
FROM content c
INNER JOIN ratings r ON c.content_id = r.content_id
GROUP BY c.content_id, c.title ORDER BY average_rating DESC LIMIT 1;

SELECT c.title,COUNT(r.rate_id) AS rat_count
FROM content c
LEFT JOIN ratings r ON c.content_id = r.content_id
GROUP BY c.content_id, c.title ORDER BY rat_count DESC;

SELECT DISTINCT u.user_id,u.full_name
FROM user u
INNER JOIN profiles p ON u.user_id = p.user_id
INNER JOIN watchlist w ON p.profile_id = w.profile_id;