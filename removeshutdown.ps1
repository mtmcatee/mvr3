Get-ScheduledTask -TaskName "Shutdown PC"
Unregister-ScheduledTask -TaskName "Shutdown PC" -Confirm:$false
