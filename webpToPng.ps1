Param(      
[Parameter(Mandatory=$true)]      
[string]$folder    
 )      

Write-Output $folder  
    
$files = Get-ChildItem -Path $folder -Recurse -Force -Include *.webp
#Write-Output $files

foreach($inputFile in $files){     
   #Write-Output $inputFile
   #Call dwebp  
   $inputFilePath = $inputFile.FullName  
   $outputFilePath = Split-Path -Path $inputFile.FullName  
   $outputFilePath = $outputFilePath + "\" + [System.IO.Path]::GetFileNameWithoutExtension($inputFilePath) + ".png"  
  
   $args = $inputFilePath + " -o " + $outputFilePath  
  
   Start-Process dwebp -ArgumentList $args -Wait  
  
   $originalFileSize = (Get-Item $inputFilePath).length  
   $optimizedFileSize = (Get-Item $outputFilePath).length  
  
   #Prepare output  
   $savedBytes = $optimizedFileSize - $originalFileSize 
   $savedPercentage = [math]::Round((($optimizedFileSize/$originalFileSize) * 100) - 100)  
   $message = $inputFilePath + " " + $outputFilePath + " " + $savedBytes + "bytes " + $savedPercentage + "%"  
   Write-Output $message
} 
