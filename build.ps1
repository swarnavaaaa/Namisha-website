$header = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>__TITLE__ | The Singular Space</title>
  <link rel="stylesheet" href="styles.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <meta name="description" content="Namisha Chamaria - Psychoanalytically-oriented Psychotherapy in Mumbai and Online.">
</head>
<body>

  <!-- Navigation -->
  <header>
    <a href="index.html" class="logo-container">
      <img src="logo.png" alt="Logo">
      <div class="logo-text">
        <span class="name">Namisha Chamaria</span>
        <span class="credentials">M.A. Applied Psychology, TISS</span>
      </div>
    </a>
    
    <nav class="desktop-nav">
      <ul>
        <li><a href="index.html" class="__ACT_INDEX__">Home</a></li>
        <li><a href="about.html" class="__ACT_ABOUT__">About</a></li>
        <li><a href="psychotherapy.html" class="__ACT_PSYCH__">Psychotherapy</a></li>
        <li><a href="areas-of-work.html" class="__ACT_AREAS__">Areas of Work</a></li>
        <li><a href="faqs.html" class="__ACT_FAQS__">FAQs</a></li>
        <li><a href="resources.html" class="__ACT_RES__">Resources</a></li>
        <li><a href="contact.html" class="__ACT_CONTACT__">Contact</a></li>
      </ul>
    </nav>

    <div class="nav-actions">
      <a href="#"><i class="fa-brands fa-linkedin"></i></a>
      <a href="#"><i class="fa-solid fa-leaf"></i></a>
      <a href="#"><i class="fa-solid fa-clipboard-list"></i></a>
      <div class="lang-selector" style="font-family: var(--font-body); font-size: 0.85rem; display: flex; align-items: center; gap: 0.3rem;">
        <i class="fa-solid fa-globe"></i> English <i class="fa-solid fa-chevron-down" style="font-size: 0.6rem;"></i>
      </div>
    </div>
  </header>
"@

$footer = @"
  <!-- Footer -->
  <footer>
    <p>&copy; 2026 The Singular Space. All rights reserved. | Namisha Chamaria</p>
  </footer>

</body>
</html>
"@

