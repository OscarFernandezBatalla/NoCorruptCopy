param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$SourcePath,
    [Parameter(Mandatory=$true, Position=1)]
    [string]$DestPath
)

$filesToCopy = Get-ChildItem -Path $SourcePath -Recurse -File
$totalFiles = $filesToCopy.Count
$filesCopied = 0

foreach ($file in $filesToCopy) {
    $sourceFile = $file.FullName
    $destFile = Join-Path $DestPath $file.FullName.Substring($SourcePath.Length + 1)

    if (!(Test-Path $destFile)) {
        $destDir = Split-Path $destFile
        if (!(Test-Path $destDir)) {
            New-Item -ItemType Directory -Path $destDir -Force
        }

        do {
            Copy-Item $sourceFile $destFile -Force
            $sourceHash = Get-FileHash -Path $sourceFile
            $destHash = Get-FileHash -Path $destFile
        } until ($sourceHash.Hash -eq $destHash.Hash)

        Write-Host "Copied: $sourceFile to $destFile"
    }

    $filesCopied++
    $progress = [Math]::Round(($filesCopied / $totalFiles) * 100)
    Write-Progress -Activity "Copying files..." -PercentComplete $progress
}