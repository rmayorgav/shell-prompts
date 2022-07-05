function Write-BranchName () {
    # https://stackoverflow.com/questions/1287718/how-can-i-display-my-current-git-branch-name-in-my-powershell-prompt
    $ESC = $([char]27)
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            $branch = git rev-parse --short HEAD
            Write-Host " $ESC[36m($branch)"
        }
        else {
            Write-Host " $ESC[36m($branch)"
        }
    }
    catch {
        Write-Host " $ESC[36m(no branches yet)"
    }
}

function prompt {
    $ESC = $([char]27)
    $currentPath = Get-Location
    $userPrompt = "$('>' * ($nestedPromptLevel + 1)) "
  
    Write-Host "$ESC[32m$env:USERNAME@$env:COMPUTERNAME" -NoNewLine
    Write-Host " $ESC[33m$currentPath" -NoNewLine
    if (Test-Path .git) {
        Write-BranchName
    }
    else {
        Write-Host 
    }
    return $userPrompt
}
