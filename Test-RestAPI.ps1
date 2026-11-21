[CmdletBinding()]
param()

try {
    Write-Host "Fetching live REST API data with PowerShell..." -ForegroundColor Cyan
    
    $Uri = "https://api.github.com/users/octocat"
    $Headers = @{ "User-Agent" = "ArchitectLab-PowerShell" }
    
    $Response = Invoke-RestMethod -Uri $Uri -Method Get -Headers $Headers -ErrorAction Stop

    $UserSummary = [PSCustomObject]@{
        UserName    = $Response.name
        Login       = $Response.login
        Company     = $Response.company
        Location    = $Response.location
        PublicRepos = $Response.public_repos
        CheckedAt   = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    }

    $UserSummary | Format-Table -AutoSize
}
catch {
    Write-Error "API request failed: $_"
}
