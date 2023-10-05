function prompt {
  $loc = $executionContext.SessionState.Path.CurrentLocation;

  $out = ""
  if ($loc.Provider.Name -eq "FileSystem") {
    $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";
  return $out
}
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\clean-detailed.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
    $OnViModeChange = [scriptblock]{
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    }
    else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
    }
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PsReadLineOption -EditMode Vi 
    Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $OnViModeChange
    Set-PSReadlineKeyHandler -Chord Ctrl+n   -Function HistorySearchBackward 
    Set-PSReadlineKeyHandler -Chord Ctrl+p -Function HistorySearchForward 
    Set-PSReadlineKeyHandler -Chord Ctrl+" "   -Function Complete 
    Set-PSReadLineKeyHandler -Chord Ctrl+u    -Function RevertLine
}
