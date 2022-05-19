set define off;

-- 관리자
insert into tblManager values(seq_manager.nextval, 'eSfCEw54', 'jbQKtlKl62');
insert into tblManager values(seq_manager.nextval, 'TrEESi24', 'ImqbeILV98');
insert into tblManager values(seq_manager.nextval, 'asdf', 'asdf');

-- 과목
insert into tblSubject values(seq_subject.nextVal, 'Spring');
insert into tblSubject values(seq_subject.nextVal, 'Java');
insert into tblSubject values(seq_subject.nextVal, 'AWS');
insert into tblSubject values(seq_subject.nextVal, 'Oracle');
insert into tblSubject values(seq_subject.nextVal, 'HTML');                 --5
insert into tblSubject values(seq_subject.nextVal, 'CSS');
insert into tblSubject values(seq_subject.nextVal, 'JavaScript');
insert into tblSubject values(seq_subject.nextVal, 'jquery');
insert into tblSubject values(seq_subject.nextVal, 'jsp');
insert into tblSubject values(seq_subject.nextVal, 'mybatis');              --10
insert into tblSubject values(seq_subject.nextVal, 'python');
insert into tblSubject values(seq_subject.nextVal, 'r프로그래밍');
insert into tblSubject values(seq_subject.nextVal, 'MongoDB');
insert into tblSubject values(seq_subject.nextVal, 'Hadoop');
insert into tblSubject values(seq_subject.nextVal, 'Servlet/JSP');          --15
insert into tblSubject values(seq_subject.nextVal, 'Spring/Mybatis');
insert into tblSubject values(seq_subject.nextVal, '안드로이드 프로그래밍');
insert into tblSubject values(seq_subject.nextVal, '안드로이드 DB');
insert into tblSubject values(seq_subject.nextVal, 'Node');
insert into tblSubject values(seq_subject.nextVal, 'React');                --20
insert into tblSubject values(seq_subject.nextVal, 'Vue');
insert into tblSubject values(seq_subject.nextVal, 'Angular');
insert into tblSubject values(seq_subject.nextVal, 'MariaDB');
insert into tblSubject values(seq_subject.nextVal, 'git');

--과정
insert into tblCourse values(seq_course.nextval, '(디지털컨버젼스)AWS 클라우드 활용 자바(Java) Full-Stack 개발자 양성 과정'); -- Spring, Java, AWS, Oracle, HTML, CSS, JavaScript, jquery, jsp, spring, mybatis
insert into tblCourse values(seq_course.nextval, '실무 프로젝트 기반 자바&빅데이터 개발자 양성과정'); -- python, r프로그래밍
insert into tblCourse values(seq_course.nextval, '(빅데이터 전문가) 웹기반 빅데이터 활용 전문 개발자 양성과정'); -- python, MongoDB, Hadoop, Servlet/JSP, Spring/MyBatis
insert into tblCourse values(seq_course.nextval, 'AWS 활용 및 데이터 분석·시각화'); -- Spring, Java, AWS
insert into tblCourse values(seq_course.nextval, '안드로이드 앱 프로그래밍'); -- 안드로이드 프로그래밍, 안드로이드 DB 
insert into tblCourse values(seq_course.nextval, '웹 프론트엔드 클라우드 콘솔 개발자 양성'); -- Node, React, Vue, Angular, Python, MariaDB, MongoDB
insert into tblCourse values(seq_course.nextval, '(디지털컨버전스)자바(JAVA)기반 공공데이터 융합 개발자 양성과정'); -- Servlet/JSP, Spring/MyBatis, git
insert into tblCourse values(seq_course.nextval, '웹기반 빅데이터 전문 개발자 양성과정'); -- Spring, Java, MongoDB, Hadoop, node

-- 과정과목 (과정과목번호, 과목번호, 과정번호)
-- java 필수 포함

--1 (디지털컨버젼스)AWS 클라우드 활용 자바(Java) Full-Stack 개발자 양성 과정 : Spring, java, AWS
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 1, 1);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 2, 1);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 3, 1);

--2 실무 프로젝트 기반 자바&빅데이터 개발자 양성과정 : java, python, r프로그래밍
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 2, 2);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 11, 2);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 12, 2);

--3 (빅데이터 전문가) 웹기반 빅데이터 활용 전문 개발자 양성과정: java, MongoDB, Servlet/JSP
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 2, 3);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 13, 3);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 15, 3);

--4 AWS 활용 및 데이터 분석·시각화: Spring, java, AWS
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 1, 4);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 2, 4);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 3, 4);

--5 안드로이드 앱 프로그래밍: 안드로이드 프로그래밍, 안드로이드 DB, java
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 17, 5);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 18, 5);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 2, 5);

--6 웹 프론트엔드 클라우드 콘솔 개발자 양성: React, Vue, java
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 20, 6);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 21, 6);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 2, 6);

--7 (디지털컨버전스)자바(JAVA)기반 공공데이터 융합 개발자 양성과정: java, Spring/MyBatis, git
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 2, 7);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 16, 7);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 24, 7);

--8 웹기반 빅데이터 전문 개발자 양성과정: java, Hadoop, node
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 2, 8);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 14, 8);
insert into tblSubjectCourse values (SEQ_SUBJECTCOURSE.nextval, 19, 8);


-- 강의실
insert into tblClassroom values(seq_classroom.nextval, '1강의실', 30);
insert into tblClassroom values(seq_classroom.nextval, '2강의실', 30);
insert into tblClassroom values(seq_classroom.nextval, '3강의실', 30);
insert into tblClassroom values(seq_classroom.nextval, '4강의실', 26);
insert into tblClassroom values(seq_classroom.nextval, '5강의실', 26);
insert into tblClassroom values(seq_classroom.nextval, '6강의실', 26);


-- 교재 (교재번호, 교재명, 출판사, 저자)
insert into tblBook values(seq_tblbook.nextVal, '코드로 배우는 스프링 웹 프로젝트', '남가람북스', '구멍가게 코딩단');
insert into tblBook values(seq_tblbook.nextVal, 'Java의 정석 3판', '도우출판', '남궁성');
insert into tblBook values(seq_tblbook.nextVal, '당신이 지금 알아야 할 AWS', '비제이퍼블릭', '이영호, 한동수');
insert into tblBook values(seq_tblbook.nextVal, '데이터베이스 개론과 실습', '한빛아카데미', '박우창, 남송휘');
insert into tblBook values(seq_tblbook.nextVal, 'Do it! 자바 프로그래밍 입문', '이지스퍼블리싱', '박은종');              --5
insert into tblBook values(seq_tblbook.nextVal, '윤성우의 열혈 Java 프로그래밍', '오렌지미디어', '윤성우');  
insert into tblBook values(seq_tblbook.nextVal, '모던 자바스크립트 Deep Dive', '위키북스', '이웅모');
insert into tblBook values(seq_tblbook.nextVal, '자바스크립트+jQuery', '영진닷컴', '박성배');
insert into tblBook values(seq_tblbook.nextVal, '쉽게 배우는 JSP 웹 프로그래밍', '한빛아카데미', '송미영');
insert into tblBook values(seq_tblbook.nextVal, '스프링 부트 JSP + MyBatis + MySQL', '온노트', '향단코드');              --10
insert into tblBook values(seq_tblbook.nextVal, 'Do it! 점프 투 파이썬', '이지스퍼블리싱', '박응용');                 
insert into tblBook values(seq_tblbook.nextVal, '빅데이터 분석 도구 R 프로그래밍', '에이콘출판사', '권정민');
insert into tblBook values(seq_tblbook.nextVal, '몽고DB 완벽 가이드', '한빛미디어', '크리스티나 초도로 외 2명');
insert into tblBook values(seq_tblbook.nextVal, 'Hadoop 보안', '에이콘출판사', '수디쉬 나라야난');
insert into tblBook values(seq_tblbook.nextVal, 'JSP & Servlet 웹 프로그래밍 입문', '앤써북', '정동진, 최주호');         --15
insert into tblBook values(seq_tblbook.nextVal, '깡쌤의 안드로이드 프로그래밍', '쌤즈', '강성윤');                    
insert into tblBook values(seq_tblbook.nextVal, 'Node.js 교과서', '길벗', '조현영');
insert into tblBook values(seq_tblbook.nextVal, '초보자를 위한 리액트 200제', '정보문화사', '이정열');
insert into tblBook values(seq_tblbook.nextVal, 'Vue.js 프로젝트 투입 일주일 전', '비제이퍼블릭', '고승원'); 
insert into tblBook values(seq_tblbook.nextVal, '러닝! Angular 4', '위키북스', '브래드 데일리');                         --20
insert into tblBook values(seq_tblbook.nextVal, 'MariaDB 구축과 활용', '에이콘출판사', '다니엘 바솔로뮤');            
insert into tblBook values(seq_tblbook.nextVal, '팀 개발을 위한 Git, GitHub', '한빛미디어', '정호영, 진유림');


