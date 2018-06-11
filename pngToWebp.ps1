Param(      
[Parameter(Mandatory=$true)]      
[string]$folder    
 )      
    
$files = get-childitem $folder -recurse -force -include *.jpg, *.png  
foreach($inputFile in $files){     
   #Call cwebp  
   $inputFilePath = $inputFile.FullName  
   $outputFilePath = Split-Path -Path $inputFile.FullName  
   $outputFilePath = $outputFilePath + "\" + [System.IO.Path]::GetFileNameWithoutExtension($inputFilePath) + ".webp"  
  
   $args = "-q 80 " + $inputFilePath + " -o " + $outputFilePath  
  
   Start-Process cwebp -ArgumentList $args -Wait  
  
   $originalFileSize = (Get-Item $inputFilePath).length  
   $optimizedFileSize = (Get-Item $outputFilePath).length  
  
   #Prepare output  
   $savedBytes = $originalFileSize - $optimizedFileSize  
   $savedPercentage = [math]::Round(100-($optimizedFileSize / $originalFileSize)*100)  
   $message = $inputFilePath + " " + $outputFilePath + " " + $savedBytes + "bytes " + $savedPercentage + "%"  
   Write-Output $message  
} 
