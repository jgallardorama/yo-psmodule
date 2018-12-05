[CmdletBinding()]
param (
        
)
    
begin {
}
    
process {
    $nugetApiKey = Get-Content -Path "nugetApiKey.txt"

    Publish-Module -Name ..\src\<%= moduleName %>\<%= moduleName %>.psd1 -Repository MyPSGallery -Verbose -NuGetApiKey $nugetApiKey
}
    
end {
}


