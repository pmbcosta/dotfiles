Get-Process | Where-Object { $_.Name -eq "Uncap"  } | Select-Object -First 1 | Stop-Process
