#!/bin/bash

echo "Informe o hostname" 
read HOSTNAME 
echo "Informe a porta" 
read PORT 
echo "Informe a instancia" 
read INSTANCIA 

#rm -f txt.txt

#/usr/local/nagios/libexec/check_mssql_health --hostname $HOSTNAME --port $PORT --username APP_NAGIOS --password Ald42mc#dkr! --mode database-online >> txt.txt


#BASE=(`cat txt.txt | sed "s/,/&\n/g"| sed "s/OK - / /" | awk '{print $1}'`)



echo "##################### DBS SQL INICIO ###################" >>  $HOSTNAME.cfg

#for i in "${BASE[@]}"  do echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_db_$i \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_health_dbsp"!"APP_NAGIOS"!"Ald42mc#dkr!"!""$i"\n \t \t }\n"   done  >>  $HOSTNAME.cfg



echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Databases \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_health_db"!"usr_monit!usr_monit"!""$PORT" \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t check_mssql_dbon_instance \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_dbon_instance"!"usr_monit!usr_monit"!""$INSTANCIA""!""$HOSTNAME""!""$PORT >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Hit Ratio \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_hit_ratio2"!"usr_monit!usr_monit"!""$PORT" \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_db_Page_Writes \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_server3"!""$PORT""!"--pagewrites \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_db_Page_Reads \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_server3"!""$PORT""!"--pagereads \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_Logins_per_Sec \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_logins"!""$PORT""!"$HOSTNAME \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_Logouts_per_Sec \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_logouts"!""$PORT""!"$HOSTNAME \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_db_Free_list_stalls \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_health"!"usr_monit!usr_monit"!"free-list-stalls"!""$PORT""!"2"!"3 \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_db_Lazy_writes \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_health"!"usr_monit!usr_monit"!"lazy-writes"!""$PORT""!"30"!"50 \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_db_Lock_wait_time \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_health"!"usr_monit!usr_monit"!"locks-waits"!""$PORT""!"500"!"600 \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_db_Page_Life_expectancy \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_health"!"usr_monit!usr_monit"!"page-life-expectancy"!""$PORT""!"600:"!"300: \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_db_Log_Used \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_logused"!""$PORT" \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_db_Memory_Grants_Pending \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_grants_pending"!""$PORT" \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_Deadlock \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_health"!"usr_monit!usr_monit"!"locks-deadlocks"!""$PORT" \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_Free_Page \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_query"!"usr_monit!usr_monit"!"sql"!"SELECT [cntr_value] FROM sys.dm_os_performance_counters WHERE [object_name] LIKE '%Buffer Manager%' "!""$PORT""!"'<640'"!"'<300' \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_Page_Split \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_query"!"usr_monit!usr_monit"!"sql"!"SELECT 1.0*cntr_value / (SELECT 1.0*cntr_value FROM sys.dm_os_performance_counters WHERE counter_name = 'Batch equests/sec') AS [PageSplitPct] FROM sys.dm_os_performance_counters WHERE counter_name = 'Page splits/sec'"!""$PORT""!"15"!"20 \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_IO_Busy \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_health"!"usr_monit!usr_monit"!"io-busy"!""$PORT" \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_CXPACKET \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_query"!"usr_monit!usr_monit"!"sql"!"SELECT  wait_time_ms / 1000.0 AS wait_time_sec FROM    sys.dm_os_wait_stats  WHERE   wait_type = 'CXPACKET' "!""$PORT""!"500000"!"1000000 \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_User_Connections \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_query"!"usr_monit!usr_monit"!"sql"!"SELECT [cntr_value] FROM sys.dm_os_performance_counters WHERE [object_name] LIKE '%General Statistics%'  AND [counter_name] ='User Connections'"!""$PORT""!"1000"!"20000 \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_Schema_Modified \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_query"!"usr_monit!usr_monit"!"sql"!"SELECT DATEDIFF(ss, '1970', MAX([modify_date]))  FROM [sys].[objects] "!""$PORT" \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_Schema_Modified \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_query"!"usr_monit!usr_monit"!"sql"!"DECLARE @endtime DATETIME  SET @endtime = GETDATE() DECLARE @starttime DATETIME SET @starttime = DATEADD(hh, -1, @endtime)  IF OBJECT_ID('tempdb..#LogEntries') IS NOT NULL DROP TABLE #LogEntries   CREATE TABLE #LogEntries ( LogDate DATETIME , ProcessInfo VARCHAR(1000) ,  LogMessage TEXT)  INSERT  INTO #LogEntries EXEC sys.xp_readerrorlog 0, 1, N'Login', N'failed', @starttime, @endtime  SELECT  COUNT(*) FROM    #LogEntries  DROP TABLE #LogEntries"!""$PORT""!"100"!"200 \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_Memory_Erros \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_query"!"usr_monit!usr_monit"!"sql"!"DECLARE @tmp INT  SELECT  @tmp = 1 FROM    sys.dm_os_ring_buffers AS dorb  CROSS JOIN sys.dm_os_sys_info AS dosi WHERE   dorb.ring_buffer_type = 'RING_BUFFER_OOM'  AND DATEADD(ss,  (-1 * ((dosi.cpu_ticks / CONVERT (FLOAT, (dosi.cpu_ticks  / dosi.ms_ticks)))  - dorb.timestamp) / 1000), GETDATE()) > DATEADD(mi, -5, GETDATE())  SELECT ISNULL(@tmp, 0) "!""$PORT""!"1"!"2 \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_Server_Logins \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_query"!"usr_monit!usr_monit"!"sql"!"DECLARE @endtime DATETIME  SET @endtime = GETDATE()  DECLARE @starttime DATETIME  SET @starttime = DATEADD(hh, -1, @endtime)   IF OBJECT_ID('tempdb..#LogEntries') IS NOT NULL DROP TABLE #LogEntries   CREATE TABLE #LogEntries ( LogDate DATETIME , ProcessInfo VARCHAR(1000) ,  LogMessage TEXT)  INSERT  INTO #LogEntries EXEC sys.xp_readerrorlog 0, 1, N'Login', N'failed', @starttime, @endtime  SELECT  COUNT(*) FROM    #LogEntries  DROP TABLE #LogEntries "!""$PORT""!"20"!"30 \n \t \t }\n"  >>  $HOSTNAME.cfg

