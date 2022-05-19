--C-02 기초 정보 관리 plsql

--1. 출력
--------------------과정-과목--------------------
create or replace view vwSubjectCourse
as
select sc.seq, c.coursename, s.subjectname from tblSubjectCourse sc
    inner join tblSubject s on sc.sseq = s.seq
        inner join tblCourse c on sc.cseq = c.seq order by sc.seq; 
        
select * from vwsubjectcourse;



--2. 입력, 수정, 삭제
--------------------과정--------------------
--1) 과정 정보 입력
insert into tblCourse(seq, courseName) values (seq_Course.nextVal, '추가 과정명');

---과정 정보 입력 프로시저 생성
create or replace procedure procCourseInsert(
    pcourseName varchar2
)
is
begin
    insert into tblCourse(seq, courseName) values (seq_Course.nextVal, pcourseName);
    dbms_output.put_line('과정명:' || pcourseName);
    dbms_output.put_line('과정 입력에 성공하였습니다.');
exception
    when others then 
    dbms_output.put_line('과정 입력에 실패하였습니다.');
end procCourseInsert;


---과정 정보 입력 프로시저 실행
begin
    procCourseInsert('테스트과정명');
exception 
    when others then 
    dbms_output.put_line('과정 입력에 실패하였습니다.');
end;

--2) 과정 정보 수정

---과정 정보 수정 프로시저 생성
create or replace procedure procUpCourse (
    pseq number,
    pcoursename tblCourse.coursename%type
)
is
begin
    update tblCourse set coursename = pcoursename where seq = pseq;
    dbms_output.put_line('과정번호:' || pseq || '     ' || '과정명:' || pcoursename);
    dbms_output.put_line('과정 수정을 성공하였습니다.');
exception
    when others then
    dbms_output.put_line('과정 수정을 실패하였습니다.');
end procUpCourse;

-- 과정 정보 수정 프로시저 실행
begin
    procUpCourse(5, '안드로이드 앱 프로그래밍');
exception
    when others then
    dbms_output.put_line('과정 수정을 실패하였습니다.');
end;


--3) 과정 정보 삭제

---과정 정보 삭제 프로시저 생성
create or replace procedure procDelCourse(
    pseq number
)
is
    vname tblcourse.coursename%type;
begin
    select coursename into vname from tblCourse where seq = pseq;
    delete from tblCourse where seq = pseq;
    dbms_output.put_line('과정명:' || vname );
    dbms_output.put_line('해당 과정 삭제를 성공하였습니다.');
exception when others then 
    dbms_output.put_line('해당 과정 삭제를 실패하였습니다.');
end;

---과정 정보 삭제 프로시저 실행
begin
    procDelCourse('과정번호');
end;


--------------------과목-------------------
insert into tblSubject(seq, subjectName) values (seq_Subject.nextVal, '추가 과목명');

--1) 과목 정보 입력
---과목 정보 입력 프로시저 생성
create or replace procedure procSubjectInsert(
    psubjectName varchar2
)
is
begin
    insert into tblSubject(seq, subjectName) values(seq_Subject.nextVal, psubjectName);
    dbms_output.put_line('과목명:' || psubjectName);
    dbms_output.put_line('과목 입력에 성공하였습니다.');
exception
    when others then 
    dbms_output.put_line('과목 입력에 실패하였습니다.');
end procSubjectInsert;


---과목 정보 입력 프로시저 실행
begin
    procSubjectInsert('테스트과목명');
exception 
    when others then 
    dbms_output.put_line('과목 입력에 실패하였습니다.');
end;


--2) 과목 정보 수정
---과목 정보 수정 프로시저 생성
create or replace procedure procUpSubject (
    pseq number,
    psubjectname tblSubject.subjectname%type
)
is
begin
    update tblSubject set subjectname = psubjectname where seq = pseq;
    dbms_output.put_line('과목번호:' || pseq || '     ' || '과목명:' || psubjectname);
    dbms_output.put_line('과목 수정에 성공하였습니다.');
exception
    when others then
    dbms_output.put_line('과목 수정에 실패하였습니다.');
end procUpSubject;

--과목 정보 수정 프로시저 실행
begin
    porcUpSubject(1, 'Spring');
exception
    when others then
    dbms_output.put_line('과목 수정에 실패하였습니다.');
end;

--3) 과목 정보 삭제
--과목 정보 삭제 프로시저 생성
create or replace procedure procDelSubject(
    pseq number
)
is
    vname tblsubject.subjectname%type;
begin
    select subjectname into vname from tblSubject where seq = pseq;
    delete from tblSubject where seq = pseq;
    dbms_output.put_line('과정명:' || vname);
    dbms_output.put_line('해당 과목 삭제를 성공하였습니다.');
