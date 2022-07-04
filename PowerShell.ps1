function Write-BranchName () {
	# https://stackoverflow.com/questions/1287718/how-can-i-display-my-current-git-branch-name-in-my-powershell-prompt
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            $branch = git rev-parse --short HEAD
            Write-Host " ($branch)" -ForegroundColor "red"
        }
        else {
            Write-Host " ($branch)" -ForegroundColor "blue"
        }
    } catch {
        Write-Host " (no branches yet)" -ForegroundColor "yellow"
    }
}

function prompt {
  $currentPath = Get-Location
  $userPrompt = "$('>' * ($nestedPromptLevel + 1)) "
  #Write-Host "$env:USERNAME@$env:COMPUTERNAME " -NoNewLine
  Write-Host "$currentPath" -NoNewLine -ForegroundColor "green"
  if (Test-Path .git) {
	  Write-BranchName
  } else {
	  Write-Host 
  }
  return $userPrompt
}
