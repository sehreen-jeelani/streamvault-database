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
FROM subscription
INNER JOIN subscription_plans ON subscription.plan_id = subscription_plans.plan_id
GROUP BY subscription_plans.plan_id,subscription_plans.plan_name;

SELECT ROUND(
COUNT(DISTINCT CASE WHEN status = 'Active' THEN user_id END)* 100.0 / COUNT(*),2)
AS active_subs_percentage
FROM user;

SELECT subscription_plans.plan_name,
COUNT(DISTINCT subscription.user_id) AS subscriber_count
FROM subscription
INNER JOIN subscription_plans ON subscription.plan_id = subscription_plans.plan_id
GROUP BY subscription_plans.plan_id,subscription_plans.plan_name
ORDER BY subscriber_count DESC
LIMIT 1;

SELECT AVG(price) AS average_plan_price
FROM subscription_plans;