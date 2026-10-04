$utf8 = New-Object System.Text.UTF8Encoding($false, $true)
$file = ".\02_QS_Audit\QS09_Integrity_Chain\03_DORA_Article_30_Evidence_Package.md"

try {
    [void]$utf8.GetString([System.IO.File]::ReadAllBytes((Resolve-Path $file).Path))
    Write-Host "VALID UTF-8" -ForegroundColor Green
} catch {
    Write-Host "INVALID UTF-8" -ForegroundColor Red
}

$content = [System.IO.File]::ReadAllText((Resolve-Path $file).Path, [System.Text.Encoding]::UTF8)

$checks = @(
    "## 1. Purpose",
    "## 2. Regulatory Context",
    "## 3. Evidence Package Structure",
    "## 4. Evidence Categories and Minimum Requirements",
    "## 5. Contractual Clauses",
    "## 6. Vendor Assessment Questionnaire",
    "## 7. Supervisory Reporting",
    "## 8. Relationship to Other Documents",
    "## 9. Non-Mandate Note",
    "## 10. Open Questions",
    "## 11. Status"
)

foreach ($c in $checks) {
    $found = $content.Contains($c)
    $color = if ($found) { "Green" } else { "Red" }
    $status = if ($found) { "OK" } else { "MISS" }
    Write-Host ("  {0,-60} {1}" -f $c, $status) -ForegroundColor $color
}

Write-Host ""
Write-Host "File size: $((Get-Item $file).Length) bytes"
Write-Host ""
Write-Host "Files in QS09_Integrity_Chain folder:"
Get-ChildItem ".\02_QS_Audit\QS09_Integrity_Chain" -File | Select-Object Name, Length | Format-Table -AutoSize