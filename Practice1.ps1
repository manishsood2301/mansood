# A list (array) of 3 device names
$Devices = @("LAPTOP-01", "LAPTOP-02", "LAPTOP-03","LAPTOP-04")

# Loop through each item one at a time
foreach ($item in $Devices) {
    if ($item -eq "LAPTOP-02") {
        Write-Host "$item needs patching!" -ForegroundColor Yellow
    }
    elseif  ($item -eq "LAPTOP-04") {
        Write-Host "$item is retired!" -ForegroundColor Red
    }
    else  
    {
        Write-Host "$item is healthy." -ForegroundColor Green
    }
}