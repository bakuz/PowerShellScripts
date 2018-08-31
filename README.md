# Power Shell Scripts
This repository have some scripts used in some batch tasks over windows.

## Requirements
- PowerShell v3

## Scripts
This section contains the description and the use for each respective script.

### webToPng
#### Requirement
Google libraries. You can get it from: <https://developers.google.com/speed/webp/download>. Don't forget to setting the enviromental variables.

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
Google libraries. You can get it from: <https://developers.google.com/speed/webp/download>. Don't forget to setting the enviromental variables.

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
This script is used for remove all files in a folder and its subfolders given a file extention.

#### Parameters
- folder
- file extension

#### Example of Use
```powershell
PS .\removeItemsByExtension [folder] [file extension]
```

