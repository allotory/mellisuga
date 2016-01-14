create database mellisuga;

use mellisuga;

/* 
 * 成员信息表
 */
CREATE TABLE IF NOT EXISTS member (
	id int(11) NOT NULL AUTO_INCREMENT,				/* 成员ID（唯一标识） */
	fullname varchar(64) NOT NULL,					/* 全名 */
	gender int(11) NOT NULL DEFAULT '0',			/* 性别  1:male , 2:female , 3: other */
	avatar_path varchar(256) DEFAULT NULL,			/* 头像路径 */
  	location varchar(128) DEFAULT NULL,			/* 居住位置 */
  	business varchar(128) DEFAULT NULL,			/* 行业 */
  	employment varchar(128) DEFAULT NULL,			/* 公司或组织名称 */
  	position varchar(128) DEFAULT NULL,			/* 职位 */
  	education varchar(128) DEFAULT NULL,			/* 学校或教育机构 */
  	major varchar(128) DEFAULT NULL,				/* 专业 */
  	description varchar(256) DEFAULT NULL,			/* 个人描述 */
	autograph varchar(128) DEFAULT NULL,			/* 签名 */
	approve_num int(11) NOT NULL DEFAULT '0',		/* 获得赞同数 */
	thank_num int(11) NOT NULL DEFAULT '0',		/* 获得感谢数 */
	question_num int(11) NOT NULL DEFAULT '0',		/* 提问数 */
	answer_num int(11) NOT NULL DEFAULT '0',		/* 回答数 */
	collect_num int(11) NOT NULL DEFAULT '0',		/* 收藏夹数 */
	personality_url varchar(64) DEFAULT NULL,		/* 个性网址 */
	is_emailactive int(11) NOT NULL DEFAULT '0',	/* 邮箱是否激活 0：否， 1：是 */
	user_id int NOT NULL DEFAULT '0',				/* 用户ID */
  	PRIMARY KEY (id)
);

/*
 * 角色表
 */
CREATE TABLE IF NOT EXISTS role (
	id int unsigned NOT NULL AUTO_INCREMENT,	/* 角色 ID（唯一标识） */
	rolename varchar(32) NOT NULL,				/* 角色名 */
	pid int unsigned DEFAULT '0',				/* 父角色 ID */
	status tinyint(1) unsigned NOT NULL,		/* 启用状态：0-表示禁用，1-表示启用 */
	remark varchar(256) DEFAULT NULL,			/* 备注信息 */
	PRIMARY KEY(id),
	KEY rolename (rolename),
	KEY pid (pid),
	KEY status (status)
);

/*
 * 用户与角色对应表
 */
CREATE TABLE IF NOT EXISTS role_member (
	role_id int unsigned NOT NULL DEFAULT '0',			/* 角色 ID（唯一标识） */
	member_id int unsigned NOT NULL DEFAULT '0',		/* 成员 ID（唯一标识） */
	PRIMARY KEY(role_id, member_id)
);

/*
 * 权限表
 */
CREATE TABLE IF NOT EXISTS permission (
	id int unsigned NOT NULL AUTO_INCREMENT,	/* 权限 ID（唯一标识） */
	name varchar(32) NOT NULL,					/* 权限名称（英文名，对应应用控制器、应用、方法名） */
	title varchar(64) DEFAULT NULL,			/* 权限名称 */
	status tinyint(1) DEFAULT '0',				/* 启用状态：0-表示禁用，1-表示启用 */
	remark varchar(256) DEFAULT NULL,			/* 备注信息 */
	sort smallint(6) unsigned DEFAULT '50',	/* 排序值（默认值为50） */
	pid smallint(6) unsigned NOT NULL,			/* 父权限 ID（如:方法pid对应相应的控制器） */
	level tinyint(1) unsigned NOT NULL,			/* 权限类型：1-表示应用（模块）, 2-表示控制器, 3-表示方法 */
	PRIMARY KEY (id),
	KEY name (name),
	KEY level (level),
	KEY pid (pid),
	KEY status (status)
);

/**
 * 角色权限对应表
 */
CREATE TABLE IF NOT EXISTS role_permission (
	role_id int unsigned NOT NULL DEFAULT '0',			/* 角色 ID（唯一标识） */
	permission_id int unsigned NOT NULL DEFAULT '0',	/* 权限 ID（唯一标识） */
	PRIMARY KEY(role_id, permission_id)
);

/* 
 * 用户关注表
 *
 ** ee和er同时表示同一个用户A，
 * 如果A与当前用户互相关注则标记为（1，1），
 * 如果该用户A是当前用户粉丝且当前用户没有关注A 则标记为（0，1），反之亦然*/
