--C-04 개설 과정 관리 plsql

--1. 출력

--------------------모든 개설 과정 정보--------------------
create or replace view vwAllOpenedCourse
as
select 
    oc.seq as "과정 번호",
    c.coursename as "개설 과정명",
    oc.startdate as "과정 시작일",
    oc.enddate as "과정 종료일",
    cl.classroomname as "강의실명",
    nvl2(vsc.cnt, '등록', '미등록') as "개설 과목 등록 여부",
    nvl(vhc.cnt, 0) as "등록 인원수"
from tblOpenedCourse oc
    left join tblCourse c on oc.cseq = c.seq
    left join tblclassroom cl on oc.rseq = cl.seq
    left join vwHeadCount vhc on vhc.ocseq = oc.seq
    left join vwSubjcetCount vsc on vsc.ocseq = oc.seq;
    
select * from vwAllOpenedCourse;


-- 수강 인원 view
create or replace view vwHeadCount
as
select
ocseq,
count(*) as cnt
from tblSignup
    group by ocseq
    order by ocseq;


-- 과정당 과목 view
create or replace view vwSubjcetCount
as
select 
os.ocseq,
count(*) as cnt
from tblopenedcourse oc
    inner join tblopenedsubject os on oc.seq = os.ocseq
    group by os.ocseq
    order by os.ocseq;


--------------------특정개설과정정보--------------------
create or replace view vwOpenedCourseSubject
as
select distinct
    oc.seq as "개설과정번호",
    s.seq as "과목번호",
    s.subjectName as "과목명",
    os.startdate as "과목 시작일",
    os.enddate as "과목 종료일",
    b.bookTitle as "교재명",
    t.name as "교사명"
from tblOpenedSubject os 
    inner join tblOpenedCourse oc on oc.seq = os.ocseq
    inner join tblBookSubject bs on os.seq = bs.osseq
    inner join tblBook b on b.seq = bs.bseq
    inner join tblSubjectCourse sc on sc.seq = os.scseq
    inner join tblSubject s on s.seq = sc.sseq
    inner join tblCourse c on c.seq = sc.cseq 
    inner join tblOpenedCourse oc on c.seq = oc.cseq
    inner join tblTeacher t on t.seq = os.tseq
order by os.startdate;

select "과목번호", "과목명", "과목 시작일", "과목 종료일", "교재명", "교사명" from vwOpenedCourseSubject where "개설과정번호" = 1;

--------------------등록된 교육생--------------------
create or replace view vwAllStudent
as
select distinct
    oc.seq as "개설과정번호",
    stu.seq as "학생번호",
    stu.name as "학생이름",
    stu.jumin as "주민번호",
    stu.tel as "전화번호",
    stu.regdate as "등록일",
    vs."수료",
    vs."중도탈락"
from tblOpenedCourse oc 
    inner join tblSignUp su on oc.seq = su.ocseq
    inner join tblStudent stu on stu.seq = su.stuseq
    inner join tblCourse c on c.seq = oc.cseq
    inner join vwsignup vs on vs.seq = su.seq
order by stu.seq;

select "학생번호", "학생이름", "주민번호", "전화번호", "등록일" from vwAllStudent where 개설과정번호 = '개설과정번호';

--수료, 중도탈락 여부 view 
create or replace view vwSignUp
as
select
    seq,
    case
        when completiondate is not null then '수료'
    end as "수료",
    case
        when dropoutdate is not null then '중도탈락'
    end as "중도탈락"
from tblSignUp;


--2. 입력, 수정, 삭제
--1) 개설 과정 정보 입력

---개설 과정 정보 입력 프로시저 생성
create or replace procedure procOpenedCourseInsert(
    pcourseName varchar2,
    pclassroomName varchar2,
    pstartdate date,
    penddate date
)
is
    vcourseName tblcourse.coursename%type;
    vclassroomName tblclassroom.classroomName%type;
