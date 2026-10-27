Import-Module Microsoft.Graph.Mail
Connect-MgGraph -Scopes "Mail.Read", "User.Read.All"
$userId = "hokrushko@traffix.com"
$outfile = "C:\Users\Asiimdoe\Documents\Scripts\Retrieve_emails\Tests"
$num = 0

$messages = Get-MgUserMessage -Top 50 -UserId $userId

foreach ($message in $messages)
{
Get-MgUserMessageAttachment -UserId $userId -MessageId $message.id -All
$num++
$message.From.EmailAddress.Name
$message.Subject
}


#Get-MgUserMessageAttachment -All -MessageId Any -UserId $userId