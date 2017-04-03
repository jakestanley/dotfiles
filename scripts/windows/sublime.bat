rmdir /s /q "%UserProfile%\AppData\Roaming\Sublime Text 3\Packages\User"
mklink /J "%UserProfile%\AppData\Roaming\Sublime Text 3\Packages\User" "%UserProfile%\dotfiles\config\sublime-text-3\Packages\User"
