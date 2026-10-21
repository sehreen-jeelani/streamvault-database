USE streamvault;

CREATE INDEX idx_content_title
ON content(title);

CREATE INDEX idx_content_language_type
ON content(language, type);

CREATE INDEX idx_subscription_user_status
ON subscription(user_id, status);

CREATE INDEX idx_watch_history_profile_time
ON watch_history(profile_id, watched_at);

CREATE INDEX idx_ratings_content
ON ratings(content_id);

CREATE INDEX idx_payment_status_date
ON payment(pay_status, paid_at);