--  교사

insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '한광훈', '1534921', '010-5456-5418');
insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '나윤철', '1785425', '010-0465-3845');
insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '김선혜', '2683521', '010-1529-9965');
insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '차혜선', '2234598', '010-4547-2011');
insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '김종민', '1756548', '010-1546-5465');
insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '박상호', '1548896', '010-9873-4100');
insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '배경민', '1584132', '010-3111-9370');
insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '신수연', '2645856', '010-1546-2211');
insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '강도현', '1556548', '010-1664-9785');
insert into tblTeacher(seq, name, jumin, tel) values(seq_Teacher.nextVal, '신종욱', '1546854', '010-9654-5222');


--개설과정
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 1, 1, '2021-10-18', '2022-04-18');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 1, 2, '2021-12-15', '2022-06-20');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 2, 3, '2021-01-31', '2022-08-08');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 2, 4, '2021-02-14', '2022-08-15');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 3, 5, '2022-03-04', '2022-09-05');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 3, 6, '2022-04-25', '2022-10-26');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 4, 1, '2022-05-02', '2022-11-03');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 4, 2, '2022-06-27', '2022-12-30');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 5, 3, '2022-08-16', '2023-02-20');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 6, 4, '2022-08-18', '2023-02-22');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 7, 5, '2022-09-08', '2023-03-13');
insert into tblOpenedCourse(seq, cseq, rseq, startdate, enddate) values(seq_openedCourse.nextVal, 8, 6, '2022-11-07', '2023-05-10');


-- 강의 가능 과목

insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 1, 1);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 1, 2);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 1, 3);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 1, 4);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 1, 7);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 1, 8);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 1, 9);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 2, 2);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 2, 10);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 2, 11);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 2, 12);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 3, 2);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 3, 13);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 3, 14);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 3, 15);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 4, 1);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 4, 2);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 4, 3);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 5, 16);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 5, 17);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 5, 18);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 5, 2);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 6, 19);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 6, 20);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 6, 21);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 6, 2);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 7, 2);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 7, 16);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 7, 24);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 8, 2);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 8, 14);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 8, 19);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 9, 2);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 9, 5);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 9, 6);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 9, 7);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 10, 2);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 10, 22);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 10, 23);
insert into tblAvailable(seq, tseq, sseq) values(seq_available.nextVal, 10, 24);


-- 교육생 정보

insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '장관양', '2709960', '010-7931-1658', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '편효창', '2827962', '010-9379-5000', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '옥섭남', '1954758', '010-8301-6070', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '마실병', '1948260', '010-0413-8745', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '현아예', '2108675', '010-3638-2396', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '왕주애', '1008207', '010-0765-2863', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신관유', '1149327', '010-1263-5460', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '원늘새', '2916586', '010-4616-4499', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '배얀설', '1934666', '010-5093-1754', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '여누엽', '1847821', '010-0036-3170', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '명치환', '1457105', '010-1651-9438', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '함소수', '2172926', '010-1845-6093', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '원래운', '1388494', '010-0894-8891', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '위오온', '2017680', '010-5822-1768', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '함온중', '1033925', '010-6311-7187', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '임실명', '2592234', '010-0562-1212', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '허단걸', '1969481', '010-5578-7991', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '전령찬', '2406266', '010-8935-9343', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '진백성', '1576277', '010-8481-0831', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '성겸량', '2093148', '010-8788-6384', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '왕부중', '1808065', '010-8868-3975', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '안혁흥', '2186858', '010-7142-9803', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '위종미', '2600938', '010-6265-4554', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '방헌훔', '2900675', '010-1953-5875', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '여실자', '1101407', '010-6120-5636', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '여복범', '1842437', '010-2168-2950', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '곽윤환', '1847355', '010-5719-3155', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '여창언', '2849286', '010-8131-6248', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '권채해', '1934771', '010-9241-8449', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '선산섭', '1088385', '010-9295-3371', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '허장진', '2604353', '010-8859-5113', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '방면삼', '2229245', '010-5225-3603', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '반래권', '1017042', '010-6692-9000', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '어곤소', '2408804', '010-5653-8025', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '천분직', '2818301', '010-3029-6847', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '나새진', '2063751', '010-4415-9413', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '탁형해', '1972668', '010-5644-5859', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '공으려', '2026604', '010-6864-1524', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '심범장', '2576707', '010-8963-4229', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '구운기', '1459837', '010-0700-1785', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '한실요', '1070629', '010-2882-6256', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '진소혼', '2166973', '010-8140-9206', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '염람번', '2174944', '010-3491-7515', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '용식진', '2936650', '010-5853-3454', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '육희비', '2809974', '010-9806-8009', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '명순섬', '1956371', '010-6334-8399', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '서슬식', '2370956', '010-4731-2066', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '정담단', '2222605', '010-2079-9278', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '마견래', '2808127', '010-9948-6685', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '여판학', '2826099', '010-4305-7758', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '조하강', '1737146', '010-8826-0339', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '변단설', '1913977', '010-9627-8121', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '주정뜸', '2598307', '010-2957-2141', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '장회흔', '1608985', '010-1592-1684', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '노택제', '2286379', '010-5460-7562', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '주주령', '2467059', '010-4753-5089', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '정훔두', '1279104', '010-7867-4593', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '국변린', '2523450', '010-1582-5717', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '노선롱', '2478230', '010-1273-8193', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '진식판', '2222643', '010-1581-2381', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '곽반타', '1967511', '010-6519-7994', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '강길지', '2262753', '010-7226-5977', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '김아직', '2086205', '010-6050-5683', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '노악동', '2262093', '010-0776-1312', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '위슬대', '1447352', '010-8774-3389', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '석관실', '1395279', '010-7058-6525', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '진사진', '1736251', '010-4564-8064', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '육연승', '2245504', '010-1626-1807', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '김용복', '1384409', '010-1679-0649', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신열송', '2432615', '010-8839-9602', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '허얀나', '1893365', '010-2727-5851', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신술울', '1836012', '010-0610-0378', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '선솔봉', '1521504', '010-0261-9388', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '변손가', '1761699', '010-3435-6695', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '남덕심', '2359718', '010-9781-3056', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '어탐현', '1167655', '010-5942-9123', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '배랑공', '2439177', '010-4629-4384', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '육무정', '2371700', '010-5259-6788', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '맹만판', '1425771', '010-5498-9326', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '조월반', '1487935', '010-0104-6180', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '오광흠', '1955538', '010-3446-8298', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '인추자', '1621382', '010-9102-9145', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '명대라', '1262307', '010-6864-9092', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '강삼채', '1293665', '010-7877-0163', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '인인늘', '1765052', '010-2190-9365', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '방손요', '2027684', '010-9100-7423', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '유광노', '1588895', '010-0051-8637', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '류엄설', '1565581', '010-0258-3577', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '윤리해', '1876165', '010-9409-9521', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '노을분', '1959173', '010-0823-2458', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '탁해실', '1648060', '010-3119-1307', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '전만으', '1654182', '010-4647-4385', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '연엄달', '1024729', '010-0584-3728', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '주뜸나', '2137989', '010-0667-8027', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신휘늘', '1233320', '010-0135-8232', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '유롱영', '1454022', '010-2635-0630', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '옥빛중', '1787145', '010-4599-4509', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '양악요', '1537307', '010-9698-2780', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '유형번', '2374991', '010-0724-4326', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '손천달', '2967601', '010-0724-4568', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '모헌유', '2062090', '010-7733-4574', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '원애노', '1171428', '010-8011-0485', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '추나디', '1486923', '010-4824-5407', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '황개세', '1919183', '010-8532-7279', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '노시리', '2725461', '010-7013-6594', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '전으신', '2860159', '010-9271-6910', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '최홍부', '1221056', '010-9148-0353', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '방태찬', '1208749', '010-4757-7063', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '마산항', '1788307', '010-1622-9537', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '백혁섬', '2764804', '010-5972-1500', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '남송양', '2877337', '010-0019-4091', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '성숭묵', '2172425', '010-5761-8625', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '왕가언', '2301029', '010-2012-5153', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '진잔휴', '2613195', '010-7240-2389', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '고천경', '1516308', '010-5210-8835', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '진누람', '2110246', '010-8557-3798', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '정심비', '1011634', '010-1604-8607', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '금섭한', '1616040', '010-5391-6491', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신경원', '1589599', '010-1095-3604', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '류고래', '1965664', '010-4317-5035', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '심지회', '1427808', '010-8004-3236', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '채배반', '2552992', '010-6926-5326', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '천미아', '1366138', '010-2892-8038', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '명화형', '1995034', '010-1947-1099', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '구박솔', '1588430', '010-1780-5497', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '서루황', '1925163', '010-7191-2601', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '배율진', '2692040', '010-6296-8386', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신흥강', '1006782', '010-2429-7452', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '장휘더', '2360749', '010-9802-5121', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '석겸규', '2135773', '010-7434-3519', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '나원헌', '1284579', '010-8230-6562', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신얀송', '1503766', '010-1803-0630', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '편출종', '2712543', '010-2370-6054', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신엄슬', '2631558', '010-1036-9012', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '양혼여', '2638422', '010-1485-9048', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '남백순', '1801281', '010-2655-7763', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '민규박', '1841298', '010-6697-6735', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '곽탁린', '2905588', '010-3360-2308', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '진소개', '2871081', '010-8789-7448', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '길병엄', '2843917', '010-9823-4879', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '정재언', '1235884', '010-7955-6283', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '양늬새', '1184292', '010-3335-8798', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '고직오', '2793987', '010-5910-7417', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '문학으', '1864685', '010-2984-4088', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '탁들진', '2017078', '010-6849-2976', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '설곤판', '1739865', '010-8865-7704', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '구찬부', '2203535', '010-2622-4034', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '정탁주', '2996773', '010-5639-0521', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '심순람', '1635298', '010-7207-0070', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '권손묵', '1932617', '010-6176-3512', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '방더연', '2095533', '010-7539-0426', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '선도잎', '2117547', '010-8955-8606', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '유여양', '2496730', '010-5493-1989', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '유설달', '2563641', '010-0154-1803', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '권명복', '1458837', '010-4818-3007', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '제들롱', '2388068', '010-7473-9247', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '마울길', '1045928', '010-7598-5046', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '탁심훔', '1946804', '010-5434-5449', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '황건노', '1392833', '010-6969-5104', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '강순솜', '2978997', '010-1330-1437', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '정공덕', '2708987', '010-9918-5691', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '변전울', '1728875', '010-2998-2790', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '양손중', '2172440', '010-4185-7986', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '주운찬', '2569665', '010-3507-3341', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '기더덕', '2136436', '010-0492-1069', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '오련엽', '2748137', '010-1293-4096', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '기온래', '2598611', '010-1540-5804', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '장권반', '1204665', '010-8708-5463', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '용광휘', '1130682', '010-0964-4930', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '홍미강', '1195797', '010-9475-1552', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '주리다', '1152348', '010-7474-4264', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '변화향', '1010635', '010-9460-8406', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '위채요', '2044760', '010-1275-1151', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '차산운', '1055556', '010-8527-0333', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '변단배', '1463900', '010-5893-7618', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '은택요', '1165861', '010-2982-5862', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '한엽송', '1520556', '010-0991-8659', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '남초옥', '1854628', '010-5349-8035', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '민단비', '1888550', '010-2829-1755', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '모채련', '1287853', '010-2120-9910', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신배혁', '1739891', '010-4176-4540', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '엄개요', '1981663', '010-0030-8627', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '위윤연', '1230378', '010-1309-4470', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '구온탐', '1343915', '010-5793-8308', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '주연순', '2843539', '010-7846-3567', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '왕택언', '1377574', '010-2464-2420', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '진주림', '1409780', '010-0801-2551', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '국회다', '1752853', '010-8555-8405', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '노충잎', '1047376', '010-2217-6514', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '구영범', '2492408', '010-6495-4455', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '최노뜸', '2264158', '010-8916-3902', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '표별랑', '2719849', '010-5772-6737', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '여동태', '2826103', '010-8380-1376', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '양엄도', '2242253', '010-4116-0756', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '곽해마', '2392392', '010-7433-0599', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '어향운', '2951864', '010-3858-9326', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '양우마', '2859861', '010-0105-5270', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '옥문배', '2785348', '010-0409-3428', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '어언림', '2913926', '010-8861-6329', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '송충곤', '2612668', '010-3847-0751', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '홍개배', '2443612', '010-1257-1726', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '원건헌', '1400725', '010-2268-8411', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '유솜태', '2821843', '010-4334-6213', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '송울권', '2573115', '010-7066-1701', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '위치인', '1859421', '010-9489-5125', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '양형령', '1558395', '010-9342-3444', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '옥직늬', '2909919', '010-6871-2821', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '양보덕', '1387992', '010-6836-7541', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '용솜현', '2018052', '010-7365-7660', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '정엄시', '1593015', '010-5397-6032', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '하민만', '2343725', '010-5118-6219', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '기연새', '1430079', '010-4918-3420', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '홍향디', '1977368', '010-2069-3538', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '손택승', '2196701', '010-4366-7761', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '방울효', '2845805', '010-9306-4961', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '장덕달', '1700011', '010-4213-7895', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '염가오', '2040434', '010-6877-4950', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '안고문', '1071152', '010-1125-5937', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '모율여', '2746868', '010-8866-2692', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '노인운', '2616504', '010-9593-8243', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '노유규', '2501466', '010-3202-1083', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '표병평', '2825653', '010-3851-4152', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '옥두요', '2517374', '010-0557-3238', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '주란슬', '2505969', '010-2927-2030', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신동학', '2755191', '010-7533-8886', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '백근으', '2114846', '010-1073-6657', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '양들랑', '2393366', '010-8059-7349', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '박빈열', '2349750', '010-8655-0235', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '석은빛', '1156412', '010-7103-5889', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '윤희휘', '1030959', '010-6256-4094', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '이지늬', '2139844', '010-2212-4227', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '국로휘', '1549560', '010-5458-6451', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '선동권', '1318624', '010-4007-9414', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '신번새', '2132873', '010-5870-3861', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '명경식', '1058105', '010-7408-8964', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '진종화', '1554014', '010-2933-3557', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '도솔숭', '2415980', '010-6728-9453', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '편울진', '1096096', '010-3018-4719', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '소으섬', '2159885', '010-2009-0363', '2022-10-17');
insert into tblStudent(seq, name, jumin, tel, regdate) values(seq_Student.nextVal, '진민세', '2124730', '010-0381-0827', '2022-10-17');