CREATE TABLE IF NOT EXISTS relationship (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 关系ID（唯一标识） */
	member_id int(11) NOT NULL,					/* 成员ID */
	followee_id int(11) NOT NULL,				/* 当前成员关注的人  */		
	follower_id int(11) NOT NULL,				/* 当前成员的关注者  */
	PRIMARY KEY (id)
);

/* 
 * 问题表 
 */
CREATE TABLE IF NOT EXISTS question (
	id int(11) NOT NULL AUTO_INCREMENT,				/* 问题ID（唯一标识） */
	question_title varchar(256) NOT NULL,			/* 问题标题 */
	question_content text DEFAULT NULL,			/* 问题内容 */
	answers_num int(11) NOT NULL DEFAULT '0',		/* 回答数 */
	followers_num int(11) NOT NULL DEFAULT '0',	/* 关注人数 */
	last_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	/* 更新时间 */
	scan_num int(11) NOT NULL DEFAULT '0',			/* 浏览数 */
	reply_num int(11) NOT NULL,						/* 评论数 */
	is_anonymous int(11) NOT NULL DEFAULT '0',		/* 是否匿名 1：是， 0：否 */
	member_id int(11) NOT NULL,						/* 提问用户 */
	PRIMARY KEY (id)
);

/**
 * 草稿表
 */
CREATE TABLE IF NOT EXISTS draft (
	id int(11) NOT NULL AUTO_INCREMENT,				/* 草稿问题ID（唯一标识） */
	draft_title varchar(256) NOT NULL,				/* 草稿问题标题 */
	draft_content text NOT NULL,					/* 草稿问题内容 */
	last_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	/* 草稿更新时间 */
	is_anonymous int(11) NOT NULL DEFAULT '0',		/* 草稿是否匿名 1：是， 0：否 */
	member_id int(11) NOT NULL,						/* 草稿提问用户 */
	PRIMARY KEY (id)
);

/**
 * 动态表
 */
CREATE TABLE IF NOT EXISTS trends (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 动态ID */
	trends_id int(11) NOT NULL,					/* 动态类型所对应的ID,如关注和提出问题对应的是问题ID，赞同答案和回答问题对应的是答案ID */
	trends_type varchar(64) NOT NULL,			/* 动态类型 1：关注该问题，2：赞同该回答，3：回答了该问题，4：提了一个问题*/
	p_trends_id int(11) NOT NULL DEFAULT '0',	/* 父动态类型所对应的ID，赞同答案和回答问题对应的是问题ID */
	p_trends_type varchar(64) DEFAULT NULL,	/* 父动态类型 1：赞同该回答——对应问题，2：回答了该问题——对应问题*/
	trends_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,		/* 动态时间 */
	trends_member int(11) NOT NULL,				/* 动态发起人 */
	PRIMARY KEY (id)
);

/* 
 * 问题关注表
 */
CREATE TABLE IF NOT EXISTS follow (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 问题关注ID（唯一标识）*/
	question_id int(11) NOT NULL,				/* 被关注的问题ID（唯一标识） */
	follower_id int(11) NOT NULL,				/* 问题关注人ID（唯一标识）*/
	PRIMARY KEY (id)
);

/* 
 * 答案表 
 */
CREATE TABLE IF NOT EXISTS answers (
	id int(11) NOT NULL AUTO_INCREMENT,					/* 答案ID（唯一标识） */
	question_id int(11) unsigned NOT NULL,				/* 问题ID（唯一标识） */
	author_id int(10) unsigned NOT NULL,				/* 作者ID（唯一标识） */
	answers text NOT NULL,								/* 答案 */
	answer_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,		/* 回答或更新时间 */
	reply_num int(11) NOT NULL,							/* 评论数 */
	is_top_answer int(11) NOT NULL DEFAULT '0', 		/* 是否是精华答案 */
	is_anonymous int(11) NOT NULL DEFAULT '0',			/* 是否匿名 1：是， 0：否 */
	PRIMARY KEY (id)
);

/* 
 * 问题/回答评论表
 *
 ** 问题id与答案id按评论位置适时填写，二者取一 */
CREATE TABLE IF NOT EXISTS comment (
	id int(11) NOT NULL AUTO_INCREMENT,					/* 评论ID（唯一标识） */
	question_id int(11) NOT NULL DEFAULT '0',			/* 被评论的问题ID（唯一标识） */
	answer_id int(11) NOT NULL DEFAULT '0',			/* 被评论的答案ID（唯一标识） */
	reviewer_id int(11) NOT NULL DEFAULT '0',			/* 评论用户ID（唯一标识） */
	parent_comment_id int(11) NOT NULL DEFAULT '0',	/* 被回复评论的ID（唯一标识） */
	content text NOT NULL,								/* 评论内容 */
	comment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	/* 评论时间 */
	favour_num int(11) NOT NULL DEFAULT '0',			/* 赞同数量 */
	PRIMARY KEY (id)
);

