-- :name save-score! :! :n
-- :doc creates a new score record
INSERT INTO scores
    (golfer_name, course_name, date_played, rating, slope, score)
VALUES
    (:golfer_name, :course_name, :date_played, :rating, :slope, :score)

-- :name update-score! :! :n
-- :doc updates an existing score record
UPDATE scores
SET golfer_name = :golfer_name, course_name
= :course_name, date_played = :date_played, rating = :rating, slope = :slope, score = :score
WHERE id = :id

-- :name get-all-scores :? :*
-- :doc retrieves all score records
SELECT *
FROM scores

-- :name get-score :? :1
-- :doc retrieves a score record given the id
SELECT *
FROM scores
WHERE id = :id

-- :name get-golfer-scores :? :*
-- :doc retrieves all score records for given golfer
SELECT *
FROM scores
WHERE golfer_name = :golfer_name

-- :name delete-score! :! :n
-- :doc deletes a score record given the id
DELETE FROM scores
WHERE id = :id

-- :name create-user! :! :n
-- :doc creates a new user record
INSERT INTO users
    (name, email, password)
VALUES
    (:name, :email, :password)

-- :name update-user! :! :n
-- :doc updates an existing user record
UPDATE users
SET name = :name, email
= :email, password = :password
WHERE id = :id

-- :name get-users :? :*
-- :doc retrieves all user records
SELECT *
FROM users

-- :name get-user :? :1
-- :doc retrieves a user record given the id
SELECT *
FROM users
WHERE id = :id

-- :name delete-user! :! :n
-- :doc deletes a user record given the id
DELETE FROM users
WHERE id = :id

