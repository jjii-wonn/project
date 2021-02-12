proc format ;
         value b2W 1='CGV' 2='롯데시네마' 3='메가박스' 4='기타' ;
         value b3W 1='3회 미만' 2= '3~5회' 3='6~10회' 4='11회~15회'  5='16회 이상';
         value b4W 1='할인 혜택 및 이벤트' 2='영상 시설. 음향 시설의 수준' 3='직원의 친절한 서비스' 
                          4='포인트 적립' 5='가까운 거리' 6='기타';
         value b5W 1='친구' 2='가족' 3='연인' 4='혼자' 5='기타';
         value b6W 1='인터넷'2='현장예매' 3='스마트폰 앱 이용' 4='기타';
         value b7W 1='주중 조조' 2='주중 일반' 3='주중 심야' 4='주말 조조' 5='주말 일반' 6='주말 심야';
         value b8W 1='명시된 영화 상영시각 10분 이전' 2='명시된 영화 상영시각 직전' 3='명시된 영화 상영시간 후 광고시간 ' 
                           4='실질적으로 영화가 시작한 후 (광고가 끝난 후)' ;
         value b9W 1='2D 또는 디지털' 2='3D' 3='4DX' 4='IMAX' 5='screen X' 6='Sound X' 7='Temper cinema 또는 The first club'
                        8='기타';
         value b10W 1='①' 2='②' 3='③' 4='④' 5='⑤' 6='⑥' 7='⑦' 8='⑧' 9='⑨';
         value b11W 1='로맨스·멜로' 2='코미디' 3='드라마' 4='범죄·느와르' 5='SF' 6='다큐멘터리' 7='애니메이션'
                        8='공포' 9='독립영화' 10='기타';
         value b12W 1='-광고나 예고편을 보고' 2='주변 사람들의 권유' 3='좋아하는 감독이나 배우의 출연' 
                        4='좋아하는 장르' 5='높은 평점' 6='기타';
         value b19W 1='대기 시간이 너무 길어서' 2='음식의 맛이 없어서' 3='가격이 너무 비싸서' 4='먹고 싶은 메뉴가 없어서' 5='기타';
         value b21W 1='앉을 자리 부족' 2='소음' 3='불청결' 4='기타' ;
         value b23W 1='찬성한다.' 2='반대한다.' 3='잘 모르겠다.' ;
         value b24W 1='7000원 미만' 2='7000원 이상 8000원 미만' 3='8000원 이상 9000원 미만' 
                         4='9000원 이상 10000원 미만' 5='10000원 이상' ;
          value b29W 1='편리한 이용' 2='휴대 가능한 관람표' 3='어플리케이션 이용 시 혜택' 4='기타';
         value b31W 1='직원의 친절성' 2='상영관 내에서의 소란스러움' 3='영화관 내 시설(ex.화장실, 오락실, 카페)' 
                        4='매점의 먹거리' 5='기타';
          value c32W 1='남자' 2='여자';
         value c33W 1='1학년' 2='2학년' 3='3학년' 4='4학년';
         value c34W 1='과학기술대학' 2='글로벌비즈니스대학' 3='공공정책대학' 4='문화스포츠대학';
         value c35W 1='20만원 미만' 2='20만원 이상 30만원 미만' 3='30만원 이상 40만원 미만'
                         4='40만원 이상 50만원 미만'  5='50만원 이상';
        value c36W 1='기숙사' 2='자취' 3='통학';
         value aW 1='예' 2='아니오' ;
        value rW 1='매우 만족' 2='만족' 3='보통' 4='불만족' 5='매우 불만족';
        run;

DATA LIB.survey;
SET LIB.example;
FORMAT
r1 aW.
r2 b2W.
r3 b3W.
r41-r44 b4W.
r5 b5W.
r6 b6W.
r7 b7W.
r8 b8W.
r91 b9W.
r92 b9W.
r93 b9W.
r10 b10W.
r111 b11W.
r112 b11W.
r113 b11W.
r12 b12W.
r13-r17 rW.
r18 rW.
r19 b19W.
r20 rW.
r21 b21W.
r22 rW.
r23 b23W.
r24 b24W.
r25 rW.
r26 rW.
r27 rW.
r28 rW.
r29 b29W.
r30 aW.
r31 b31W.
r32 c32W.
r33 c33W.
r34 c34W.
r35 c35W.
r36 c36W.;
LABEL
r32="성별"
r33="학년"
r34="소속 단과대"
;
RUN;

