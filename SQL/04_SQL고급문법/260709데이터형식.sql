use market_db;
create table hongong4 (
	tinyint_col tinyint,
    smallint_col smallint,
    int_col int,
    bigint_col bigint );
    
insert into hongong4 values(127, 32767, 2147483647, 9000000000000000000);
insert into hongong4 values(128, 32768, 2147483648, 90000000000000000000); -- out of range

create table big_table (
data1 char(256),
data2 varchar(16384) ); -- length too big, use BLOB or TEXT

create database netflix_db;
use netflix_db;
create table movie (
movie_id int,
movie_title varchar(30),
movie_director varchar(20),
movie_star varchar(20),
movie_script longtext,
movie_film longblob
)
