function Install-SoftwareUsingChoco() {
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    choco install googlechrome `
                  firefox `
                  vscode `
                  resharper `
                  linqpad `
                  git-credential-manager-for-windows `
                  cmder `
                  nodejs.install `
                  greenshot `
                  poshgit `
                  screentogif `
                  kdiff3 `
                  docker `
                  microsoftazurestorageexplorer `
                  rdcman `
                  terraform `
                  virtualbox `
                  python `
                  keybase `
                  treesizefree `
                  everything `
                  slack `
                  dotnetcore-sdk `
                  microsoft-teams.install `
                  megasync `
                  sql-server-management-studio `
                  sql-server-express `
                  postman `
                  fiddler `
                  putty `
                  azure-cli `
                  azure-data-studio `
                  -y
}

function Install-VsCodeExtentions() {
    $extentions = "ms-vscode.azure-account", `
                  "ms-azuretools.vscode-azureterraform", `
                  "ms-vscode.csharp", `
                  "PeterJausovec.vscode-docker", `
                  "EditorConfig.editorconfig", `
                  "James-Yu.latex-workshop", `
                  "DavidAnson.vscode-markdownlint", `
                  "ms-vscode.powershell", `
                  "mauve.terraform", `
                  "ms-vscode.azurecli", `
                  "ms-vsts.team", `
                  "ms-python.python", `
                  "streetsidesoftware.code-spell-checker", `
                  "ionide.ionide-fsharp"

    foreach ($extention in $extentions) {
        code --install-extension $extention
    }
}

function Install-WindowsFeatures() {
    Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
    Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Hyper-V-All
}

function Install-PoshGit() {
    Install-Module posh-git -Force -AllowClobber
}

function Set-GitConfigs() {
    git config --global core.editor 'code --wait'
    git config --global diff.tool defaultdiff-tool
    git config --global difftool.defaultdiff-tool.cmd 'code --wait --diff $LOCAL $REMOTE'
    git config --global core.autocrlf true
}

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
Install-SoftwareUsingChoco
RefreshEnv
Install-PoshGit
RefreshEnv
Install-VsCodeExtentions
Set-GitConfigs
Install-WindowsFeatures
Restart-Computer -Force
