//RUNFIB2  JOB (ESW),'COBOL 6.2 RUN',NOTIFY=&SYSUID, 
//             CLASS=A,MSGCLASS=X,MSGLEVEL=(1,1),TIME=1438
//***********************************************************
//* Add Comment
//         SET HLQ1='TS4447'
//         SET HLQ3='DEMO'  
//STEPCOMP EXEC PGM=FIBCHEC2,REGION=0M
//STEPLIB  DD  DSN=TS4447.DEMO.LOADPDSE,DISP=SHR
//         DD  DSN=&HLQ1..&HLQ3..LOADPDSE,DISP=SHR
//         DD  DSN=CEE.SCEERUN,DISP=SHR
//         DD  DSN=TS4447.DEMO.LOADPDSE,DISP=SHR
//SYSOUT   DD  SYSOUT=*
//SYSIN    DD *
  SORT FIELDS=COPY
/*