$pages = @(
    @{ filename="index.html"; title="Home"; content=@"

  <!-- Hero Section -->
  <section class="hero">
    <img src="portrait.png" alt="Namisha Chamaria Portrait" class="hero-img">
    <h1>The Singular Space</h1>
    <div class="subtitle">Psychoanalytically-oriented Psychotherapy &bull; Mumbai &amp; Online</div>
    
    <div class="hero-buttons">
      <a href="contact.html" class="btn btn-primary">Reach Out</a>
      <a href="faqs.html" class="btn btn-secondary">Read FAQs</a>
    </div>
  </section>

  <!-- Below Hero / Main Content -->
  <main class="page-content" style="padding-top: 1rem;">
    <div style="text-align: center; margin-bottom: 4rem;">
      <h4 style="text-transform: uppercase; letter-spacing: 0.15em; color: var(--accent-color); font-size: 0.85rem; font-family: var(--font-body);">The Foundation</h4>
    </div>
    
    <div class="quote-box">
      <h3>"Ensuring an atmosphere of trust, safety, and deep reflection."</h3>
    </div>
  </main>
"@ },
    @{ filename="about.html"; title="About"; content=@"

  <main class="page-content">
    <div class="page-title">
      <h1>About Namisha</h1>
      <div class="divider"></div>
    </div>
    <div class="content-section two-cols">
      <div>
        <p>I am Namisha Chamaria, a psychotherapist based in Mumbai offering both in-person and online sessions. I hold an M.A. in Applied Psychology from the Tata Institute of Social Sciences (TISS).</p>
        <p style="margin-top: 1rem;">My focus lies in creating a containing space for deep reflection and exploration to facilitate long-lasting change.</p>
      </div>
      <div>
         <img src="portrait.png" alt="Namisha" style="width: 100%; border-radius: 12px; border: 4px solid white; box-shadow: 0 10px 30px rgba(0,0,0,0.05);">
      </div>
    </div>
  </main>
"@ },
    @{ filename="psychotherapy.html"; title="Psychotherapy"; content=@"

  <main class="page-content">
    <div class="page-title">
      <h1>Psychoanalytically-oriented Psychotherapy</h1>
      <div class="divider"></div>
    </div>
    <div class="content-section">
      <p>Psychoanalytically-oriented psychotherapy is a deeply relational process. It aims to help individuals understand their unconscious mind, the root causes of their current distress, and unhelpful patterns in their lives.</p>
      <div class="quote-box" style="margin: 2rem auto;">
        <h3>"It is a journey of understanding the unseen narratives that shape our lives."</h3>
      </div>
    </div>
  </main>
"@ },
    @{ filename="areas-of-work.html"; title="Areas of Work"; content=@"

  <main class="page-content">
    <div class="page-title">
      <h1>Areas of Work</h1>
      <div class="divider"></div>
    </div>
    <div class="content-section">
      <ul style="list-style-position: inside; font-size: 1.1rem; color: var(--heading-color); line-height: 2;">
        <li>Anxiety & Distress</li>
        <li>Depression & Mood Fluctuations</li>
        <li>Relationship & Attachment Issues</li>
        <li>Trauma & Grief</li>
        <li>Identity & Self-Worth</li>
      </ul>
    </div>
  </main>
"@ },
    @{ filename="faqs.html"; title="FAQs"; content=@"

  <main class="page-content">
    <div class="page-title">
      <h1>Frequently Asked Questions</h1>
      <div class="divider"></div>
    </div>
    <div class="content-section">
      <div style="margin-bottom: 2rem;">
        <h3 style="margin-bottom: 0.5rem; color: var(--subheading-color);">How long does a session last?</h3>
        <p>A typical session lasts for 50 minutes.</p>
      </div>
      <div style="margin-bottom: 2rem;">
        <h3 style="margin-bottom: 0.5rem; color: var(--subheading-color);">Do you offer online sessions?</h3>
        <p>Yes, I offer both in-person sessions in Mumbai and online sessions.</p>
      </div>
      <div style="margin-bottom: 2rem;">
        <h3 style="margin-bottom: 0.5rem; color: var(--subheading-color);">What is your cancellation policy?</h3>
        <p>Sessions canceled within 24 hours will be charged in full.</p>
      </div>
    </div>
  </main>
"@ },
    @{ filename="resources.html"; title="Resources"; content=@"

  <main class="page-content">
    <div class="page-title">
      <h1>Resources</h1>
      <div class="divider"></div>
    </div>
    <div class="content-section">
      <p>A curated collection of readings, essays, and reflective notes to support your mental health journey.</p>
      <div style="margin-top: 2rem; padding: 2rem; border: 1px dashed var(--accent-color); border-radius: 8px; text-align: center;">
        <p style="color: var(--accent-color);">Articles coming soon.</p>
      </div>
    </div>
  </main>
"@ },
    @{ filename="contact.html"; title="Contact"; content=@"

  <main class="page-content">
    <div class="page-title">
      <h1>Reach Out</h1>
      <div class="divider"></div>
    </div>
    <div class="content-section two-cols">
      <div>
        <h3 style="margin-bottom: 1rem;">Let's Connect</h3>
        <p style="margin-bottom: 1rem;">If you are interested in starting therapy, please feel free to reach out via email or fill out the form.</p>
        <p><strong>Email:</strong> namisha.chamaria@example.com</p>
        <p><strong>Location:</strong> Mumbai & Online</p>
      </div>
      <div>
        <form style="display: flex; flex-direction: column; gap: 1rem; background: white; padding: 2rem; border-radius: 8px; box-shadow: 0 5px 20px rgba(0,0,0,0.05);">
          <input type="text" placeholder="Name" style="padding: 0.8rem; border: 1px solid #ddd; border-radius: 4px; font-family: var(--font-body);">
          <input type="email" placeholder="Email" style="padding: 0.8rem; border: 1px solid #ddd; border-radius: 4px; font-family: var(--font-body);">
          <textarea placeholder="Message" rows="4" style="padding: 0.8rem; border: 1px solid #ddd; border-radius: 4px; font-family: var(--font-body);"></textarea>
          <button type="button" class="btn btn-primary" style="align-self: flex-start;">Send Message</button>
        </form>
      </div>
    </div>
  </main>
"@ }
)

foreach($p in $pages) {
    $h = $header.Replace("__TITLE__", $p.title)
    
    $act_index = if($p.filename -eq "index.html") { "active" } else { "" }
    $act_about = if($p.filename -eq "about.html") { "active" } else { "" }
    $act_psych = if($p.filename -eq "psychotherapy.html") { "active" } else { "" }
    $act_areas = if($p.filename -eq "areas-of-work.html") { "active" } else { "" }
    $act_faqs = if($p.filename -eq "faqs.html") { "active" } else { "" }
    $act_res = if($p.filename -eq "resources.html") { "active" } else { "" }
    $act_contact = if($p.filename -eq "contact.html") { "active" } else { "" }

    $h = $h.Replace("__ACT_INDEX__", $act_index)
    $h = $h.Replace("__ACT_ABOUT__", $act_about)
    $h = $h.Replace("__ACT_PSYCH__", $act_psych)
    $h = $h.Replace("__ACT_AREAS__", $act_areas)
    $h = $h.Replace("__ACT_FAQS__", $act_faqs)
    $h = $h.Replace("__ACT_RES__", $act_res)
    $h = $h.Replace("__ACT_CONTACT__", $act_contact)

    $fullhtml = $h + $p.content + $footer
    Set-Content -Path $p.filename -Value $fullhtml -Encoding UTF8
}

Write-Output "Build complete!"
