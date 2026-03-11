$oldLink = '<a href="#" class="footer-link">Ethical and Legal Guidelines</a>'
$newLink = '<a href="ethical-guidelines.html" class="footer-link">Ethical and Legal Guidelines</a>'

Get-ChildItem -Filter *.html | ForEach-Object {
    $content = Get-Content -Path $_.FullName -Raw
    $content = $content.Replace($oldLink, $newLink)
    Set-Content -Path $_.FullName -Value $content -Encoding UTF8
}
Write-Output "Footer links updated successfully!"
