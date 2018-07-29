
DROP TABLE IF EXISTS groups_rooms;

DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS user_groups;

DROP TABLE IF EXISTS rooms;

CREATE TABLE user_groups
(
  group_ID int PRIMARY KEY,
  group_name varchar(30) NOT NULL
  );

INSERT INTO user_groups ( group_ID, group_name) VALUES (1, 'I.T.');
INSERT INTO user_groups ( group_ID, group_name) VALUES (2, 'Sales');
INSERT INTO user_groups ( group_ID, group_name) VALUES (3, 'Administration');
INSERT INTO user_groups ( group_ID, group_name) VALUES (4, 'Operations');

SELECT * FROM user_groups;

CREATE TABLE users
(
  user_ID int PRIMARY KEY,
  user_name varchar(30) NOT NULL,
  group_ID int,
  FOREIGN KEY (group_ID)
    REFERENCES user_groups(group_ID)

);

INSERT INTO users ( user_ID, user_name, group_ID) VALUES (1, 'Modesto', 1);
INSERT INTO users ( user_ID, user_name, group_ID) VALUES (2, 'Ayine', 1);
INSERT INTO users ( user_ID, user_name, group_ID) VALUES (3, 'Christopher', 2);
INSERT INTO users ( user_ID, user_name, group_ID) VALUES (4, 'Cheong Woo', 2);
INSERT INTO users ( user_ID, user_name, group_ID) VALUES (5, 'Saulat', 3);
INSERT INTO users ( user_ID, user_name) VALUES (6, 'Heidy');


SELECT * FROM users;

CREATE TABLE rooms
(
  room_name varchar(30) PRIMARY KEY 
  );

INSERT INTO rooms ( room_name) VALUES ('101');
INSERT INTO rooms ( room_name) VALUES ('102');
INSERT INTO rooms ( room_name) VALUES ('Auditorium A');
INSERT INTO rooms ( room_name) VALUES ('Auditorium B');

SELECT * FROM rooms;


CREATE TABLE groups_rooms
(
  group_ID int NOT NULL, FOREIGN KEY (group_ID) REFERENCES user_groups(group_ID),
  room_name varchar(30) NOT NULL , FOREIGN KEY (room_name) REFERENCES rooms(room_name)
);

INSERT INTO groups_rooms (group_ID, room_name) VALUES (1, '101');
INSERT INTO groups_rooms (group_ID, room_name) VALUES (1, '102');
INSERT INTO groups_rooms (group_ID, room_name) VALUES (2, '102');
INSERT INTO groups_rooms (group_ID, room_name) VALUES (2, 'Auditorium A');


SELECT * FROM groups_rooms;

#All groups, and the users in each group. A group should appear even if there are no users assigned to the group.

SELECT user_groups.group_name, users.user_name
FROM user_groups
LEFT JOIN users ON user_groups.group_ID = users.group_ID;

#All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
#assigned to them.

SELECT rooms.room_name, user_groups.group_name
FROM groups_rooms
RIGHT JOIN rooms ON rooms.room_name = groups_rooms.room_name
LEFT JOIN user_groups ON user_groups.group_ID = groups_rooms.group_ID;

#A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
#alphabetically by user, then by group, then by room.

SELECT users.user_name,user_groups.group_name, groups_rooms.room_name
FROM users
LEFT JOIN user_groups ON users.group_ID = user_groups.group_ID
LEFT JOIN groups_rooms ON user_groups.group_ID = groups_rooms.group_ID
ORDER BY users.user_name, user_groups.group_name, groups_rooms.room_name;