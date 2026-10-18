USE streamvault;

DELIMITER $$
CREATE PROCEDURE sp_get_all_cont()
BEGIN
SELECT content_id, title, type, language, rel_date
FROM content
ORDER BY title;
END$$

CREATE PROCEDURE sp_get_cont_by_type(
IN p_type VARCHAR(20))
BEGIN
SELECT content_id, title, type, language
FROM content
WHERE type = p_type ORDER BY title;
END$$

CREATE PROCEDURE sp_get_cont_by_lang(
IN p_language VARCHAR(150))
BEGIN
SELECT content_id, title, type, language
FROM content
WHERE language = p_language ORDER BY title;
END$$

CREATE PROCEDURE sp_get_cont_ratings(
IN p_content_id INT)
BEGIN
SELECT c.title,
COUNT(r.rate_id) AS rating_count,
ROUND(AVG(r.rate), 2) AS average_rating
FROM content c
LEFT JOIN ratings r ON c.content_id = r.content_id
WHERE c.content_id = p_content_id GROUP BY c.content_id, c.title;
END$$

CREATE PROCEDURE sp_get_top_rated_cont(
IN p_limit INT)
BEGIN
IF p_limit > 0 THEN
SELECT c.title,
ROUND(AVG(r.rate), 2) AS average_rating,
COUNT(r.rate_id) AS rating_count
FROM content c
INNER JOIN ratings r ON c.content_id = r.content_id
GROUP BY c.content_id, c.title
ORDER BY average_rating DESC, rating_count DESC
LIMIT p_limit;
END IF;
END$$

DELIMITER ;
