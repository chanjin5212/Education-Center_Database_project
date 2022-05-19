--관리자
create table tblManager(
        seq number not null,
        id VARCHAR2(60) not null,
        password VARCHAR2(60) not null,
        
        constraint tblManager_seq_pk primary key(seq)
);

create sequence seq_Manager;


--과목

create table tblSubject(
        
        seq number not null,
        subjectName VARCHAR2(60) not null,
        
        constraint tblSubject_seq_pk primary key(seq)
    
);

create sequence seq_Subject;

-- 과정

create table tblCourse(
        
        seq number not null,
        courseName VARCHAR2(300) not null,
        
        constraint tblCourse_seq_pk primary key(seq)
    

);

create sequence seq_Course;

-- 과정-과목
create table tblSubjectCourse (
    seq number not null,
    sseq number not null,
    cseq number not null,
    
    constraint tblSubjectCourse_seq_pk primary key(seq),
    constraint tblSubjectCourse_sseq_fk foreign key(sseq) references tblSubject(seq),
    constraint tblSubjectCourse_cseq_fk foreign key(cseq) references tblCourse(seq)
);

create sequence seq_SubjectCourse;

--강의실

create table tblClassroom(
        
        seq number not null,
        classroomName VARCHAR2(60) not null,
        max NUMBER not null,
        
        
        constraint  tblClassroom_seq_pk primary key(seq)
        
);

create sequence seq_Classroom;

--교재

create table tblBook (
    seq number not null,
    booktitle varchar2(60) not null,
    publisher varchar2(60) not null,
    author varchar2(60) not null,
    
    constraint tblBook_seq_pk primary key(seq)
);


create sequence seq_tblBook;

--교사

create table tblTeacher(
        
        seq number not null,
        name VARCHAR2(16) not null,
        jumin VARCHAR2(7) not null,
        tel VARCHAR2(60) not null,
        
      constraint tblTeacher_seq_pk primary key(seq)
);
create sequence seq_Teacher;

-- 개설 과정
create table tblOpenedCourse(
    seq number not null,
    cseq number not null,
    rseq number not null,
    startdate date not null,
    enddate date not null,
    
    constraint tblOpenedCourse_seq_pk primary key(seq),
    constraint tblOpenedCourse_cseq_fk foreign key(cseq) references tblCourse(seq),
    constraint tblOpenedCourse_rseq_fk foreign key(rseq) references tblClassroom(seq)
);

create sequence seq_openedCourse;

-- 강의 가능 과목
create table tblAvailable(
    seq number not null,
    tseq number not null,
    sseq number not null,
    
    constraint tblAvailable_seq_pk primary key(seq),
    constraint tblAvailable_tseq_fk foreign key(tseq) references tblTeacher(seq),
    constraint tblAvailable_sseq_fk foreign key(sseq) references tblSubject(seq)
);

create sequence seq_available;


-- 교육생 정보
create table tblStudent(
    seq number not null,
    name varchar2(15) not null,
    jumin varchar2(7) not null,
    tel varchar2(30) not null,
    regdate date default sysdate not null,
    
    constraint tblStudent_seq_pk primary key(seq)
);

create sequence seq_student;

-- 교육생 수강정보
create table tblSignUp(
    seq number not null,
    ocseq number not null,
    stuseq number not null,
    completiondate date null,
    dropoutdate date null,
    
    constraint tblSignUp_seq_pk primary key(seq),
    constraint tblSignUp_ocseq_fk foreign key(ocseq) references tblOpenedCourse(seq),
    constraint tblSignUp_stuseq_fk foreign key(stuseq) references tblStudent(seq)
);

create sequence seq_signUp;

--개설과목
create table tblOpenedSubject (
    seq number not null,
    ocseq number not null,
    tseq number not null,
    scseq number not null,
    isprogress varchar2(15) not null,
    startdate date not null,
    enddate date not null,
    
    constraint tblOpenedSubject_seq_pk primary key(seq),
    constraint tblOpenedSubject_ocseq_fk foreign key(ocseq) references tblOpenedCourse(seq),
    constraint tblOpenedSubject_tseq_fk foreign key(tseq) references tblTeacher(seq),
    constraint tblOpenedSubject_scseq_fk foreign key(scseq) references tblSubjectCourse(seq),
    constraint tblOpenedSubject_isprogress_ck check (isprogress in ('강의예정', '강의중','강의종료'))
);