-- 교육생 수강정보
insert into tblSignUp values (seq_signUp.nextVal, 1, 1, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 2, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 3, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 4, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 5, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 6, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 7, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 8, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 9, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 10, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 11, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 12, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 13, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 14, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 15, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 16, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 17, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 18, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 19, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 1, 20, '2022-04-18', null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 21, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 22, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 23, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 24, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 25, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 26, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 27, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 28, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 29, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 30, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 31, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 32, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 33, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 34, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 35, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 36, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 37, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 38, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 39, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 2, 40, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 41, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 42, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 43, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 44, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 45, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 46, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 47, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 48, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 49, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 50, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 51, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 52, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 53, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 54, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 55, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 56, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 57, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 58, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 59, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 3, 60, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 61, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 62, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 63, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 64, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 65, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 66, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 67, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 68, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 69, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 70, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 71, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 72, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 73, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 74, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 75, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 76, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 77, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 78, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 79, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 4, 80, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 81, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 82, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 83, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 84, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 85, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 86, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 87, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 88, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 89, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 90, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 91, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 92, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 93, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 94, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 95, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 96, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 97, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 98, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 99, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 5, 100, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 101, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 102, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 103, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 104, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 105, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 106, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 107, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 108, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 109, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 110, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 111, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 112, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 113, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 114, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 115, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 116, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 117, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 118, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 119, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 6, 120, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 121, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 122, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 123, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 124, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 125, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 126, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 127, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 128, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 129, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 130, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 131, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 132, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 133, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 134, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 135, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 136, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 137, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 138, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 139, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 7, 140, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 141, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 142, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 143, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 144, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 145, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 146, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 147, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 148, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 149, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 150, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 151, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 152, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 153, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 154, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 155, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 156, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 157, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 158, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 159, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 8, 160, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 161, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 162, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 163, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 164, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 165, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 166, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 167, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 168, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 169, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 170, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 171, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 172, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 173, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 174, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 175, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 176, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 177, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 178, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 179, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 9, 180, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 181, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 182, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 183, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 184, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 185, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 186, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 187, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 188, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 189, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 190, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 191, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 192, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 193, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 194, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 195, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 196, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 197, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 198, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 199, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 10, 200, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 201, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 202, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 203, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 204, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 205, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 206, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 207, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 208, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 209, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 210, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 211, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 212, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 213, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 214, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 215, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 216, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 217, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 218, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 219, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 11, 220, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 221, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 222, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 223, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 224, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 225, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 226, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 227, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 228, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 229, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 230, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 231, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 232, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 233, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 234, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 235, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 236, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 237, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 238, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 239, null, null);
insert into tblSignUp values (seq_signUp.nextVal, 12, 240, null, null);

-- 개설과목: 6개월씩 12개 과정, !!!!개설과정당!!! 2개월씩 3개 > 36개
-- values (개설과목번호, 개설과정번호, 교사번호, 과정과목번호, 강의진행여부, 과목시작일, 과목종료일)


--현시점 강의인원(교사): 1, 2, 3, 4, 5, 6번 교사
--강의예정 인원: 7, 8, 2, 3, 4번 교사
--대타 대기인원(등록된 강의없음): 9, 10번 교사


--개설과정번호 > 개설과정명 : 해당 개설과목 3개
--개설과정 1 (수료) > (디지털컨버젼스)AWS 클라우드 활용 자바(Java) Full-Stack 개발자 양성 과정 : Spring, java, AWS
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 1, 1, 1, '강의종료', '2021-10-18', '2021-12-17');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 1, 1, 2, '강의종료', '2021-12-18', '2022-02-17');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 1, 1, 3, '강의종료', '2022-02-18', '2022-04-18');

--개설과정 2 > 실무 프로젝트 기반 자바&빅데이터 개발자 양성과정 : java, python, r프로그래밍
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 2, 2, 4, '강의종료', '2021-12-15', '2022-02-14');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 2, 2, 5, '강의종료', '2022-02-15', '2022-04-16');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 2, 2, 6, '강의중', '2022-04-17', '2022-06-20');

--개설과정 3 > (빅데이터 전문가) 웹기반 빅데이터 활용 전문 개발자 양성과정: java, MongoDB, Servlet/JSP
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 3, 3, 7, '강의종료', '2022-01-31', '2022-04-01');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 3, 3, 8, '강의중', '2022-04-02', '2022-06-04');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 3, 3, 9, '강의예정', '2022-06-05', '2022-08-08');

--개설과정 4 > AWS 활용 및 데이터 분석·시각화: Spring, java, AWS
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 4, 4, 10, '강의종료', '2022-02-14', '2022-04-14');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 4, 4, 11, '강의중', '2022-04-15', '2022-06-14');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 4, 4, 12, '강의예정', '2022-06-14', '2022-08-15');

--개설과정 5 > 안드로이드 앱 프로그래밍: 안드로이드 프로그래밍, 안드로이드 DB, java
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 5, 5, 13, '강의종료', '2022-03-04', '2022-05-03');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 5, 5, 14, '강의중', '2022-05-04', '2022-07-04');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 5, 5, 15, '강의예정', '2022-07-05', '2022-09-05');

--개설과정 6 > 웹 프론트엔드 클라우드 콘솔 개발자 양성: React, Vue, java
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 6, 6, 16, '강의중', '2022-04-25', '2022-06-24');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 6, 6, 17, '강의예정', '2022-06-25', '2022-08-25');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 6, 6, 18, '강의예정', '2022-08-26', '2022-10-26');

--개설과정 7 > (디지털컨버젼스)AWS 클라우드 활용 자바(Java) Full-Stack 개발자 양성 과정 : Spring, java, AWS
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 7, 1, 1, '강의중', '2022-05-02', '2022-07-01');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 7, 1, 2, '강의예정', '2022-07-02', '2022-09-02');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 7, 1, 3, '강의예정', '2022-09-03', '2022-11-03');

--개설과정 8 > (디지털컨버전스)자바(JAVA)기반 공공데이터 융합 개발자 양성과정: java, Spring/MyBatis, git
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 8, 7, 19, '강의예정', '2022-06-27', '2022-08-26');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 8, 7, 20, '강의예정', '2022-08-27', '2022-10-28');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 8, 7, 21, '강의예정', '2022-10-29', '2022-12-30');

--개설과정 9 > 웹기반 빅데이터 전문 개발자 양성과정: java, Hadoop, node
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 9, 8, 22, '강의예정', '2022-08-16', '2022-10-15');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 9, 8, 23, '강의예정', '2022-10-16', '2022-12-18');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 9, 8, 24, '강의예정', '2022-12-19', '2023-02-20');

--개설과정 10 > 실무 프로젝트 기반 자바&빅데이터 개발자 양성과정 : java, python, r프로그래밍
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 10, 2, 4, '강의예정', '2022-08-18', '2022-10-19');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 10, 2, 5, '강의예정', '2022-10-19', '2022-12-20');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 10, 2, 6, '강의예정', '2022-12-21', '2023-02-22');

--개설과정 11 > (빅데이터 전문가) 웹기반 빅데이터 활용 전문 개발자 양성과정: java, MongoDB, Servlet/JSP
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 11, 3, 7, '강의예정', '2022-09-08', '2022-11-10');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 11, 3, 8, '강의예정', '2022-11-11', '2023-01-10');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 11, 3, 9, '강의예정', '2023-01-10', '2023-03-13');

--개설과정 12 > AWS 활용 및 데이터 분석·시각화: Spring, java, AWS
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 12, 4, 10, '강의예정', '2022-11-07', '2023-01-07');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 12, 4, 11, '강의예정', '2023-01-08', '2023-03-09');
insert into tblOpenedSubject(seq, ocseq, tseq, scseq, isprogress, startdate, enddate) values (seq_OpenedSubject.nextVal, 12, 4, 12, '강의예정', '2023-03-09', '2022-05-10');


-- 교재-개설과목 (번호, 교재번호, 개설과목번호)
-- 같은 과목 종류여도 다른 교재 사용하는 경우 있음!

-- 개설과목 1, 2, 3: Spring, java, AWS
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 1, 1);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 2, 2);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 3, 3);

-- 개설과목 4, 5, 6: java, python, r프로그래밍
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 2, 4);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 11, 5);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 12, 6);

-- 개설과목 7, 8, 9: java, MongoDB, Servlet/JSP
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 5, 7);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 13, 8);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 15, 9);

-- 개설과목 10, 11, 12: Spring, java, AWS
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 10, 10);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 2, 11);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 3, 12);

-- 개설과목 13, 14, 15: 안드로이드 프로그래밍, 안드로이드 DB, java
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 16, 13);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 4, 14);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 5, 15);

-- 개설과목 16, 17, 18: React, Vue, java
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 18, 16);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 19, 17);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 6, 18);

-- 개설과목 19, 20, 21: Spring, java, AWS
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 1, 19);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 2, 20);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 4, 21);

-- 개설과목 22, 23, 24: java, Spring/MyBatis, git
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 5, 22);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 10, 23);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 22, 24);

-- 개설과목 25, 26, 27: java, Hadoop, node
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 6, 25);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 14, 26);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 17, 27);

-- 개설과목 28, 29, 30: java, python, r프로그래밍
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 2, 28);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 11, 29);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 12, 30);

-- 개설과목 31, 32, 33: java, MongoDB, Servlet/JSP
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 5, 31);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 13, 32);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 15, 33);

-- 개설과목 34, 35, 36: Spring, java, AWS
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 1, 34);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 2, 35);
insert into tblBookSubject(seq, bseq, osseq) values (SEQ_BOOKSUBJECT.nextVal, 3, 36);