proc freq data=lib.survey;
run;

/*신뢰도 검토(영화관 만족도)*/
proc corr data =lib.survey alpha;
var r13-r18 r20 r22 r25-r28 ;
run;
/*신뢰도 검토(r22 제거)*/
proc corr data =lib.survey alpha;
var r13-r18 r20 r25-r28 ;
run;   
/*점수화(산술) */
data lib.survey;
set lib.survey;
mean2= (r13+r14+r15+r16+r17+r18+r20+r25+r26+r27+r28)/11    ;
run;
/*점수화(가중)*/
proc factor data= lib.survey out = lib.factor1
nfactors= 1;
var r13-r18 r20 r25-r28;
run;
/*산술평균과 가중평균 관계*/
proc reg data=lib.factor1;
model mean2 = factor1;
run;
/*빈도분석*/
proc freq data=lib.survey;
	tables r32 r33 r34 r35 r36;
run;
proc freq data=lib.survey;
	tables r1 r2 r3 r41 r42 r43 r44 r5 r6 r7 r8 r91 r92 r93
	r10 r111 r112 r113 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21
	r22 r23 r24 r25 r26 r27 r28 r29 r30 r31;
run;
  /* 순위를 가중합으로 구하기 위한 프로그램 (성별 주로 이용하는 상영관의 유형)*/ 
 DATA lib.sortrank1 ;
set lib.survey ;
    ARRAY q{3} r91-r93 ;
    DO n=1 TO 3 ;
      IF q{n} <9 ;
      IF q{n} ^= . THEN DO;
         b=q{n} ;   
         wgt = 4-n ;    OUTPUT ;
       END;
   END ;
   DROP n r91-r93 ;
    RUN;

proc tabulate ;
      CLASS r32 b;
      VAR wgt ;
      TABLES b=' ' ,
               (r32=' ' ALL='전체' )*wgt=' '*sum=' '*F=7.0
               / BOX='주로 이용하는 상영관의 유형';
     RUN;
	 proc sort data=lib.sortrank1;
	by r32 b; 
run;
proc means data=lib.sortrank1 sum maxdec=0;
	var  wgt;
	by r32 b;
output out=lib.sumout sum=sumb; 
run;
proc rank data= lib.sumout descending ties=mean;
	var sumb;
	ranks rankb;
	by r32 ;
run;
 proc print ;
   VAR r32 sumb rankb ;
   run;
    /* 순위응답 (학년별 주로 이용하는 상영관의 유형)*/ 
   DATA lib.sortrank1 ;
set lib.survey ;
    ARRAY q{3} r91-r93 ;
    DO n=1 TO 3 ;
      IF q{n} <9 ;
      IF q{n} ^= . THEN DO;
         b=q{n} ;   
         wgt = 4-n ;    OUTPUT ;
       END;
   END ;
   DROP n r91-r93 ;
    RUN;
  proc tabulate ;
      CLASS r33 b;
      VAR wgt ;
      TABLES b=' ' ,
               (r33=' ' ALL='전체' )*wgt=' '*sum=' '*F=7.0
               / BOX='주로 이용하는 상영관의 유형';
     RUN;
	 proc sort data=lib.sortrank1;
	by r33 b; 
run;
proc means data=lib.sortrank1 sum maxdec=0;
	var  wgt;
	by r33 b;
output out=lib.sumout sum=sumb; 
run;
proc rank data= lib.sumout descending ties=mean;
	var sumb;
	ranks rankb;
	by r33 ;
run;
 proc print ;
   VAR r33 sumb rankb ;
   run;

  /* 순위응답 (성별 선호하는 영화 장르)*/ 
DATA lib.sortrank2 ;
set lib.survey ;
    ARRAY q{3} r111-r113 ;
    DO n=1 TO 3 ;
      IF q{n} <11;
      IF q{n} ^= . THEN DO;
         b=q{n} ;   
         wgt = 4-n ;    OUTPUT ;
       END;
   END ;
   DROP n r111-r113 ;
    RUN;
	proc tabulate ;
      CLASS r32  b;
      VAR wgt ;
      TABLES b=' ' ,
               (r32=' ' ALL='전체' )*wgt=' '*SUM=' '*F=7.0
               / BOX='선호하는 영화 장르';
     RUN;
	 	 proc sort data=lib.sortrank2;
	by r32 b; 