/* 
 * 问题标签表
 */
CREATE TABLE IF NOT EXISTS tag (
	id int(11) NOT NULL AUTO_INCREMENT, 			/* 标签ID（唯一标识） */
	tagname varchar(50) NOT NULL, 					/* 标签内容 */
	question_id int(11) NOT NULL DEFAULT '0',		/* 标签的问题ID（唯一标识） */	
	PRIMARY KEY (id)	
);

/* 
 * 问题日志表 
 *
 ** event包括 添加了问题，添加了话题，编辑了问题，编辑了补充说明，移除了补充说明，移除了话题等*/
CREATE TABLE IF NOT EXISTS qlog (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 日志ID（唯一标识） */
	question_id int(11) NOT NULL,				/* 问题ID（唯一标识） */
	member_id int(11) NOT NULL,					/* 用户ID（唯一标识） */
	event varchar(20) NOT NULL,				/* 日志事件 */
	log_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	/* 日志记录时间 */
	PRIMARY KEY (id) 
);

/* 
 * 评论赞同表（不包括答案） 
 */
CREATE TABLE IF NOT EXISTS favour (
	id int(11) NOT NULL AUTO_INCREMENT,		/* 赞同ID（唯一标识） */
	comment_id int(11) NOT NULL,			/* 被赞同评论ID（唯一标识） */
	member_id int(11) NOT NULL,				/* 用户ID（唯一标识） */
	PRIMARY KEY (id) 
);

/* 
 * 答案投票表
 */
CREATE TABLE IF NOT EXISTS vote (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 投票ID（唯一标识） */
	answer_id int(11) NOT NULL,					/* 答案ID（唯一标识） */
	voter_id int(11) NOT NULL,					/* 投票用户ID */
	vote_type varchar(16) NOT NULL,			/* 投票 up、down、unconcern */
	PRIMARY KEY (id) 
);

/**
 * 邀请表
 */
CREATE TABLE IF NOT EXISTS invite(
	id int(11) NOT NULL AUTO_INCREMENT,		/* 邀请ID（唯一标识） */
	question_id int(11) NOT NULL,			/* 问题ID */
	inviter_id int(11) NOT NULL,			/* 邀请人ID */
	invitee_id int(11) NOT NULL,			/* 被邀请人ID */
	PRIMARY KEY (id) 
);

/* 
 * 答案感谢表 
 */
CREATE TABLE IF NOT EXISTS thanks (
	id int(11) NOT NULL AUTO_INCREMENT,		/* 感谢ID（唯一标识） */
	answer_id int(11) NOT NULL,				/* 被感谢答案ID */
	thanker_id int(11) NOT NULL,			/* 感谢用户ID */
	PRIMARY KEY (id) 
);

/*
 * 答案收藏夹表
 * */
CREATE TABLE IF NOT EXISTS collection_folder (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 收藏夹ID（唯一标识） */
	foldername varchar(256) NOT NULL,			/* 收藏夹名称 */
	description varchar(256) DEFAULT NULL,		/* 收藏夹描述 */
	owner_id int(11) NOT NULL,					/* 创建者ID */
	answers_num int(11) NOT NULL,				/* 包含答案数量 */
	followers_num int(11) NOT NULL,				/* 关注者数量 */
	is_public int(11) NOT NULL DEFAULT '1',	/* 是否公开 0：否， 1：是 */
	PRIMARY KEY (id)
);

/* 
 * 答案收藏表 
 */
CREATE TABLE IF NOT EXISTS collection (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 收藏ID（唯一标识） */
	answer_id int(11) NOT NULL,					/* 被收藏的答案ID */
	collection_folder_id int(11) NOT NULL,		/* 所属收藏夹ID */
	owner_id int(11) NOT NULL,					/* 收藏夹所属用户ID */
	PRIMARY KEY (id)
);

/*
 * 收藏夹关注表
 */
CREATE TABLE IF NOT EXISTS collection_folder_follow (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 收藏ID（唯一标识） */
	collection_folder_id int(11) NOT NULL,		/* 收藏夹ID */
	follower_id int(11) NOT NULL,				/* 收藏夹关注者ID */
	PRIMARY KEY (id)
);

/* 
 * 答案没有帮助表 
 */
