Import-Module Microsoft.Graph.Authentication, Microsoft.Graph.Sites, Microsoft.Graph.Files
Connect-MgGraph -Scopes "Files.ReadWrite.All","Sites.Read.All"

$site  = Get-MgSite -SiteId "traffix.sharepoint.com:/sites/YourSite:"
$drive = Get-MgSiteDrive -SiteId $site.Id | Where-Object Name -eq "Documents"

"test" | Out-File C:\Temp\test.txt
$remote = "Mail Attachments/Matter 1/test.txt"
Set-MgDriveItemContent -DriveId $drive.Id -DriveItemId "root:/${remote}:" -InFile C:\Temp\test.txt