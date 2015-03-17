create database mellisuga;

use mellisuga;
/* 成员信息表*/
CREATE TABLE member (
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
	member_id int(11) unsigned NOT NULL,
	fullname varchar(40) NOT NULL,
	gender int(11) NOT NULL,
	is_admin int(2) unsigned NOT NULL DEFAULT '0',
	avatar_path varchar(30) DEFAULT NULL,
  	muted int(2) NOT NULL DEFAULT '0',
  	status int(2) NOT NULL DEFAULT '0',
	registration_date datetime NOT NULL,
  	location varchar(100),
  	business varchar(50),
  	employment varchar(100),
  	position varchar(50),
  	education varchar(100),
  	major varchar(50),
  	description varchar(200),
	PRIMARY KEY (id)
);

/* 用户关注表 */
/* ee和er同时表示同一个用户A，
 * 如果A与当前用户互相关注则标记为（1，1），
 * 如果该用户A是当前用户粉丝且当前用户没有关注A 则标记为（0，1），反之亦然*/
CREATE TABLE relationship (
	id int(11) NOT NULL AUTO_INCREMENT,
	member_id int(11) NOT NULL,
	followee_id int(11) NOT NULL,
	follower_id int(11) NOT NULL,
	PRIMARY KEY (id)
);

/* 问题表 */
CREATE TABLE question (
	id int(11) NOT NULL AUTO_INCREMENT,
	questioner_id int(11) unsigned NOT NULL,
	question_title varchar(200) NOT NULL,
	question_content text NOT NULL,
	answers_num int(11) NOT NULL DEFAULT '0',
	followers_num int(11) NOT NULL DEFAULT '0',
	last_updated datetime NOT NULL,
	scan_num int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (id)
);

/* 问题关注表 */
CREATE TABLE follow (
	id int(11) NOT NULL AUTO_INCREMENT,
	question_id int(11) NOT NULL,
	follower_id int(11) NOT NULL,
	PRIMARY KEY (id)
);

/* 答案表 */
CREATE TABLE answers (
	id int(11) NOT NULL AUTO_INCREMENT,
	question_id int(11) unsigned NOT NULL,
	author_id int(10) unsigned NOT NULL,
	answers text NOT NULL,
	answer_date datetime NOT NULL,
	PRIMARY KEY (id)
);

/* 问题/回答评论表 */
/* 问题id与答案id按评论位置适时填写，二者取一 */
CREATE TABLE comment (
	id int(11) NOT NULL AUTO_INCREMENT,
	question_id int(11) NOT NULL,
	answer_id int(11) NOT NULL,
	reviewer_id int(11) unsigned NOT NULL,
	pid int(11) NOT NULL,
	rootid int(11) NOT NULL,
	content text NOT NULL,
	comment_date datetime NOT NULL,
	is_leaf smallint NOT NULL,
	favour_num int(11) NOT NULL,
	reply_num int(11) NOT NULL,
	PRIMARY KEY (id)
);

/* 问题标签表 */
CREATE TABLE topic (
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	fid int(11) NOT NULL,
	PRIMARY KEY (id)	
);

/* 问题日志表 */
/* event包括 添加了问题，添加了话题，编辑了问题，编辑了补充说明，移除了补充说明，移除了话题等*/
CREATE TABLE qlog (
	id int(11) NOT NULL AUTO_INCREMENT,
	question_id int(11) NOT NULL,
	member_id int(11) NOT NULL,	
	event varchar(20) NOT NULL,
	log_date datetime default NULL,
	PRIMARY KEY (id) 
);

/* 评论赞同表（不包括答案） */
CREATE TABLE favour (
	id int(11) NOT NULL AUTO_INCREMENT,
	comment_id int(11) NOT NULL,
	member_id int(11) NOT NULL,	
	PRIMARY KEY (id) 
);

/* 答案投票表 */
CREATE TABLE vote (
	id int(11) NOT NULL AUTO_INCREMENT,
	answer_id int(11) NOT NULL,
	vote_up int(11) NOT NULL DEFAULT '0',
	vote_down int(11) NOT NULL DEFAULT '0',
	voter_id int(11) NOT NULL,
	PRIMARY KEY (id) 
);

/* 答案感谢表 */
CREATE TABLE thanks (
	id int(11) NOT NULL AUTO_INCREMENT,
	answer_id int(11) NOT NULL,
	thanker_id int(11) NOT NULL,
	PRIMARY KEY (id) 
);

/* 答案收藏表 */
CREATE TABLE collection (
	id int(11) NOT NULL AUTO_INCREMENT,
	answer_id int(11) NOT NULL,
	collector_id int(11) NOT NULL,
	PRIMARY KEY (id)
);

/* 答案没有帮助表 */
CREATE TABLE nohelp (
	id int(11) NOT NULL AUTO_INCREMENT,
	answer_id int(11) NOT NULL,
	collector_id int(11) NOT NULL,
	PRIMARY KEY (id)
);

/* 私信表 */
CREATE TABLE message (
	id int(11) NOT NULL AUTO_INCREMENT,
	sender_id int(11) NOT NULL,
	receiver_id int(11) NOT NULL,
	message text NOT NULL,
	receiver_isdel smallint NOT NULL,
	sender_isdel smallint NOT NULL,
	send_time datetime NOT NULL,
	read_time datetime NOT NULL,
	is_read smallint NOT NULL,
	is_reply smallint NOT NULL,
	dialog_id int(11) NOT NULL,
	PRIMARY KEY (id)
);

/* 对话表 */
CREATE TABLE dialog (
	id int(11) NOT NULL AUTO_INCREMENT,
	member_id int(11) NOT NULL,
	PRIMARY KEY (id)
);













