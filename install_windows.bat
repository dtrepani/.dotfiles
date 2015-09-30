:: Link each dotfile in the directory to its home counterpart.
:: Will not properly link "shell_prompt.sh" or delete existing dotfiles in home directory.
:: Reminders:
::		- mklink /H %HOME%\.shell_prompt.sh %HOME%\.dotfiles\shell_prompt.sh
::		- Install Powerline Fonts (Currently used: DejaVu 10pt)
::		- Add Pathogen:
::			- curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
::			- cd ~/.vim/bundle && git clone git://github.com/tpope/vim-sensible.git
::		- Add Vundle: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
::			- Run Vundle :PluginInstall

@echo off

attrib +h install*
attrib +h dotbot

:: Cycle through files
for %%i in (%HOME%\.dotfiles\*) do (
	@echo -- Linking file: %%~ni
	mklink /H %HOME%\.%%~ni %HOME%\.dotfiles\%%~ni
)

:: Cycle through subdirectories
for /D %%i in (%HOME%\.dotfiles\*) do (
	@echo -- Linking directory: %%~ni
	mklink /J %HOME%\.%%~ni %HOME%\.dotfiles\%%~ni
)

attrib -h install*
attrib -h dotbot