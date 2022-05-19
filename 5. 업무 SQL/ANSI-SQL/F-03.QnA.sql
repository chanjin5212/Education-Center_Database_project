--전체 게시판의 정보 출력(제목, 등록일, 작성자)
select 
q.seq as 글번호,
q.title as 제목,
q.regdate as 등록일,
s.name as 작성자
from tblStudent s
    inner join tblQna q
        on s.seq = q.stuseq
            order by q.seq asc;

--특정 게시판의 정보 출력(제목, 내용, 등록일, 작성자, 댓글(작성자, 등록일, 내용))
select 
q.title as 제목,
q.contents as 내용,
q.regdate as 등록일,
s.name as 작성자,
c.contents as 댓글내용,
c.regdate as 댓글등록일,
t.name as 댓글작성자
from tblStudent s
    inner join tblQna q
        on s.seq = q.stuseq
            inner join tblComments c
                on q.seq = c.qseq
                    inner join tblTeacher t
                        on t.seq = c.tseq
                            where q.seq = 1;
                        

--교육생이 게시판 입력(제목, 내용)
insert into tblQna (seq, stuseq, title, contents, regdate) values (seq_Qna.nextVal, 교육생번호, '제목', '내용', '등록일자');

--교사 댓글 입력(내용)
insert into tblComments (seq, qseq, tseq, contents, regdate) values (seq_Comments.nextVal, 글번호, 교사번호, '내용', '등록일자');
