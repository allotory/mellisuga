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
	is_admin` int(2) unsigned NOT NULL DEFAULT '0',
	avatar_path` varchar(30) DEFAULT NULL,
  	muted int(2) NOT NULL DEFAULT '0',
  	status int(2) NOT NULL DEFAULT '0',
	registrationdate datetime NOT NULL,
  	location varchar(100),
  	business varchar(50),
  	employment varchar(100),
  	position varchar(50),
  	education varchar(100),
  	major varchar(50),
  	description varchar(200),
	PRIMARY KEY (member_id)
);





















