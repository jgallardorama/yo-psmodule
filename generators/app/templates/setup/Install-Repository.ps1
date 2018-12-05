# Extraido de https://blogs.infosupport.com/powershellget-packagemanagement-with-tfs2017/
# https://github.com/PowerShell/PowerShell-Docs/issues/1200


$SourceLocation = "<nuget repository>"
$PublishLocation = $SourceLocation

$reponame = "MyPSGallery"

Register-PSRepository -Name $reponame `
    -SourceLocation $SourceLocation `
    -PublishLocation $PublishLocation `
    -PackageManagementProvider nuget `
    -InstallationPolicy Trusted  


Get-PSRepository