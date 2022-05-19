--PLSQL관리자_ 출결 관리 및 출결 조회 수정 .sql

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 선택한 과정의 출결 상태

create or replace procedure pCourseAttendence(
    pseq number
)
is
    vname tblStudent.name%type;
    vdate date;
    vatt tblattendence.state%type;
    cursor vcursor
    is
    select 
    a.name "이름", vd.a as "날짜", nvl(at.state, '정상') as "출결상태" into vname, vdate, vatt
from
(select st.name, su.seq, os.seq as osseq from tblOpenedCourse os
    inner join tblsignup su on os.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblOpenedCourse where seq = pseq) + level - 1) as a,
    to_char((select startdate from tblOpenedCourse where seq = pseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblOpenedCourse where seq = pseq) - (
    select
    startdate
    from tblOpenedCourse where seq = pseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq where a.osseq = pseq order by vd.a;
begin
    open vcursor;
    dbms_output.put_line('=======================');
    dbms_output.put_line('이름      날짜         출결상태');
        loop
            fetch vcursor into vname, vdate, vatt;            
            exit when vcursor%notfound;
            dbms_output.put_line(vname || '    ' || vdate || '    ' ||vatt);
        end loop;
    dbms_output.put_line('=======================');
    close vcursor;
end;

-- 선택한 과정의 출결 상태 실행

begin
    pCourseAttendence('개설과정seq');
exception
    when others then         
    dbms_output.put_line('출결 조회를 실패하였습니다.');
end;
--
--begin
--    pCourseAttendence(2);
--exception
--    when others then         
--    dbms_output.put_line('출결 조회를 실패하였습니다.');
--end;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 특정한 과정, 인원의 출결 현황

create or replace procedure pCourseAttendenceStudent(
    pseq number,
    pstuseq number
)
is
    vname tblStudent.name%type;
    vdate date;
    vatt tblattendence.state%type;
    cursor vcursor
    is
    select 
    a.name "이름", vd.a as "날짜", nvl(at.state, '정상') as "출결상태" into vname, vdate, vatt
from
(select st.name, su.seq, os.seq as osseq from tblOpenedCourse os
    inner join tblsignup su on os.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblOpenedCourse where seq = pseq) + level - 1) as a,
    to_char((select startdate from tblOpenedCourse where seq = pseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblOpenedCourse where seq = pseq) - (
    select
    startdate
    from tblOpenedCourse where seq = pseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq where a.osseq = pseq  and a.seq = pstuseq order by vd.a;
begin
    open vcursor;
    dbms_output.put_line('=======================');
    dbms_output.put_line('이름      날짜         출결상태');
        loop
            fetch vcursor into vname, vdate, vatt;            
            exit when vcursor%notfound;
            dbms_output.put_line(vname || '    ' || vdate || '    ' ||vatt);
        end loop;
    dbms_output.put_line('=======================');
    close vcursor;
end;

-- 특정 과정의 출결 상태 실행

begin
    pcourseattendencestudent('개설과정seq', '학생seq');
exception
    when others then         
    dbms_output.put_line('출결 조회를 실패하였습니다.');
end;


--begin
--    pcourseattendencestudent(1,2);
--exception
--    when others then         
--    dbms_output.put_line('출결 조회를 실패하였습니다.');
--end;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 특정한 년의 출결 조회

create or replace procedure pCourseAttendenceY(
    pseq number,
    pdate varchar2
)
is
    vname tblStudent.name%type;
    vdate date;
    vatt tblattendence.state%type;
    cursor vcursor
    is
    select 
    a.name "이름", vd.a as "날짜", nvl(at.state, '정상') as "출결상태" into vname, vdate, vatt
from
(select st.name, su.seq, os.seq as osseq from tblOpenedCourse os
    inner join tblsignup su on os.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblOpenedCourse where seq = pseq) + level - 1) as a,
    to_char((select startdate from tblOpenedCourse where seq = pseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblOpenedCourse where seq = pseq) - (
    select
    startdate
    from tblOpenedCourse where seq = pseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq where to_char(vd.a, 'yyyy') like pdate order by vd.a;
begin
    open vcursor;
    dbms_output.put_line('=======================');
    dbms_output.put_line('이름      날짜         출결상태');
        loop
            fetch vcursor into vname, vdate, vatt;            
            exit when vcursor%notfound;
            dbms_output.put_line(vname || '    ' || vdate || '    ' ||vatt);
        end loop;
    dbms_output.put_line('=======================');
    close vcursor;
end;


-- 특정한 년의 출결 조회 실행

begin
    pCourseAttendenceY('특정 과정seq', 'YYYY');
exception
    when others then         
    dbms_output.put_line('출결 조회를 실패하였습니다.');
end;

--begin
--    pCourseAttendenceY(1, '2022');
--exception
--    when others then         
--    dbms_output.put_line('출결 조회를 실패하였습니다.');
--end;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 특정한 년,달 의 출결 조회

create or replace procedure pCourseAttendenceYM(
    pseq number,
    pdate varchar2
)
is
    vname tblStudent.name%type;
    vdate date;
    vatt tblattendence.state%type;
    cursor vcursor
    is
    select 
    a.name "이름", vd.a as "날짜", nvl(at.state, '정상') as "출결상태" into vname, vdate, vatt
from
(select st.name, su.seq, os.seq as osseq from tblOpenedCourse os
    inner join tblsignup su on os.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblOpenedCourse where seq = pseq) + level - 1) as a,
    to_char((select startdate from tblOpenedCourse where seq = pseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblOpenedCourse where seq = pseq) - (
    select
    startdate
    from tblOpenedCourse where seq = pseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq where to_char(vd.a, 'yyyy-mm') like pdate order by vd.a;
begin
    open vcursor;
    dbms_output.put_line('=======================');
    dbms_output.put_line('이름      날짜         출결상태');
        loop
            fetch vcursor into vname, vdate, vatt;            
            exit when vcursor%notfound;
            dbms_output.put_line(vname || '    ' || vdate || '    ' ||vatt);
        end loop;
    dbms_output.put_line('=======================');
    close vcursor;
end;

-- 특정한 년,달의 출결 조회 실행

begin
    pCourseAttendenceYM('특정 과정seq', 'YYYY-MM');
exception
    when others then         
    dbms_output.put_line('출결 조회를 실패하였습니다.');
end;

--begin
--    pCourseAttendenceYM(1, '2022-03');
--exception
--    when others then         
--    dbms_output.put_line('출결 조회를 실패하였습니다.');
--end;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 특정한 년,달,일 의 출결 조회

create or replace procedure pCourseAttendenceYMD(
    pseq number,
    pdate varchar2
)
is
    vname tblStudent.name%type;
    vdate date;
    vatt tblattendence.state%type;
    cursor vcursor
    is
    select 
    a.name "이름", vd.a as "날짜", nvl(at.state, '정상') as "출결상태" into vname, vdate, vatt
from
(select st.name, su.seq, os.seq as osseq from tblOpenedCourse os
    inner join tblsignup su on os.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblOpenedCourse where seq = pseq) + level - 1) as a,
    to_char((select startdate from tblOpenedCourse where seq = pseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblOpenedCourse where seq = pseq) - (
    select
    startdate
    from tblOpenedCourse where seq = pseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq where to_char(vd.a, 'yyyy-mm-dd') like pdate order by vd.a;
begin
    open vcursor;
    dbms_output.put_line('=======================');
    dbms_output.put_line('이름      날짜         출결상태');
        loop
            fetch vcursor into vname, vdate, vatt;            
            exit when vcursor%notfound;
            dbms_output.put_line(vname || '    ' || vdate || '    ' ||vatt);
        end loop;
    dbms_output.put_line('=======================');
    close vcursor;
end;

-- 특정한 년,달의 출결 조회 실행

begin
    pCourseAttendenceYMD('특정 과정seq', 'YYYY-MM-DD');
exception
    when others then         
    dbms_output.put_line('출결 조회를 실패하였습니다.');
end;


--begin
--    pCourseAttendenceYMD(1, '2022-03-02');
--exception
--    when others then         
--    dbms_output.put_line('출결 조회를 실패하였습니다.');
--end;
