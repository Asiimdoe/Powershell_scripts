Import-Module Microsoft.Graph.Mail
Connect-MgGraph -Scopes "Mail.Read", "User.Read.All"
$userId = "hokrushko@traffix.com"
$outfile = "C:\Users\Asiimdoe\Documents\Scripts\Retrieve_emails\Tests"
$num = 0
$well 

$messages = Get-MgUserMessage -Top 10 -UserId $userId
$messages.Count
#Start-Sleep -Seconds 5

foreach ($message in $messages)
{
$attachments = Get-MgUserMessageAttachment -UserId $userId -MessageId $message.id 
foreach ($attachment in $attachments) 
{
  if ($attachment.AdditionalProperties["@odata.type"] -eq "#microsoft.graph.fileAttachment" -and $attachment.Name -like "*.*") {
        
        
        # Convert the base64 content back to a physical file
        $Bytes = [System.Convert]::FromBase64String($attachment.AdditionalProperties["contentBytes"])
        $OutputPath = Join-Path $outfile $attachment.Name
        
        [System.IO.File]::WriteAllBytes($OutputPath, $Bytes)
        Write-Host "Saved: $($attachment.Name) from $($message.Subject)"
    }
}

#Get-MgUserMessageContent -UserId $userId -MessageId $message.id -OutFile $outfile\$num
$num++
$message.From.EmailAddress.Name
$message.Subject
}


#Get-MgUserMessageAttachment -All -MessageId Any -UserId $userId