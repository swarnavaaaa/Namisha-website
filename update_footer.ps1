$oldFooter = @"
  <!-- Footer -->
  <footer>
    <p>&copy; 2026 The Singular Space. All rights reserved. | Namisha Chamaria</p>
  </footer>
"@

$newFooter = @"
  <!-- Footer -->
  <footer>
    <div class="footer-content">
      <a href="#" class="footer-link">Ethical and Legal Guidelines</a>
      <p class="footer-disclaimer">Updated on 2026. Please understand that with time things may have changed if the website doesn't get updated later for some reason.</p>
      <p class="footer-copyright">&copy; 2026 Namisha Chamaria. All rights reserved.</p>
    </div>
  </footer>
"@

Get-ChildItem -Filter *.html | ForEach-Object {
    $content = Get-Content -Path $_.FullName -Raw
    $content = $content.Replace($oldFooter, $newFooter)
    Set-Content -Path $_.FullName -Value $content -Encoding UTF8
}
Write-Output "Footers updated across all HTML files successfully!"
