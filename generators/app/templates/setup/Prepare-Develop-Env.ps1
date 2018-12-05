

$thisScriptPath = $PSScriptRoot

$moduleDir = Join-Path -Path $thisScriptPath -ChildPath ..\src

$env:PSModulePath = $env:PSModulePath + ";" + $moduleDir

$env:PSModulePath -Split ";"