exception 
    when others then 
    dbms_output.put_line('해당 과목 삭제를 실패하였습니다,');
end;

--과목 정보 삭제 프로시저 실행
begin
    procDelSubject('과목번호');
end;

--------------------과정-과목--------------------
insert into tblSubjectCourse(seq, sseq, cseq) values (seq_SubjectCourse.nextVal, '과목번호', '과정번호');

--1) 과정-과목 입력
--과정-과목 입력 프로시저 생성
create or replace procedure procSubjectCourseInsert(
    psubName varchar2,
    pcourName varchar2
)
is
begin
    insert into tblSubjectCourse(seq, sseq, cseq) 
        values (seq_SubjectCourse.nextVal, (select seq from tblSubject where subjectName = psubName), 
            (select seq from tblCourse where courseName = pcourName));
    dbms_output.put_line('과정-과목 입력에 성공하였습니다.');
    dbms_output.put_line('과정이름:' || pcourName || '     ' || ' 과목이름:' || psubName);
exception 
    when others then
        dbms_output.put_line('과정-과목 입력에 실패하였습니다.');
end procSubjectCourseInsert;


--과정-과목 입력 프로시저실행
begin
    procSubjectCourseInsert('Spring','(디지털컨버젼스)AWS 클라우드 활용 자바(Java) Full-Stack 개발자 양성 과정'); --과목명, 과정명
exception
    when others then
    dbms_output.put_line('과정-과목 입력에 실패하였습니다.');
end;


--2) 과정-과목 수정
--과정-과목 수정 프로시저 생성
create or replace procedure procSubCou(
    pseq number,
    ptarget number,
    pname varchar2
)
is
begin
    if ptarget = 1 then
        update tblsubjectcourse set sseq = (select seq from tblsubject where subjectname = pname) where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '과목명:' || pname);
        dbms_output.put_line('과목명 수정에 성공하였습니다.');
    elsif ptarget = 2 then
        update tblsubjectcourse set cseq = (select seq from tblcourse where coursename = pname) where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '과정명:' || pname);
        dbms_output.put_line('과정명 수정에 성공하였습니다.');
    else
        dbms_output.put_line('과목-과정 수정을 실패하였습니다.');
    end if;
exception
    when others then
    dbms_output.put_line('과목-과정 수정을 실패하였습니다.');
end;

-- 과정-과목 수정 프로시저 실행
begin
    procSubCou(22, 2, '웹기반 빅데이터 전문 개발자 양성과정'); --1번 과목명, 2번 과정명
exception
    when others then
    dbms_output.put_line('과목-과정 수정을 실패하였습니다.');
end;


--3) 과정-과목 삭제
-- 과정-과목 삭제 프로시저 생성
create or replace procedure procDelSubCou(
    pseq number
)
is
    vcourseName tblCourse.courseName%type;
    vsubjectName tblSubject.subjectName%type;
begin
    select subjectName into vsubjectName from tblSubject where seq = (select sseq  from tblSubjectCourse where seq = pseq);
    select courseName into vcourseName from tblCourse where seq = (select cseq  from tblSubjectCourse where seq = pseq);
    delete from tblSubjectCourse where seq = pseq;
    dbms_output.put_line('과정과목번호:' || pseq || '     ' || '과목명:' || vsubjectName || '     ' || '과정명:' || vcourseName);
    dbms_output.put_line('해당 과정-과목 삭제를 성공하였습니다.');
exception
    when others then
    dbms_output.put_line('해당 과정-과목 삭제를 실패하였습니다.');

end;

-- 과정-과목 삭제 프로시저 실행
begin
    procDelSubCou(1);
end;

--------------------강의실--------------------
--1) 강의실 정보 입력
insert into tblClassroom(seq, classroomName, max) values (seq_Classroom.nextVal, '추가 강의실명', '정원');

---강의실 정보 입력 프로시저 생성
create or replace procedure procClassroomInsert(
    pclassroomName varchar2,
    pmax number
)
is
begin
    insert into tblClassroom(seq, classroomName, max) values (seq_Classroom.nextVal, pclassroomName, pmax);
    dbms_output.put_line('강의실 입력에 성공하였습니다.');
    dbms_output.put_line('강의실명:' || pclassroomName || '     ' || '정원:' || pmax);
exception
    when others then
    dbms_output.put_line('강의실 입력을 실패하였습니다.');
end procClassroomInsert;

--강의실 정보 입력 프로시저 실행
begin
    procclassroomInsert('테스트강의실1', '15');
