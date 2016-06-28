Add-PsSnapin Microsoft.SharePoint.PowerShell
Start-SPAssignment -Global
 $siteAddress = "Your Site Here"
 $web = Get-SPWeb $siteAddress

 $spList = $web.Lists["Your List Here"]
 $listItems = $spList.GetItems()
 foreach ($item in $listItems)
 {
 	$url = $siteAddress + $item.File.Url
 	$file = $web.GetFile($url)
 	
			$f = $file.Item
 			$f["Name"] = "[ARCHIVE]-" + $f["Name"]
			$f.SystemUpdate()
 	
 }
 $web.dispose()
Stop-SPAssignment -Global