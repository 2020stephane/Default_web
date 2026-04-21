param (
    [Parameter(Mandatory=$true)] # obligation de donner un nom
    [string]$NomRepertoire,

    [string]$Source = "C:\xampp\htdocs\Defi_Web\projet_perso\Default_web\" # Valeur par défaut si non précisée
)
   $DateJour = Get-Date -Format "dd"
   $MoisJour = Get-Date -Format "MM"
   $AnneeJour = Get-Date -Format "yyyy"
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


$ContenuHtml = @"
       <!--===========================================================
             FICHIER : $NomRepertoire.html
             PROJET  : $NomRepertoire
             DATE    : $DateJour/$MoisJour/$AnneeJour
             AUTEUR  : Stephane Brisse
             ===========================================================-->
         <!DOCTYPE html>
         <html lang="fr">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>$NomRepertoire</title>
                <link rel="stylesheet" href="/css/$NomRepertoire.css">
            </head>
            <body>
                <header>
                </header>
                <main>

                </main>
         <script src="/js/$NomRepertoire.js"></script>
         <footer>
         </footer>
         </body>
         </html>
"@

$ContenuHtml | Out-File -FilePath "$Destination\html\$($NomRepertoire).html" -Encoding utf8
code $Destination -r
