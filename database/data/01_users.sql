USE streamvault;

-- 1. USERS
INSERT INTO user
(full_name, email, password_hash, contact, date_of_birth)
VALUES
('Aarav Sharma', 'aarav01@streamvault.test', 'dummy_hash_001', '9000000001', '2004-05-12'),
('Meera Khan', 'meera02@streamvault.test', 'dummy_hash_002', '9000000002', '2003-11-20'),
('Zoya Khan', 'zoya03@streamvault.test', 'dummy_hash_003', '9000000003', '2003-08-21'),
('Rohan Mehta', 'rohan04@streamvault.test', 'dummy_hash_004', '9000000004', '2001-12-09'),
('Mehak Ali', 'mehak05@streamvault.test', 'dummy_hash_005', '9000000005', '2004-02-17'),
('Kabir Singh', 'kabir06@streamvault.test', 'dummy_hash_006', '9000000006', '2002-06-28'),
('Sara Ahmad', 'sara07@streamvault.test', 'dummy_hash_007', '9000000007', '2003-11-03'),
('Arjun Kapoor', 'arjun08@streamvault.test', 'dummy_hash_008', '9000000008', '2000-09-19'),
('Hiba Mir', 'hiba09@streamvault.test', 'dummy_hash_009', '9000000009', '2004-05-11'),
('Aditya Verma', 'aditya10@streamvault.test', 'dummy_hash_010', '9000000010', '2001-01-25');

SELECT * FROM user;

-- PROFILES
INSERT INTO profiles
(user_id, profile_name)
VALUES
(1, 'Aarav'),
(1, 'Kids'),

(2, 'Meera'),
(2, 'Family'),

(3, 'Zoya'),

(4, 'Rohan'),

(5, 'Mehak'),
(5, 'Kids'),

(6, 'Kabir'),

(7, 'Sara'),
(7, 'Family'),

(8, 'Arjun'),

(9, 'Hiba'),

(10, 'Aditya'),
(10, 'Kids');

SELECT * FROM profiles;

-- 3. TEST THE RELATIONSHIP
SELECT
    u.user_id,
    u.full_name,
    p.profile_id,
    p.profile_name
FROM user u
JOIN profiles p
    ON u.user_id = p.user_id
ORDER BY u.user_id, p.profile_id;

