--전체 게시판의 정보 출력(제목, 등록일, 작성자)
create or replace view vwBoard
as
select 
q.seq as 글번호,
q.title as 제목,
q.regdate as 등록일,
s.name as 작성자
from tblStudent s
    inner join tblQna q
        on s.seq = q.stuseq
            order by q.seq asc;
            
select * from vwBoard;

--특정 게시판의 정보 출력(제목, 내용, 등록일, 작성자, 댓글(작성자, 등록일, 내용))
create or replace view vwBoardinfo
as
select 
q.seq as 글번호,
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
                        on t.seq = c.tseq;

select 제목, 내용, 등록일, 작성자, 댓글내용, 댓글등록일, 댓글작성자 from vwBoardinfo
where 글번호 = 1;

--교육생이 게시판 입력(제목, 내용)
create or replace procedure procQna (
    pstuseq in tblQna.stuseq%type,
    ptitle in tblQna.title%type,
    pcontents in tblQna.contents%type
    
)
is

begin
    insert into tblQna (seq, stuseq, title, contents, regdate) 
    values (seq_Qna.nextVal, pstuseq, ptitle, pcontents, sysdate);
    dbms_output.put_line('교육생번호: '||pstuseq||' '||'제목: '||ptitle||' '||'내용: '||pcontents);
    dbms_output.put_line('입력에 성공하였습니다.');
    commit;

exception
    when OTHERS then
    dbms_output.put_line('입력에 실패하였습니다.');
    rollback;

end procQna;

--게시판 입력 실행
begin
    procQna(1, 'pl/sql 프로시저 에서 default 질문합니다.', '프로시저에서 default쓰려면 어떻게 써야할까요?');
end;

--게시판 글 수정하기
-- (수정할 글번호, 작성자 교육생번호, 비밀번호(주민번호), 수정할 대상(1=제목, 2=내용), 수정할 내용) 게시글 수정하기
create or replace procedure procQnaEdit (
    pseq number,
    pstuseq number,
    pjumin varchar2,
    ptarget number,
    pedit varchar2
)
is
    cursor vcursor
    is
    select * from tblQna;
    
    vrow tblQna%rowtype;
    vflag number;
    vjumin tblStudent.jumin%type;
    vresult number;
    vname tblStudent.name%type;
begin
    open vcursor;
        loop
            fetch vcursor into vrow;
            exit when vcursor%notfound;
            
            if vrow.seq = pseq then
                vflag := 1;
            end if;
        end loop;
    close vcursor;
    
    if vflag = 1 then
        select jumin, name into vjumin, vname from tblStudent where seq = pstuseq;
        
        if vjumin = pjumin then
            if ptarget = 1 then
               update tblQna set title = pedit where seq = pseq;
               vresult := 1;
            elsif ptarget = 2 then
               update tblQna set contents = pedit where seq = pseq;
               vresult := 2;
            else
               dbms_output.put_line('수정할 대상을 올바르게 입력하세요.');
            end if;
        else 
            dbms_output.put_line('비밀번호를 올바르게 입력하세요.');
        end if;
    else
        dbms_output.put_line('글번호를 올바르게 입력하세요.');    
    end if;
    
    if vresult = 1 then
        dbms_output.put_line('게시판 글제목 수정에 성공했습니다.');
        dbms_output.put_line('[글번호] ' || pseq || ' [작성자] ' || vname || ' [글제목] ' || pedit);
        commit;
    elsif vresult = 2 then
        dbms_output.put_line('게시판 글내용 수정에 성공했습니다.');
        dbms_output.put_line('[글번호] ' || pseq || ' [작성자] ' || vname || ' [글내용] ' || pedit);
        commit;
    else
        dbms_output.put_line('게시판 글 수정에 실패했습니다.');
        rollback;
    
    end if;
    
exception
    when others then
        dbms_output.put_line('게시판 글 수정에 실패했습니다.');
        rollback;
end procQnaEdit;

--게시판 글 수정 실행
--(수정할 글번호, 작성자 교육생번호, 비밀번호(주민번호), 수정할 대상(1=제목, 2=내용), 수정할 내용) 
begin
    procQnaEdit(6, 1, '2709960', 1, '제목변경');
end;

select * from tblQna;

-- 게시글 삭제하기
create or replace procedure procQnaDel (
    pseq number,
    pstuseq number,
    pjumin varchar2
)
is
    cursor vcursor
    is
    select * from tblQna;
    
    vrow tblQna%rowtype;
    vflag number;
    vjumin tblStudent.jumin%type;
    vresult number;
    vname tblStudent.name%type;
    vtitle tblQna.title%type;
begin
    open vcursor;
        loop
            fetch vcursor into vrow;
            exit when vcursor%notfound;
            
            if vrow.seq = pseq then
                vflag := 1;
                vtitle := vrow.title;
            end if;
        end loop;
    close vcursor;
    
    if vflag = 1 then
        select jumin, name into vjumin, vname from tblStudent where seq = pstuseq;
        if vjumin = pjumin then
            delete from tblQna where seq = pseq;
            vresult := 1;
        else
            dbms_output.put_line('비밀번호를 올바르게 입력하세요.');
        end if;
    else
        dbms_output.put_line('글번호를 올바르게 입력하세요.');    
    end if;
    
    if vresult = 1 then
        dbms_output.put_line('게시판 글 삭제에 성공했습니다.');
        dbms_output.put_line('[글번호] ' || pseq || ' [작성자] ' || vname || ' [글제목] ' || vtitle);
        commit;
    else
        dbms_output.put_line('게시판 글 삭제에 실패했습니다.');
        rollback;
    end if;

exception
    when others then
        dbms_output.put_line('게시판 글 삭제에 실패했습니다.');
        rollback;
end procQnaDel;

--게시판 글 삭제하기 실행
begin
    procQnaDel(6, 1, '2709960');
end;

--교사 댓글 입력
create or replace PROCEDURE procComments (
    pqseq in tblComments.qseq%type,
    ptseq in tblComments.tseq%type,
    pcontents in tblComments.contents%type
    
)
is

begin
    insert into tblComments (seq, qseq, tseq, contents, regdate) 
    values (seq_Comments.nextVal, pqseq, ptseq, pcontents, sysdate);
    dbms_output.put_line('글번호: '||pqseq||' '||'교사번호: '||ptseq||' '||'내용: '||pcontents);
    dbms_output.put_line('입력에 성공하였습니다.');
    commit;

exception
    when OTHERS then
    dbms_output.put_line('입력에 실패하였습니다.');
    rollback;

end procComments;

--교사 댓글 입력 실행
begin
    proccomments(6, 1, 'default값이 변동없으면 create문에서는 생략 values에만 써주면됩니다. ');
end;


--댓글 삭제하기
create or replace procedure procCommentsDel (
    pqseq number

)
is
    vqseq tblComments.qseq%type;
begin
    
    select qseq into vqseq from tblComments where qseq = pqseq;
    delete from tblComments where qseq = vqseq;
    
    dbms_output.put_line('글번호: '||pqseq);
    dbms_output.put_line('삭제를 성공하였습니다.');
    commit;

exception
    when OTHERS then
    dbms_output.put_line('삭제를 실패하였습니다.');
    rollback;

end procCommentsDel;

--댓글 삭제실행하기
begin
    procCommentsDel(5);
end;


