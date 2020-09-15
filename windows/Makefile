WINDOWS_TERMINAL_CFG="/mnt/c/Users/paulo/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
WINDOWS_HOME="/mnt/c/Users/paulo"
VSCODE_SETTINGS="/mnt/c/Users/paulo/AppData/Roaming/Code/User/settings.json"
VSCODE_KEYBINDINGS="/mnt/c/Users/paulo/AppData/Roaming/Code/User/keybindings.json"
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
	cp -r ./ps1_scripts ~/
vscode-import:
	cp ../settings.json $(VSCODE_SETTINGS)
	cp ../keybindings.json $(VSCODE_KEYBINDINGS)
vscode-export:
	cp $(VSCODE_SETTINGS) ../settings.json
	cp $(VSCODE_KEYBINDINGS) ../keybindings.json
vim-import:
	cp ../.ideavimrc ~/.ideavimrc
	cp ../.ideavimrc $(WINDOWS_HOME)/.ideavimrc
