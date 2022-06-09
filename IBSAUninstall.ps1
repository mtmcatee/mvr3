$application = Get-WmiObject -Class Win32_Product -Filter "Name = 'IBSA'"
$application.Uninstall()
