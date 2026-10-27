$Matter_Name= @{

1 = "FLS v. TRAFFIX"

}
Import-Module Microsoft.Graph.Mail
Connect-MgGraph -Scopes "Mail.Read", "User.Read.All"
$userId = "hokrushko@traffix.com"
$outfile = "C:\Users\Asiimdoe\Documents\Scripts\Retrieve_emails\Tests"
$num = 0

"TEST"
Get-MgUserMessage -Top 10000 -UserId $userId | Format-List *
"Test is over"
$messages = Get-MgUserMessage -Top 50 -UserId $userId 

foreach ($message in $messages)
{
Get-MgUserMessageAttachment -UserId $userId -MessageId $message.id -All
$num++
$message.From.EmailAddress.Name
$message.Subject
}


#Get-MgUserMessageAttachment -All -MessageId Any -UserId $userId
#Connect-MgGraph -Scopes "Mail.Read"

#Find-MgGraphCommand -Command Get-Attachment