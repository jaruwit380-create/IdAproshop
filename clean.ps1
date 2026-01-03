# ================= ADMIN CHECK =================
if (-not ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "PLEASE RUN AS ADMIN" -ForegroundColor Red
    pause
    exit
}

cls
Write-Host "RESTORING WINDOWS DEFAULT..." -ForegroundColor Yellow

# ================= POWER PLAN =================
powercfg -setactive SCHEME_BALANCED

# ================= CPU / TIMER RESET =================
bcdedit /deletevalue disabledynamictick | Out-Null
bcdedit /deletevalue useplatformtick | Out-Null
bcdedit /deletevalue useplatformclock | Out-Null
bcdedit /deletevalue tscsyncpolicy | Out-Null
bcdedit /set hypervisorlaunchtype auto | Out-Null

# ================= WIN32 RESET =================
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 2 /f

# ================= GPU RESET =================
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f

# ================= INPUT RESET =================
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 1 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 6 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 10 /f

# ================= GAME DVR =================
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f

# ================= XBOX =================
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 3 /f

Write-Host ""
Write-Host "CLEAN COMPLETE - RESTART REQUIRED" -ForegroundColor Green
pause
