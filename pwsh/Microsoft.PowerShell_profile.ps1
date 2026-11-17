Write-Host "`e[3mMy Focus Is Unparalleled!`n`e[0m"

# Add Update-SessionEnvironment/RefreshEnv Command, need Chocolatey installed
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
# Refresh the environment variables for the current session
Update-SessionEnvironment

# Restart all VSCode instances, useful for refreshing environment changes
function VSCodeRestartAll {
    Stop-Process -Name "Code" -Force
    Start-Process "code" -NoNewWindow
}

# Test
function tt {
    Write-Host "Test"
}
