Write-Host "========================================="
Write-Host " Windows High/Critical Alert Generator"
Write-Host "========================================="

function Show-Menu {
    Write-Host ""
    Write-Host "1) Suspicious PowerShell Execution (High)"
    Write-Host "2) Discovery / Enumeration Activity (High)"
    Write-Host "3) Registry Run Key Persistence (Critical)"
    Write-Host "4) PowerShell Download Behavior (Critical)"
    Write-Host "5) Exit"
    Write-Host ""
}

function Suspicious-PowerShell {
    Write-Host "[*] Generating suspicious PowerShell execution..."
    powershell -ExecutionPolicy Bypass -Command "Get-Process"
    Write-Host "[+] Done."
}

function Discovery-Activity {
    Write-Host "[*] Generating discovery / enumeration commands..."
    whoami
    hostname
    ipconfig /all
    net user
    net localgroup administrators
    Write-Host "[+] Done."
}

function Registry-Persistence {
    Write-Host "[*] Creating registry autorun persistence..."
    reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v TestApp /t REG_SZ /d "cmd.exe" /f
    Write-Host "[+] Done."
}

function PowerShell-Download {
    Write-Host "[*] Generating PowerShell download behavior..."
    Invoke-WebRequest http://example.com -UseBasicParsing
    Write-Host "[+] Done."
}

while ($true) {
    Show-Menu
    $choice = Read-Host "Enter choice"

    switch ($choice) {
        "1" { Suspicious-PowerShell }
        "2" { Discovery-Activity }
        "3" { Registry-Persistence }
        "4" { PowerShell-Download }
        "5" { break }
        default { Write-Host "Invalid choice." }
    }
}