create database abeillia;

use abeillia;
/* 用户表 */
CREATE TABLE user (
	id int(10) unsigned NOT NULL AUTO_INCREMENT,
	username varchar(40) NOT NULL,
	password varchar(60) NOT NULL,
	email varchar(200) NOT NULL,
	PRIMARY KEY (id)
);

create database mellisuga;

use mellisuga;
/* 成员信息表*/
CREATE TABLE member (
	id int(10) unsigned NOT NULL AUTO_INCREMENT,
	member_id int(10) unsigned NOT NULL,
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
	PRIMARY KEY (member_id)
);

/* 问题表 */
CREATE TABLE question (
	id int(10) NOT NULL AUTO_INCREMENT,
	questioner_id int(10) unsigned NOT NULL,
	question_title varchar(200) NOT NULL,
	question_content text NOT NULL,
	answers_num int(11) NOT NULL DEFAULT '0',
	followers_num int(11) NOT NULL DEFAULT '0',
	last_updated datetime NOT NULL,
	scan_num int(11) NOT null DEFAULT '0'
);

/* 答案表 */
CREATE TABLE answers (
	id int(10) NOT NULL AUTO_INCREMENT,
	question_id int(10) unsigned NOT NULL,
	answerer_author_id int(10) unsigned NOT NULL,
	answers text NOT NULL,
	answer_date datetime NOT NULL
);

/* 问题评论表 */

/* 问题标签表 */

/* 问题日志表 */


/* 答案赞同表 */
/* 答案感谢表 */
/* 答案收藏表 */
/* 答案没有帮助表 */



















