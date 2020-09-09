WINDOWS_TERMINAL_CFG="/mnt/c/Users/paulo/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
WINDOWS_HOME="/mnt/c/Users/paulo"
import_zsh:
	cp ../.zshrc ~/.zshrc
	cp .platform ~/.platform
export_zsh:
	cp ~/.zshrc ../.zshrc
	cp ~/.platform .platform
uncap_setup:
	echo "TODO"
import_terminal_cfg:
	cp settings.json $(WINDOWS_TERMINAL_CFG)
export_terminal_cfg:
	cp $(WINDOWS_TERMINAL_CFG) .
export_ps_profile:
	cp $(WINDOWS_HOME)/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1 .
import_ps_profile:
	cp Microsoft.PowerShell_profile.ps1 $(WINDOWS_HOME)/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