exception
    when others then
    dbms_output.put_line('강의실 입력을 실패하였습니다.');
end;

select * from tblClassroom;

--2) 강의실 정보 수정
---강의실 정보 수정 프로시저 생성
create or replace procedure procClassEdit(
    pseq number,
    ptarget number,
    pedit varchar2
)
is
begin
    if ptarget = 1 then
        update tblClassroom set classroomname = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '강의실명:' || pedit);
        dbms_output.put_line('강의실명 수정에 성공하였습니다.');
    elsif ptarget = 2 then
        update tblClassroom set max = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '정원:' || pedit);
        dbms_output.put_line('정원 수정에 성공하였습니다.');
    else 
        dbms_output.put_line('강의실 수정을 실패하였습니다.');
    end if;
exception
    when others then
    dbms_output.put_line('강의실 수정을 실패하였습니다.');
end;

-- 강의실 정보 수정 프로시저 실행
begin
    procClassEdit(2, 2, '30'); -- 1번 강의실명, 2번 정원
exception
    when others then
    dbms_output.put_line('강의실 수정을 실패하였습니다.');
end;

--3) 강의실 정보 삭제
-- 강의실 정보 삭제 프로시저 생성
create or replace procedure procDelClassroom(
    pseq number
)
is
    vname tblClassroom.classroomname%type;
begin
    select classroomname into vname from tblClassroom where seq = pseq;
    delete from tblClassroom where seq = pseq;
    dbms_output.put_line('강의실명:' || vname);
    dbms_output.put_line('해당 강의실을 삭제를 성공하였습니다.');
exception 
    when others then 
    dbms_output.put_line('해당 강의실을 삭제를 실패하였습니다.');
end;


---강의실 정보 삭제 프로시저 실행
begin
    procDelClassroom('강의실번호');
end;

--------------------교재--------------------
insert into tblBook(seq, booktitle, publisher, author) values (seq_tblBook.nextVal, '추가 교재명', '출판사', '작가');

--1) 교재 정보 입력
---교재 정보 입력 프로시저 생성
create or replace procedure procbookInsert(
    pbooktitle varchar2,
    ppublisher varchar2,
    pauthor varchar2
)
is
begin
    insert into tblBook(seq, booktitle, publisher, author) values (seq_tblBook.nextVal, pbooktitle, ppublisher, pauthor);
    dbms_output.put_line('교재 입력에 성공하였습니다.');
    dbms_output.put_line('교재명:' || pbooktitle || '     ' || '출판사:' || ppublisher || '     ' || '작가:' || pauthor);
exception
    when others then
    dbms_output.put_line('교재 입력을 실패하였습니다.');
end procbookInsert;

--교재 정보 입력 프로시저 실행
begin
    procbookInsert('테스트교재명', '테스트출판사', '테스트작가');
end;


--2) 교재 정보 수정

---교재 정보 수정 프로시저 생성
create or replace procedure procBookEdit (
    pseq number,
    ptarget number,
    pedit varchar2
)
is
begin
    if ptarget = 1 then
        update tblBook set booktitle = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '교재명:' || pedit);
        dbms_output.put_line('교재명 수정에 성공하였습니다.');
    elsif ptarget = 2 then
        update tblBook set publisher = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '출판사:' || pedit);
        dbms_output.put_line('출판사 수정에 성공하였습니다.');
    elsif ptarget = 3 then
        update tblBook set author = pedit where seq = pseq;
        dbms_output.put_line('번호:' || pseq || '     ' || '작가:' || pedit);
        dbms_output.put_line('작가 수정에 성공하였습니다.');
    else
        dbms_output.put_line('교재 수정을 실패하였습니다.');
    end if;
exception
    when others then
    dbms_output.put_line('교재 수정을 실패하였습니다.');
end;

---교재 정보 수정 프로시저 실행
begin
    procBookEdit(1, 3, '구멍가게 코딩단'); --1번 교재명, 2번 출판사, 3번 작가
exception
    when others then
    dbms_output.put_line('교재 수정을 실패하였습니다.');
end;


--3) 교재 정보 삭제
---교재 정보 삭제 프로시저 생성
create or replace procedure procDelBook(
    pseq number
)
is
    vname tblbook.booktitle%type;
begin
    select booktitle into vname from tblbook where seq = pseq;
    delete from tblBook where seq = pseq;
    dbms_output.put_line('교재명:' || name );
    dbms_output.put_line('해당 교재 삭제를 성공하였습니다.');
exception when others then 
    dbms_output.put_line('해당 교재 삭제를 실패하였습니다.');
end;

---교재 정보 삭제 프로시저 실행
begin
    procDelBook('교재번호');
end;


