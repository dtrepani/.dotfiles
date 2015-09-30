:: Link each dotfile in the directory to its home counterpart.
:: Will not properly link "shell_prompt.sh" or delete dotfiles.
:: shell_prompt.sh link: mklink /H %HOME%\.shell_prompt.sh %HOME%\.dotfiles\shell_prompt.sh

@echo off

attrib +h install*
attrib +h dotbot

:: Cycle through files
for %%i in (%HOME%\.dotfiles\*) do (
	@echo -- Linking: %%~ni
	mklink /H %HOME%\.%%~ni %HOME%\.dotfiles\%%~ni
)

:: Cycle through subdirectories
for /D %%i in (%HOME%\.dotfiles\*) do (
	@echo -- Linking: %%~ni
	mklink /J %HOME%\.%%~ni %HOME%\.dotfiles\%%~ni
)

attrib -h install*
attrib -h dotbot