:: Link each dotfile in the directory to its home counterpart.
:: Will not properly link "shell_prompt.sh" or delete dotfiles.
:: 		mklink /H %HOME%\.shell_prompt.sh %HOME%\.dotfiles\shell_prompt.sh
:: Reminders:
::		- Run Vundle :PluginInstall
::		- Install Powerline Fonts (Currently used: DejaVu 10pt)

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