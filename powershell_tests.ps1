$test = [pscustomobject][ordered]@{
 Matter_Name = "",""
 Key_Words = "test"
 Processes = {3,4},{1,2}
 }

$test.Processes[1]

$userId = "vnelep@traffix.com"
Get-MgUserChat -UserId $userId