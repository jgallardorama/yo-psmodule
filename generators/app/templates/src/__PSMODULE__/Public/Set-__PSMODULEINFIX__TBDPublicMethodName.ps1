function Set-<%= moduleInfix %>TBDPublicMethodName  {
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