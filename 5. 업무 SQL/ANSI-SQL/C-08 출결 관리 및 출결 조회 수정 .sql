--관리자_ 출결 관리 및 출결 조회 수정 .sql

-- 선택한 과정의 출결 상태

select 
    a.name "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.name, su.seq from tblOpenedCourse os
    inner join tblsignup su on os.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
where os.seq = '선택한 과정seq') a
    cross join vwdate1 vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq order by vd.a;
    
--select 
--    a.name "이름", 
--    vd.a as "날짜", 
--    nvl(at.state, '정상') as "출결상태"
--from
--(select st.name, su.seq from tblOpenedCourse os
--    inner join tblsignup su on os.seq = su.ocseq
--    inner join tblstudent st on su.stuseq = st.seq
--where os.seq = 1) a
--    cross join vwdate1 vd
--    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq order by vd.a;



-- 선택한 과정의 공휴일, 주말 제외한 날짜
create or replace view vwdate1
as
select
    b.a
from(
select
    ((select startdate from tblOpenedCourse where seq = ''선택한 과정seq'') + level - 1) as a,
    to_char((select startdate from tblOpenedCourse where seq = ''선택한 과정seq'') + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblOpenedCourse where seq = ''선택한 과정seq'') - (
    select
    startdate
    from tblOpenedCourse where seq = ''선택한 과정seq''
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a;

-- 년도별 검색
select 
    a.name "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.name, su.seq from tblopenedCourse os
    inner join tblsignup su on os.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
    where os.seq = '선택한 과정 번호') a
    cross join vwdate1 vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq 
where to_char(vd.a, 'yyyy') like '선택한 년도' order by vd.a;

--select 
--    a.name "이름", 
--    vd.a as "날짜", 
--    nvl(at.state, '정상') as "출결상태"
--from
--(select st.name, su.seq from tblopenedCourse os
--    inner join tblsignup su on os.seq = su.ocseq
--    inner join tblstudent st on su.stuseq = st.seq
--    where os.seq = '1') a
--    cross join vwdate1 vd
--    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq 
--where to_char(vd.a, 'yyyy') like '2021' order by vd.a;


-- 월별
select 
    a.name "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.name, su.seq from tblopenedCourse os
    inner join tblsignup su on os.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
    where os.seq = '선택한 과정 번호') a
    cross join vwdate1 vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq 
where to_char(vd.a, 'yyyy-mm') like '선택한 년월' order by vd.a;

--select 
--    a.name "이름", 
--    vd.a as "날짜", 
--    nvl(at.state, '정상') as "출결상태"
--from
--(select st.name, su.seq from tblopenedCourse os
--    inner join tblsignup su on os.seq = su.ocseq
--    inner join tblstudent st on su.stuseq = st.seq
--    where os.seq = '1') a
--    cross join vwdate1 vd
--    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq 
--where to_char(vd.a, 'yyyy-mm') like '2021-12' order by vd.a;

-- 일별
select 
    a.name "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.name, su.seq from tblopenedCourse os
    inner join tblsignup su on os.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
    where os.seq = '선택한 과정 번호') a
    cross join vwdate1 vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq 
where to_char(vd.a, 'yyyy-mm-dd') like '선택한 년월일' order by vd.a;

--select 
--    a.name "이름", 
--    vd.a as "날짜", 
--    nvl(at.state, '정상') as "출결상태"
--from
--(select st.name, su.seq from tblopenedCourse os
--    inner join tblsignup su on os.seq = su.ocseq
--    inner join tblstudent st on su.stuseq = st.seq
--    where os.seq = '1') a
--    cross join vwdate1 vd
--    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq 
--where to_char(vd.a, 'yyyy-mm-dd') like '2021-11-18' order by vd.a;































































