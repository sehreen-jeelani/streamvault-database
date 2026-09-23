USE streamvault;

-- 1. SUBSCRIPTION PLANS
INSERT INTO subscription_plans
(plan_name, price, duration, max_devices, video_quality)
VALUES
('Mobile', 149.00, 'Monthly', 1, 'SD'),
('Basic', 299.00, 'Monthly', 1, 'HD'),
('Standard', 499.00, 'Monthly', 2, 'Full HD'),
('Premium', 699.00, 'Monthly', 4, '4K');

SELECT * FROM subscription_plans;

-- 2. USER SUBSCRIPTIONS
INSERT INTO subscription
(user_id, plan_id, start_date, end_date, status)
VALUES
(1, 4, '2026-01-10 10:00:00', '2026-02-10 10:00:00', 'Expired'),
(2, 2, '2026-02-15 12:30:00', '2026-03-15 12:30:00', 'Expired'),
(3, 3, '2026-03-01 09:15:00', '2026-04-01 09:15:00', 'Expired'),
(4, 1, '2026-04-05 14:00:00', '2026-05-05 14:00:00', 'Cancelled'),
(5, 4, '2026-05-10 11:20:00', '2026-06-10 11:20:00', 'Expired'),
(6, 3, '2026-06-01 16:45:00', '2026-07-01 16:45:00', 'Expired'),
(7, 2, '2026-07-05 10:30:00', '2026-08-05 10:30:00', 'Expired'),
(8, 4, '2026-08-01 13:10:00', '2026-09-01 13:10:00', 'Expired'),
(9, 3, '2026-08-20 18:00:00', '2026-09-20 18:00:00', 'Expired'),
(10, 4, '2026-09-01 09:00:00', '2026-10-01 09:00:00', 'Active');

SELECT * FROM subscription;

SELECT
    s.subs_id,
    u.full_name,
    sp.plan_name,
    sp.price,
    s.start_date,
    s.end_date,
    s.status
FROM subscription s
JOIN user u
    ON s.user_id = u.user_id
JOIN subscription_plans sp
    ON s.plan_id = sp.plan_id
ORDER BY s.subs_id;

