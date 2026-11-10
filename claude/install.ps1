# Windows equivalent of install.sh: link every skill in claude/skills/ into ~/.claude/skills/
# so edits here apply everywhere. Uses directory junctions, which need neither admin rights
# nor Developer Mode (Git Bash's `ln -s` silently copies instead of linking).
#
# Usage:  powershell -ExecutionPolicy Bypass -File claude\install.ps1
$ErrorActionPreference = 'Stop'

$srcDir = Join-Path $PSScriptRoot 'skills'
$destDir = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { Join-Path $env:USERPROFILE '.claude\skills' }
New-Item -ItemType Directory -Force -Path $destDir | Out-Null

foreach ($skill in Get-ChildItem -Path $srcDir -Directory) {
    $name = $skill.Name
    $target = Join-Path $destDir $name
    $item = Get-Item -LiteralPath $target -Force -ErrorAction SilentlyContinue

    if ($item -and $item.LinkType) {
        $current = @($item.Target)[0]
        if ($current -and ($current.TrimEnd('\') -ieq $skill.FullName.TrimEnd('\'))) {
            Write-Output "ok       $name (already linked)"
            continue
        }
        Write-Output "relink   $name"
        # Removes only the link itself, never the folder it points to.
        $item.Delete()
    }
    elseif ($item) {
        Write-Output "skip     $name ($target exists and is not a link - remove it to install)"
        continue
    }
    else {
        Write-Output "link     $name"
    }
    New-Item -ItemType Junction -Path $target -Target $skill.FullName | Out-Null
}
