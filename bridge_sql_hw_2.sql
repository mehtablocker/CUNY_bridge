DROP DATABASE IF EXISTS how_to_mysql_videos;

CREATE DATABASE how_to_mysql_videos DEFAULT CHARACTER SET utf8;

USE how_to_mysql_videos;

CREATE TABLE video (
	video_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    length_min DOUBLE,
    url VARCHAR(255),
    
    PRIMARY KEY(video_id)
    ) ENGINE = InnoDB;

CREATE TABLE review (
	review_id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(255),
    rating FLOAT,
    review_text TEXT,
    video_id INT,
    
    PRIMARY KEY(review_id),
    CONSTRAINT FOREIGN KEY(video_id)
		REFERENCES video (video_id)
        ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE = InnoDB;

INSERT INTO video (title, length_min, url)
	VALUES ('MySQL Tutorial', 41.2, 'https://www.youtube.com/watch?v=yPu6qV5byu4');
INSERT INTO video (title, length_min, url)
	VALUES ('MySQL Beginner Tutorial 1', 10.4, 'https://www.youtube.com/watch?v=nN4Kjdverzs');
INSERT INTO video (title, length_min, url)
	VALUES ('Introduction to MySQL Workbench', 11.75, 'https://www.youtube.com/watch?v=RSHevYMwCVw');

INSERT INTO review (user_name, rating, review_text, video_id)
	VALUES ('Johnny5', 3.8, 'Not bad.', 1);
INSERT INTO review (user_name, rating, review_text, video_id)
	VALUES ('LindaK', 4.2, 'Very good.', 1);
INSERT INTO review (user_name, rating, review_text, video_id)
	VALUES ('Joan7', 2.1, 'Did not like it.', 2);
INSERT INTO review (user_name, rating, review_text, video_id)
	VALUES ('StephanieQ', 3, 'Pretty mediocre.', 2);
INSERT INTO review (user_name, rating, review_text, video_id)
	VALUES ('Johnny5', 4.6, 'Excellent!', 3);
INSERT INTO review (user_name, rating, review_text, video_id)
	VALUES ('AaronV', 4.1, 'Solid video.', 3);

SELECT * FROM video v
	LEFT JOIN review r ON v.video_id = r.video_id;
