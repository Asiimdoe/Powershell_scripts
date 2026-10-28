Import-Module Microsoft.Graph.Mail
Connect-MgGraph -Scopes "Mail.Read", "User.Read.All"
$userId = "hokrushko@traffix.com"
$outfile = "C:\Users\Asiimdoe\Documents\Scripts\Retrieve_emails\Tests"
$num = 0

$messages = Get-MgUserMessage -All -UserId $userId -Property id
$messages.Count
#Start-Sleep -Seconds 5

foreach ($message in $messages)
{
$attachments = Get-MgUserMessageAttachment -UserId $userId -MessageId $message.id 
foreach ($attachment in $attachments) 
{
  if ($attachment.AdditionalProperties["@odata.type"] -eq "#microsoft.graph.fileAttachment" -and $attachment.Name -like "*.*") {
       
        #convert from base64 to readable
        $Bytes = [System.Convert]::FromBase64String($attachment.AdditionalProperties["contentBytes"])
        $OutputPath = "$($outfile)\$($num)_$($attachment.Name)"
        
        [System.IO.File]::WriteAllBytes($OutputPath, $Bytes)
        Write-Host "Saved: $($attachment.Name) from $($message.Subject)"
    }
}

$num++
$message.From.EmailAddress.Name
$message.Subject
}
