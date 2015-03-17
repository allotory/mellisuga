create database mellisuga;

use mellisuga;
/* ��Ա��Ϣ��*/
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

/* �û���ע�� */
/* ee��erͬʱ��ʾͬһ���û�A��
 * ���A�뵱ǰ�û������ע����Ϊ��1��1����
 * ������û�A�ǵ�ǰ�û���˿�ҵ�ǰ�û�û�й�עA ����Ϊ��0��1������֮��Ȼ*/
CREATE TABLE relationship (
	id int(11) NOT NULL AUTO_INCREMENT,
	member_id int(11) NOT NULL,
	followee_id int(11) NOT NULL,
	follower_id int(11) NOT NULL,
	PRIMARY KEY (id)
);

/* ����� */
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

/* �����ע�� */
CREATE TABLE follow (
	id int(11) NOT NULL AUTO_INCREMENT,
	question_id int(11) NOT NULL,
	follower_id int(11) NOT NULL,
	PRIMARY KEY (id)
);

/* �𰸱� */
CREATE TABLE answers (
	id int(11) NOT NULL AUTO_INCREMENT,
	question_id int(11) unsigned NOT NULL,
	author_id int(10) unsigned NOT NULL,
	answers text NOT NULL,
	answer_date datetime NOT NULL,
	PRIMARY KEY (id)
);

/* ����/�ش����۱� */
/* ����id���id������λ����ʱ��д������ȡһ */
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

/* �����ǩ�� */
CREATE TABLE topic (
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	fid int(11) NOT NULL,
	PRIMARY KEY (id)	
);

/* ������־�� */
/* event���� ��������⣬����˻��⣬�༭�����⣬�༭�˲���˵�����Ƴ��˲���˵�����Ƴ��˻����*/
CREATE TABLE qlog (
	id int(11) NOT NULL AUTO_INCREMENT,
	question_id int(11) NOT NULL,
	member_id int(11) NOT NULL,	
	event varchar(20) NOT NULL,
	log_date datetime default NULL,
	PRIMARY KEY (id) 
);

/* ������ͬ���������𰸣� */
CREATE TABLE favour (
	id int(11) NOT NULL AUTO_INCREMENT,
	comment_id int(11) NOT NULL,
	member_id int(11) NOT NULL,	
	PRIMARY KEY (id) 
);

/* ��ͶƱ�� */
CREATE TABLE vote (
	id int(11) NOT NULL AUTO_INCREMENT,
	answer_id int(11) NOT NULL,
	vote_up int(11) NOT NULL DEFAULT '0',
	vote_down int(11) NOT NULL DEFAULT '0',
	voter_id int(11) NOT NULL,
	PRIMARY KEY (id) 
);

/* �𰸸�л�� */
CREATE TABLE thanks (
	id int(11) NOT NULL AUTO_INCREMENT,
	answer_id int(11) NOT NULL,
	thanker_id int(11) NOT NULL,
	PRIMARY KEY (id) 
);

/* ���ղر� */
CREATE TABLE collection (
	id int(11) NOT NULL AUTO_INCREMENT,
	answer_id int(11) NOT NULL,
	collector_id int(11) NOT NULL,
	PRIMARY KEY (id)
);

/* ��û�а����� */
CREATE TABLE nohelp (
	id int(11) NOT NULL AUTO_INCREMENT,
	answer_id int(11) NOT NULL,
	collector_id int(11) NOT NULL,
	PRIMARY KEY (id)
);

/* ˽�ű� */
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

/* �Ի��� */
CREATE TABLE dialog (
	id int(11) NOT NULL AUTO_INCREMENT,
	member_id int(11) NOT NULL,
	PRIMARY KEY (id)
);













