select <열 목록> -- 내부조인
from <첫 번째 테이블>
	INNER JOIN <두 번째 테이블>
    on <조인될 조건>
[where 검색 조건];

use market_db;
select *
	from buy
		INNER JOIN member
        ON buy.mem_id = member.mem_id
	where buy.mem_id = 'grl'; -- grl을 추출
    
select *
 from buy
	inner join member
    on buy.mem_id = member.mem_id;
    
select mem_id, mem_name, prod_name, addr, concat(phone1, phone2) '연락처'
	from buy
		inner join member
        on buy.mem_id = member.mem_id; -- 'mem_id' in filed list is ambiguous
        
select buy.mem_id, mem_name, prod_name, addr, concat(phone1, phone2) '연락처' 
	from buy
		inner join member
        on buy.mem_id = member.mem_id;
        
select buy.mem_id, member.mem_name, buy.prod_name, member.addr, concat(member.phone1, member.phone2) '연락처'
	from buy
		inner join member
        on buy.mem_id = member.mem_id
	order by buy.mem_id;
        
select b.mem_id, m.mem_name, b.prod_name, m.addr, concat(m.phone1, m.phone2) '연락처'
	from buy B -- 별칭
		inner join member M -- 별칭
		on b.mem_id = m.mem_id;
        
select m.mem_id, m.mem_name, b.prod_name, m.addr
	from buy B -- 별칭
		inner join member M -- 별칭
		on b.mem_id = m.mem_id
	order by m.mem_id;
    

select <열 목록> -- 외부조인
from <첫 번째 테이블(left 테이블)>
	<left | right | full> outer join <두 번째 테이블(right 테이블)>
    on <조인될 조건>
[where 검색 조건] ; 

select m.mem_id, m.mem_name, b.prod_name, m.addr
	from member m
		left outer join buy B -- 왼쪽에 있는 회원 테이블 기준으로 외부 조인
        on m.mem_id = b.mem_id
	order by m.mem_id;
    
select m.mem_id, m.mem_name, b.prod_name, m.addr
	from buy b
		right outer join member m
        on m.mem_id = b.mem_id
	order by m.mem_id;
    
select distinct m.mem_id, b.prod_name, m.mem_name, m.addr
	from member m
		left outer join buy b
        on m.mem_id = b.mem_id
	where b.prod_name is null
    order by m.mem_id;
    

select *
 from buy
	cross join member; -- 상호 조인
    
select count(*) "데이터 개수"
	from sakila.inventory
		cross join world.city;
        
create table cross_table
	select *
		from sakila.actor -- 200건
			cross join world.country; -- 239건
            
select * from cross_table limit 5;


use market_db;
create table emp_table (emp char(4), manager char(4), phone varchar(8));
insert into emp_table values('대표', null, '0000');
insert into emp_table values('영업이사', '대표', '1111');
insert into emp_table values('관리이사', '대표', '2222');
insert into emp_table values('정보이사', '대표', '3333');
insert into emp_table values('영업과장', '영업이사', '1111-1');
insert into emp_table values('경리부장', '관리이사', '2222-1');
insert into emp_table values('인사부장', '관리이사', '2222-2');
insert into emp_table values('개발팀장', '정보이사', '3333-1');
insert into emp_table values('개발주임', '정보이사', '3333-1-1');

select <열 목록> -- 자체 조인
from <테이블> 별칭A
	inner join <테이블> 별칭B
    on <조인될 조건>
[where 검색 조건]

select A.emp "직원", B.emp "직속상관", B.phone "직속상관연락처"
	from emp_table A
		inner join emp_table B
        on a.manager = b.emp
	where a.emp = '경리부장';