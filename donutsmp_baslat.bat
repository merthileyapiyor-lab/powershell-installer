@echo off
title Minecraft Baslatici
color 0A

:: ---------------- AYARLAR ----------------
set "ZIP_URL=https://raw.githubusercontent.com/merthileyapiyor-lab/powershell-installer/refs/heads/main/minecraft.zip"
set "KLASOR_ADI=MC_Oyun"

:: Hesap Bilgileriniz (Yeni Token ve Pachamamaa hesabi)
set "TOKEN=eyJraWQiOiIwNDkxODEiLCJhbGciOiJSUzI1NiJ9.eyJ4dWlkIjoiMjUzNTQwODE5ODA1Njg3OSIsImFnZyI6IkFkdWx0Iiwic3ViIjoiYmFmOWU3YTktYmMyYy00NGQ0LThlZmYtYTk4YzYyYTA4ZmJkIiwiYXV0aCI6IlhCT1giLCJucyI6ImRlZmF1bHQiLCJyb2xlcyI6W10sImlzcyI6ImF1dGhlbnRpY2F0aW9uIiwiZmxhZ3MiOlsibXVsdGlwbGF5ZXIiXSwicHJvZmlsZXMiOnsibWMiOiIxM2RlOTlhOS0yMjdkLTQ2MTMtOGE2OS1jMjg2ZjlmZGNjMjIifSwicG1pZCI6IjkyNjE1NWQ5LTI0ZTAtNWYyNC04YzY3LTMxY2YxNzc5OWIyYiIsInBsYXRmb3JtIjoiUENfTEFVTkNIRVIiLCJ0aWQiOiJFOTlCMCIsInBmZCI6W3sidHlwZSI6Im1jIiwiaWQiOiIxM2RlOTlhOS0yMjdkLTQ2MTMtOGE2OS1jMjg2ZjlmZGNjMjIiLCJuYW1lIjoiUGFjaGFtYW1hYSJ9XSwieGlkIjoiMjUzNTQwODE5ODA1Njg3OSIsIm5iZiI6MTc4NzkxMzA4OCwiZXhwIjoxNzg3OTk5NDg4LCJpYXQiOjE3ODc5MTMwODgsImFpZCI6IjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDA0MDJiNTMyOCJ9.N_ot7Z0liv7Vdm8MpBg-aPP4XEl8woFrm4NPVbbSHQb48pQzugr6kGHWqtIoM_Hw5GszX6mJMCpry5qiVAfMf1pJBd5pHqhcGVHcwtUqtyTfDuidRpCMRHw_vLFNLAMZ8p9kYM4xF2UeqqXT7-1h4wrY4mGBtEUbseZV9BdMTjxF7lWmXUzjX5FRYwxW3HlBTppSbDd4dkU3bIum8NUdXFr-8UfcOzwpW0dICupoLvMNFXKS7fPS-UJ5UHImnaOnLC7ripnil_cVjw9MJnBeBdhWfWbfOq0m1mqxdeg5rQXtxzkghbTv-7uB4InS3GB6uvG4hCt5_IhlzvnR4HriBw"
set "UUID=13de99a9227d46138a69c286f9fdcc22"
set "USERNAME=Pachamamaa"
set "SUREM=1.20.6" 
:: ------------------------------------------

if not exist "%KLASOR_ADI%" (
    echo [1] Oyun dosyalari GitHub'dan indiriliyor... Lutfen bekleyin. (Dosya buyukse surebilir)
    powershell -Command "Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile 'mc_dosyalar.zip'"
    
    echo [2] ZIP dosyasi cikariliyor...
    powershell -Command "Expand-Archive -Path 'mc_dosyalar.zip' -DestinationPath '%KLASOR_ADI%' -Force"
    
    echo [3] Temizlik yapiliyor...
    del mc_dosyalar.zip
) else (
    echo Oyun dosyalari zaten mevcut. Direk baslatiliyor...
)

echo [4] Minecraft Baslatiliyor...
cd "%KLASOR_ADI%"

:: Java baslatma komutu (javaw ile CMD gizlenir ve otomatik DonutSMP'ye girer)
start "" javaw -Xmx2G -cp "libraries\*;versions\%SUREM%-fabric\%SUREM%-fabric.jar" net.fabricmc.loader.impl.launch.knot.KnotClient --username %USERNAME% --version %SUREM% --gameDir . --assetsDir assets --assetIndex %SUREM% --uuid %UUID% --accessToken %TOKEN% --userType msa --versionType release --server play.donutsmp.net --port 25565

exit
