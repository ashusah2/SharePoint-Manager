Add-PSSnapin Microsoft.SharePoint.PowerShell -ea 0

<#
    $feature = Get-SPFeature 485f5158-4b8a-453f-9eeb-7b33f5112adf
    $feature.GetTitle([Threading.Thread]::CurrentThread.CurrentCulture).Replace("`"", "`\`"")

    Get-SPFeature | measure
    Get-SPFeature | sort-object -Property Id -Unique | measure
#>

function Write-Features() {
    Get-SPFeature | foreach { 
        $title = $_.GetTitle([Threading.Thread]::CurrentThread.CurrentCulture).Replace("`"", "`\`"")
        Write-Output "            _features.Add(new SPFeature() { Id = new Guid(`"$($_.Id)`"), DisplayName = `"$( $title )`", InternalName = `"$($_.DisplayName)`", Hidden = $($_.Hidden.ToString().ToLower()) });" 
    }
}

Write-Features > Features.cs