run;
proc means data=lib.sortrank2 sum maxdec=0;
	var  wgt;
	by r32 b;
output out=lib.sumout sum=sumb; 
run;
proc rank data= lib.sumout descending ties=mean;
	var sumb;
	ranks rankb;
	by r32 ;
run;
 proc print ;
   VAR r32  sumb rankb ;
   run;
    /* 순위응답 (학년별 선호하는 영화 장르)*/ 
DATA lib.sortrank2 ;
set lib.survey ;
    ARRAY q{3} r111-r113 ;
    DO n=1 TO 3 ;
      IF q{n} <11;
      IF q{n} ^= . THEN DO;
         b=q{n} ;   
         wgt = 4-n ;    OUTPUT ;
       END;
   END ;
   DROP n r111-r113 ;
    RUN;
   	proc tabulate ;
      CLASS r33  b;
      VAR wgt ;
      TABLES b=' ' ,
               (r33=' ' ALL='전체' )*wgt=' '*SUM=' '*F=7.0
               / BOX='선호하는 영화 장르';
     RUN;
	 	 proc sort data=lib.sortrank2;
	by r33  b; 
run;
proc means data=lib.sortrank2 sum maxdec=0;
	var  wgt;
	by r33 b;
output out=lib.sumout sum=sumb; 
run;
proc rank data= lib.sumout descending ties=mean;
	var sumb;
	ranks rankb;
	by r33 ;
run;
 proc print ;
   VAR r33  sumb rankb ;
   run;
    /* 중복응답 (성별 영화관 선택 이유)*/ 
   DATA lib.sortrank3 ;
set lib.survey ;
    ARRAY q{4} r41-r44 ;
    DO n=1 TO 4 ;
      IF q{n} <7;
      IF q{n} ^= . THEN DO;
         b=q{n} ;   
         wgt = 1 ;    OUTPUT ;
       END;
   END ;
   DROP n r41-r44 ;
    RUN;
 	proc tabulate ;
      CLASS r32  b;
      VAR wgt ;
      TABLES b=' ' ,
               (r32=' ' ALL='전체' )*wgt=' '*SUM=' '*F=7.0
               / BOX='특정 영화관 선택이유';
     RUN;
	 	 proc sort data=lib.sortrank3;
	by r32  b; 
run;
proc means data=lib.sortrank3 sum maxdec=0;
	var  wgt;
	by r32 b;
output out=lib.sumout sum=sumb; 
run;
proc rank data= lib.sumout descending ties=mean;
	var sumb;
	ranks rankb;
	by r32 ;
run;
 proc print ;
   VAR r32  sumb rankb ;
   run;
 /* 중복응답 (학년별 영화관 선택 이유)*/ 
DATA lib.sortrank3 ;
set lib.survey ;
    ARRAY q{4} r41-r44 ;
    DO n=1 TO 4 ;
      IF q{n} <7;
      IF q{n} ^= . THEN DO;
         b=q{n} ;   
         wgt = 1 ;    OUTPUT ;
       END;
   END ;
   DROP n r41-r44 ;
    RUN;
 	proc tabulate ;
      CLASS r33  b;
      VAR wgt ;
      TABLES b=' ' ,
               (r33=' ' ALL='전체' )*wgt=' '*SUM=' '*F=7.0
               / BOX='특정 영화관 선택이유';
     RUN;
	 	 proc sort data=lib.sortrank3;
	by r33  b; 
run;
proc means data=lib.sortrank3 sum maxdec=0;
	var  wgt;
	by r33 b;
output out=lib.sumout sum=sumb; 
run;
proc rank data= lib.sumout descending ties=mean;
	var sumb;
	ranks rankb;
	by r33 ;
run;
 proc print ;
   VAR r33  sumb rankb ;
   run;
 /* 중복응답 (브랜드별 영화관 선택 이유)*/ 
 DATA lib.sortrank3 ;
set lib.survey ;
    ARRAY q{4} r41-r44 ;
    DO n=1 TO 4 ;
      IF q{n} <7;
      IF q{n} ^= . THEN DO;
         b=q{n} ;   
         wgt = 1 ;    OUTPUT ;
       END;
   END ;
   DROP n r41-r44 ;
    RUN;
 	proc tabulate ;
      CLASS r2  b;
      VAR wgt ;
      TABLES b=' ' ,
               (r2=' ' ALL='전체' )*wgt=' '*SUM=' '*F=7.0
               / BOX='특정 영화관 선택이유';
     RUN;
	 	 proc sort data=lib.sortrank3;
	by r2  b; 
