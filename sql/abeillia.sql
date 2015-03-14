create database abeillia;

use abeillia;
/* ”√ªß±Ì */
CREATE TABLE user (
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
	username varchar(40) NOT NULL,
	password varchar(60) NOT NULL,
	email varchar(200) NOT NULL,
	PRIMARY KEY (id)
);