--시험.sql

--과정1
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 1 ,'2021-11-18','필기','문제01');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 1 ,'2021-12-23','실기','문제02');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 2 ,'2022-01-18','필기','문제03');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 2 ,'2022-02-18','실기','문제04');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 3 ,'2022-03-18','필기','문제05');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 3,'2022-04-17','실기','문제06');

--과정2
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 4 ,'2022-01-15','필기','문제07');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 4 ,'2022-02-15','실기','문제08');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 5 ,'2022-03-18','필기','문제09');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 5,'2022-04-18','실기','문제10');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 6 ,'2022-05-18','필기','문제11');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 6 ,'2022-06-17','실기','문제12');

--과정3
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 7 ,'2022-03-23','필기','문제13');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 7 ,'2022-04-23','실기','문제14');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 8 ,'2022-05-18','필기','문제15');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal,  8,'2022-06-18','실기','문제16');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 9 ,'2022-07-18','필기','문제17');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 9 ,'2022-08-04','실기','문제18');

--과정4
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 10 ,'2022-03-14','필기','문제19');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal,10  ,'2022-04-14','실기','문제20');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 11 ,'2022-05-18','필기','문제21');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 11 ,'2022-06-18','실기','문제22');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 12 ,'2022-07-18','필기','문제23');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 12 ,'2022-08-12','실기','문제24');

--과정5
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 13 ,'2022-04-28','필기','문제25');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 13 ,'2022-05-23','실기','문제26');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 14 ,'2022-06-18','필기','문제27');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 14 ,'2022-07-18','실기','문제28');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal,  15,'2022-08-18','필기','문제29');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 15 ,'2022-09-01','실기','문제30');

--과정6
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 16 ,'2022-05-28','필기','문제31');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 16 ,'2022-06-23','실기','문제32');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal,17  ,'2022-07-18','필기','문제33');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 17,'2022-08-18','실기','문제34');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 18 ,'2022-09-18','필기','문제35');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 18 ,'2022-10-20','실기','문제36');

--과정7
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal,19 ,'2022-06-28','필기','문제37');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal,19,'2022-07-23','실기','문제38');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 20 ,'2022-08-18','필기','문제39');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 20 ,'2022-09-18','실기','문제40');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal,21  ,'2022-10-18','필기','문제41');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal,  21,'2022-11-01','실기','문제42');

--과정8
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal,  22,'2022-07-13','필기','문제43');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 22 ,'2022-08-13','실기','문제44');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 23 ,'2022-09-18','필기','문제45');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 23 ,'2022-10-18','실기','문제46');

insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal, 24 ,'2022-11-18','필기','문제47');
insert into tblTest (seq,osseq,testdate,testtype,question) values (seq_test.nextVal,24 ,'2022-12-22','실기','문제48');

--과정9
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 25 ,'2022-09-13','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal,  25,'2022-10-13','실기');

insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 26 ,'2022-11-18','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 26 ,'2022-12-18','실기');

insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal,  27,'2023-01-18','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 27 ,'2023-02-12','실기');

--과정10
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal,  28,'2022-09-13','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 28 ,'2022-10-13','실기');

insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 29 ,'2022-11-18','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal,  29,'2022-12-18','실기');

insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 30 ,'2023-01-18','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 30 ,'2023-02-12','실기');

--과정11
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 31 ,'2022-10-13','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 31,'2022-11-13','실기');

insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal,32  ,'2022-12-18','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal,32  ,'2023-01-18','실기');

insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal,33 ,'2023-02-18','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal,  33,'2023-03-01','실기');

--과정12
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 34 ,'2022-12-13','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 34 ,'2023-01-13','실기');

insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 35 ,'2023-02-18','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 35 ,'2023-03-18','실기');

insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 36 ,'2023-04-18','필기');
insert into tblTest (seq,osseq,testdate,testtype) values (seq_test.nextVal, 36 ,'2023-05-03','실기');


--시험결과.sql

--1번 과정 수료한 수강생  1번시험
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,1 ,80);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,2 ,78);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,3 ,95);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,4 ,58);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,5 ,87);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,6 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,7 ,58);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,8 ,99);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,9 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,10 ,96);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,11 ,90);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,12 ,75);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,13 ,82);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,14 ,93);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,15 ,74);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,16 ,57);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,17 ,92);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,18 ,82);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,19 ,62);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,1,20 ,78);


--1번 과정 수료한 수강생  2번시험
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,1 ,58);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,2 ,84);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,3 ,69);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,4 ,59);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,5 ,90);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,6 ,57);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,7 ,90);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,8 ,89);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,9 ,99);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,10 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,11 ,55);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,12 ,88);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,13 ,73);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,14 ,92);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,15 ,76);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,16 ,72);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,17 ,94);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,18 ,65);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,19 ,83);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,2,20 ,60);

--1번 과정 수료한 수강생  3번시험
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,1 ,96);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,2 ,96);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,3 ,84);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,4 ,67);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,5 ,72);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,6 ,81);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,7 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,8 ,84);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,9 ,88);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,10 ,87);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,11 ,77);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,12 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,13 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,14 ,83);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,15 ,91);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,16 ,68);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,17 ,94);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,18 ,95);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,19 ,77);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,3,20 ,98);


--1번 과정 수료한 수강생  4번시험
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,1 ,56);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,2 ,64);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,3 ,91);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,4 ,90);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,5 ,91);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,6 ,63);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,7 ,96);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,8 ,79);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,9 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,10 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,11 ,98);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,12 ,74);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,13 ,65);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,14 ,92);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,15 ,78);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,16 ,58);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,17 ,99);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,18 ,59);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,19 ,70);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,4,20 ,63);

--1번 과정 수료한 수강생  5번시험
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,1 ,75);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,2 ,85);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,3 ,83);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,4 ,96);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,5 ,69);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,6 ,99);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,7 ,84);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,8 ,85);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,9 ,60);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,10 ,67);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,11 ,55);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,12 ,71);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,13 ,94);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,14 ,70);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,15 ,72);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,16 ,61);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,17 ,94);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,18 ,65);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,19 ,58);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,5,20 ,82);



--1번 과정 수료한 수강생  6번시험
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,1 ,77);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,2 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,3 ,64);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,4 ,59);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,5 ,85);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,6 ,72);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,7 ,63);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,8 ,62);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,9 ,59);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,10 ,77);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,11 ,70);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,12 ,99);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,13 ,99);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,14 ,97);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,15 ,60);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,16 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,17 ,90);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,18 ,74);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,19 ,90);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,6,20 ,59);

--2번 과정 수료한 수강생  7번시험

insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,21 ,91);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,22 ,66);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,23 ,62);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,24 ,72);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,25 ,95);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,26 ,65);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,27 ,94);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,28 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,29 ,55);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,30 ,91);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,31 ,95);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,32 ,60);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,33 ,75);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,34 ,66);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,35 ,92);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,36 ,79);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,37 ,76);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,38 ,56);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,39 ,60);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,7,40 ,56);

--2번 과정 수료한 수강생  8번시험

insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,21 ,78);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,22 ,63);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,23 ,74);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,24 ,99);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,25 ,60);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,26 ,65);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,27 ,88);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,28 ,84);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,29 ,60);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,30 ,92);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,31 ,74);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,32 ,83);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,33 ,58);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,34 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,35 ,76);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,36 ,62);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,37 ,70);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,38 ,80);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,39 ,76);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,8,40 ,94);

--2번 과정 수료한 수강생  9번시험

insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,21 ,58);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,22 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,23 ,74);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,24 ,60);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,25 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,26 ,68);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,27 ,85);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,28 ,89);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,29 ,69);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,30 ,63);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,31 ,62);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,32 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,33 ,88);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,34 ,85);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,35 ,62);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,36 ,62);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,37 ,59);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,38 ,67);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,39 ,57);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,9,40 ,85);


--2번 과정 수료한 수강생  10번시험

insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,21 ,77);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,22 ,56);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,23 ,74);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,24 ,93);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,25 ,74);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,26 ,96);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,27 ,60);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,28 ,64);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,29 ,64);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,30 ,80);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,31 ,67);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,32 ,58);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,33 ,90);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,34 ,96);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,35 ,91);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,36 ,56);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,37 ,90);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,38 ,79);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,39 ,83);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,10,40 ,72);



