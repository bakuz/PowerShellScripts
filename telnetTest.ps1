Param(      
	[Parameter(Mandatory=$true)]      
	[string]$file,
		
	[Parameter(Mandatory=$true)]      
	[string]$Port,   
	
	[int32] $Timeout = 10000
 )    

$IPNodes = Get-Content $file

foreach($IP in $IPNodes) {
    Try {
		$tcp = New-Object System.Net.Sockets.TcpClient
		$connection = $tcp.BeginConnect($IP, $Port, $null, $null)
		$connection.AsyncWaitHandle.WaitOne($Timeout,$false) | Out-Null 
		if($tcp.Connected -eq $true) {
			Write-Host  "Successfully connected to Host: `"$IP`" on Port: `"$Port`"" -ForegroundColor Green
		}
		else {
			Write-Host "Could not connect to Host: `"$IP `" on Port: `"$Port`"" -ForegroundColor Red
		}
	}
	Catch {
		Write-Host "Unknown Error" -ForegroundColor Red
	}
}
