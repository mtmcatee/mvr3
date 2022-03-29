# Set the scheduled task time and repitition
$TaskTime = New-ScheduledTaskTrigger -Daily -At 8:21AM

# Set  the task to run as a local administrator with highest level privileges
$TaskUser = New-ScheduledTaskPrincipal -GroupId "NT AUTHORITY\SYSTEM" -RunLevel Highest 

# Set actions the schedule task should perform
$Action1 = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'Stop-Computer -Force'

# Registers the task with Task Scheduler
Register-ScheduledTask "Shutdown" -Action $Action1 -Principal $TaskUser -Trigger $TaskTime
