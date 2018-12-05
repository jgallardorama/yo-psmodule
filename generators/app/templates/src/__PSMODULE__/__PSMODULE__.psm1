#Get public and private function definition files.
$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )

$Scripts = @($Public + $Private)

$Scripts = $Scripts | Where-Object { $_ -notlike "*\Scripts\*"}

#Dot source the files
Foreach ($import in $Scripts) {    
    Try {
        Write-Verbose "> Importing: <$($import.fullname)>"
        . $import.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# Here I might...
# Read in or create an initial config file and variable
# Export Public functions ($Public.BaseName) for WIP modules
# Set variables visible to the module and its functions only

Foreach ($export in $Public) {
    Write-Verbose "> Exporting: <$($export.Basename)>"
    Export-ModuleMember -Function $export.Basename
}
