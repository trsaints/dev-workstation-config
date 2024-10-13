$UrlsHash = @{
    JetBrainsToolbox = "https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.4.2.32922.exe?_gl=1*1iui4b9*_gcl_au*MTQyMTg3MjYxNi4xNzI4NzYyODA4*_ga*MTExNDUxMzE4OS4xNzI4NzYyODA2*_ga_9J976DJZ68*MTcyODc4MjQ1MS4yLjEuMTcyODc4MjQ2My40OC4wLjA.";
    VsCode           = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user";
    Obsidian         = "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/Obsidian-1.6.7.exe";
    Vlc              = "https://get.videolan.org/vlc/3.0.21/win32/vlc-3.0.21-win32.exe";
    DotnetSdk        = "https://download.visualstudio.microsoft.com/download/pr/6224f00f-08da-4e7f-85b1-00d42c2bb3d3/b775de636b91e023574a0bbc291f705a/dotnet-sdk-8.0.403-win-x64.exe";
    Git              = "https://github.com/git-for-windows/git/releases/download/v2.47.0.windows.1/Git-2.47.0-64-bit.exe";
    Gimp              = "https://download.gimp.org/gimp/v2.10/windows/gimp-2.10.38-setup-1.exe";
    ObsStudio        = "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-30.2.3-Windows-Installer.exe";
    PowerShell       = "https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x64.msi"
    PowerToys = "https://github.com/microsoft/PowerToys/releases/download/v0.85.1/PowerToysSetup-0.85.1-x64.exe"
}

$path = [System.Environment]::GetFolderPath("Desktop") 

$UrlsHash.GetEnumerator() | ForEach-Object {
    Clear-Host

    $url = $_.Value
    $fileName = $url.Split("/")[$UrlsHash.Count - 1]
    $filePath = Join-Path $path $fileName

    Write-Host "Downloading $fileName"
    Invoke-WebRequest -Uri $url -OutFile $filePath
    Write-Host "Downloaded $fileName to $filePath"
}
