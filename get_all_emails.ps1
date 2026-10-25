Import-Module Microsoft.Graph.Mail
Connect-MgGraph -Scopes "Mail.Read", "User.Read.All"
$userId = "hokrushko@traffix.com"

$message = Get-MgUserMessage -UserId $userId -MessageId "AAMkADAyNGIzMzYzLTJkMTUtNGJlOC1hYjMwLWU4ODdiZGE4MWVkOQBGAAAAAACdXaJBTjyCQ4y7I9KV8MWBBwBtBwi9D4XITqOxOUsKJWcLAAAAAAEPAABtBwi9D4XITqOxOUsKJWcLAAGV3EUTAAA="

"test"
Select-Object $message 
"test"

$message | Format-List *

$message.From
1
2
$message.From.EmailAddress.Name
2
3
$message.ToRecipients
3
#Get-MgUserMessageAttachment -All -MessageId Any -UserId $userId