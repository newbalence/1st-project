SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS favorit;
DROP TABLE IF EXISTS hit;
DROP TABLE IF EXISTS push;
DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS chat;
DROP TABLE IF EXISTS chatuser;
DROP TABLE IF EXISTS chatroom;
DROP TABLE IF EXISTS goal;
DROP TABLE IF EXISTS timer;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE board
(
	-- 게시판 번호
	bno int NOT NULL AUTO_INCREMENT COMMENT '게시판 번호',
	-- 사용자 아이디
	author varchar(255) NOT NULL COMMENT '사용자 아이디',
	-- 게시글 닉네임
	nick varchar(255) NOT NULL COMMENT '게시글 닉네임',
	-- 게시글 제목
	title varchar(255) NOT NULL COMMENT '게시글 제목',
	-- 게시글 본문
	content text NOT NULL COMMENT '게시글 본문',
	-- 게시글 작성일
	create_date timestamp DEFAULT NOW(), SYSDATE() NOT NULL COMMENT '게시글 작성일',
	-- 게시글 수정일
	update_date timestamp COMMENT '게시글 수정일',
	-- 0 : 전체
	-- 1 : 공부
	-- 2 : 독서
	-- 3 : 축구
	-- 4 : 런닝
	-- 5 : 헬스
	-- 99 : 공지
	-- 00 : 삭제
	-- 취미별 로 추가 예정
	board_type int NOT NULL COMMENT '0 : 전체
1 : 공부
2 : 독서
3 : 축구
4 : 런닝
5 : 헬스
99 : 공지
00 : 삭제
취미별 로 추가 예정',
	-- 게시글 세부 목록
	list_type int COMMENT '게시글 세부 목록',
	-- 첨부파일 원본 이름
	origin_name varchar(255) COMMENT '첨부파일 원본 이름',
	-- 첨부파일 업로드 이름
	upload_name varchar(255) COMMENT '첨부파일 업로드 이름',
	location varchar(255),
	-- 파일 사이즈
	file_size int COMMENT '파일 사이즈',
	PRIMARY KEY (bno)
);


CREATE TABLE chat
(
	-- 채팅 방번호
	chatno int NOT NULL AUTO_INCREMENT COMMENT '채팅 방번호',
	-- 채팅방번호
	chatroomno int NOT NULL COMMENT '채팅방번호',
	-- 사용자 아이디
	sender varchar(255) NOT NULL COMMENT '사용자 아이디',
	-- 채팅 본문
	chatcontent varchar(255) NOT NULL COMMENT '채팅 본문',
	-- 채팅시간
	chattime timestamp DEFAULT NOW(), SYSDATE() NOT NULL COMMENT '채팅시간',
	-- 사용자 닉네임
	nick varchar(255) NOT NULL COMMENT '사용자 닉네임',
	PRIMARY KEY (chatno)
);


CREATE TABLE chatroom
(
	-- 채팅방번호
	chatroomno int NOT NULL AUTO_INCREMENT COMMENT '채팅방번호',
	-- 채팅 방이름
	chatname varchar(255) NOT NULL COMMENT '채팅 방이름',
	-- 0 : 관리자
	-- 1 : 일반
	-- 2 : 삭제
	-- 
	chat_type int DEFAULT 1 NOT NULL COMMENT '0 : 관리자
1 : 일반
2 : 삭제
',
	PRIMARY KEY (chatroomno)
);


CREATE TABLE chatuser
(
	chatuserno int NOT NULL AUTO_INCREMENT,
	-- 채팅방번호
	chatroomno int NOT NULL COMMENT '채팅방번호',
	-- 사용자 아이디
	id varchar(255) NOT NULL COMMENT '사용자 아이디',
	PRIMARY KEY (chatuserno)
);


CREATE TABLE favorit
(
	-- 사용자 아이디
	id varchar(255) NOT NULL COMMENT '사용자 아이디',
	-- 게시판 타입
	-- 
	board_type int NOT NULL COMMENT '게시판 타입
',
	PRIMARY KEY (id, board_type)
);


