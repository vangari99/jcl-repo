//RUNFIB2  JOB (ESW),'COBOL 6.2 RUN',NOTIFY=&SYSUID,               
//            CLASS=,MSGCLASS=X,MSGLEVEL=(1,1),TIME=1438              
//***********************************************************
//         SET HLQ1='TS4447'
//         SET HLQ4='TEST1'    
//STEPCOMP EXEC PGM=FIBCHEC2,REGION=0M
//STEPLIB  DD  DSN=TS4447.DEMO1.LOADPDSE,DISP=SHR                                      
//         DD  DSN=&HLQ1..&HLQ4.LOADPDSE,DISP=SHR                                       
//         DD  DSN=CEE.SCEERUN,DISP=SHR
//         DD  DSN=CEE.SCEERUN2,DISP=SHR
//SYSOUT   DD  SYSOUT=*
