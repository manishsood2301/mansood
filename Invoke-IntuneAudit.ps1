[CmdletBinding()]
param(
    [string]$InputFile = ".\intune_devices.json",
    [int]$StaleThresholdDays = 90
)

function Get-IntuneAuditReport {
    param($Devices, [int]$Threshold)

    $Report = @()

    foreach ($device in $Devices) {
        # Condition logic to classify device action
        if ($device.daysSinceLastSync -ge $Threshold) {
            $Action = "RETIRE & RECLAIM LICENSE"
        }
        elseif ($device.complianceState -ne "compliant") {
            $Action = "TRIGGER REMEDIATION"
        }
        else {
            $Action = "HEALTHY"
        }

        # Handle null/unassigned primary user safely
        $Owner = if ($device.userPrincipalName) { $device.userPrincipalName } else { "Unassigned" }

        # Build clean output object
        $Report += [PSCustomObject]@{
            DeviceName      = $device.deviceName
            Owner           = $Owner
            Compliance      = $device.complianceState
            DaysInactive    = $device.daysSinceLastSync
            RecommendedStep = $Action
        }
    }

    return $Report
}

try {
    Write-Host "Loading simulated Intune inventory..." -ForegroundColor Cyan
    $RawJson = Get-Content -Path $InputFile -Raw -ErrorAction Stop
    $DeviceList = $RawJson | ConvertFrom-Json

    $AuditResults = Get-IntuneAuditReport -Devices $DeviceList -Threshold $StaleThresholdDays
    $AuditResults | Format-Table -AutoSize
}
catch {
    Write-Error "Audit failed: $_"
}
