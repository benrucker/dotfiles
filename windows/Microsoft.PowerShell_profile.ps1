Set-Alias -Name g -Value git

function prompt 
{
	$time = (Get-Date).ToShortTimeString() -replace " ", ""
  
  $currentPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path -replace [regex]::Escape($HOME + "\"), "~"


  $esc = [char]27


	$prompt = "$esc[32m$time$esc[38;5;14m $currentPath$esc[39m > "
	$prompt
}