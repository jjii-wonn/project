proc format ;
         value b2W 1='CGV' 2='�Ե��ó׸�' 3='�ް��ڽ�' 4='��Ÿ' ;
         value b3W 1='3ȸ �̸�' 2= '3~5ȸ' 3='6~10ȸ' 4='11ȸ~15ȸ'  5='16ȸ �̻�';
         value b4W 1='���� ���� �� �̺�Ʈ' 2='���� �ü�. ���� �ü��� ����' 3='������ ģ���� ����' 
                          4='����Ʈ ����' 5='����� �Ÿ�' 6='��Ÿ';
         value b5W 1='ģ��' 2='����' 3='����' 4='ȥ��' 5='��Ÿ';
         value b6W 1='���ͳ�'2='���忹��' 3='����Ʈ�� �� �̿�' 4='��Ÿ';
         value b7W 1='���� ����' 2='���� �Ϲ�' 3='���� �ɾ�' 4='�ָ� ����' 5='�ָ� �Ϲ�' 6='�ָ� �ɾ�';
         value b8W 1='��õ� ��ȭ �󿵽ð� 10�� ����' 2='��õ� ��ȭ �󿵽ð� ����' 3='��õ� ��ȭ �󿵽ð� �� ����ð� ' 
                           4='���������� ��ȭ�� ������ �� (���� ���� ��)' ;
         value b9W 1='2D �Ǵ� ������' 2='3D' 3='4DX' 4='IMAX' 5='screen X' 6='Sound X' 7='Temper cinema �Ǵ� The first club'
                        8='��Ÿ';
         value b10W 1='��' 2='��' 3='��' 4='��' 5='��' 6='��' 7='��' 8='��' 9='��';
         value b11W 1='�θǽ������' 2='�ڹ̵�' 3='���' 4='���ˡ����͸�' 5='SF' 6='��ť���͸�' 7='�ִϸ��̼�'
                        8='����' 9='������ȭ' 10='��Ÿ';
         value b12W 1='-���� �������� ����' 2='�ֺ� ������� ����' 3='�����ϴ� �����̳� ����� �⿬' 
                        4='�����ϴ� �帣' 5='���� ����' 6='��Ÿ';
         value b19W 1='��� �ð��� �ʹ� ��' 2='������ ���� ���' 3='������ �ʹ� ��μ�' 4='�԰� ���� �޴��� ���' 5='��Ÿ';
         value b21W 1='���� �ڸ� ����' 2='����' 3='��û��' 4='��Ÿ' ;
         value b23W 1='�����Ѵ�.' 2='�ݴ��Ѵ�.' 3='�� �𸣰ڴ�.' ;
         value b24W 1='7000�� �̸�' 2='7000�� �̻� 8000�� �̸�' 3='8000�� �̻� 9000�� �̸�' 
                         4='9000�� �̻� 10000�� �̸�' 5='10000�� �̻�' ;
          value b29W 1='���� �̿�' 2='�޴� ������ ����ǥ' 3='���ø����̼� �̿� �� ����' 4='��Ÿ';
         value b31W 1='������ ģ����' 2='�󿵰� �������� �Ҷ�������' 3='��ȭ�� �� �ü�(ex.ȭ���, ������, ī��)' 
                        4='������ �԰Ÿ�' 5='��Ÿ';
          value c32W 1='����' 2='����';
         value c33W 1='1�г�' 2='2�г�' 3='3�г�' 4='4�г�';
         value c34W 1='���б������' 2='�۷ι�����Ͻ�����' 3='������å����' 4='��ȭ����������';
         value c35W 1='20���� �̸�' 2='20���� �̻� 30���� �̸�' 3='30���� �̻� 40���� �̸�'
                         4='40���� �̻� 50���� �̸�'  5='50���� �̻�';
        value c36W 1='�����' 2='����' 3='����';
         value aW 1='��' 2='�ƴϿ�' ;
        value rW 1='�ſ� ����' 2='����' 3='����' 4='�Ҹ���' 5='�ſ� �Ҹ���';
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
r32="����"
r33="�г�"
r34="�Ҽ� �ܰ���"
;
RUN;

proc freq data=lib.survey;
run;

/*�ŷڵ� ����(��ȭ�� ������)*/
proc corr data =lib.survey alpha;
var r13-r18 r20 r22 r25-r28 ;
run;
/*�ŷڵ� ����(r22 ����)*/
proc corr data =lib.survey alpha;
var r13-r18 r20 r25-r28 ;
run;   
/*����ȭ(���) */
data lib.survey;
set lib.survey;
mean2= (r13+r14+r15+r16+r17+r18+r20+r25+r26+r27+r28)/11    ;
run;
/*����ȭ(����)*/
proc factor data= lib.survey out = lib.factor1
nfactors= 1;
var r13-r18 r20 r25-r28;
run;
/*�����հ� ������� ����*/
proc reg data=lib.factor1;
model mean2 = factor1;
run;
/*�󵵺м�*/
proc freq data=lib.survey;
	tables r32 r33 r34 r35 r36;
