cls
Write-Host "======================================" -ForegroundColor Red
Write-Host ""
Write-Host "1. Install"
Write-Host "2. Clean"
Write-Host ""

$choice = Read-Host "Select Option (1 or 2)"

if ($choice -eq "1") {
    iex (iwr -UseBasicParsing "https://raw.githubusercontent.com/jaruwit380/IdAproshop/main/install.ps1")
}
elseif ($choice -eq "2") {
    iex (iwr -UseBasicParsing "https://raw.githubusercontent.com/jaruwit380/IdAproshop/main/clean.ps1")
}
else {
    Write-Host "INVALID OPTION" -ForegroundColor Red
    pause
}
