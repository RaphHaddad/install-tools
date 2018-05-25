
function Install-SoftwareUsingChoco() {
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    choco install googlechrome googledrive firefox visualstudiocode sql-server-management-studio resharper-platform linqpad git-credential-manager-for-windows gitextensions cmder nodejs.install greenshot poshgit screentogif kdiff3 docker azurestorageexplorer rdcman terraform virtualbox python f.lux keybase -y
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
                  "ms-vsts.team"

    foreach ($extention in $extentions) {
        code --install-extension $extention
    }
}

Install-SoftwareUsingChoco
RefreshEnv
Install-VsCodeExtentions
