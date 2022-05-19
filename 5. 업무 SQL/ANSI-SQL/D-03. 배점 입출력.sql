--3. 배점 입출력



--3.1 강의를 마친 과목에 한해 특정 과목 선택, 배점 정보를 출결, 필기, 실기로 구분해 등록
-- 프로시저: 입력, 수정, 삭제 -> 출결+필기+실기배점 = 1이 아니면 에러 나도록

--배점 정보 등록
insert into tblscoring(seq, osseq, attrate, wtestrate, ptestrate)
    values(seq_Scoring.nextVal, (select seq from tblOpenedSubject where isprogress = '강의종료' and seq = 개설과목번호), 출결배점, 필기배점, 실기배점);

--배점 정보 수정
update tblScoring set attrate = 수정할 출결배점, wtestrate = 수정할 필기배점, ptestrate = 수정할 실기배점 where osseq = 수정할 개설과목번호;

--배점 정보 삭제
delete from tblScoring where osseq = 삭제할 개설과목번호;


--3.2 시험 날짜와 시험 문제 추가
-- 프로시저: 입력, 수정, 삭제

-- 시험 추가
insert into tblTest(seq, osseq, testdate, testtype, question)
    values (seq_Test.nextVal, '개설과목번호', '원하는 날짜', '필기/실기 중 하나의 값', '시험문제');

-- 시험 날짜 수정
update tblTest set testdate = '수정할 날짜' where seq = 수정할 시험 번호;

-- 시험 유형 수정
update tblTest set testtype = '수정할 시험유형' where seq = 수정할 시험 번호;

-- 시험 문제 수정
update tbltest set question = '수정할 시험문제' where seq = 수정할 시험 번호;

-- 시험 삭제 (시험 자체를 삭제)
delete from tblTest where seq = 삭제할 시험 번호;

-- 시험문제 삭제(null)
update tblTest set question is null where seq = 삭제할 시험 번호;



--3.3 과목 목록 전체 출력: (해당 교사가 맡은) 과목번호, 과정명, 과정기간(시작,끝), 강의실, 과목명, 과목기간(시작,끝), 교재명, 출결배점, 필기배점, 실기배점
--    배점 미등록 시 null로 출력

select
    os.seq as "개설과목번호",
    c.courseName as "과정명",
    oc.startdate as "과정시작일",
    oc.enddate as "과정종료일",
    cr.classroomname as "강의실명",
    s.subjectname as "과목명",
    os.startdate as "과목시작일",
    os.enddate as "과목종료일",
    os.isprogress as "강의진행여부",
    b.booktitle as "교재명",
    score.attrate as "출결배점",
    score.wtestrate as "필기배점",
    score.ptestrate as "실기배점"
    
from tblOpenedSubject os
    inner join tblSubjectCourse sc on os.scseq = sc.seq
    inner join tblCourse c on sc.cseq = c.seq
    inner join tblOpenedCourse oc on os.ocseq = oc.seq
    inner join tblClassroom cr on oc.rseq = cr.seq
    inner join tblSubject s on sc.sseq = s.seq
    inner join tblBookSubject bs on os.seq = bs.osseq
    inner join tblBook b on bs.bseq = b.seq
    left outer join tblScoring score on os.seq = score.osseq
        where os.tseq = (select seq from tblTeacher where jumin = '조회할 교사 주민등록번호 뒷자리')
                order by oc.startdate, os.startdate asc;
                

--3.4 특정 과목 선택 출력(개설과목번호로): 출결배점, 필기배점, 실기배점, 시험날짜, 시험문제
--    배점, 시험문제 미등록 시 null로 출력

select
    os.seq as "개설과목번호",
    score.attrate as "출결배점",
    score.wtestrate as "필기배점",
    score.ptestrate as "실기배점",
    t.testdate as "시험날짜",
    t.testtype as "시험유형",
    t.question as "시험문제"
    
from tblScoring score
    right outer join tblOpenedSubject os on score.osseq = os.seq
    inner join tblTest t on os.seq = t.osseq
        where os.seq = 개설과목번호
            order by t.testdate asc;
        