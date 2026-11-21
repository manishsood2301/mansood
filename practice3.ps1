# 1. Define a reusable function with parameters
function Get-DeviceStatus {
    param(
        [string]$DeviceName,
        [int]$DaysInactive
    )

    if ($DaysInactive -gt 90) {
        return "$DeviceName -> RETIRE ($DaysInactive days inactive)"
    }
    return "$DeviceName -> ACTIVE ($DaysInactive days inactive)"
}

# 2. Wrap execution in try/catch for safety
try {
    # Call your custom function twice with different inputs
    Get-DeviceStatus -DeviceName "HSBC-TOR-01" -DaysInactive 12
    Get-DeviceStatus -DeviceName "HSBC-MIS-02" -DaysInactive 104

    # Trigger an intentional error to see 'catch' in action
    Get-Content -Path ".\missing_file.json" -ErrorAction Stop
}
catch {
    Write-Host "Caught error safely: $($_.Exception.Message)" -ForegroundColor Red
}