CREATE TABLE goal
(
	-- 목표 번호
	goalno int NOT NULL AUTO_INCREMENT COMMENT '목표 번호',
	-- 사용자 아이디
	id varchar(255) NOT NULL COMMENT '사용자 아이디',
	-- 목표 시간
	goal_time int NOT NULL COMMENT '목표 시간',
	-- 목표 제목
	goal_title varchar(255) NOT NULL COMMENT '목표 제목',
	-- 목표 내용
	goal_cont varchar(255) NOT NULL COMMENT '목표 내용',
	PRIMARY KEY (goalno)
);


CREATE TABLE hit
(
	hitno int NOT NULL AUTO_INCREMENT,
	-- 사용자 아이디
	user varchar(255) NOT NULL COMMENT '사용자 아이디',
	-- 게시판 번호
	bno int NOT NULL COMMENT '게시판 번호',
	PRIMARY KEY (hitno)
);


CREATE TABLE push
(
	pushno int NOT NULL AUTO_INCREMENT,
	-- 사용자 아이디
	user varchar(255) NOT NULL COMMENT '사용자 아이디',
	-- 게시판 번호
	bno int NOT NULL COMMENT '게시판 번호',
	PRIMARY KEY (pushno)
);


CREATE TABLE reply
(
	-- 댓글번호
	rno int NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
	-- 사용자 아이디
	rauthor varchar(255) NOT NULL COMMENT '사용자 아이디',
	-- 게시판 번호
	bno int NOT NULL COMMENT '게시판 번호',
	rnick varchar(255) NOT NULL,
	-- 댓글 본문
	rcontent varchar(255) NOT NULL COMMENT '댓글 본문',
	-- 댓글 작성일
	create_date timestamp DEFAULT NOW(), SYSDATE() NOT NULL COMMENT '댓글 작성일',
	-- 댓글 수정일
	update_date timestamp COMMENT '댓글 수정일',
	PRIMARY KEY (rno)
);


CREATE TABLE timer
(
	timeno int NOT NULL AUTO_INCREMENT,
	-- 사용자 아이디
	id varchar(255) NOT NULL COMMENT '사용자 아이디',
	start_time timestamp,
	end_time timestamp,
	all_time int,
	add_time int,
	-- 목표시간 타입
	timer_type int COMMENT '목표시간 타입',
	PRIMARY KEY (timeno)
);


CREATE TABLE user
(
	-- 사용자 아이디
	id varchar(255) NOT NULL COMMENT '사용자 아이디',
	-- 사용자 비밀번호
	pw varbinary(255) NOT NULL COMMENT '사용자 비밀번호',
	-- 사용자 이름
	name varchar(255) NOT NULL COMMENT '사용자 이름',
	-- 사용자 닉네임
	nick varchar(255) NOT NULL COMMENT '사용자 닉네임',
	-- 사용자 이메일
	email varchar(255) NOT NULL COMMENT '사용자 이메일',
	-- 사용자 성별
	gender varchar(255) COMMENT '사용자 성별',
	-- 1 : 공부
	-- 2 : 독서
	-- 3 : 축구
	-- 4 : 런닝
	-- 5 : 헬스
	hobby int NOT NULL COMMENT '1 : 공부
2 : 독서
3 : 축구
4 : 런닝
5 : 헬스',
	create_date timestamp DEFAULT NOW(), SYSDATE() NOT NULL,
	update_date timestamp,
	delete_date timestamp,
	-- 현재 사용 이전 비밀번호
	last_pw varchar(255) COMMENT '현재 사용 이전 비밀번호',
	-- 0 : 관리자
	-- 1 : 일반회원
	-- 2 : 탈퇴회원
	-- 99 : 차단회원
	user_type int DEFAULT 1 COMMENT '0 : 관리자
1 : 일반회원
2 : 탈퇴회원
99 : 차단회원',
	PRIMARY KEY (id),
	UNIQUE (nick),
	UNIQUE (email)
);



/* Create Foreign Keys */

ALTER TABLE favorit
	ADD FOREIGN KEY (board_type)
	REFERENCES board (bno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE hit
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE push
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE chat
	ADD FOREIGN KEY (chatroomno)
	REFERENCES chatroom (chatroomno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE chatuser
	ADD FOREIGN KEY (chatroomno)
	REFERENCES chatroom (chatroomno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (author)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE chat
	ADD FOREIGN KEY (sender)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE chatuser
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE favorit
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE goal
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE hit
	ADD FOREIGN KEY (user)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE push
	ADD FOREIGN KEY (user)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (rauthor)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE timer
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



