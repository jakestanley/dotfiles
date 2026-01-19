function Git-AmendAddHours {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [int]$Hours = 8
    )

    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Error "git not found on PATH"
        return
    }

    git rev-parse --is-inside-work-tree *> $null
    if ($LASTEXITCODE -ne 0) {
        Write-Error "not inside a git repository"
        return
    }

    git rev-parse --verify HEAD *> $null
    if ($LASTEXITCODE -ne 0) {
        Write-Error "no commits found (HEAD does not exist)"
        return
    }

    $author = (git show -s --format=%aI HEAD).Trim()
    $committer = (git show -s --format=%cI HEAD).Trim()

    $newAuthor = ([DateTimeOffset]::Parse($author)).AddHours($Hours).ToString("o")
    $newCommitter = ([DateTimeOffset]::Parse($committer)).AddHours($Hours).ToString("o")

    Write-Host "Amending HEAD: shift timestamps by $Hours h"
    Write-Host "Author:    $author -> $newAuthor"
    Write-Host "Committer: $committer -> $newCommitter"

    $previousCommitterDate = $env:GIT_COMMITTER_DATE
    try {
        $env:GIT_COMMITTER_DATE = $newCommitter
        git commit --amend --no-edit --date $newAuthor
    }
    finally {
        if ($null -eq $previousCommitterDate) {
            Remove-Item Env:\GIT_COMMITTER_DATE -ErrorAction SilentlyContinue
        }
        else {
            $env:GIT_COMMITTER_DATE = $previousCommitterDate
        }
    }
}

