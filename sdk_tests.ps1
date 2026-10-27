Import-Module Microsoft.Graph.Mail
Connect-MgGraph -Scopes "Mail.Read", "User.Read.All"
$userId = "hokrushko@traffix.com"
$outfile = "C:\Users\Asiimdoe\Documents\Scripts\Retrieve_emails\Tests"
$num = 0
$well 

"TEST"
#Get-MgUserMessage -Top 1000 -UserId $userId 
"Test is over"

$messages = Get-MgUserMessage -Top 100000 -UserId $userId
$messages.Count
Start-Sleep -Seconds 10
foreach ($message in $messages)
{
Get-MgUserMessageAttachment -UserId $userId -MessageId $message.id 
Get-MgUserMessageContent -UserId $userId -MessageId $message.id -OutFile $outfile\$num
$num++
$message.From.EmailAddress.Name
$message.Subject

}


#Get-MgUserMessageAttachment -All -MessageId Any -UserId $userId