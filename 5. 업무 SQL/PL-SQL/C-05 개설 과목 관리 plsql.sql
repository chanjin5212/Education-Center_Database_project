--C-05 개설 과목 관리 plsql

--1. 출력
--------------------특정 개설 과정 선택--------------------
create or replace view vwOpenedSubjectChoice
as
select 
    seq as "개설과목번호",
    ocseq as "개설과정번호",
    tseq as "교사번호",
    scseq as "과정과목번호", 
    isprogress as "강의진행여부",
    startdate as "과목 시작일",
    enddate as "과목 종료일"
from tblOpenedSubject;

select * from vwOpenedSubjectChoice where 개설과정번호 = 1;

--------------------개설과목출력-------------------- 
create or replace view vwAllOpenedSubject
as
select distinct
    c.seq as "과정번호",
    c.coursename as "개설 과정명",
    oc.startdate as "과정 시작일",
    oc.enddate as "과정 종료일",
    cr.classroomname as "강의실명",
    s.subjectname as "개설 과목명",
    os.startdate as "과목 시작일",
    os.enddate as "과목 종료일",
    b.booktitle as "교재명",
    t.name as "교사명"
from tblOpenedSubject os 
    inner join tblTeacher t on t.seq = os.tseq
    inner join tblOpenedcourse oc on oc.seq = os.ocseq
    inner join tblBookSubject bs on os.seq = bs.osseq
    inner join tblBook b on b.seq = bs.bseq
    inner join tblSubjectCourse sc on sc.seq = os.scseq
    inner join tblCourse c on c.seq = sc.cseq
    inner join tblSubject s on s.seq =sc.sseq
    inner join tblClassroom cr on cr.seq = oc.rseq
order by oc.startdate asc;

select* from vwAllOpenedSubject;



--2. 입력, 수정, 삭제
--------------------개설 과목--------------------
--1) 개설 과목 정보 입력
---개설 과목 정보 입력 프로시저 생성
create or replace procedure procOpenedSubjectInsert(
    pocseq number,
    ptseq number,
    pcseq number,
    pisprogress varchar2,
    pstartdate date,
    penddate date
)
is
    vname tblTeacher.name%type;
begin
    insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) 
    values (seq_OpenedSubject.nextVal, pocseq, ptseq, pcseq , pisprogress, pstartdate, penddate);
    select name into vname from tblTeacher where seq = ptseq;
    dbms_output.put_line('개설과목 입력에 성공하였습니다.');
    dbms_output.put_line('개설과정번호:' || pocseq || ' 교사이름:' || vname || ' 과정-과목번호:' || pcseq || ' 강의진행여부:' || pisprogress || 
        ' 과목시작일:' || pstartdate || ' 과목종료일:' || penddate);
exception
    when others then 
    dbms_output.put_line('개설과목 입력에 실패하였습니다.');
end procOpenedSubjectInsert;

---개설 과목 정보 입력 프로시저 실행
begin
   procOpenedSubjectInsert(1, 1, 1, '강의예정', '2025-08-08', '2026-08-08'); 
end;


--2) 개설 과목 정보 수정
---개설 과목 정보 수정 프로시저 생성
create or replace procedure procOpenSubject(
    pseq number,
    ptarget number,
    pedit varchar2
)
is
begin
    if ptarget = 1 then
        update tblOpenedSubject set ocseq = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '개설과정번호:' || pedit);
        dbms_output.put_line('개설과정번호 수정에 성공하였습니다.');
    elsif ptarget = 2 then
        update tblOpenedSubject set tseq = (select seq from tblteacher where name = pedit) where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '교사명:' || pedit);
        dbms_output.put_line('교사명 수정에 성공하였습니다.');
    elsif ptarget = 3 then
        update tblOpenedSubject set scseq = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '과정과목번호:' || pedit);
        dbms_output.put_line('과정과목번호 수정에 성공하였습니다.');
    elsif ptarget = 4 then
        update tblOpenedSubject set isprogress = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '강의상태:' || pedit);
        dbms_output.put_line('강의상태 수정에 성공하였습니다.');
    elsif ptarget = 5 then
        update tblOpenedSubject set startdate = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '과목 시작일:' || pedit);
        dbms_output.put_line('과목 시작일 수정에 성공하였습니다.');
    elsif ptarget = 6 then
        update tblOpenedSubject set enddate = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '과목 종료일:' || pedit);
        dbms_output.put_line('과목 종료일 수정에 성공하였습니다.');
    end if;
exception
    when others then
    dbms_output.put_line('개설 과목 수정을 실패하였습니다.');
end;

---개설 과목 정보 수정 프로시저 실행
begin
    procOpenSubject(1, 1, '1'); --1번 개설과정번호, 2번 교사명, 3번 과정과목번호, 4번 강의상태, 5번 과목 시작일, 6번 과목 종료일