run;
proc freq data=lib.survey;
	tables r1 r2 r3 r41 r42 r43 r44 r5 r6 r7 r8 r91 r92 r93
	r10 r111 r112 r113 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21
	r22 r23 r24 r25 r26 r27 r28 r29 r30 r31;
run;
  /* ������ ���������� ���ϱ� ���� ���α׷� (���� �ַ� �̿��ϴ� �󿵰��� ����)*/ 
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
               (r32=' ' ALL='��ü' )*wgt=' '*sum=' '*F=7.0
               / BOX='�ַ� �̿��ϴ� �󿵰��� ����';
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
    /* �������� (�г⺰ �ַ� �̿��ϴ� �󿵰��� ����)*/ 
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
               (r33=' ' ALL='��ü' )*wgt=' '*sum=' '*F=7.0
               / BOX='�ַ� �̿��ϴ� �󿵰��� ����';
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

  /* �������� (���� ��ȣ�ϴ� ��ȭ �帣)*/ 
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
               (r32=' ' ALL='��ü' )*wgt=' '*SUM=' '*F=7.0
               / BOX='��ȣ�ϴ� ��ȭ �帣';
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
    /* �������� (�г⺰ ��ȣ�ϴ� ��ȭ �帣)*/ 
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
               (r33=' ' ALL='��ü' )*wgt=' '*SUM=' '*F=7.0
               / BOX='��ȣ�ϴ� ��ȭ �帣';
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
    /* �ߺ����� (���� ��ȭ�� ���� ����)*/ 
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
               (r32=' ' ALL='��ü' )*wgt=' '*SUM=' '*F=7.0
               / BOX='Ư�� ��ȭ�� ��������';
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
 /* �ߺ����� (�г⺰ ��ȭ�� ���� ����)*/ 
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
               (r33=' ' ALL='��ü' )*wgt=' '*SUM=' '*F=7.0
               / BOX='Ư�� ��ȭ�� ��������';
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
 /* �ߺ����� (�귣�庰 ��ȭ�� ���� ����)*/ 
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
               (r2=' ' ALL='��ü' )*wgt=' '*SUM=' '*F=7.0
               / BOX='Ư�� ��ȭ�� ��������';
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
/*ī������ ������ ����( ����, �г⺰, �귣�庰)*/
/* �̿� ����*/
proc freq data =lib.survey;
tables  (r32 r33)*(r2 r3 r5 r6 r7 r8 r10 r12) /chisq;
run;
proc freq data =lib.survey;
tables  r2*( r3 r5 r6 r7 r8 r10 r12 r30 r31) /chisq;
run;
/* �̿� ������*/
proc freq data =lib.factor1;
tables  (r32 r33 r2)*( r13 r14 r15 r16 r17 r18 r20 r25 r26 r27 r28) /chisq;
run;


/*�̿� �������� ���� �л�м�(����)*/
proc glm data =lib.factor1;
class r32;
model mean2 =r32;
means r32 /tukey
run;
/*�л�м�(�г⺰)*/
proc glm data =lib.factor1;
class r33;
model mean2 =r33;
means r33 /tukey
run;

/*�л�м�(�귣�庰)*/
proc glm data =lib.factor1;
class r2;
model mean2 =r2;
means r2 /tukey;
run;
/*�������� ���� ���ںм�*/
proc factor data=lib.survey
	cov simple rotate=varimax reorder plot
	outstat=outst3_2;
	var r13-r18 r20 r25-r28;
run;

/*�ü� ������*/
   /*����ȭ(���) */
data lib.survey;
set lib.survey;
mean3= (r13+r14+r15+r16+r17)/5    ;
run;
/*����ȭ(����)*/
proc factor data= lib.survey out = lib.factor2
nfactors= 1;
var r13-r17;
run;
/*�����հ� ������� ����*/
proc reg data=lib.factor2;
model mean3 = factor1;
run;
/*���� ������*/
 /*����ȭ(���) */
data lib.survey;
set lib.survey;
mean4= (r25+r26+r27+r28)/4 ;
run;
/*����ȭ(����)*/
proc factor data= lib.survey out = lib.factor3
nfactors= 1;
var r25-r28;
run;
/*�����հ� ������� ����*/
proc reg data=lib.factor3;
model mean4 = factor1;
run;
/*������ �� ����, ī��  ������*/
 /*����ȭ(���) */
data lib.survey;
set lib.survey;
mean5= (r18+r20)/2    ;
run;
/*����ȭ(����)*/
proc factor data= lib.survey out = lib.factor4
nfactors= 1;
var r18 r20;
run;
/*�����հ� ������� ����*/
proc reg data=lib.factor4;
model mean5 = factor1;
run;
/*�л�м�(�ü� ������(����, �г⺰, �귣�庰))*/
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
/*�л�м�(���� ������(����, �г⺰, �귣�庰))*/
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
/*�л�м�(������ �� ����, ī�� ������(����, �г⺰, �귣�庰))*/
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


