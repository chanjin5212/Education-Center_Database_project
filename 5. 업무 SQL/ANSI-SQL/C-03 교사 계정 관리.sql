--C-03 교사 계정 관리

----(1) 입력
insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '등록할 교사 이름', '주민번호 뒷7자리 ', '핸드폰번호');

--강의가능 과목 추가
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, '교사번호', '과목번호');

----(2) 출력
select * from tblTeacher;

---**교사 정보 출력
--전체출력
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

--특정 교사 출력
select distinct
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
where t.seq = '교사번호'
order by os.startdate asc;

----(3) 수정
update tblTeacher set name = '이름' where seq = '수정할 교사 번호';
update tblTeacher set jumin = '주민번호 뒷 7자리' where seq = '수정할 교사 번호';
update tblTeacher set tel = '핸드폰 번호' where seq = '수정할 교사 번호';

update tblAvailable set tseq = '교사번호' where seq = '수정할 강의가능과목 번호';
update tblAvaulable set sseq = '과목번호' where seq = '수정할 강의가능과먹 번호';

----(4) 삭제
delete from tblTeacher where seq = '삭제할 교사 번호';

delete from tblAvailable where seq = '삭제할 강의가능한 과목번호';
