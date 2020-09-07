-- 맛집 시퀀스 생성
DROP SEQUENCE RSTRNT_INFO_SEQ;

CREATE SEQUENCE RSTRNT_INFO_SEQ
  START WITH 1
  INCREMENT BY 1
  MAXVALUE 10000
  MINVALUE 1
  NOCYCLE;

INSERT INTO TB_RSTRNT_INFO VALUES(RSTRNT_INFO_SEQ.NEXTVAL, 
999, 
'01012345678', 
'서울', 
'스타쉐프 바이 후남', 
'서울특별시 송파구 위례성대로 134',
'서울특별시 송파구 방이동 183-6', 
NULL, 
45000, 
DEFAULT, 
9, 
18, 
4, 
'맛집 소개', 
'N', 
'일', 
DEFAULT, 
DEFAULT, 
DEFAULT);

INSERT INTO TB_PHOTOFILES VALUES(1,
1,
'캡처.JPG',
'2020090523440844614.JPG',
1
);

INSERT INTO TB_PHOTOFILES VALUES(2,
1,
'캡처1.JPG',
'2020090523440863264.JPG',
DEFAULT
);

INSERT INTO TB_PHOTOFILES VALUES(3,
1,
'캡처2.JPG',
'2020090523444837295.JPG',
DEFAULT
);

INSERT INTO TB_PHOTOFILES VALUES(4L,
1,
'캡처3.JPG',
'2020090523441237540.JPG',
DEFAULT
);

INSERT INTO TB_PHOTOFILES VALUES(5,
1,
'카페1.jpg',
'2020090523442332653.jpg',
DEFAULT
);

INSERT INTO TB_PHOTOFILES VALUES(6,
1,
'맛잇는거1.jpg',
'2020090523448712567.jpg',
DEFAULT
);

INSERT INTO TB_RSTRNT_MENU VALUES(1,
1,
'불갈비와 버섯구이 샐러드',
39000
);

INSERT INTO TB_RSTRNT_MENU VALUES(2,
1,
'프라임 등심구이 샐러드',
39000
);

INSERT INTO TB_RSTRNT_MENU VALUES(3,
1,
'생선 버터구이',
43000
);

INSERT INTO TB_RSTRNT_MENU VALUES(4,
1,
'NY스테이크 500g',
74000
);

INSERT INTO TB_RSTRNT_MENU VALUES(5,
1,
'풍기 크림 파스타',
28000
);

INSERT INTO TB_RSTRNT_MENU VALUES(6,
1,
'허브식초로 절인 청어요리',
33000
);

INSERT INTO TB_RSTRNT_MENU VALUES(7,
1,
'지중해식 문어요리',
39000
);

INSERT INTO TB_RSTRNT_MENU VALUES(8,
1,
'양파스프 그라당',
12000
);

INSERT INTO TB_RSTRNT_MENU VALUES(9,
1,
'오늘의 스프 라지',
11000
);

INSERT INTO TB_RSTRNT_MENU VALUES(10,
1,
'오늘의 스프 레귤러',
8000
);

SET SERVEROUTPUT ON ;

DECLARE

        v_cnt NUMBER := 1;

     BEGIN

        DBMS_OUTPUT.ENABLE ;

        LOOP
            INSERT INTO TB_MEMBER
            VALUES(M_SEQ.NEXTVAL, 'honey' || v_cnt, '김허니' || v_cnt, 'honey' || v_cnt || '@gmail.com', DEFAULT, DEFAULT, DEFAULT, 'Y', DEFAULT, DEFAULT);

	INSERT INTO TB_GNRL_MEMBER
	VALUES (M_SEQ.CURRVAL,'hp' || v_cnt, 050630, 01012345678, '서울시', 1, 0);

	INSERT INTO TB_M_PASSWORD
	VALUES (M_SEQ.CURRVAL,'123');

            v_cnt := v_cnt+1;

            EXIT WHEN v_cnt > 100;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('데이터 입력 완료');
        DBMS_OUTPUT.PUT_LINE(v_cnt - 1 || '개의 데이터가 입력되었습니다');

     END;           
     /

DECLARE

        v_cnt NUMBER := 1;

     BEGIN

        DBMS_OUTPUT.ENABLE ;

        LOOP
            INSERT INTO TB_REVIEW
            VALUES(v_cnt, 1, '내용 테스트' || v_cnt, SYSDATE, 1, DEFAULT, v_cnt);

            v_cnt := v_cnt+1;

            EXIT WHEN v_cnt > 10;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('데이터 입력 완료');
        DBMS_OUTPUT.PUT_LINE(v_cnt - 1 || '개의 데이터가 입력되었습니다');

     END;           
     /

DECLARE

        v_cnt NUMBER := 11;

     BEGIN

        DBMS_OUTPUT.ENABLE ;

        LOOP
            INSERT INTO TB_REVIEW
            VALUES(v_cnt, 1, '내용 테스트' || v_cnt, SYSDATE, 2, DEFAULT, v_cnt);

            v_cnt := v_cnt+1;

            EXIT WHEN v_cnt > 15;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('데이터 입력 완료');
        DBMS_OUTPUT.PUT_LINE(v_cnt - 1 || '개의 데이터가 입력되었습니다');

     END;           
     /

DECLARE

        v_cnt NUMBER := 16;

     BEGIN

        DBMS_OUTPUT.ENABLE ;

        LOOP
            INSERT INTO TB_REVIEW
            VALUES(v_cnt, 1, '내용 테스트' || v_cnt, SYSDATE, 3, DEFAULT, v_cnt);

            v_cnt := v_cnt+1;

            EXIT WHEN v_cnt > 20;

        END LOOP;

        DBMS_OUTPUT.PUT_LINE('데이터 입력 완료');
        DBMS_OUTPUT.PUT_LINE(v_cnt - 1 || '개의 데이터가 입력되었습니다');

     END;           
     /
COMMIT;