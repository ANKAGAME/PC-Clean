
	$objShell = New-Object -ComObject Shell.Application
	$objFolder = $objShell.Namespace(0xA)
	$WinTemp = "c:\Windows\Temp\*"
	
#1#	Empty Recycle Bin #
	write-Host "Çöptenekesi Boşaltılıyor." -ForegroundColor Cyan 
	$objFolder.items() | %{ remove-item $_.path -Recurse -Confirm:$false}
	
#2# Remove Temp
	write-Host "Temprori Temizleniyor" -ForegroundColor Green
    Set-Location “C:\Windows\Temp”
	Remove-Item * -Recurse -Force -ErrorAction SilentlyContinue

    Set-Location “C:\Windows\Prefetch”
    Remove-Item * -Recurse -Force -ErrorAction SilentlyContinue

    Set-Location “C:\Documents and Settings”
    Remove-Item “.\*\Local Settings\temp\*” -Recurse -Force -ErrorAction SilentlyContinue

    Set-Location “C:\Users”
    Remove-Item “.\*\Appdata\Local\Temp\*” -Recurse -Force -ErrorAction SilentlyContinue
	
#3# Running Disk Clean up Tool 
	write-Host "Son olarak Sistem Gereksiz dosyalar Temizleniyor" -ForegroundColor Cyan
	cleanmgr /sagerun:1 | out-Null 
	
	$([char]7)
	Sleep 3
	write-Host "Termizlem işlemi Bitti " -ForegroundColor Yellow 
	Sleep 3
##### End of the Script ##### 