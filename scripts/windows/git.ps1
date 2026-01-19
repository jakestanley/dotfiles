<# 
Link or relink git config files and enable repo-managed hooks.
#>

$userProfile = $env:USERPROFILE
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")

$gitConfig = Join-Path $userProfile ".gitconfig"
$gitIgnore = Join-Path $userProfile ".gitignore_global"

Remove-Item -Force -ErrorAction SilentlyContinue $gitConfig, $gitIgnore

New-Item -ItemType HardLink -Path $gitConfig -Target (Join-Path $repoRoot "gitconfig") | Out-Null
New-Item -ItemType HardLink -Path $gitIgnore -Target (Join-Path $repoRoot "gitignore_global") | Out-Null

git config --global core.hooksPath (Join-Path $repoRoot "git-hooks")
