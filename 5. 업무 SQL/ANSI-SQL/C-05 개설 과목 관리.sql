--C-05 개설 과목 관리

----(1) 입력
--**기초 과목 
--과목
insert into tblSubject(seq, subjectName) values(seq_subject.nextVal, '등록할 과목명');
--과정-과목
insert into tblSubjectCourse(seq, sseq, cseq) values(seq_SubjectCourse.nextval, '과목번호', '과정번호');

--**개설 과목 신규 등록
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) 
    values (seq_OpenedSubject.nextVal, '개설과정번호', '교사번호', '과정-과목번호','강의진행여부(강의 예정, 강의 중, 강의 종료)', '과목 시작일', '과목 종료일');

--**교재-개설과목 등록
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, ‘교재번호’, '개설과목번호');

----(2)출력
--**특정 개설 과정 선택
select 
    seq as "개설과목번호",
    ocseq as "개설과정번호",
    tseq as "교사번호",
    scseq as "과정과목번호", 
    isprogress as "강의진행여부",
    startdate as "과목 시작일",
    enddate as "과목 종료일"
from tblOpenedSubject
where ocseq = '개설과정번호';

--출력

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

----(3)수정
--개설과목 수정
update tblOpenedSubject set ocseq = '개설과정번호' where seq = '수정할 개설과목번호'; 
update tblOpenedSubject set tseq = '교사번호' where seq = '수정할 개설과목번호';
update tblOpenedSubject set csseq = '과정과목번호' where seq = '수정할 개설과목번호';
update tblOpenedSubject set isprogress = '강의 예정, 강의 중, 강의 종료 중 하나의 값' where seq = '수정할 개설과목번호';
update tblOpenedSubject set startdate = '과목 시작일' where seq = '수정할 개설과목번호';
update tblOpenedSubject set enddate = '과목 종료일' where seq = '수정할 개설과목번호';

--교재-개설과목 수정
update tblBookSubject set bseq = '교재번호' where seq = '수정할 교재-개설과목번호';
update tblBookSubject set osseq = '개설과목번호' where seq = '수정할 교재-개설과목번호';

----(4)삭제
--개설과목 삭제
delete from tblOpenedSubject where seq = '수정할 개설과목번호';

--교재-개설과목 삭제
delete from tblBookSubject where seq = '수정할 교재-개설과목번호';
