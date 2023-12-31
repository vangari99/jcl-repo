//CB62COMP JOB (ESW),'COBOL 6.2 COMPILE',NOTIFY=&SYSUID,
//        CLASS=A,MSGCLASS=X,MSGLEVEL=(1,1)
//*****************************************************
//* git testing....
//*****************************************************
//IGYWC  PROC  HLQI='TS4447.NTISV1',MEM='IGYIVP',
//             HLQO='TS4447.CDA',
//             LNGPRFX='ESW.ENTCOB.IGY620',
//             LIBPRFX='CEE'
//STEPCOMP EXEC PGM=IGYCRCTL,REGION=0M,
//        PARM='LIST,RENT,MAP,NONUM,NOOFF,S,TEST(DWARF)'
//STEPLIB  DD  DSNAME=&LNGPRFX..SIGYCOMP,DISP=SHR,DCB=BLKSIZE=32760
//         DD  DSNAME=&LIBPRFX..SCEERUN,DISP=SHR
//         DD  DSNAME=&LIBPRFX..SCEERUN2,DISP=SHR
//*YSIN    DD  DSN=TS4447.TESTESW.COBOL(&MEM),DISP=SHR
//SYSIN    DD  DSN=&HLQI..COBOL(&MEM),DISP=SHR
//SYSLIB   DD  DSN=&HLQI..COBOL,DISP=SHR
//SYSPRINT DD  SYSOUT=*
//SYSLIN   DD  DSNAME=&&LOADSET,UNIT=SYSALLDA,
//             DISP=(MOD,PASS),SPACE=(CYL,(1,1))
//SYSUT1   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT2   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT3   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT4   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT5   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT6   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT7   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT8   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT9   DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT10  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT11  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT12  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT13  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT14  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT15  DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSMDECK DD  UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//*
//************* OBJECT COPY STEP **********************
//STEPOBJ  EXEC PGM=VIAGENER,REGION=2M,COND=(8,LE,STEPCOMP)
//STEPLIB  DD  DSN=ESW.PROD.LOAD,DISP=SHR
//SYSIN    DD  DUMMY
//SYSPRINT DD  DUMMY
//SYSUT1   DD  DSN=&&LOADSET,DISP=(OLD,DELETE)
//SYSUT2   DD  DSN=&HLQO..OBJ(&MEM),DISP=SHR
//*
//************* OBJECT TIMESTAMP STEP *****************
//STEPTCHO EXEC PGM=VIATOUCH,PARM='MEMBER=&MEM.,LIBTYPE=O-BJ',
//             REGION=2M,COND=(8,LE,STEPCOMP)
//STEPLIB  DD  DSN=ESW.PROD.LOAD,DISP=SHR
//SYSPRINT DD  DUMMY
//SYSLIB   DD  DSN=&HLQO..OBJ,DISP=SHR
//*
//       PEND
//*
//COMP01 EXEC IGYWC,HLQI='TS4447.DEMO',HLQO='TS4447.DEMO',
//         MEM='FIBCHEC2'
//*
