# Power Shell Scripts
This repository have scripts used in some batch tasks over Windows OS with Power Shell.

## Requirements
- PowerShell v3

## Scripts
This section contains the description and the use for each respective script.

### webToPng
#### Requirement
Google libraries. You can get it from: <https://developers.google.com/speed/webp/download>. Don't forget to set the enviromental variables.

#### Description
This script is used for convert all webp files in a folder and its subfolders to png format.

#### Parameters
- folder

#### Example of Use
```powershell
PS .\webToPng [folder]
```

### pngToWebp
#### Requirement
Google libraries. You can get it from: <https://developers.google.com/speed/webp/download>. Don't forget to set the enviromental variables.

#### Description
This script is used for convert all png files in a folder and its subfolders to webp format.

#### Parameters
- folder

#### Example of Use
```powershell
PS .\pngToWebp [folder]
```

### removeItemsByExtension
#### Requirement
None.

#### Description
This script is used for remove all files in the specified folder and its subfolders given a file extension.

#### Parameters
- folder
- file extension

#### Example of Use
```powershell
PS .\removeItemsByExtension [folder] [file extension]
```

### pingToIPList
#### Requirement
Plain Text File with ip list separated by new line character.

#### Description
This script is used for ping to ip list from text file.

#### Parameters
- file

#### Example of Use
```powershell
PS .\pingToIPList [file]
```

### telnetTest
#### Requirement
Plain Text File with ip list separated by new line character.

#### Description
This script is used for test telnet form a ip list to a specific port user as parameters.

#### Parameters
- file 
- port 
- timeout (optional)

#### Example of Use
```powershell
PS .\telnetTest [file] [port] [timeout]
```

