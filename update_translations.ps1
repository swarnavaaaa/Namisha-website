$oldLang = @"
        <i class="fa-solid fa-globe"></i> English <i class="fa-solid fa-chevron-down" style="font-size: 0.6rem;"></i>
"@

$newLang = @"
        <div id="google_translate_element"></div>
"@

$scriptAddition = @"
  <!-- Google Translate Script -->
  <script type="text/javascript">
    function googleTranslateElementInit() {
      new google.translate.TranslateElement({
        pageLanguage: 'en',
        layout: google.translate.TranslateElement.InlineLayout.SIMPLE
      }, 'google_translate_element');
    }
  </script>
  <script type="text/javascript" src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</body>
"@

Get-ChildItem -Filter *.html | ForEach-Object {
    $content = Get-Content -Path $_.FullName -Raw
    
    # Replace the lang-selector contents
    if ($content -match $oldLang) {
        $content = $content.Replace($oldLang, $newLang)
    }

    # Append the Google Translate scripts just before </body> if not already there
    if ($content -notmatch "googleTranslateElementInit") {
        $content = $content.Replace("</body>", $scriptAddition)
    }

    Set-Content -Path $_.FullName -Value $content -Encoding UTF8
}
Write-Output "Translation Widget embedded successfully across all HTML files!"
