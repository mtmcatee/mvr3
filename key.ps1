# ==========================================================
# Windows 10 Education License Extension Script
# - Replaces expiring license with new product key
# - Activates Windows
# ==========================================================

$ProductKey = "N2FQC-Q67JC-2V7XP-WHMQT-2BC48" 
$LogPath = "C:\ProgramData\Faronics\Logs\Win10_License_Extension.log"

function Write-Log {
param([string]$Message)
$ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$line = "$ts $Message"
try {
$dir = Split-Path -Parent $LogPath
if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
Add-Content -Path $LogPath -Value $line
} catch {}
}

try {
Write-Log "Starting Windows 10 license extension"

Write-Log "Installing new product key..."
cscript.exe //Nologo "$env:windir\system32\slmgr.vbs" /ipk $ProductKey

Start-Sleep -Seconds 5

Write-Log "Activating Windows..."
cscript.exe //Nologo "$env:windir\system32\slmgr.vbs" /ato

Start-Sleep -Seconds 5

$status = cscript.exe //Nologo "$env:windir\system32\slmgr.vbs" /dli
Write-Log "License status:`n$status"

Write-Log "Script completed"
}
catch {
Write-Log "ERROR: $($_.Exception.Message)"
}
