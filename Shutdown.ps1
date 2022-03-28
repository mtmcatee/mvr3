# The name of your scheduled task.
$taskName = "Shutdown Computer"

# Describe the scheduled task.
$description = "Shuts computer down daily at 10 CDT"

# Create a new task action
$taskAction = New-ScheduledTaskAction `
    -Execute 'powershell.exe' `
    -Argument 'Stop-Computer -Force'

#Create task trigger
$taskTrigger = New-ScheduledTaskTrigger -Daily -At 11:10AM

# Register the new PowerShell scheduled task
# Register the scheduled task
Register-ScheduledTask `
    -TaskName $taskName `
    -Action $taskAction `
    -Trigger $taskTrigger `
    -Description $description
    -$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
