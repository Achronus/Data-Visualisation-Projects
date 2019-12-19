/* Create the database */
DROP DATABASE IF EXISTS fake_ig;
CREATE DATABASE IF NOT EXISTS fake_ig;
USE fake_ig;

/* Create the tables */
CREATE TABLE users
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE photos
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  image_url VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  comment_text VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (photo_id) REFERENCES photos(id)
);

CREATE TABLE likes
(
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (photo_id) REFERENCES photos(id),
  PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE follows
(
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (followee_id) REFERENCES users(id),
  PRIMARY KEY (follower_id, followee_id)
);

CREATE TABLE tags
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags
(
  photo_id INT NOT NULL,
  tag_id INT NOT NULL,
  FOREIGN KEY (photo_id) REFERENCES photos(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id),
  PRIMARY KEY (photo_id, tag_id)
);

/*-----------------------------------------------------------------------*/
/* We want to reward our users who have been around the longest. */
/* Find the 5 oldest users */
SELECT *
FROM users
ORDER BY created_at 
LIMIT 5;

/* What is the best day to schedule an ad campaign? */
/* Find what day of the week most users register on */
SELECT
  DAYNAME(created_at) as day,
  COUNT(*) as total
FROM users
GROUP BY day
ORDER BY total DESC;

/* We want to target our inactive users with an email campaign */
/* Find the users who have never posted a photo */
SELECT 
  users.username
FROM users
LEFT JOIN photos
  ON users.id = photos.user_id
WHERE photos.id IS NULL;

/* We ran a new contest and want to find who got the most likes on a single photo */
SELECT
  users.username,
  photos.id,
  photos.image_url,
  COUNT(*) as total
FROM photos
INNER JOIN likes
  ON likes.photo_id = photos.id
INNER JOIN users
  ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 5;

/* Our investors are interested to know... */
/* How many times does the average user post? */
/* [total photos] / [total users] */
SELECT
  ROUND((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users), 2)
AS average_user_posts;

/* A brand wants to know which hashtags to use in a post */
/* What are the top 5 most commonly used hashtags? */
SELECT 
  tags.tag_name,
  COUNT(*) as total
FROM photo_tags
INNER JOIN tags
  ON photo_tags.tag_id = tags.id
GROUP BY tag_id 
ORDER BY total DESC
LIMIT 5;

/* We have a problem with bots on the site... */
/* Find the users who have liked every single photo on the site */
SELECT 
  users.username,
  COUNT(*) AS num_likes
FROM users
INNER JOIN likes
  ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);