begin
    insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) 
        values(seq_openedCourse.nextVal, (select seq from tblCourse where courseName = pcourseName), 
        (select seq from tblClassroom where classroomName = pclassroomName), pstartdate, penddate);
    dbms_output.put_line('개설과정 입력에 성공하였습니다.');
    dbms_output.put_line('과정이름:' || pcourseName || '     ' || ' 강의실이름:' || pclassroomName || '     ' || ' 
                                과정시작일:' || pstartdate || '     ' || ' 과정종료일:' || penddate);
exception
    when others then
    dbms_output.put_line('개설과정 입력에 실패하였습니다.');
end procOpenedCourseInsert;


---개설 과정 정보 입력 프로시저 실행
begin
    procOpenedCourseInsert('(디지털컨버젼스)AWS 클라우드 활용 자바(Java) Full-Stack 개발자 양성 과정','1강의실','2024-08-06', '2025-02-06'); 
exception
    when others then
    dbms_output.put_line('개설과정 입력에 실패하였습니다.');
end;

select * from tblOpenedCourse;



--2) 개설 과정 정보 수정
---개설 과정 정보 수정 프로시저 생성
create or replace procedure procOpenCourse(
    pseq number,
    ptarget number,
    pedit varchar2
)
is
begin
    if ptarget = 1 then
        update tblOpenedCourse set cseq = (select seq from tblcourse where coursename = pedit) where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '과정명:' || pedit);
        dbms_output.put_line('과정명 수정에 성공하였습니다.');
    elsif ptarget = 2 then
        update tblOpenedCourse set rseq = (select seq from tblclassroom where classroomname = pedit) where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '강의실명:' || pedit);
        dbms_output.put_line('강의실명 수정에 성공하였습니다.');
    elsif ptarget = 3 then
        update tblOpenedCourse set startdate = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '과정시작일:' || pedit);
        dbms_output.put_line('과정시작일 수정에 성공하였습니다.');
    elsif ptarget = 4 then
        update tblOpenedCourse set enddate = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '과정종료일:' || pedit);
        dbms_output.put_line('과정종료일 수정에 성공하였습니다.');
    else
        dbms_output.put_line('개설 과정 수정을 실패하였습니다.');
    end if;
exception
    when others then
    dbms_output.put_line('개설 과정 수정을 실패하였습니다.');
end;

---개설 과정 정보 수정 프로시저 실행
begin
    procOpenCourse(1, 1, '(디지털컨버젼스)AWS 클라우드 활용 자바(Java) Full-Stack 개발자 양성 과정'); -- 1번 과정명, 2번 강의실명, 3번 과정시작일, 4번 과정종료일
exception
    when others then
    dbms_output.put_line('개설 과정 수정을 실패하였습니다.');
end;

--3) 개설 과정 정보 삭제
---개설 과정 정보 삭제 프로시저 생성
create or replace procedure procDelOpenedCourse(
    pseq number
)
is
    vname tblCourse.coursename%type;
    vsdate tblopenedcourse.startdate%type;
    vedate tblOpenedCourse.enddate%type;
begin
    select 
        c.coursename, oc.startdate, oc.enddate into vname, vsdate, vedate
    from tblCourse c
        inner join tblOpenedCourse oc
            on c.seq = oc.cseq
                where oc.seq = pseq;
    delete from tblCourse where seq = pseq;
    dbms_output.put_line('과정명 : ' || vname || '   시작일: ' || to_char(vsdate, 'yyyy-mm-dd') || '   종료일: ' || to_char(vedate, 'yyyy-mm-dd'));
    dbms_output.put_line('해당 개설과정 삭제를 성공하였습니다.');
exception 
    when others then 
    dbms_output.put_line('해당 개설과정 삭제를 실패하였습니다.');
end;

---개설 과정 정보 삭제 프로시저 실행
begin
    procDelOpenedCourse('개설과정번호');
end;

