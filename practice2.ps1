# 1. Create a structured device object
$MyDevice = [PSCustomObject]@{
    DeviceName = "HSBC-TOR-01"
    OSVersion  = "Win11 25H2"
    Compliant  = $true
    SyncDays   = 3
}

# 2. Convert object TO a JSON string (for sending to an API)
$JsonText = $MyDevice | ConvertTo-Json
Write-Host "--- Raw JSON Text ---" -ForegroundColor Cyan
Write-Host $JsonText

# 3. Convert JSON string BACK into a PowerShell object (reading from an API)
$ParsedObject = $JsonText | ConvertFrom-Json
Write-Host "`nDevice Name read from JSON: $($ParsedObject.DeviceName)" -ForegroundColor Green
Write-Host "`nOS Version read from JSON: $($ParsedObject.OSVersion)" -ForegroundColor Green