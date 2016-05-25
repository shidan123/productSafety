--创建用户
create user test identified by test;  
--给用户授权
GRANT CONNECT,RESOURCE TO test;
--建表
--管理员表
DROP TABLE admin_info ;
CREATE TABLE admin_info
(
id NUMBER(4) PRIMARY KEY,
admin_code  VARCHAR2(30),
password VARCHAR2(8),
name VARCHAR2(20),
telephone VARCHAR2(15),
email VARCHAR2(50)
);
select * from admin_info;
--角色表
DROP TABLE role_info ;
CREATE TABLE role_info
(
	id NUMBER(11) PRIMARY KEY,
	name VARCHAR2(20)	 
);
--权限表
DROP TABLE privilege_info ;
CREATE TABLE  privilege_info
(
id NUMBER(4) PRIMARY KEY,
name VARCHAR2(20)
);
--管理员角色表
DROP TABLE admin_role ;
CREATE TABLE admin_role
(
admin_id NUMBER(4),
role_id NUMBER(4),
PRIMARY KEY(admin_id ,role_id)
);
--角色权限表
DROP TABLE role_privilege ;
CREATE TABLE role_privilege
(
role_id NUMBER(4),
privilege_id NUMBER(4),
PRIMARY KEY(role_id,privilege_id)
);

--产品表
alter table product_info
   drop primary key cascade;

drop table product_info cascade constraints;

create table product_info  (
	id                   number(4),
   product_id           varchar2(13)                      not null,
   product_name         varchar2(50),
   product_weight       varchar2(10),
   product_area         varchar2(30),
   product_brand        varchar2(20),
   safety_index         varchar2(30),
   createDate            date,
   expireDate           varchar2(10),
   energy              VARCHAR2(10),
	protein            VARCHAR2(8),
	fat                VARCHAR2(8),
	carbohydrate        VARCHAR2(8),
	sodium              VARCHAR2(10)
);

select id,product_id,product_name,product_weight,product_area,product_brand,safety_index,createDate,expireDate,
energy,protein,fat,carbohydrate,sodium from product_info;
--添加主键
alter table product_info
   add constraint pk_product_info primary key (product_id);

--添加外键
ALTER TABLE admin_role
ADD FOREIGN KEY(admin_id) REFERENCES admin_info(id);
ALTER TABLE admin_role
ADD FOREIGN KEY(role_id) REFERENCES role_info(id);

ALTER TABLE role_privilege
ADD FOREIGN KEY(role_id) REFERENCES role_info(id);
ALTER TABLE role_privilege
ADD FOREIGN KEY(privilege_id) REFERENCES privilege_info(id);
--添加序列
CREATE SEQUENCE admin_seq;
CREATE SEQUENCE role_seq;
CREATE SEQUENCE product_info_seq;
--添加数据
--admin_info
INSERT INTO admin_info VALUES
(admin_seq.nextval,'aaa','aaa','张三','13333333333','zs@asiainfo.com.cn');
INSERT INTO admin_info VALUES
(admin_seq.nextval,'AAA','AAA','张三','13333333333','zs@asiainfo.com.cn');
INSERT INTO admin_info VALUES
(admin_seq.nextval,'BBB','BBB','张三','13333333333','zs@asiainfo.com.cn');
INSERT INTO admin_info VALUES
(admin_seq.nextval,'admin','admin','李四','13333333333','ls@asiainfo.com.cn');
INSERT INTO admin_info VALUES
(admin_seq.nextval,'ccc','ccc','王五','13333333333','ww@asiainfo.com.cn');
INSERT INTO admin_info VALUES
(admin_seq.nextval,'fff','fff','王五','13333333333','ww@asiainfo.com.cn');
INSERT INTO admin_info VALUES
(admin_seq.nextval,'admin1','admin1','赵六','13333333333','zl@asiainfo.com.cn');
INSERT INTO admin_info VALUES
(admin_seq.nextval,'admin2','admin2','Joe','13333333333','Joe@asiainfo.com.cn');

--privilege_info
INSERT INTO privilege_info VALUES(1,'超级管理员');
INSERT INTO privilege_info VALUES(2,'用户管理员');
INSERT INTO privilege_info VALUES(3,'产品管理员');
INSERT INTO privilege_info VALUES(4,'普通用户');
INSERT INTO privilege_info VALUES(5,'角色管理');

select * from privilege_info;

--role_info
INSERT INTO role_info VALUES (role_seq.nextval,'超级管理员1');
INSERT INTO role_info VALUES (role_seq.nextval,'用户管理员1');
INSERT INTO role_info VALUES (role_seq.nextval,'产品管理员1');