run;
proc means data=lib.sortrank3 sum maxdec=0;
	var  wgt;
	by r2 b;
output out=lib.sumout sum=sumb; 
run;
proc rank data= lib.sumout descending ties=mean;
	var sumb;
	ranks rankb;
	by r2 ;
run;
 proc print ;
   VAR r2  sumb rankb ;
   run;
/*카이제곱 동질성 검정( 성별, 학년별, 브랜드별)*/
/* 이용 행태*/
proc freq data =lib.survey;
tables  (r32 r33)*(r2 r3 r5 r6 r7 r8 r10 r12) /chisq;
run;
proc freq data =lib.survey;
tables  r2*( r3 r5 r6 r7 r8 r10 r12 r30 r31) /chisq;
run;
/* 이용 만족도*/
proc freq data =lib.factor1;
tables  (r32 r33 r2)*( r13 r14 r15 r16 r17 r18 r20 r25 r26 r27 r28) /chisq;
run;


/*이용 만족도에 따른 분산분석(성별)*/
proc glm data =lib.factor1;
class r32;
model mean2 =r32;
means r32 /tukey
run;
/*분산분석(학년별)*/
proc glm data =lib.factor1;
class r33;
model mean2 =r33;
means r33 /tukey
run;

/*분산분석(브랜드별)*/
proc glm data =lib.factor1;
class r2;
model mean2 =r2;
means r2 /tukey;
run;
/*만족도에 대한 인자분석*/
proc factor data=lib.survey
	cov simple rotate=varimax reorder plot
	outstat=outst3_2;
	var r13-r18 r20 r25-r28;
run;

/*시설 만족도*/
   /*점수화(산술) */
data lib.survey;
set lib.survey;
mean3= (r13+r14+r15+r16+r17)/5    ;
run;
/*점수화(가중)*/
proc factor data= lib.survey out = lib.factor2
nfactors= 1;
var r13-r17;
run;
/*산술평균과 가중평균 관계*/
proc reg data=lib.factor2;
model mean3 = factor1;
run;
/*서비스 만족도*/
 /*점수화(산술) */
data lib.survey;
set lib.survey;
mean4= (r25+r26+r27+r28)/4 ;
run;
/*점수화(가중)*/
proc factor data= lib.survey out = lib.factor3
nfactors= 1;
var r25-r28;
run;
/*산술평균과 가중평균 관계*/
proc reg data=lib.factor3;
model mean4 = factor1;
run;
/*대기장소 및 매점, 카페  만족도*/
 /*점수화(산술) */
data lib.survey;
set lib.survey;
mean5= (r18+r20)/2    ;
run;
/*점수화(가중)*/
proc factor data= lib.survey out = lib.factor4
nfactors= 1;
var r18 r20;
run;
/*산술평균과 가중평균 관계*/
proc reg data=lib.factor4;
model mean5 = factor1;
run;
/*분산분석(시설 만족도(성별, 학년별, 브랜드별))*/
proc glm data =lib.factor2;
class r32 ;
model mean3 =r32 ;
means r32 /tukey;
run;
proc glm data =lib.factor2;
class r33 ;
model mean3 =r33 ;
means r33 /tukey;
run;
proc glm data =lib.factor2;
class r2 ;
model mean3 =r2 ;
means r2 /tukey;
run;
/*분산분석(서비스 만족도(성별, 학년별, 브랜드별))*/
proc glm data =lib.factor3;
class r32 ;
model mean4 =r32 ;
means r32 /tukey;
run;
proc glm data =lib.factor3;
class r33 ;
model mean4 =r33 ;
means r33 /tukey;
run;
proc glm data =lib.factor3;
class r2 ;
model mean4 =r2 ;
means r2 /tukey;
run;
/*분산분석(대기장소 및 매점, 카페 만족도(성별, 학년별, 브랜드별))*/
proc glm data =lib.factor4;
class r32 ;
model mean5 =r32 ;
means r32 /tukey;
run;
proc glm data =lib.factor4;
class r33 ;
model mean5 =r33 ;
means r33/tukey;
run;
proc glm data =lib.factor4;
class r2 ;
model mean5 =r2 ;
means r2 /tukey;
run;


