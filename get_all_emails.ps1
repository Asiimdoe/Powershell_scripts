Import-Module Microsoft.Graph.Mail
Connect-MgGraph -Scopes "Mail.Read"
$userId = "hokrushko@traffix.com"

Get-MgUserMessage -All -UserId $userId -Property "sender,subject"