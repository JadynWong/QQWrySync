$rootFolder = (Get-Item -Path "./" -Verbose).FullName

$copywrite_uri = 'http://update.cz88.net/ip/copywrite.rar'
$qqwry_uri = 'http://update.cz88.net/ip/qqwry.rar'

$copywrite_des = (Join-Path $rootFolder "copywrite.rar")
$qqwry_des = (Join-Path $rootFolder "qqwry.rar")

function Download([string]$uri, [string]$outFile) {
    Write-Output "Download start: $uri save $outFile"
    if (Test-Path $outFile) { Remove-Item $outFile -Force -Recurse }
    Invoke-WebRequest -Uri $uri -Headers @{"Accept" = "text/html, */*"; "User-Agent" = "Mozilla/3.0 (compatible; Indy Library)" } -OutFile $outFile
    Write-Output "Download end"

    Write-Output "Unlock $outFile"
    Unblock-File $outFile
}

Download -uri $copywrite_uri -outFile $copywrite_des
Download -uri $qqwry_uri -outFile $qqwry_des

Write-Output "Download success"