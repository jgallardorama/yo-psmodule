function Get-__PSMODULEINFIX__TBDPublicMethodName {
  [cmdletbinding()]
  Param (
    [parameter(ValueFromPipeline = $True)]
    [string]$Name)
   
  Begin {

  }
  Process {
    write-verbose $Name
  }
  End {

  }
}