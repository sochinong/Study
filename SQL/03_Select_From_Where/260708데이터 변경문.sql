	use market_db;
drop table if exists hongong1;
	Create table hongong1 (toy_id int, toy_name char(4), age int);
	insert into hongong1 values (1, '우디', 25);
drop table if exists hongong1;
	Create table hongong1 (toy_id int, toy_name char(4), age int);
	insert into hongong1 (toy_id, toy_name) values (2, '버즈');
drop table if exists hongong1; -- 방금 깨달은건데 드롭을 일일이 할 필요가 없고 셀렉트로 보면 되는거 아님? 물론 create 작동하는지 보는 용도면 상관없긴해
	Create table hongong1 (toy_id int, toy_name char(4), age int);
	insert into hongong1 (toy_name, age, toy_id) values ('제시', 20, 3);
    
create table hongong2 (
	toy_id int Auto_increment primary key,
    toy_name char(4),
    age int);
    insert into hongong2 values (null, '보핍', 25);
    insert into hongong2 values (null, '슬링키', 22);
    insert into hongong2 values (null, '렉스', 21);
    select * from hongong2;
select last_insert_id(); -- 어느 숫자까지 증가되었는지

alter table hongong2 auto_increment=100;
	insert into hongong2 values (null, '재남', 35);
	select * from hongong2;
    
create table hongong3 (
	toy_id int auto_increment primary key,
    toy_name char(4),
    age int);
    alter table hongong3 auto_increment=1000; -- 시작값은 1000으로 지정
    set @@auto_increment_increment=3; -- 증가값은 3으로 지정
	insert into hongong3 values (null, '토마스', 20);
    insert into hongong3 values (null, '제임스', 23);
    insert into hongong3 values (null, '고든', 25);
    insert into hongong3 values (null, '토마스', 20), (null, '제임스', 23), (null, '고든', 25); -- 위 세줄과 같은 문장
    select * from hongong3;
    
    
Select count(*) from world.city;
desc world.city;
select * from world.city limit 5;
create table city_popul (city_name char(35), population int);
	insert into city_popul
    select name, population from world.city;
    

	use market_db;
update city_popul
	set city_name = '서울' -- 서울로 설정하라
	where city_name = 'seoul'; -- 이름이 seoul인 도시를
select * from city_popul where city_name = '서울';

update city_popul
	set city_name = '뉴욕', population=0
    where city_name = 'new york';
select * from city_popul where city_name = '뉴욕';
	
update city_popul
	set population = population / 10000;
select * from city_popul limit 5;

-- delete from 테이블이름 where 조건 ;
delete from city_popul
	where city_name like 'new%';
delete from city_popul
	where city_name like 'new%'
    limit 5;