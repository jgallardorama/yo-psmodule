function Get-<%= moduleInfix %>TBDPrivateMethodName {
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
  