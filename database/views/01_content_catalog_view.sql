USE streamvault;

CREATE VIEW cont_catalog_view AS
SELECT content_id,title,type,language,
rel_date,duration_min,country
FROM content;

CREATE VIEW cont_genre_view AS
SELECT c.content_id,c.title,
c.type,g.gen_name AS genre
FROM content c
LEFT JOIN content_genres cg ON c.content_id = cg.content_id
LEFT JOIN genres g ON cg.gen_id = g.gen_id;

CREATE VIEW cont_actor_view AS
SELECT c.content_id,c.title,
c.type,a.actor_name
FROM content c
LEFT JOIN content_actor ca ON c.content_id = ca.content_id
LEFT JOIN actors a ON ca.actor_id = a.actor_id;

CREATE VIEW cont_dir_view AS
SELECT c.content_id,c.title,c.type,
d.dir_name AS director_name
FROM content c
LEFT JOIN content_directors cd ON c.content_id = cd.content_id
LEFT JOIN director d ON cd.dir_id = d.dir_id;

CREATE VIEW cont_rating_view AS
SELECT c.content_id,c.title,
COUNT(r.rate_id) AS rating_count,
ROUND(AVG(r.rate), 2) AS average_rating
FROM content c
LEFT JOIN ratings r ON c.content_id = r.content_id
GROUP BY c.content_id, c.title;

CREATE VIEW user_subscription_view AS
SELECT u.user_id,u.full_name,
u.email,sp.plan_name,
s.start_date,s.end_date,s.status
FROM user u
LEFT JOIN subscription s ON u.user_id = s.user_id
LEFT JOIN subscription_plans sp ON s.plan_id = sp.plan_id;

CREATE VIEW user_profile_summary_view AS
SELECT u.user_id,u.full_name,
COUNT(p.profile_id) AS profile_count
FROM user u
LEFT JOIN profiles p ON u.user_id = p.user_id
GROUP BY u.user_id, u.full_name;

CREATE VIEW content_watch_summary_view AS
SELECT c.content_id,c.title,
COUNT(w.watch_hist_id) AS total_watches,
SUM(CASE 
WHEN w.completed = 'Yes' THEN 1
ELSE 0 END) AS completed_watches,
ROUND(AVG(w.watch_dura_min), 2) AS avg_watch_dur_min
FROM content c
LEFT JOIN watch_history w ON c.content_id = w.content_id
GROUP BY c.content_id, c.title;

CREATE VIEW plan_revenue_view AS
SELECT sp.plan_id,sp.plan_name,
ROUND(COALESCE(SUM(CASE
WHEN p.pay_status = 'Successful' THEN p.amount
ELSE 0 END), 0), 2) AS total_successful_amount
FROM subscription_plans sp
LEFT JOIN subscription s ON sp.plan_id = s.plan_id
LEFT JOIN payment p ON s.subs_id = p.subs_id
GROUP BY sp.plan_id, sp.plan_name;

CREATE VIEW profile_watchlist_view AS
SELECT p.profile_id,p.profile_name,
COUNT(w.w_list_id) AS watchlist_count
FROM profiles p
LEFT JOIN watchlist w ON p.profile_id = w.profile_id
GROUP BY p.profile_id, p.profile_name;

