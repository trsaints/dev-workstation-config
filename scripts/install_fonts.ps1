Param(
    [string]
    $Path
)

If ($Path -eq '') {
    Write-Host "Usage: install_fonts.ps1 -Path <Path to font file>"
    Exit
}

foreach ($font in Get-ChildItem $Path) {
    If ($font.Extension -ne ".ttf" -and $font.Extension -ne ".otf") {
        Write-Host "Skipping file: $($font.FullName)"
        Continue
    }

    Write-Host "Installing font: $($font.FullName)"
    
    $sa = New-Object -ComObject Shell.Application
    $Fonts = $sa.NameSpace(0x14)
    $Fonts.CopyHere($font.FullName)
}
