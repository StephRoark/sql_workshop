
# Assignment 2 - One to Many Relationships

# make sure that tables do not already exist
DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS reviewers;

# creat the videos table with title, length of video and url

CREATE TABLE videos
( 
  video_ID  int PRIMARY KEY,
  Title varchar(50) NOT NULL,
  Length varchar(10) NOT NULL,
  URL varchar (100) NOT NULL
  );
 
 
 # insert data into videos table including at least 3 different entries
 
INSERT INTO videos (video_ID, Title, Length, URL) VALUES (1, 'MySQL Tutorial', '41:09', 'https://www.youtube.com/watch?v=yPu6qV5byu4');
INSERT INTO videos (video_ID, Title, Length, URL) VALUES (2, 'MySQL Beginner Tutorial 1 - Introduction to MySQL', '10:20', 'https://www.youtube.com/watch?v=nN4Kjdverzs');
INSERT INTO videos (video_ID, Title, Length, URL) VALUES (3, 'Create MySQL Database - MySQL Workbench Tutorial', '17;14', 'https://www.youtube.com/watch?v=K6w0bZjl_Lw');

# show videos table

SELECT * FROM videos;

 # create reviewers table 
  
CREATE TABLE reviewers

(
  video_ID int,
  UsersName varchar(30) NOT NULL,
  Rating int,
  Review varchar(75) NOT NULL  
);

# insert data into reviewers table with entries from 2 different reviewers

INSERT INTO reviewers (video_ID, UsersName, Rating, Review) VALUES(1, 'Steph Roark', 2, 'Too Long!');
INSERT INTO reviewers (video_ID, UsersName, Rating, Review) VALUES(2, 'Steph Roark', 3, 'Informational!');
INSERT INTO reviewers (video_ID, UsersName, Rating, Review) VALUES(3, 'Steph Roark', 5, 'Blows my mind');
INSERT INTO reviewers (video_ID, UsersName, Rating, Review) VALUES(2, 'Hank Roark', 1, 'Video is really long');
INSERT INTO reviewers (video_ID, UsersName, Rating, Review) VALUES(1, 'Hank Roark', 3, 'Easy to understand');
INSERT INTO reviewers (video_ID, UsersName, Rating, Review) VALUES(3, 'Hank Roark', 5, 'Great!');


# show reviewers table

SELECT * FROM reviewers;

# join information from both tables to show one set of information for reporting purposes

SELECT videos.Title, videos.length, reviewers.Rating, reviewers.Review
FROM videos
INNER JOIN  reviewers 
ON videos.video_ID = reviewers.video_ID;

