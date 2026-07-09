use market_db;
select height from member where mem_name = '에이핑크';
select mem_name, height from member where height > 164;

select mem_name, height from member
	where height > (select height from member where mem_name = '에이핑크'); -- 세미콜론이 하나이므로 한 문장. select 안에 select 있는 서브쿼리