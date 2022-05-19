-- E-03. 출결 관리 및 조회

-- E-03-01. 출결 현황 기간별 조회(전체, 월, 일)

-- 전체 출결 조회
create or replace procedure procStuAtt(
    pstseq number -- 로그인한 학생 번호
)
is
    vname tblStudent.name%type;
    vdate date;
    vatt tblattendence.state%type;
    cursor vcursor
    is
select 
    a.stname "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.name as stname, su.seq as suseq from tblopenedcourse oc
    inner join tblsignup su on oc.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
        where st.seq = pstseq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq) + level - 1) as a,
    to_char((select startdate from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq) - (
    select
    startdate
    from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.suseq order by vd.a;
begin
    open vcursor;
    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line('이름'|| '     ' || '날짜' || '                 ' || '출결');
    dbms_output.put_line('-----------------------------------------');
        loop
            fetch vcursor into vname, vdate, vatt;
            exit when vcursor%notfound;
            dbms_output.put_line(vname || '   ' || vdate || '   ' || vatt);
        end loop;
    close vcursor;
end;



begin
    procStuAtt(1);
end;



-- 출결 월별 조회
create or replace procedure procStuAttFindByMonth(
    pstseq number, -- 로그인한 학생 번호
    pdate varchar2
)
is
    vname tblStudent.name%type;
    vdate date;
    vatt tblattendence.state%type;
    cursor vcursor
    is
select 
    a.stname "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.name as stname, su.seq as suseq from tblopenedcourse oc
    inner join tblsignup su on oc.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
        where st.seq = pstseq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq) + level - 1) as a,
    to_char((select startdate from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq) - (
    select
    startdate
    from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.suseq
        where to_char(vd.a, 'yyyy-mm') like pdate
            order by vd.a;
begin
    open vcursor;
    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line('이름'|| '     ' || '날짜' || '                 ' || '출결');
    dbms_output.put_line('-----------------------------------------');
        loop
            fetch vcursor into vname, vdate, vatt;
            exit when vcursor%notfound;
            dbms_output.put_line(vname || '   ' || vdate || '   ' || vatt);
        end loop;
    close vcursor;
end;


begin
    procStuAttFindByMonth(1, '2021-10');
end;



-- 출결 일별 조회
create or replace procedure procStuAttFindByDate(
    pstseq number, -- 로그인한 학생 번호
    pdate varchar2
)
is
    vname tblStudent.name%type;
    vdate date;
    vatt tblattendence.state%type;
    cursor vcursor
    is
select 
    a.stname "이름", 
    vd.a as "날짜", 
    nvl(at.state, '정상') as "출결상태"
from
(select st.name as stname, su.seq as suseq from tblopenedcourse oc
    inner join tblsignup su on oc.seq = su.ocseq
    inner join tblstudent st on su.stuseq = st.seq
        where st.seq = pstseq) a
    cross join (select
    b.a
from(
select
    ((select startdate from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq) + level - 1) as a,
    to_char((select startdate from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq) + level - 1, 'D') as d
from
    dual connect by level <= (
    select 
    case
        when enddate <= sysdate then enddate
        when enddate > sysdate then sysdate
    end
    from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq) - (
    select
    startdate
    from tblopenedcourse oc inner join tblsignup su on oc.seq = su.ocseq where su.stuseq = pstseq
    )) b left join tblholiday h on b.a = h.holiday
        where b.d not in('1', '7') and h.holiday is null order by b.a) vd
    left join tblattendence at on vd.a = at.attdate and at.suseq = a.suseq
        where to_char(vd.a, 'yyyy-mm-dd') like pdate
            order by vd.a;
begin
    open vcursor;
    dbms_output.put_line('-----------------------------------------');
    dbms_output.put_line('이름'|| '     ' || '날짜' || '                 ' || '출결');
    dbms_output.put_line('-----------------------------------------');
        loop
            fetch vcursor into vname, vdate, vatt;
            exit when vcursor%notfound;
            dbms_output.put_line(vname || '   ' || vdate || '   ' || vatt);
        end loop;
    close vcursor;
end;


begin
    procStuAttFindByDate(1, '2021-11-18'); 
end;

             
-- E-03-02.출결 기록 
create or replace procedure procAttendence(
    pseq tblStudent.seq%type,
    pstatus tblAttendence.state%type
)
is
    vstartdate date;
    venddate date;
begin
    select
        startdate, enddate into vstartdate, venddate
    from tblOpenedCourse
    where seq = (select ocseq from tblSignUp where stuseq = pseq);
    
    if sysdate >= vstartdate and sysdate <= venddate then
        insert into tblAttendence values(SEQ_ATTENDENCE.nextval, (select su.seq 
                                                                from tblSignUp su
                                                                    inner join tblStudent s
                                                                        on su.stuseq = s.seq
                                                                            where s.seq = pseq), sysdate, pstatus);
        dbms_output.put_line('출결 기록 성공');
    else
        raise_application_error(-20000, '시작하지 않은 과정 또는 끝난 과정');
    end if;
exception when others then
    dbms_output.put_line('출결 기록 실패');
end;


begin
    procAttendence(1, '결석');
end;
