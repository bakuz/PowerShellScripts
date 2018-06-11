Param(      
[Parameter(Mandatory=$true)]      
[string]$folder,

[Parameter(Mandatory=$true)]      
[string]$file_Extension #Ex: png ; xml; etc.
 )      

Write-Output $folder
$file_Extension = "*." + $file_Extension
Write-Output $file_Extension
    
$files = Get-ChildItem -Path $folder -Recurse -Force -Include $file_Extension
#Write-Output $files

foreach($inputFile in $files){     
   #Write-Output $inputFile
   $message = $inputFile.FullName + "has been removed..."  
   Remove-Item $inputFile.FullName   
   Write-Output $message 
} 