exception
    when others then
    dbms_output.put_line('개설 과목 수정을 실패하였습니다.');
end;


--3) 개설 과목 정보 삭제
---개설 과목 정보 삭제 프로시저 생성
create or replace procedure procDelOpenedSubject(
    pseq number
)
is
    vname tblSubject.subjectname%type;
    vsdate tblopenedcourse.startdate%type;
    vedate tblOpenedCourse.enddate%type;
begin
    select
        sj.subjectname, os.startdate, os.enddate into vname, vsdate, vedate
    from tblSubject sj
        inner join tblSubjectCourse sc
            on sc.sseq = sj.seq
                inner join tblOpenedSubject os
                    on os.scseq = sc.seq
                        where os.seq = pseq;
    delete from tblOpenedSubject where seq = pseq;
    dbms_output.put_line('과목명 : ' || vname || '   시작일: ' || to_char(vsdate, 'yyyy-mm-dd') || '   종료일: ' || to_char(vedate, 'yyyy-mm-dd'));
    dbms_output.put_line('해당 개설과정 삭제를 성공하였습니다.');
exception when others then 
    dbms_output.put_line('해당 개설과정 삭제를 실패하였습니다.');
end;

---개설 과목 정보 삭제 프로시저 실행
begin
    procDelOpenedSubject('개설과목번호');
end;

--------------------교재-개설과목--------------------
--1) 교재-개설과목 정보 입력
---교재-개설과목 정보 입력 프로시저 생성
create or replace procedure procBooksubjectInsert(
    pbseq number,
    posseq number
)
is
    vbookTitle tblBook.bookTitle%type;
begin
    insert into tblBookSubject(seq, bseq, osseq) values(seq_booksubject.nextVal, pbseq , posseq);
    select bookTitle into vbookTitle from tblBook where seq = pbseq;
    dbms_output.put_line('교재-개설과목 입력에 성공하였습니다.');
    dbms_output.put_line('교재명:' || vbookTitle || ' 개설과목번호:' || posseq);
exception
    when others then
    dbms_output.put_line('교재-개설과목 입력을 실패하였습니다.');
end procBooksubjectInsert;


---교재-개설과목 정보 입력 프로시저 실행
begin
    procBooksubjectInsert(1,2);
end;


--2) 교재-개설과목 정보 수정
---교재-개설과목 정보 수정 프로시저 생성
create or replace procedure procBookSub (
    pseq number,
    ptarget number,
    pedit varchar2
)
is
begin
    if ptarget = 1 then
        update tblBookSubject set bseq = (select seq from tblbook where booktitle = pedit) where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '교재명:' || pedit);
        dbms_output.put_line('교재명 수정에 성공하였습니다.');
    elsif ptarget = 2 then
        update tblBookSubject set osseq = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '개설 과목 번호:' || pedit);
        dbms_output.put_line('개설 과목 번호 수정에 성공하였습니다.');
    end if;
exception
    when others then
    dbms_output.put_line('교재-개설과목 수정을 실패하였습니다.');
end;

---교재-개설과목 정보 수정 프로시저 실행
begin
    procBookSub(1, 1, '코드로 배우는 스프링 웹 프로젝트'); --1번 교재명, 2번 개설 과목 번호
exception
    when others then
    dbms_output.put_line('교재-개설과목 수정을 실패하였습니다.');
end;


--3) 교재-개설과목 정보 삭제
---교재-개설과목 정보 삭제 프로시저 생성
create or replace procedure procDelBookSub(
    pseq number
)
is      
    vseq tblBookSubject.seq%type;
    vbookTitle tblBook.bookTitle%type;
    cursor vcursor
    is
    select * from tblBookSubject;
    vrow tblBookSubject%rowtype;
    vflag number;
begin
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        
        if vrow.seq = pseq then 
            vflag :=1;
        end if;
    end loop;
    close vcursor;
    
    if vflag = 1 then
        select bookTitle into vbookTitle from tblBook where seq = pseq;
        delete from tblBookSubject where seq = pseq;
        dbms_output.put_line('교재명:' || vbookTitle || '     ' || '개설과목번호:' || pseq);
        dbms_output.put_line('해당 교재-개설과목 삭제를 성공하였습니다.');
    else
         dbms_output.put_line('해당 교재-개설과목 삭제를 실패하였습니다.');
    end if;
exception
    when others then
    dbms_output.put_line('해당 교재-개설과목 삭제를 실패하였습니다.');
end;

---교재-개설과목 정보 삭제 프로시저 실행
begin
    procDelBookSub(5);
exception
    when others then
    dbms_output.put_line('교재-개설 과목 삭제를 실패하였습니다.');
end;
