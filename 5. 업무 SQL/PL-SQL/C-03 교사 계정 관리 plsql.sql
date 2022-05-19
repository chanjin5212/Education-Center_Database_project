--C-03 교사 계정 관리 plsql

--1. 출력
--------------------교사 정보출력--------------------
create or replace view vwTeacherinfo
as
select 
    t.seq as "교사번호",
    t.name as "교사이름", 
    t.jumin as "주민번호 뒷자리", 
    t.tel as "전화번호", 
    s.subjectname as "강의 가능한 과목"
from tblTeacher t 
    inner join tblAvailable a on t.seq = a.tseq
    inner join tblSubject s on s.seq = a.sseq
order by t.seq asc, s.subjectname asc;

select * from vwTeacherinfo;

--------------------특정교사 출력--------------------
create or replace view vwChoiceTeacherInfo
as
select distinct
    t.seq as "교사번호",
    s.subjectname as "개설 과목명",
    os.startdate as "과목 시작일",
    os.enddate as "과목 종료일",
    c.coursename as "개설 과정명",
    oc.startdate as "과정 시작일",
    oc.enddate as "과정 종료일",
    b.booktitle as "교재명",
    cr.classroomname as "강의실명",
    os.isprogress as "강의 진행 여부"
from tblOpenedSubject os 
    inner join tblTeacher t on t.seq = os.tseq
    inner join tblOpenedcourse oc on oc.seq = os.ocseq
    inner join tblBookSubject bs on os.seq = bs.osseq
    inner join tblBook b on b.seq = bs.bseq
    inner join tblSubjectCourse sc on sc.seq = os.scseq
    inner join tblCourse c on c.seq = sc.cseq
    inner join tblSubject s on s.seq =sc.sseq
    inner join tblClassroom cr on cr.seq = oc.rseq
order by os.startdate asc;

select "개설 과목명", "과목 시작일", "과목 종료일", "개설 과정명", "과정 시작일", "과정 종료일", "교재명", "강의실명", "강의 진행 여부" from vwChoiceTeacherInfo 
        where "교사번호" = '교사번호';
        
        
--2.입력, 수정, 삭제
--------------------교사--------------------
--1) 교사 정보 입력
---과정 정보 입력 프로시저 생성
create or replace procedure procTeacherInsert(
    pname varchar2,
    pjumin varchar2,
    ptel varchar2
)
is
begin
    insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, pname, pjumin, ptel);
    dbms_output.put_line('교사 입력에 성공하였습니다.');
    dbms_output.put_line('교사이름:' || pname || '     ' || ' 주민번호:' || pjumin || '     ' || ' 전화번호:' || ptel);
    commit;
exception
    when others then
    dbms_output.put_line('교사 입력에 실패하였습니다.');
    rollback; 
end procTeacherInsert;

----교사 정보 입력 프로시저 실행
begin
    procTeacherInsert('테스트교사', '8564568', '010-1234-5678');
end;


--2) 교사 정보 수정
---교사 정보 수정 프로시저 생성
create or replace procedure procTeacherEdit (
    pseq number,
    ptarget number,
    pedit varchar2
)
is
begin  
    if ptarget = 1 then
        update tblTeacher set name = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '교사명:' || pedit);
        dbms_output.put_line('교사명 수정에 성공하였습니다.');
    elsif ptarget = 2 then
        update tblTeacher set jumin = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '주민번호:' || pedit);
        dbms_output.put_line('주민번호 수정에 성공하였습니다.');
    elsif ptarget = 3 then
        update tblTeacher set tel = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '전화번호:' || pedit);
        dbms_output.put_line('전화번호 수정에 성공하였습니다.');
    else
        dbms_output.put_line('교사 수정을 실패하였습니다.');
    end if;
exception
    when others then
    dbms_output.put_line('교사 수정을 실패하였습니다.');
end;

