// movie table 생성

CREATE TABLE movie (
movie_idx INT PRIMARY KEY,
movie_title VARCHAR(20),
movie_grade VARCHAR(20),
movie_genre VARCHAR(20),
movie_open_date DATE,
movie_runtime INT,
movie_intro VARCHAR(2000),
movie_actors VARCHAR(500),
movie_picture VARCHAR(100),
movie_viewer INT DEFAULT 0);


// comment table 생성

CREATE TABLE comment (
comment_idx INT PRIMARY KEY,
movie_idx INT,
member_id VARCHAR(20),
comment_star INT,
comment_content VARCHAR(2000),
comment_date DATE
);

//임시로 넣을 영화 
INSERT INTO movie VALUES (1, '극장판 뽀로로', '12', 'animation', now(), 120, '뽀로로', '루피', '뽀로로 포스터', 100);

INSERT INTO movie VALUES (2, '아바타', '15', 'action', now(), 120, '아바타 설명', '아바타 배우', '아바타 포스터', 100);

INSERT INTO movie VALUES (3, '블팬', '15', 'action', now(), 120, '블팬 설명', '블팬 배우', '블팬 포스터', 100);
