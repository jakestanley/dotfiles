<# 
Link or relink git config files and install dotfiles-managed hooks.
#>

$userProfile = $env:USERPROFILE
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")

$gitConfig = Join-Path $userProfile ".gitconfig"
$gitIgnore = Join-Path $userProfile ".gitignore_global"
if (-not (Test-Path -LiteralPath $repoRoot)) {
    throw "dotfiles repo root not found"
}

Remove-Item -Force -ErrorAction SilentlyContinue $gitConfig, $gitIgnore

New-Item -ItemType HardLink -Path $gitConfig -Target (Join-Path $repoRoot "gitconfig") | Out-Null
New-Item -ItemType HardLink -Path $gitIgnore -Target (Join-Path $repoRoot "gitignore_global") | Out-Null

$hooksDir = Join-Path $userProfile ".config\git\hooks"
New-Item -ItemType Directory -Force -Path $hooksDir | Out-Null

$repoHooks = Join-Path $repoRoot "git-hooks\*"
Copy-Item -Force -Path $repoHooks -Destination $hooksDir

$localGitConfig = Join-Path $userProfile ".gitconfig.local"
if (-not (Test-Path -LiteralPath $localGitConfig)) {
    Set-Content -LiteralPath $localGitConfig -Encoding utf8 -Value "# Add per-machine overrides (GPG key, user/email overrides, etc.) below this line."
}

git config --file $localGitConfig core.hooksPath $hooksDir