--3번 과정 수료한 수강생  13번시험

insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,41 ,85);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,42 ,78);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,43 ,70);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,44 ,71);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,45 ,70);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,46 ,70);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,47 ,66);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,48 ,95);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,49 ,66);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,50 ,82);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,51 ,59);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,52 ,82);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,53 ,96);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,54 ,99);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,55 ,80);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,56 ,56);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,57 ,67);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,58 ,59);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,59 ,98);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,13,60 ,78);

--3번 과정 수료한 수강생  14번시험

insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,41 ,74);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,42 ,56);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,43 ,94);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,44 ,95);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,45 ,58);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,46 ,79);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,47 ,66);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,48 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,49 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,50 ,76);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,51 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,52 ,88);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,53 ,62);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,54 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,55 ,99);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,56 ,77);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,57 ,97);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,58 ,69);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,59 ,82);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,14,60 ,75);


--4번 과정 수료한 수강생  19번시험

insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,61 ,97);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,62 ,56);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,63 ,85);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,64 ,85);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,65 ,96);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,66 ,71);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,67 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,68 ,87);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,69 ,89);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,70 ,94);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,71 ,83);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,72 ,99);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,73 ,59);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,74 ,73);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,75 ,87);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,76 ,77);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,77 ,79);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,78 ,67);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,79 ,60);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,19,80 ,81);


--4번 과정 수료한 수강생  20번시험

insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,61 ,100);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,62 ,93);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,63 ,80);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,64 ,74);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,65 ,75);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,66 ,63);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,67 ,81);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,68 ,98);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,69 ,98);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,70 ,70);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,71 ,61);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,72 ,95);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,73 ,92);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,74 ,77);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,75 ,66);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,76 ,96);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,77 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,78 ,66);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,79 ,91);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,20,80 ,95);


--5번 과정 수료한 수강생  25번시험

insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,81 ,69);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,82 ,94);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,83 ,64);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,84 ,87);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,85 ,80);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,86 ,77);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,87 ,75);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,88 ,82);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,89 ,56);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,90 ,56);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,91 ,82);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,92 ,63);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,93 ,69);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,94 ,61);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,95 ,69);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,96 ,86);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,97 ,85);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,98 ,78);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,99 ,89);
insert into tblScore (seq,tseq,suseq,score) values(seq_score.nextVal,25,100 ,84);


-- 출결
insert into tblAttendence values(seq_attendence.nextval, 1, '2021-11-18', '지각');
insert into tblAttendence values(seq_attendence.nextval, 1, '2021-11-22', '지각');
insert into tblAttendence values(seq_attendence.nextval, 2, '2021-11-23', '조퇴');
insert into tblAttendence values(seq_attendence.nextval, 2, '2021-11-25', '지각');
insert into tblAttendence values(seq_attendence.nextval, 3, '2021-11-30', '병가');
insert into tblAttendence values(seq_attendence.nextval, 3, '2021-12-01', '지각');
insert into tblAttendence values(seq_attendence.nextval, 4, '2021-12-20', '지각');
insert into tblAttendence values(seq_attendence.nextval, 4, '2021-12-21', '외출');
insert into tblAttendence values(seq_attendence.nextval, 5, '2022-01-03', '지각');
insert into tblAttendence values(seq_attendence.nextval, 5, '2022-01-10', '기타');
insert into tblAttendence values(seq_attendence.nextval, 6, '2022-01-18', '지각');
insert into tblAttendence values(seq_attendence.nextval, 6, '2022-01-21', '외출');
insert into tblAttendence values(seq_attendence.nextval, 7, '2022-01-24', '조퇴');
insert into tblAttendence values(seq_attendence.nextval, 8, '2022-01-26', '지각');
insert into tblAttendence values(seq_attendence.nextval, 10, '2022-02-08', '병가');
insert into tblAttendence values(seq_attendence.nextval, 11, '2022-02-10', '지각');
insert into tblAttendence values(seq_attendence.nextval, 13, '2022-02-21', '지각');
insert into tblAttendence values(seq_attendence.nextval, 14, '2022-02-22', '외출');
insert into tblAttendence values(seq_attendence.nextval, 19, '2022-02-28', '지각');
insert into tblAttendence values(seq_attendence.nextval, 19, '2022-03-17', '기타');

--배점
insert into tblScoring values(seq_Scoring.nextVal, 1, 0.2, 0.33, 0.47);
insert into tblScoring values(seq_Scoring.nextVal, 2, 0.2, 0.57, 0.23);
insert into tblScoring values(seq_Scoring.nextVal, 3, 0.2, 0.47, 0.33);
insert into tblScoring values(seq_Scoring.nextVal, 4, 0.2, 0.71, 0.09);
insert into tblScoring values(seq_Scoring.nextVal, 5, 0.2, 0.25, 0.55);
insert into tblScoring values(seq_Scoring.nextVal, 7, 0.2, 0.45, 0.35);
insert into tblScoring values(seq_Scoring.nextVal, 10, 0.2, 0.74, 0.06);
insert into tblScoring values(seq_Scoring.nextVal, 13, 0.2, 0.52, 0.28);
insert into tblScoring values(seq_Scoring.nextVal, 14, 0.2, 0.33, 0.47);

--프로젝트 참여자 모집 공고
insert into tblProjectRecruitment values (seq_ProjectRecruitment.nextVal, 30, '자바 프로젝트', '자바를 이용한 자바 프로젝트 인원을 모집합니다.', to_date('2022-06-01', 'yyyy-mm-dd'), to_date('2022-06-07', 'yyyy-mm-dd'), 3, to_date('2022-05-29', 'yyyy-mm-dd'));
insert into tblProjectRecruitment values (seq_ProjectRecruitment.nextVal, 40, '오라클 프로젝트', '오라클을 이용한 DB 프로젝트 인원을 모집합니다.', to_date('2022-06-02', 'yyyy-mm-dd'), to_date('2022-06-08', 'yyyy-mm-dd'), 2, to_date('2022-05-30', 'yyyy-mm-dd'));
insert into tblProjectRecruitment values (seq_ProjectRecruitment.nextVal, 23, '파이썬 프로젝트', '파이썬을 이용한 파이썬 프로젝트 인원을 모집합니다.', to_date('2022-06-03', 'yyyy-mm-dd'), to_date('2022-06-09', 'yyyy-mm-dd'), 4, to_date('2022-05-31', 'yyyy-mm-dd'));
insert into tblProjectRecruitment values (seq_ProjectRecruitment.nextVal, 65, 'Spring 프로젝트', 'Spring을 이용한 Spring 프로젝트 인원을 모집합니다.', to_date('2022-06-04', 'yyyy-mm-dd'), to_date('2022-06-10', 'yyyy-mm-dd'), 3, to_date('2022-06-01', 'yyyy-mm-dd'));
insert into tblProjectRecruitment values (seq_ProjectRecruitment.nextVal, 34, 'JDBC 프로젝트', 'JDBC를 이용한 JDBC 프로젝트 인원을 모집합니다.', to_date('2022-06-05', 'yyyy-mm-dd'), to_date('2022-06-12', 'yyyy-mm-dd'), 4, to_date('2022-06-02', 'yyyy-mm-dd'));



--프로젝트 참여자 모집 공고 - 신청
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 1, 31);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 1, 32);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 1, 33);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 2, 22);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 2, 35);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 2, 36);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 3, 37);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 3, 38);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 3, 39);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 4, 41);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 4, 42);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 4, 43);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 5, 44);
insert into tblProjectParticipant values (seq_ProjectParticipant.nextVal, 5, 45);

--대면/비대면 수업등록내역(등록번호/수강정보번호 (21~140)/수업일/대면,비대면여부)
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 21, '2022-05-20', '대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 25, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 21, '2022-05-20', '대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 25, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 35, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 41, '2022-05-20', '대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 45, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 61, '2022-05-20', '대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 55, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 75, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 81, '2022-05-20', '대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 95, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 101, '2022-05-20', '대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 111, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 122, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 105, '2022-05-20', '대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 113, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 126, '2022-05-20', '대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 136, '2022-05-20', '비대면');
insert into tblHomeStudent (seq, suseq, classday, home) values (seq_HomeStudent.nextVal, 109, '2022-05-20', '비대면');

