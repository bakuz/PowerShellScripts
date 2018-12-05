Param(      
	[Parameter(Mandatory=$true)]      
	[string]$file    
 )    

$IPNodes = Get-Content $file

foreach ($IP in $IPNodes){	
	try {
        Test-Connection -IPAddress $IP -Count 2 -ErrorAction Stop | Out-Null
		Write-Host "$IP is UP" -ForegroundColor Green;
	} catch { # either ping failed or access denied 
        try {
            Test-Connection -IPAddress $IP -Count 2 -ErrorAction Stop | Out-Null
			$Status = $(if ($Error[0].Exception -match 'Access is denied') { 'Access is denied' } else { $Error[0].Exception })
			Write-Host "$IP is Down: $Status" -ForegroundColor Red;
		} catch {
			$Status = 'No response to ping'
			Write-Host "$IP is Indeterminated: $Status" -ForegroundColor Yellow;
		}
	}	
}
