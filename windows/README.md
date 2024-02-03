https://github.com/nvim-telescope/telescope-fzf-native.nvim/issues/43#issuecomment-1020653830

PLUGIN LOCATION: C:\Users\[USERNAME]\AppData\Local\nvim-data\site\pack\packer\start

-- the above shows how to install fzf
choco install minwg
choco install make
---- RELOAD ALL TERMINALS

NOTE: nvim won't work inside bash shell. Use powershell.

CONFIG LOCATION:
C:/Users/[username]/AppData/Local/nvim
-- put CONTENTS of windows(this dir) inside the above folder.

RUN THESE COMMANDS:
:PackerSync
:GoInstallBinaries

INSTALL LSPS:
:Mason
-- install the following for this config
emf
golangci-lint
golangci-lint-langserver
gopls
lua-language-server

