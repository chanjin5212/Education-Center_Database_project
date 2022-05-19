--C-02 기초 정보 관리
--기초 정보 등록 및 관리

----(1) 입력
--과목
insert into tblSubject(seq, subjectName) values (seq_Subject.nextVal, '추가 과목명');

--과정
insert into tblCourse(seq, courseName) values (seq_Course.nextVal, '추가 과정명');

--과정-과목
insert into tblSubjectCourse(seq, sseq, cseq) values (seq_SubjectCourse.nextVal, '과목번호', '과정번호');

--강의실
insert into tblClassroom(seq, classroomName, max) values (seq_Classroom.nextVal, '추가 강의실명', '정원');

--교재
insert into tblBook(seq, booktitle, publisher, author) values (seq_tblBook.nextVal, '추가 교재명', '출판사', '저자');


----(2) 출력
--과목
select * from tblSubject; 

--과정
select * from tblCourse; 

--과정-과목
select sc.seq, c.coursename, s.subjectname from tblSubjectCourse sc
    inner join tblSubject s on sc.sseq = s.seq
        inner join tblCourse c on sc.cseq = c.seq order by sc.seq; 
        
--강의실
select * from tblClassroom; 

--교재
select * from tblBook; 




----(3) 수정
--과목
update tblSubject set subjectname = '과목명' where seq = '수정할 과목 번호';

--과정
update tblCourse set coursename = '과정명' where seq = '수정할 과정 번호';

--과정-과목
update tblSubjectCourse set sseq = '과목번호', cseq = '과정번호' where seq = '수정할 과정-과목 번호';

--강의실
update tblClassroom set classroomname = '강의실명' where seq = '수정할 강의실 번호';
update tblClassroom set max = '정원' where seq = '수정할 강의실 번호';

--교재
update tblBook set booktitle = '교재명' where seq = '수정할 교재 번호';
update tblBook set publisher = '출판사' where seq = '수정할 교재 번호';
update tblBook set author = '작가' where seq = '수정할 교재번호';



----(4) 삭제
delete from tblSubject where seq = '삭제할 과목 번호';
delete from tblCourse where seq = '삭제할 과정 번호';
delete from tblSubjectCourse where seq = '삭제할 과정-과목 번호';
delete from tblClassroom where seq = '삭제할 강의실 번호';
delete from tblBook where seq = '삭제할 교재 번호';

