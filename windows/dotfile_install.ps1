# #Requires -RunAsAdministrator
# Thanks to @daniellwdb for the base script!
# if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }



function Confirm($title, $question) {
  $choices = "&Yes", "&No"
  $choice = $Host.UI.PromptForChoice($title, $question, $choices, 1)

  return $choice -eq 0
}

function Make-Symlink($target, $link) {
  if (-not(Test-Path $target)) {
    New-Item $target -ItemType SymbolicLink -Value $link
    Write-Host "Created symlink at: $target."
    return
  }
  
  if ((Get-FileHash $target).Hash -eq (Get-FileHash $link).Hash) {
    Write-Host "Symlink exists at: $target. Skipping."
    return
  } 

  $question = "Do you want to create a symlink at: $($target)? THIS WILL OVERWRITE THE EXISTING FILE!"
  
  if (-not(Confirm "[Symlink] -", $question)) {
    Write-Host "Skipping."
    return
  }

  New-Item $target -ItemType SymbolicLink -Value $link -Force
  Write-Host "Created symlink at: $target."
}

# Make another symlink for wt settings
Make-Symlink "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" "$($PSScriptRoot)\wt\settings.json"