--직무(직무번호/직무명)
insert into tblJob (seq, jobName) values (seq_Job.nextVal, '소프트웨어 개발자');
insert into tblJob (seq, jobName) values (seq_Job.nextVal, '모바일앱 개발자');
insert into tblJob (seq, jobName) values (seq_Job.nextVal, '데이터베이스 관리자');
insert into tblJob (seq, jobName) values (seq_Job.nextVal, '웹 개발자');
insert into tblJob (seq, jobName) values (seq_Job.nextVal, '빅데이터 개발자');


--수료생(수료생번호/직무번호f/수강정보번호f/희망근무지/희망연봉/학력/취업여부)
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 1, 2, '서울', '3500000', '고졸', 'y');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 3, 12, '경기', '3000000', '고졸', 'y');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 2, 11, '대구', '2500000', '고졸', 'y');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 3, 10, '부산', '2800000', '고졸', 'y');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 5, 9, '서울', '2700000', '고졸', 'y');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 1, 8, '서울', '4000000', '대졸', 'n');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 3, 7, '경기', '4300000', '대졸', 'n');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 2, 6, '대구', '3800000', '대졸', 'n');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 3, 5, '부산', '3500000', '대졸', 'n');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 5, 4, '서울', '4500000', '대졸', 'n');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 4, 3, '경기', '4300000', '대졸', 'n');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 3, 1, '대구', '3800000', '대졸', 'n');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 3, 2, '부산', '3500000', '대졸', 'n');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 5, 13, '서울', '4500000', '대졸', 'n');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 5, 14, '서울', '4500000', '대졸', 'n');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 1, 15, '서울', '3500000', '고졸', 'y');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 3, 16, '경기', '3000000', '고졸', 'y');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 2, 17, '경기', '2500000', '고졸', 'y');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 3, 18, '부산', '2800000', '고졸', 'y');
insert into tblGraduate (seq, jseq, suseq, place, salary, education, employment) values (seq_Graduate.nextVal, 4, 19, '서울', '2700000', '고졸', 'y');


--수령방법
insert into tblDelivery values (seq_delivery.nextVal, 1, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 2, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 3, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 4, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 5, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 6, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 7, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 8, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 9, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 10, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 11, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 12, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 13, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 14, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 15, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 16, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 17, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 18, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 19, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 20, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 21, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 22, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 23, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 24, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 25, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 26, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 27, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 28, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 29, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 30, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 31, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 32, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 33, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 34, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 35, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 36, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 37, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 38, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 39, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 40, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 41, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 42, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 43, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 44, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 45, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 46, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 47, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 48, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 49, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 50, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 51, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 52, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 53, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 54, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 55, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 56, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 57, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 58, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 59, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 60, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 61, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 62, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 63, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 64, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 65, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 66, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 67, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 68, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 69, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 70, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 71, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 72, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 73, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 74, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 75, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 76, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 77, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 78, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 79, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 80, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 81, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 82, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 83, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 84, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 85, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 86, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 87, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 88, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 89, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 90, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 91, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 92, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 93, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 94, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 95, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 96, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 97, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 98, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 99, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 100, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 101, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 102, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 103, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 104, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 105, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 106, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 107, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 108, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 109, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 110, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 111, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 112, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 113, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 114, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 115, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 116, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 117, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 118, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 119, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 120, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 121, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 122, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 123, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 124, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 125, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 126, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 127, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 128, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 129, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 130, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 131, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 132, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 133, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 134, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 135, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 136, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 137, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 138, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 139, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 140, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 141, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 142, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 143, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 144, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 145, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 146, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 147, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 148, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 149, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 150, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 151, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 152, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 153, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 154, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 155, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 156, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 157, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 158, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 159, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 160, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 161, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 162, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 163, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 164, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 165, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 166, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 167, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 168, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 169, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 170, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 171, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 172, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 173, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 174, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 175, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 176, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 177, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 178, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 179, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 180, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 181, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 182, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 183, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 184, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 185, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 186, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 187, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 188, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 189, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 190, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 191, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 192, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 193, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 194, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 195, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 196, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 197, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 198, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 199, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 200, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 201, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 202, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 203, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 204, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 205, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 206, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 207, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 208, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 209, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 210, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 211, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 212, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 213, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 214, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 215, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 216, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 217, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 218, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 219, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 220, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 221, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 222, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 223, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 224, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 225, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 226, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 227, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 228, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 229, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 230, '택배', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 231, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 232, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 233, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 234, '택배', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 235, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 236, '방문', 'n');
insert into tblDelivery values (seq_delivery.nextVal, 237, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 238, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 239, '방문', 'y');
insert into tblDelivery values (seq_delivery.nextVal, 240, '택배', 'n');


--자격증.sql

insert into tblCertificate (seq,CertificateName) values (seq_certificate.nextVal,'정보처리산업기사' );
insert into tblCertificate (seq,CertificateName) values (seq_certificate.nextVal,'정보처리기사' );
insert into tblCertificate (seq,CertificateName) values (seq_certificate.nextVal, '네트워크관리사 1급');
insert into tblCertificate (seq,CertificateName) values (seq_certificate.nextVal, '네트워크관리사 2급');
insert into tblCertificate (seq,CertificateName) values (seq_certificate.nextVal, 'CCNA');
insert into tblCertificate (seq,CertificateName) values (seq_certificate.nextVal, 'OCP(Oracle Certified Professional)');
insert into tblCertificate (seq,CertificateName) values (seq_certificate.nextVal, '컴퓨터활용능력1급');
insert into tblCertificate (seq,CertificateName) values (seq_certificate.nextVal, '컴퓨터활용능력2급');
insert into tblCertificate (seq,CertificateName) values (seq_certificate.nextVal, '컴퓨터활용능력2급');
insert into tblCertificate (seq,CertificateName) values (seq_certificate.nextVal, 'AWS Foundational');


-- 자격증_교육생.sql

insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,63,9,'2014-12-06');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,27,5,'2021-06-02');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,103,6,'2011-03-18');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,37,1,'2019-01-28');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,222,2,'2020-01-09');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,17,9,'2014-12-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,208,4,'2011-04-01');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,119,3,'2012-09-27');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,189,5,'2019-09-08');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,231,2,'2014-10-06');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,214,7,'2014-08-22');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,54,1,'2021-10-22');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,168,3,'2016-11-12');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,200,2,'2021-01-10');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,229,3,'2015-10-26');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,69,8,'2021-10-14');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,125,9,'2020-01-20');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,33,1,'2020-03-23');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,151,1,'2011-10-28');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,203,7,'2016-10-03');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,207,1,'2020-11-12');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,139,5,'2019-12-02');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,102,3,'2020-01-03');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,133,5,'2020-11-20');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,53,7,'2021-05-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,226,5,'2012-06-22');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,7,9,'2017-04-20');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,237,7,'2011-10-17');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,16,5,'2015-07-27');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,84,7,'2015-12-23');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,109,4,'2020-06-07');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,200,7,'2019-10-01');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,75,2,'2014-10-27');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,3,1,'2020-02-25');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,203,4,'2014-12-12');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,127,5,'2020-05-23');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,222,5,'2020-10-26');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,30,6,'2020-06-17');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,221,8,'2018-04-21');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,153,4,'2013-11-17');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,167,3,'2020-10-17');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,126,7,'2020-02-12');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,112,7,'2017-02-12');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,79,7,'2011-12-14');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,201,4,'2020-06-17');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,83,8,'2021-10-16');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,185,4,'2020-11-17');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,26,7,'2019-11-24');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,121,6,'2018-01-21');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,157,7,'2019-11-18');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,225,3,'2017-02-12');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,128,6,'2021-10-01');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,1,4,'2015-10-21');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,141,2,'2011-12-22');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,126,7,'2017-04-04');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,228,3,'2012-07-28');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,3,2,'2021-10-01');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,223,1,'2020-10-10');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,89,6,'2018-05-24');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,169,6,'2019-06-22');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,135,9,'2021-11-24');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,188,7,'2021-11-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,135,1,'2020-06-20');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,113,5,'2013-08-10');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,18,5,'2013-09-07');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,87,6,'2016-10-25');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,37,8,'2021-04-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,117,6,'2021-12-20');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,137,2,'2020-10-24');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,217,3,'2021-04-24');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,131,5,'2021-09-03');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,99,5,'2021-09-17');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,72,1,'2017-12-11');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,207,3,'2020-11-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,11,2,'2021-12-12');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,57,2,'2020-09-28');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,207,7,'2015-11-28');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,88,2,'2021-04-26');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,206,6,'2019-06-05');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,221,7,'2012-10-09');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,128,1,'2021-06-08');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,59,8,'2021-12-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,219,3,'2020-10-06');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,59,6,'2017-11-18');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,156,1,'2021-10-24');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,204,7,'2016-04-04');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,44,9,'2021-03-26');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,147,3,'2011-02-07');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,155,6,'2021-11-21');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,85,5,'2021-09-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,3,9,'2018-10-08');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,234,9,'2015-11-06');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,102,4,'2021-02-07');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,36,2,'2020-12-16');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,61,3,'2012-01-03');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,234,5,'2021-10-16');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,46,1,'2019-11-20');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,193,2,'2016-03-09');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,215,2,'2014-06-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,16,6,'2011-10-23');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,221,8,'2013-04-22');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,174,1,'2019-11-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,133,7,'2015-12-04');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,177,4,'2020-09-25');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,31,4,'2019-06-08');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,22,2,'2021-07-08');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,146,4,'2020-08-26');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,121,7,'2014-12-20');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,188,6,'2020-10-15');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,94,5,'2014-08-27');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,54,6,'2017-10-15');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,133,3,'2020-09-16');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,125,2,'2011-07-09');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,175,8,'2020-10-10');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,56,1,'2020-10-28');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,158,3,'2011-10-01');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,29,9,'2020-11-21');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,72,1,'2020-08-02');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,83,4,'2014-04-01');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,26,2,'2015-11-09');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,209,9,'2017-07-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,166,6,'2012-11-23');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,122,5,'2019-01-14');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,196,1,'2020-11-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,86,6,'2015-04-16');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,91,7,'2021-07-16');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,208,2,'2019-03-24');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,171,8,'2014-10-01');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,124,4,'2011-11-15');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,43,9,'2021-08-04');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,59,3,'2017-10-13');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,53,9,'2012-11-15');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,90,6,'2021-11-14');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,13,8,'2020-11-26');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,86,2,'2011-07-24');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,98,3,'2019-11-06');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,16,5,'2017-09-01');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,151,2,'2021-11-05');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,228,8,'2020-07-14');
insert into tblCerStudent (seq,stuseq,cseq,adate) values (seq_cerStudent.nextVal,192,9,'2020-10-08');


