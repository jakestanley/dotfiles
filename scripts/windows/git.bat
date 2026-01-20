:: link or relink git
del /s /q %UserProfile%\.gitconfig
del /s /q %UserProfile%\.gitignore_global

mklink /H "%UserProfile%\.gitconfig" %~dp0\..\..\gitconfig
mklink /H "%UserProfile%\.gitignore_global" %~dp0\..\..\gitignore_global

:: enable repo-managed git hooks (pre-push blocks future-dated commits)
for %%I in ("%~dp0\..\..") do set "DOTFILES=%%~fI"
git config --global core.hooksPath "%DOTFILES%\git-hooks"