---교사 정보 수정 프로시저 실행
begin
    procTeacherEdit(1, 3, '010-5456-5418'); --1번 교사명, 2번 주민번호, 3번 전화번호
exception
    when others then
    dbms_output.put_line('교사 수정을 실패하였습니다.');
end;

--3) 교사 정보 삭제
---교사 정보 삭제 프로시저 생성
create or replace procedure procDelTeacher(
    pseq number
)
is
    vname tblteacher.name%type;
begin
    select name into vname from tblteacher where seq = pseq;
    delete from tblTeacher where seq = pseq;
    dbms_output.put_line('교사명:' || vname);
    dbms_output.put_line('해당 교사 삭제를 성공하였습니다.');
exception when others then 
    dbms_output.put_line('해당 교사 삭제를 실패하였습니다.');
end;

---교사 정보 삭제 프로시저 실행
begin
    procDelTeacher('교사번호');
end;

--------------------강의가능 과목--------------------
--1) 강의가능 과목 정보 입력

---강의가능 과목 입력 프로시저 생성
create or replace procedure procAvailableInsert(
    pname varchar2,
    psubjectname varchar2
)
is
begin
    insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 
    (select seq from tblTeacher where name = pname), (select seq from tblSubject where lower(subjectName) = lower(psubjectname)));
    dbms_output.put_line('강의가능한과목 입력에 성공하였습니다.');
    dbms_output.put_line('교사이름:' || pname || ' 과목명:' || psubjectName);
exception
    when others then
    dbms_output.put_line('강의가능한과목 입력을 실패하였습니다.');
end procAvailableInsert;

--강의가능 과목 입력 프로시저 실행
begin
    procAvailableInsert('한광훈', 'Spring');
exception
    when others then
    dbms_output.put_line('강의가능한과목 입력을 실패하였습니다.');
end;



--2) 강의가능 과목 정보 수정
---강의가능 과목 수정 프로시저 생성
create or replace procedure procAvailEdit(
    pseq number,
    ptarget number,
    pedit varchar2
)
is
begin
    if ptarget = 1 then
        update tblAvailable set tseq = (select seq from tblTeacher where name = pedit) where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '교사명:' || pedit);
        dbms_output.put_line('교사명 수정에 성공하였습니다.');
    elsif ptarget = 2 then
        update tblAvailable set sseq = (select seq from tblSubject where subjectname = pedit) where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '과목명:' || pedit);
        dbms_output.put_line('과목명 수정에 성공하였습니다.');
    else
        dbms_output.put_line('강의 가능 과목 수정을 실패하였습니다.');
    end if;
exception
    when others then
    dbms_output.put_line('강의 가능 과목 수정을 실패하였습니다.');
end;

-- 강의가능 과목 수정 프로시저 실행
begin
    procAvailEdit(1, 2, 'Spring'); -- 1번 교사명, 2번 과목명
exception
    when others then
    dbms_output.put_line('강의 가능 과목 수정을 실패하였습니다.');
end;

--3) 강의가능 과목 정보 삭제
---강의가능 과목 삭제 프로시저 생성
create or replace procedure procDelAvail(
    pseq number
)
is
    vname tblTeacher.name%type;
    vsubjectName tblSubject.subjectName%type;
begin
    select name into vname from tblTeacher where seq = (select tseq from tblAvailable where seq = pseq);
    select subjectName into vsubjectName from tblSubject where seq = (select sseq from tblAvailable where seq = pseq);
    delete from tblAvailable where seq = pseq;
    dbms_output.put_line('교사명:' || vname || '     ' || '과목명:' || vsubjectName);
    dbms_output.put_line('해당 강의 가능 과목 삭제를 성공하였습니다.');
exception 
    when others then 
    dbms_output.put_line('해당 강의 가능 과목 삭제를 실패하였습니다.');
end;

---강의가능 과목 삭제 프로시저 실행
begin
    procDelAvail(1);
end;

