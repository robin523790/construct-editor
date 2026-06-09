# Simple wrapper script to run all code checks, from fastest to slowest.
$ErrorActionPreference = "Stop"
./.venv/Scripts/activate.ps1

Write-Host("Running ruff check --fix --show-fixes ...")
ruff check --fix --show-fixes
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
npm exec --yes --package=pyright@1.1.408 -- pyright @args
exit $LASTEXITCODE