--기업(기업번호/기업이름/주소/전화번호)
insert into tblCompany (seq, companyName, address, tel) values (seq_Company.nextVal, '삼성', '서울시 강남구', '1588-1211');
insert into tblCompany (seq, companyName, address, tel) values (seq_Company.nextVal, '애플', '서울시 서초구', '1577-1235');
insert into tblCompany (seq, companyName, address, tel) values (seq_Company.nextVal, '구글', '서울시 강남구', '1588-3265');
insert into tblCompany (seq, companyName, address, tel) values (seq_Company.nextVal, '카카오', '경기도 성남시', '1577-3633');
insert into tblCompany (seq, companyName, address, tel) values (seq_Company.nextVal, '네이버', '경기도 성남시', '1588-1478');


--채용모집(모집번호/기업번호f/직무번호f/근무지/연봉/채용인원/채용시작날짜/채용종료날짜
insert into tblRecruitment (seq, cseq, jseq, workingArea, annulIncome, recruitmentNum, startregdate, endregdate)
    values (seq_Recruitment.nextVal, 3, 5,'서울', 2500000, 10, '2022-05-25', '2022-05-30');
insert into tblRecruitment (seq, cseq, jseq, workingArea, annulIncome, recruitmentNum, startregdate, endregdate)
    values (seq_Recruitment.nextVal, 4, 4,'경기', 3000000, 5, '2022-05-26', '2022-05-31');
insert into tblRecruitment (seq, cseq, jseq, workingArea, annulIncome, recruitmentNum, startregdate, endregdate)
    values (seq_Recruitment.nextVal, 5, 3,'서울', 3500000, 3, '2022-05-27', '2022-06-03');
insert into tblRecruitment (seq, cseq, jseq, workingArea, annulIncome, recruitmentNum, startregdate, endregdate)
    values (seq_Recruitment.nextVal, 1, 2,'부산', 3700000, 20, '2022-06-07', '2022-06-14');
insert into tblRecruitment (seq, cseq, jseq, workingArea, annulIncome, recruitmentNum, startregdate, endregdate)
    values (seq_Recruitment.nextVal, 2, 1,'대구', 4000000, 15, '2022-06-20', '2022-06-27');
    
    
--취업연계(취업연계번호/수료생번호f/모집번호f)
insert into tblEmploymentLink (seq, gseq, rseq) values (seq_EmploymentLink.nextVal, 10, 5);
insert into tblEmploymentLink (seq, gseq, rseq) values (seq_EmploymentLink.nextVal, 5, 4);
insert into tblEmploymentLink (seq, gseq, rseq) values (seq_EmploymentLink.nextVal, 15, 3);
insert into tblEmploymentLink (seq, gseq, rseq) values (seq_EmploymentLink.nextVal, 20, 2);
insert into tblEmploymentLink (seq, gseq, rseq) values (seq_EmploymentLink.nextVal, 11, 1);
insert into tblEmploymentLink (seq, gseq, rseq) values (seq_EmploymentLink.nextVal, 12, 1);
insert into tblEmploymentLink (seq, gseq, rseq) values (seq_EmploymentLink.nextVal, 13, 2);
insert into tblEmploymentLink (seq, gseq, rseq) values (seq_EmploymentLink.nextVal, 17, 3);


--Q&A 게시판
insert into tblQna values(seq_Qna.nextVal, 32, 'vscode에서 괄호 자동완성 기능', 'print () 하고 커서도 가운데로 들어가는게 굉장히편했는데 vscode 에서도 같은 기능이 있나요?', '2022-05-13');
insert into tblQna values(seq_Qna.nextVal, 31, 'SI 질문입니다.', 'SI 업체 신입 파견직인데, 프로젝트 시작 안했을 때 봉급 절반 삭감해서 주는 것', '2022-04-13');
insert into tblQna values(seq_Qna.nextVal, 30, '비전공자 공부 이렇게 해도 되나요????????', '현재 유튜브 생활코딩으로 WEB(html,스프링)/자바 강의로 간단한 예습을 하는 중이고', '2022-05-11');
insert into tblQna values(seq_Qna.nextVal, 29, '전공자 백엔드 신입 컷이 몇살정도일까요?', '선배님들 대략 이정도면 보통 초봉 어느정도인가요? 요즘 신입스프링 취직은 잘되나요', '2022-05-07');
insert into tblQna values(seq_Qna.nextVal, 28, 'visual studio code 설정', 'visual studio에서 코드 색깔을 설정을 할수 있다고하는데 알려주세요', '2022-05-01');

--댓글
insert into tblComments values(seq_Comments.nextVal, 1, 2, 'vscode 는 모듈러 방식이라 확장을 설치해야 할 것입니다.', '2022-05-13');
insert into tblComments values(seq_Comments.nextVal, 2, 3, '아니욘 헛소리 하는거 보니 보도방인듯연 ㅎㅎ;;', '2022-04-13');
insert into tblComments values(seq_Comments.nextVal, 3, 4, '정처기 준비하셔서 후반기 노려보시는 걸 추천드립니다', '2022-05-11');
insert into tblComments values(seq_Comments.nextVal, 4, 5, '포토플리오를 올려주세요. 평가해드립니다.', '2022-05-07');
insert into tblComments values(seq_Comments.nextVal, 5, 6, '보통 요런거 플러그인 깔아서 해결하지 않나 싶어요', '2022-05-01');

-- 공휴일
insert into tblHoliday values (seq_Holiday.nextVal, '2021-12-25', '크리스마스');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-01-01', '새해');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-01-31', '설날');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-02-01', '설날');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-02-02', '설날');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-03-01', '삼일절');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-05-05', '어린이날');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-05-08', '석가탄신일');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-06-06', '현충일');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-08-15', '광복절');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-09-09', '추석');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-09-12', '추석 대체공휴일');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-10-03', '개천절');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-10-10', '한글날 대체공휴일');
insert into tblHoliday values (seq_Holiday.nextVal, '2022-12-25', '크리스마스');
