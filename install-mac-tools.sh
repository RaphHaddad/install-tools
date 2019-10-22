#!/bin/bash

echo install brew
/usr/bin/ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)

echo installing tools via brew

brew cask install adoptopenjdk

brew install git \
             git-credential-manager \
             terraform

brew cask install firefox \
          google-chrome \
          slack \
          dotnet-sdk \
          visual-studio-code

echo finished brew installs

echo install git credential manager

git-credential-manager install

echo adding vs code to path

cat << EOF >> ~/.bash_profile
# Add Visual Studio Code (code)
export PATH=\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin
EOF

echo installing vs code extentions

extentions=(ms-vscode.azure-account \ 
            ms-azuretools.vscode-azureterraform \
            ms-vscode.csharp \
            PeterJausovec.vscode-docker \
            EditorConfig.editorconfig \
            James-Yu.latex-workshop  \
            DavidAnson.vscode-markdownlint  \
            ms-vscode.powershell  \
            mauve.terraform  \
            ms-vscode.azurecli  \
            ms-vsts.team  \
            ms-python.python  \
            streetsidesoftware.code-spell-checker  \
            ionide.ionide-fsharp
            )

for i in ${extentions[@]};
    do code --install-extension $i;
    done;