echo -e "define service { \n \t \t host_name\t \t "$HOSTNAME" \n \t \t service_description\t Check_mssql_Failed_Jobs \n \t \t use\t \t \t generic-database \n \t \t check_command\t \t check_mssql_query"!"usr_monit!usr_monit"!"sql"!"declare @job varchar(500)  set @job ='  ' declare @cnt varchar(3) select @job = substring ((SELECT  DISTINCT ', ' + T2.name FROM msdb..sysjobhistory T1 INNER JOIN msdb..sysjobs T2 ON T1.job_id = T2.job_id WHERE T1.run_status NOT IN (1, 4) AND T1.step_id \!= 0 AND run_date >= CONVERT(CHAR(8), (SELECT DATEADD (DAY,(-1), GETDATE())), 112) FOR XML PATH('')),3,500) SELECT DISTINCT  @cnt= COUNT(distinct T2.Name) FROM msdb..sysjobhistory T1 INNER JOIN msdb..sysjobs T2 ON T1.job_id = T2.job_id WHERE T1.run_status NOT IN (1, 4) AND T1.step_id \!= 0 AND run_date >= CONVERT(CHAR(8), (SELECT DATEADD (DAY,(-1), GETDATE())), 112) if @cnt >=0 print 'Failed jobs (' + @cnt + '): ' + @job"!""$PORT""!"1"!"2 \n \t \t }\n"  >>  $HOSTNAME.cfg

echo "##################### DBS SQL FIM ###################" >>  $HOSTNAME.cfg

> txt.txt

exit 0

