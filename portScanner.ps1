Get-NetTCPConnection | Select-Object -Property LocalAddress, LocalPort, RemoteAddress, RemotePort, State 
Test-NetConnection -ComputerName localhost -Port 80