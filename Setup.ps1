# Setup symlinks

$mappings = @(
  @{
    source = "$Env:USERPROFILE\Documents\Powershell\"
    dest = "$PWD\PowerShell"
  },
  @{
    source = "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"
    dest = "$PWD\WindowsTerminal"
  },
  @{
    source = "$Env:LocalAppData\nvim\"
    dest = "$PWD\nvim"
  }
)

foreach ($mapping in $mappings) {
  Write-Output "Creating symlink for $($mapping.source) -> $($mapping.dest)"

  if (Test-Path -Path $mapping.source) {
    # Note: I've commented this line out for the blog post, as it's destructive, and I didn't want to risk someone blindly
    # using it and losing their config. Once your config is in Git, you can uncomment this line - but make sure you
    # knowing what you're doing!
    # $(Get-Item $mapping.source).Delete()
  }

  New-Item `
    -ItemType SymbolicLink `
    -Path $mapping.source -Target $mapping.dest
}
