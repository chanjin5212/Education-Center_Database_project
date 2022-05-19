-- 교육생 로그인 
select count(*) from tblStudent where tel = '입력 전화번호' and jumin = '입력 주민번호 뒷자리'; -- 0이면 로그인 실패, 1이면 성공