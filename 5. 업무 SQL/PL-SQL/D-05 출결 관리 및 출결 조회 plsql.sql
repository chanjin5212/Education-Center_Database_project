-- 과목 목록 출력
create or replace view vwAttSubject
as
select 
    os.seq as "과목번호", 
    t.seq as "교사번호",
    c.coursename as "과정명", 
    oc.startdate as "과정 시작일", 
    oc.enddate as "과정 종료일", 
    r.classroomname as "강의실명", 
    s.subjectname as "과목명", 
    os.startdate as "과목 시작일", 
    os.enddate as "과목 종료일", 
    b.booktitle as "교재명"
from tblteacher t
    inner join tblopenedsubject os on t.seq = os.tseq
    inner join tblsubjectcourse sc on os.scseq = sc.seq
    inner join tblopenedcourse oc on os.ocseq = oc.seq
    inner join tblcourse c on sc.cseq = c.seq
    inner join tblsubject s on sc.sseq = s.seq
    inner join tblclassroom r on r.seq = oc.rseq
    inner join tblBookSubject bs on bs.osseq = os.seq
    inner join tblbook b on b.seq = bs.bseq
    order by os.seq;

-- 뷰 과목 목록 출력
select "과목번호", "과정명", "과목 시작일", "과목 종료일", "강의실명", "과목명", "과목 시작일", "과목 종료일", "교재명" from vwAttSubject where "교사번호" = '로그인한 교사 번호';
    
    

-- 선택한 과목 출결
create or replace procedure procAttCheckSub(
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
(select st.name, su.seq, os.seq as osseq from tblopenedsubject os
    inner join tblsignup su on os.ocseq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblopenedsubject where seq = pseq) + level - 1) as a,
    to_char((select startdate from tblopenedsubject where seq = pseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblopenedsubject where seq = pseq) - (
    select
    startdate
    from tblopenedsubject where seq = pseq
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
-- 선택한 과목 출결 출력
begin
    procAttCheckSub('선택한 과목 번호');
end;


-- 년도
create or replace procedure procAttCheckYear(
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
(select st.name, su.seq, os.seq as osseq from tblopenedsubject os
    inner join tblsignup su on os.ocseq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblopenedsubject where seq = pseq) + level - 1) as a,
    to_char((select startdate from tblopenedsubject where seq = pseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblopenedsubject where seq = pseq) - (
    select
    startdate
    from tblopenedsubject where seq = pseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq where a.osseq = pseq and to_char(vd.a, 'yyyy') like pdate order by vd.a;
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
-- 선택한 년도 출결 출력
begin
    procAttCheckYear(1, '2021');
end;




-- 월별
create or replace procedure procAttCheckMonth(
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
(select st.name, su.seq, os.seq as osseq from tblopenedsubject os
    inner join tblsignup su on os.ocseq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblopenedsubject where seq = pseq) + level - 1) as a,
    to_char((select startdate from tblopenedsubject where seq = pseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblopenedsubject where seq = pseq) - (
    select
    startdate
    from tblopenedsubject where seq = pseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq where a.osseq = pseq and to_char(vd.a, 'yyyy-mm') like pdate order by vd.a;
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
-- 선택한 월별 출력
begin
    procAttCheckMonth(1, '2021-10');
end;
                        


-- 일별
create or replace procedure procAttCheckDay(
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
(select st.name, su.seq, os.seq as osseq from tblopenedsubject os
    inner join tblsignup su on os.ocseq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblopenedsubject where seq = pseq) + level - 1) as a,
    to_char((select startdate from tblopenedsubject where seq = pseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblopenedsubject where seq = pseq) - (
    select
    startdate
    from tblopenedsubject where seq = pseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.seq where a.osseq = pseq and to_char(vd.a, 'yyyy-mm-dd') like pdate order by vd.a;
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
-- 선택한 년월일 출력
begin
    procAttCheckDay(1, '2021-10-18');
end;












