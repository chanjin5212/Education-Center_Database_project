--C-01.관리자계정

--관리자 계정 로그인
select * from tblManager;
select count(*) as cnt from tblManager where id = '입력id' and password = '입력password'; -- 0이면 실패 1이면 성공
