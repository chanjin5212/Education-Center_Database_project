--C-04 개설 과정 관리

----(1) 입력
--기초 과정 
insert into tblCourse(seq, courseName) values(seq_Course.nextVal, '등록할 과정이름');

--동적 과정
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) 
    values(seq_openedCourse.nextVal, '과정번호', '강의실번호' , '과정 시작일', '과정 종료일');

----(2) 출력
--모든 개설 과정 정보

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

--특정 개설 과정 정보
select distinct
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
where oc.seq = '개설 과정번호'
order by os.startdate;


----(3) 수정
update tblOpenedCourse set cseq ='과정번호' where seq = '수정할 개설과정번호' --과정번호 수정
update tblOpenedCourse set rseq ='강의실 번호' where seq = '수정할 개설과정번호'  --강의실 수정
update tblOpenedCourse set startdate ='과정시작일' where seq = '수정할 개설과정번호'  -- 과정시작일 수정
update tblOpenedCourse set enddate ='과정종료일' where seq = '수정할 개설과정번호'  --과정종료일 수정

----(4) 삭제
delete from tblOpenedCourse where seq = ‘개설과정번호’;