create sequence seq_openedsubject;


--교재-개설과목
create table tblBookSubject (
    seq number not null,
    bseq number not null,
    osseq number not null,
    
    constraint tblBookSubject_seq_pk primary key(seq),
    constraint tblBookSubject_bseq_fk foreign key(bseq) references tblBook(seq),
    constraint tblBookSubject_osseq_fk foreign key(osseq) references tblOpenedSubject(seq)
    
);

create sequence seq_booksubject;


-- 시험
create table tblTest (
    seq number not null,
    osseq number not null,
    testdate date not null,
    testtype varchar2(6) not null,
    question varchar(20) null,
    
    constraint tblTest_seq_pk primary key(seq),
    constraint tblTest_osseq_fk foreign key(osseq) references tblOpenedSubject(seq),
    constraint tblTest_testtype_ck check (testtype in ('필기', '실기'))
);

create sequence seq_test;

--시험결과
create table tblScore (
    seq number not null,
    tseq number not null,
    suseq number not null,
    score number not null,--ck걸기 1~100
    
    constraint tblScore_seq_pk primary key(seq),
    constraint tblScore_tseq_fk foreign key(tseq) references tblTest(seq),
    constraint tblScore_suseq_fk foreign key(suseq) references tblSignUp(seq),
    constraint tblScore_score_ck check (score between 1 and 100)
);

create sequence seq_score;

--출결

create table tblAttendence (
    seq number not null,
    suseq number not null,
    attdate date not null,
    state varchar(6) not null,
    
    constraint tblAttendence_seq_pk primary key(seq),
    constraint tblAttendence_suseq_fk foreign key(suseq) references tblSignUp(seq),
    constraint tblAttendence_state_ck check (state in('지각', '조퇴', '외출', '병가', '기타'))
);

create sequence seq_Attendence;


--배점
create table tblScoring (
    seq number not null,
    osseq number not null,
    attrate number not null,
    wtestrate number not null,
    ptestrate number not null,

    constraint tblScoring_seq_pk primary key(seq),
    constraint tblScoring_osseq_fk foreign key(osseq) references tblOpenedSubject(seq),
    constraint tblScoring_attrate_ck check(attrate between 0.2 and 1),
    constraint tblScoring_wtestrate_ck check(wtestrate between 0 and 0.8),
    constraint tblScoring_ptestrate_ck check(ptestrate between 0 and 0.8)
);

create sequence seq_Scoring;

--프로젝트 참여자 모집 공고
create table tblProjectRecruitment(
    seq number not null,
    stuseq number not null,
    projectname varchar2(60) not null,
    projectcontents varchar2(300) not null,
    projectstartdate date not null,
    projectenddate date not null,
    headcount number not null,
    deadline date not null,
    
    constraint tblProjectRecruitment_seq_pk primary key(seq),
    constraint tblProjectRecruitment_st_fk foreign key(stuseq) references tblStudent(seq),
    constraint tblProjectRecruitment_head_ck check(headcount between 2 and 6)

);

create sequence seq_ProjectRecruitment;



--프로젝트 참여자 모집 공고 - 신청
create table tblProjectParticipant(
    seq number not null,
    pseq number not null,
    stuseq number not null,
    
    constraint tblProjectParticipant_seq_pk primary key(seq),
    constraint tblProjectParticipant_pseq_fk foreign key(pseq) references tblProjectRecruitment(seq),
    constraint tblProjectParticipant_st_fk foreign key(stuseq) references tblStudent(seq)
);

create sequence seq_ProjectParticipant;

-- 대면/비대면 수업 등록 내역 (교육생)
create table tblHomeStudent (
    seq number not null,
    suseq number not null,
    classday date not null,
    home varchar2(9) default '비대면' not null,

    constraint tblHomeStudent_seq_pk primary key(seq),
    constraint tblHomeStudent_suseq_fk foreign key(suseq) references tblSignUp(seq),
    constraint tblHomeStudent_home_ck check (home in ('대면', '비대면'))
);

create sequence seq_homeStudent;

