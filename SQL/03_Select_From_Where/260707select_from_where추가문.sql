	use market_db; -- 여기서는 가독성을 위해 탭 키로 들여썼지만, 파이썬에서는 들여쓰기도 문법 판정이니 파이썬에선 이러지 않겠습니다.
select mem_id, mem_name, debut_date 
	from member 
		order by debut_date;
select mem_id, mem_name, debut_date 
	from member 
		order by debut_date desc;
select mem_id, mem_name, debut_date, height
	from member 
		order by height desc
			where height >= 164; -- 오류 발생( -- 뒤 문장은 무시하므로 주석으로 사용한다)
select mem_id, mem_name, debut_date, height
	from member 
		where height >= 164
			order by height desc; -- 작동
select mem_id, mem_name, debut_date, height
	from member 
		where height >= 164
			order by height desc, debut_date ASC;
select * from member limit 3; 
select mem_name, debut_date 
	from member 
		order by debut_date   
			limit 3;
select mem_name, height 
	from member
		order by height desc
			limit 3, 2;
select addr from member; -- 중복 데이터가 나온다
select addr from member order by addr; -- 정렬은 되지만 세기 귀찮다
select distinct addr from member; -- 열 앞에 distinct 붙이면 중복된 값은 1개만 출력된다

select mem_id, amount from buy order by mem_id;
select mem_id, SUM(Amount) from buy group by mem_id;
select mem_id "회원 아이디" , SUM(Amount) "총 구매 개수" from buy group by mem_id;
select avg(amount) "평균 구매 개수" from buy;
select mem_id, avg(amount) "평균 구매 개수" from buy group by mem_id;
select count(*) from member;
select count(phone1) "연락처가 있는 회원" from member;

select mem_id "회원 아이디", sum(price*amount) "총 구매 금액" 
	from buy
		group by mem_id;
        
select mem_id "회원 아이디", sum(price*amount) "총 구매 금액"
	from buy
		where sum(price*amount) > 1000;
			group by mem_id; -- 오류 발생, where 대신 having을 사용해야 함
select mem_id "회원 아이디", sum(price*amount) "총 구매 금액"
	from buy
		group by mem_id
			having sum(price*amount) > 1000;
select mem_id "회원 아이디", sum(price*amount) "총 구매 금액"
	from buy
		group by mem_id
			having sum(price*amount) > 1000
				order by sum(price*amount) desc;
-- 순서는 다음과 같습니다. 
select
	from
    where
    group_by
    having
    order by
    limit