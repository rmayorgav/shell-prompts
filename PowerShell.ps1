# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.2

function prompt {
  $currentPath = Split-Path -leaf -path (Get-Location)
  "$env:USERNAME@$env:COMPUTERNAME [$([char]27)[32m$currentPath$([char]27)[m]> "
}
