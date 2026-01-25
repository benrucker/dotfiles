$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Applying Windows dotfiles..." -ForegroundColor Cyan

# Apply .gitconfig
$gitconfigSrc = Join-Path $ScriptDir ".gitconfig"
$gitconfigDst = Join-Path $HOME ".gitconfig"
Copy-Item -Path $gitconfigSrc -Destination $gitconfigDst -Force
Write-Host "  [OK] .gitconfig -> $gitconfigDst" -ForegroundColor Green

# Apply global gitignore
$gitignoreSrc = Join-Path $ScriptDir ".gitignore_global"
$gitignoreDst = Join-Path $HOME ".gitignore_global"
Copy-Item -Path $gitignoreSrc -Destination $gitignoreDst -Force
git config --global core.excludesFile $gitignoreDst
Write-Host "  [OK] .gitignore_global -> $gitignoreDst" -ForegroundColor Green

# Apply PowerShell profile to both PS 5.1 and PS 7 locations
$profileSrc = Join-Path $ScriptDir "Microsoft.PowerShell_profile.ps1"
$profilePaths = @(
    Join-Path $HOME "Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"  # PS 5.1
    Join-Path $HOME "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"         # PS 7
)
foreach ($profileDst in $profilePaths) {
    $profileDir = Split-Path -Parent $profileDst
    if (-not (Test-Path $profileDir)) {
        New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
        Write-Host "  [OK] Created $profileDir" -ForegroundColor Green
    }
    Copy-Item -Path $profileSrc -Destination $profileDst -Force
    Write-Host "  [OK] PowerShell profile -> $profileDst" -ForegroundColor Green
}

Write-Host "`nDotfiles applied successfully!" -ForegroundColor Cyan
Write-Host "Restart your terminal to use the new settings." -ForegroundColor Yellow