CREATE TABLE IF NOT EXISTS nohelp (
	id int(11) NOT NULL AUTO_INCREMENT,		/* 答案没有帮助ID（唯一标识） */
	answer_id int(11) NOT NULL,				/* 没有帮助答案ID */
	member_id int(11) NOT NULL,				/* 用户ID */
	PRIMARY KEY (id)
);

/*
 * 屏蔽用户
 */
CREATE TABLE IF NOT EXISTS block (
	id int(11) NOT NULL AUTO_INCREMENT,		/* 屏蔽表ID（唯一标识） */
	member_id int(11) NOT NULL,				/* 当前用户ID */
	blocked_id int(11) NOT NULL,			/* 被屏蔽用户ID */
	PRIMARY KEY (id)
);

/**
 * 	（^为直接插入存储 ， #为动态读取）
 * 
 * 用户对用户：
 * 	1. 私信 ^ -- PrivateMsg
 * 
 * 系统对用户：
 * 	1. 提醒
 * 		别人邀请你回答一个问题^	-- InviteMsg
 * 		别人评论了你的回答^		-- CommentAnswerMsg
 * 		别人评论了你的问题^		-- CommentQuestionMsg
 * 		别人回答了你的问题^		-- AnswerQuestionMsg
 * 		@用户^					-- AtUserMsg
 * 		二级回复^					-- ReplyCommentMsg
 * 	2. 系统通知
 * 		别人关注了你^				-- FollowingYouMsg
 * 		你关注的问题有了一个新回答 #-- NewAnswerMsg
 * 		系统公告#					-- SystemNotice
 * 		别人赞同了你的回答^		-- AgreeAnswerMsg
 * 		别人感谢了你的回答^		-- ThankYouAnswerMsg
 */

/*
 * 消息内容表
 */
CREATE TABLE IF NOT EXISTS message_text (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 消息内容ID（唯一标识） */
	content text NOT NULL,						/* 消息内容 */
	PRIMARY KEY (id)
);

/*
 * 公共消息表
 */
CREATE TABLE IF NOT EXISTS public_message (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 公共消息ID（唯一标识） */
	text_id int(11) NOT NULL,					/* 消息内容ID */
	send_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	/* 发送时间 */
	message_type varchar(64) NOT NULL,				/* 消息类型  */
	message_group_id int(11) NOT NULL,			/* 关注问题的用户组  0:默认所有人*/
	PRIMARY KEY (id)
);

/*
 * 消息记录表
 */
CREATE TABLE IF NOT EXISTS message_log (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 用户消息ID（唯一标识） */
	sender_id int(11) NOT NULL,					/* 发送用户ID */
	receiver_id int(11) NOT NULL,				/* 接收用户ID */
	text_id int(11) NOT NULL,					/* 消息内容ID */
	send_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	/* 发送时间 */
	read_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	/* 阅读时间 */
	message_type varchar(64) NOT NULL,				/* 消息类型  */
	sender_isdel smallint NOT NULL,			/* 发送用户是否删除 */
	receiver_isdel smallint NOT NULL,			/* 接收用户是否删除 */
	is_read smallint NOT NULL,					/* 是否已读 */
	message_group_id int(11) NOT NULL,			/* 关注问题的用户组 */
	PRIMARY KEY (id)
);

/**
 * 消息组表
 */
CREATE TABLE IF NOT EXISTS message_group (
	id int(11) NOT NULL AUTO_INCREMENT,			/* 消息组ID（唯一标识） */
	member_id int(11) NOT NULL,					/* 用户ID */
	question_id int(11) NOT NULL,				/* 问题ID */
	answer_id int(11) NOT NULL,					/* 答案ID */
	PRIMARY KEY (id)
);

/**
 * 举报类型表
 */
CREATE TABLE IF NOT EXISTS report_type (
	id int(11) NOT NULL AUTO_INCREMENT,				/* 举报类型主键ID（唯一标识） */
	report_type_content varchar(64) NOT NULL;	    /* 举报类型 */
	is_common int(11) NOT NULL,						/* 判断是否是通用类型（即答案评论类型） */
	PRIMARY KEY (id)
);
	
/**
 * 举报表
 */
CREATE TABLE IF NOT EXISTS report (
	id int(11) NOT NULL AUTO_INCREMENT,		/* 举报主键ID（唯一标识） */
	report_type_id int(11) NOT NULL,		/* 举报类型 ID */
	report_category int(11) NOT NULL,		/* 举报内容所属分类 0：问题，1：答案，2：评论 */
	report_category_id int(11) NOT NULL,	/* 举报内容所属分类对应的问题、评论、答案id */
	member_id int(11) NOT NULL,				/* 举报用户ID（唯一标识） */
	PRIMARY KEY (id)
);
