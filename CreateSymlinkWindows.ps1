# Path to the source file
$sourceFile = Join-Path -Path (Get-Location) -ChildPath "NeverSinks Litefilter.filter"

# Target directory and file
$targetDir = "C:\Users\$env:USERNAME\Documents\My Games\Path of Exile 2"
$targetFile = Join-Path -Path $targetDir -ChildPath "NeverSinks Litefilter.filter"

# Ensure the target directory exists
if (-not (Test-Path -Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir | Out-Null
}

# Check if the symlink already exists and remove it if necessary
if (Test-Path -Path $targetFile -PathType Leaf) {
    Remove-Item -Path $targetFile -Force
}

# Create the symlink
Write-Host "Creating symlink from $sourceFile to $targetFile"
cmd /c mklink "$targetFile" "$sourceFile"

Write-Host "Symlink created successfully!"