INSERT INTO role_info VALUES (role_seq.nextval,'超级管理员2');
INSERT INTO role_info VALUES (role_seq.nextval,'用户管理员2');
INSERT INTO role_info VALUES (role_seq.nextval,'产品管理员2');
select * from role_info;
--中间表
INSERT INTO role_privilege VALUES(1,1);
INSERT INTO role_privilege VALUES(1,2);
INSERT INTO role_privilege VALUES(1,3);
INSERT INTO role_privilege VALUES(1,4);
INSERT INTO role_privilege VALUES(1,5);

INSERT INTO role_privilege VALUES(2,3);
INSERT INTO role_privilege VALUES(2,4);
INSERT INTO role_privilege VALUES(2,5);

INSERT INTO role_privilege VALUES(3,4);
INSERT INTO role_privilege VALUES(3,5);

INSERT INTO role_privilege VALUES(4,4);
INSERT INTO role_privilege VALUES(4,5);


INSERT INTO role_privilege VALUES(5,4);
INSERT INTO role_privilege VALUES(5,5);

INSERT INTO role_privilege VALUES(6,4);
INSERT INTO role_privilege VALUES(6,5);


select * from role_privilege;
--管理员角色表
INSERT INTO admin_role VALUES(1,1);
INSERT INTO admin_role VALUES(1,2);
INSERT INTO admin_role VALUES(1,3);
INSERT INTO admin_role VALUES(2,2);
INSERT INTO admin_role VALUES(3,3);
INSERT INTO admin_role VALUES(4,2);
INSERT INTO admin_role VALUES(5,2);
INSERT INTO admin_role VALUES(3,3);
INSERT INTO admin_role VALUES(6,1);
INSERT INTO admin_role VALUES(6,2);
INSERT INTO admin_role VALUES(6,3);
INSERT INTO admin_role VALUES(7,1);
INSERT INTO admin_role VALUES(7,2);
INSERT INTO admin_role VALUES(7,3);
INSERT INTO admin_role VALUES(8,3);
INSERT INTO admin_role VALUES(8,3);
INSERT INTO admin_role VALUES(8,3);

--产品表
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6940352201578','榛仁脆心巧克力','160g','中国广东省深圳市','美滋滋','5%',sysdate,'12','2399KJ','6.4g','38.5g','50.9g','129mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6924187820067','洽洽香瓜子','160g','安徽省合肥市','洽洽','5%',sysdate,'8','2505KJ','27.0g','50.2g','16.5g','618mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6921317989373','冰糖雪梨','1000ml','天津经济开发区','康师傅','5%',sysdate,'12','204KJ','0g','0g','12.0g','11mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6928002374186','姜汁红糖','350g','江苏南京','甘之圆','5%',sysdate,'24','1585KJ','2.9g','0g','50.9g','4.2mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6940352201577','榛仁脆心巧克力','160g','中国广东省深圳市','美滋滋','5%',sysdate,'12','2399KJ','6.4g','38.5g','50.9g','129mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6924187820068','洽洽香瓜子','160g','安徽省合肥市','洽洽','5%',sysdate,'8','2505KJ','27.0g','50.2g','16.5g','618mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6921317989374','冰糖雪梨','1000ml','天津经济开发区','康师傅','5%',sysdate,'12','204KJ','0g','0g','12.0g','11mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6928002374185','姜汁红糖','350g','江苏南京','甘之圆','5%',sysdate,'24','1585KJ','2.9g','0g','50.9g','4.2mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6940352201571','榛仁脆心巧克力','160g','中国广东省深圳市','美滋滋','5%',sysdate,'12','2399KJ','6.4g','38.5g','50.9g','129mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6924187820062','洽洽香瓜子','160g','安徽省合肥市','洽洽','5%',sysdate,'8','2505KJ','27.0g','50.2g','16.5g','618mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6921317989379','冰糖雪梨','1000ml','天津经济开发区','康师傅','5%',sysdate,'12','204KJ','0g','0g','12.0g','11mg');
INSERT INTO product_info VALUES
(product_info_seq.nextval,'6928002374180','姜汁红糖','350g','江苏南京','甘之圆','5%',sysdate,'24','1585KJ','2.9g','0g','50.9g','4.2mg');


commit;


select * from product_info;


select * from (
		select e.*,rownum rn from (
		select * from admin_info ai
		where ai.id in(
		select admin_id from 
		admin_role ar,
		role_privilege rp,
		role_info ri
		where 
		rp.role_id=ar.role_id
		and
		ri.id=rp.role_id)

