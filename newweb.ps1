param (
    [Parameter(Mandatory=$true)]
    [string]$NomRepertoire,

    [string]$Source = "C:\xampp\htdocs\Defi_Web\projet_perso\Default_web\" # Valeur par défaut si non précisée
)

$Destination = "C:\xampp\htdocs\Defi_Web\projet_perso\$NomRepertoire"

# Création et copie
if (Test-Path $Source) {
    New-Item -Path $Destination -ItemType Directory -Force
    Copy-Item -Path "$Source\*" -Destination $Destination -Recurse -Verbose
    Write-Host "Sauvegarde terminee dans : $Destination" -ForegroundColor Cyan
} else {
    Write-Warning "Source introuvable."
} 
   New-Item -Path "$Destination\html\$($NomRepertoire).html" -ItemType File
   New-Item -Path "$Destination\css\$($NomRepertoire).css" -ItemType File
   New-Item -Path "$Destination\js\$($NomRepertoire).js" -ItemType File
   Set-Location -Path $Destination
   Remove-Item ".\newweb.ps1"
   code $Destination -r