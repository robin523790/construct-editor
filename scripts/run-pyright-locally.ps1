# Simpler wrapper, da PyCharm sich etwas anstellt, wenn man kein Skript hat.
# PowerShell, damit es auch unter Linux funktionieren würde.
$ErrorActionPreference = "Stop"
./.venv/Scripts/activate.ps1

Write-Host("Running ruff check --show-fixes ...")
ruff check --show-fixes
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

Write-Host("")
Write-Host("Running ty check ...")
ty check
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

Write-Host("")
Write-Host("Running PyRight...")
npm exec --yes '--' pyright@1.1.408 @args
exit $LASTEXITCODE
