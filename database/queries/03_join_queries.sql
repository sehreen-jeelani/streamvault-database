USE streamvault;

SELECT user.full_name,profiles.profile_name
FROM user 
INNER JOIN profiles ON user.user_id = profiles.user_id;

SELECT user.full_name,subscription.status
FROM user 
INNER JOIN subscription ON user.user_id = subscription.user_id;

SELECT user.full_name,subscription_plans.plan_name
FROM user 
INNER JOIN subscription ON user.user_id = subscription.user_id
INNER JOIN subscription_plans ON subscription.plan_id = subscription_plans.plan_id;

SELECT genres.gen_name,content.title
FROM content 
INNER JOIN content_genres ON content.content_id = content_genres.content_id
INNER JOIN genres ON content_genres.gen_id = genres.gen_id;


SELECT actors.actor_name,content.title
FROM content 
INNER JOIN content_actor ON content.content_id = content_actor.content_id
INNER JOIN actors ON content_actor.actor_id = actors.actor_id;

SELECT director.dir_name,content.title
FROM content 
INNER JOIN content_directors ON content.content_id = content_directors.content_id
INNER JOIN director ON content_directors.dir_id = director.dir_id;

SELECT profiles.profile_name,content.title
FROM profiles
INNER JOIN watch_history ON profiles.profile_id = watch_history.profile_id 
INNER JOIN content ON watch_history.content_id = content.content_id;

SELECT profiles.profile_name,content.title
FROM profiles
INNER JOIN ratings ON profiles.profile_id = ratings.profile_id 
INNER JOIN content ON ratings.content_id = content.content_id;

SELECT profiles.profile_name,content.title
FROM profiles
INNER JOIN watchlist ON profiles.profile_id = watchlist.profile_id 
INNER JOIN content ON watchlist.content_id = content.content_id;

SELECT ratings.rate,content.title 
FROM content 
INNER JOIN ratings ON content.content_id = ratings.content_id;

SELECT watch_history.watched_at,content.title
FROM content
INNER JOIN watch_history ON watch_history.content_id = content.content_id;

SELECT user.full_name,profiles.profile_name,content.title
FROM user
INNER JOIN profiles ON user.user_id = profiles.user_id
INNER JOIN watch_history ON profiles.profile_id = watch_history.profile_id 
INNER JOIN content ON watch_history.content_id = content.content_id;

SELECT user.full_name,subscription_plans.plan_name,subscription.status
FROM user 
INNER JOIN subscription ON user.user_id = subscription.user_id
INNER JOIN subscription_plans ON subscription.plan_id = subscription_plans.plan_id;

SELECT content.title, genres.gen_name, content.language
FROM content
INNER JOIN content_genres ON content.content_id = content_genres.content_id
INNER JOIN genres ON content_genres.gen_id = genres.gen_id;

SELECT actors.actor_name,content.title,content.type
FROM content 
INNER JOIN content_actor ON content.content_id = content_actor.content_id
INNER JOIN actors ON content_actor.actor_id = actors.actor_id;

SELECT director.dir_name,content.title,content.rel_date
FROM content 
INNER JOIN content_directors ON content.content_id = content_directors.content_id
INNER JOIN director ON content_directors.dir_id = director.dir_id;

SELECT user.full_name, profiles.profile_name, content.title, ratings.rate
FROM user
INNER JOIN profiles ON user.user_id = profiles.user_id
INNER JOIN ratings ON profiles.profile_id = ratings.profile_id
INNER JOIN content ON ratings.content_id = content.content_id;

SELECT user.full_name, profiles.profile_name, content.title
FROM user
INNER JOIN profiles ON user.user_id = profiles.user_id
INNER JOIN watchlist ON profiles.profile_id = watchlist.profile_id
INNER JOIN content ON watchlist.content_id = content.content_id;

SELECT user.full_name,profiles.profile_name
FROM user 
LEFT JOIN profiles ON user.user_id = profiles.user_id;

SELECT content.title, ratings.rate
FROM content
LEFT JOIN ratings ON content.content_id = ratings.content_id;

SELECT content.title,watch_history.content_id
FROM content 
LEFT JOIN watch_history ON watch_history.content_id = content.content_id;

SELECT content.title,watchlist.content_id
FROM content 
LEFT JOIN watchlist ON watchlist.content_id = content.content_id;

SELECT subscription_plans.plan_name, user.full_name
FROM subscription_plans
LEFT JOIN subscription ON subscription_plans.plan_id = subscription.plan_id
LEFT JOIN user ON subscription.user_id = user.user_id;

SELECT user.full_name,subscription_plans.plan_name,subscription.status
FROM user 
INNER JOIN subscription ON user.user_id = subscription.user_id
INNER JOIN subscription_plans ON subscription.plan_id = subscription_plans.plan_id
WHERE subscription.status = 'Active';

SELECT genres.gen_name,content.title
FROM content 
INNER JOIN content_genres ON content.content_id = content_genres.content_id
INNER JOIN genres ON content_genres.gen_id = genres.gen_id
WHERE content.language = 'English';

SELECT content.title, actors.actor_name
FROM content
INNER JOIN content_actor ON content.content_id = content_actor.content_id
INNER JOIN actors ON content_actor.actor_id = actors.actor_id
WHERE content.type = 'Movie';

SELECT profiles.profile_name, content.title, ratings.rate
FROM profiles
INNER JOIN ratings ON profiles.profile_id = ratings.profile_id
INNER JOIN content ON ratings.content_id = content.content_id
WHERE ratings.rate >= 4;

SELECT profiles.profile_name,content.title
FROM profiles
INNER JOIN watch_history ON profiles.profile_id = watch_history.profile_id 
INNER JOIN content ON watch_history.content_id = content.content_id
WHERE watch_history.completed = 'Yes';

SELECT content.title,ratings.rate
FROM content
INNER JOIN ratings ON content.content_id = ratings.content_id
ORDER BY ratings.rate DESC;

SELECT user.full_name,subscription_plans.plan_name
FROM user 
INNER JOIN subscription ON user.user_id = subscription.user_id
INNER JOIN subscription_plans ON subscription.plan_id = subscription_plans.plan_id
ORDER BY user.full_name ASC;