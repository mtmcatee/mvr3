# Set the scheduled task time and repitition
$TaskTime = New-ScheduledTaskTrigger -Daily -At 12:00

# Set  the task to run as a local administrator with highest level privileges
$TaskUser = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest

# Set actions the schedule task should perform
$Action1 = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'Stop-Computer -Force'

# Registers the task with Task Scheduler
Register-ScheduledTask "Test Scheduled Task" -Action $Action1 -Principal $TaskUser