--직무
create table tblJob (
    seq number not null,
    jobname varchar2(60) not null,
    
    constraint tblJob_seq_pk primary key(seq)
);

create sequence seq_Job;

-- 수료생
create table tblGraduate (
    seq number not null,
    suseq number not null,
    jseq number not null,
    place varchar2(90) not null,
    salary varchar2(60) not null,
    education varchar2(60) not null,
    employment char not null,
    
    constraint tblGraduate_seq_pk primary key(seq),
    constraint tblGraduate_suseq_fk foreign key(suseq) references tblSignUp(seq),
    constraint tblGraduate_jseq_fk foreign key(jseq) references tblJob(seq),
    constraint tblGraduate_employment_ck check (employment in ('y', 'n'))
);

create sequence seq_graduate;


--수령방법
create table tblDelivery (
    seq number not null,
    suseq number unique not null,
    delivery varchar2(10) not null,
    receipt char not null,
    
    constraint tblDelivery_seq_pk primary key(seq),
    constraint tblDelivery_suseq_fk foreign key(suseq) references tblSignUp(seq),
    constraint tblDelivery_delivery_ck check (delivery in ('방문', '택배')),
    constraint tblDelivery_receipt_ck check (receipt in ('y', 'n'))
);

create sequence seq_delivery;


--자격증
create table tblCertificate (
    seq number not null,
    certificateName varchar2(60) not null,
    
    constraint tblCertificate_seq_pk primary key(seq)
);

create sequence seq_certificate;


--자격증 - 교육생
create table tblCerStudent (
    seq number not null,
    stuseq number not null,
    cseq number not null,
    adate date not null,
    
    constraint tblCerStudent_seq_pk primary key(seq),
    constraint tblCerStudent_stuseq_fk foreign key(stuseq) references tblStudent(seq),
    constraint tblCerStudent_cseq_fk foreign key(cseq) references tblCertificate(seq)
);

create sequence seq_cerStudent;

--기업
create table tblCompany (
    seq number not null,
    companyname varchar2(60) not null,
    address varchar2(60) not null,
    tel varchar2(45) not null,
    
    constraint tblCompany_seq_pk primary key(seq)
);

create sequence seq_Company;

--채용모집
create table tblRecruitment (
    seq number not null,
    cseq number not null,
    jseq number not null,
    workingArea varchar2(60) not null,
    annulIncome number not null,
    recruitmentNum number not null,
    startregdate date not null,
    endregdate date not null,
    
    constraint tblRecruitment_seq_pk primary key(seq),
    constraint tblRecruitment_cseq_fk foreign key(cseq) references tblCompany(seq),
    constraint tblRecruitment_jseq_fk foreign key(jseq) references tblJob(seq)
);

create sequence seq_Recruitment;

--취업연계
create table tblEmploymentLink (
    seq number not null,
    gseq number not null,
    rseq number not null,
    
    constraint tblEmploymentLink_seq_pk primary key(seq),
    constraint tblEmploymentLink_gseq_fk foreign key(gseq) references tblGraduate(seq),
    constraint tblEmploymentLink_rseq_fk foreign key(rseq) references tblRecruitment(seq)
);

create sequence seq_EmploymentLink;

--Q&A게시판
create table tblQna (
    seq number not null,
    stuseq number not null,
    title varchar2(300) not null,
    contents varchar2(3000) not null,
    regdate date default sysdate not null,
    
    constraint tblQna_seq_pk primary key(seq),
    constraint tblQna_stuseq_fk foreign key(stuseq) references tblStudent(seq)
);

create sequence seq_Qna;

--댓글
create table tblComments (
    seq number not null,
    qseq number not null,
    tseq number not null,
    contents varchar2(3000) not null,
    regdate date default sysdate not null,
    
    constraint tblComments_seq_pk primary key(seq),
    constraint tblComments_stuseq_fk foreign key(qseq) references tblQna(seq),
    constraint tblComments_tseq_fk foreign key(tseq) references tblTeacher(seq)
);

create sequence seq_Comments;

-- 공휴일
create table tblHoliday (
    seq number not null,
    holiday date not null,
    name varchar(30) not null,
    
    constraint tblHoliday_seq_pk primary key(seq)
)

create sequence seq_Holiday;


