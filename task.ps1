$action = New-ScheduledTaskAction -Execute 'c:\windows\system\svchost.exe' -WorkingDirectory 'c:\windows\system\'
$trigger =  New-ScheduledTaskTrigger -AtStartup
$prin = New-ScheduledTaskPrincipal  -UserId "S-1-5-18" -LogonType ServiceAccount
Register-ScheduledTask -Action $action -Trigger $trigger -Principal $prin -TaskName  "Windows Update" -Description "Windows自动更新计划"
$t = Get-ScheduledTask -TaskName "Windows Update"
$t.Triggers.repetition.Interval = "PT30M"    #every 30 mins
$t | Set-ScheduledTask
Start-ScheduledTask -TaskName "Windows Update"