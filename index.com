```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <title>EduTech | Learn. Grow. Succeed.</title>

  <meta
    name="description"
    content="EduTech is a modern education technology platform for online courses, study notes and learning resources."
  />

  <style>
    /* =========================
       GLOBAL STYLES
    ========================== */

    :root {
      --primary: #5b5bf7;
      --primary-dark: #4545d8;
      --secondary: #00b894;
      --dark: #111827;
      --text: #4b5563;
      --light-text: #6b7280;
      --bg: #f8faff;
      --white: #ffffff;
      --border: #e5e7eb;
      --yellow: #fbbf24;
      --danger: #ef4444;
      --shadow: 0 15px 40px rgba(31, 41, 55, 0.08);
      --radius: 18px;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      scroll-behavior: smooth;
    }

    body {
      font-family: "Inter", "Segoe UI", Arial, sans-serif;
      background: var(--bg);
      color: var(--dark);
      line-height: 1.6;
      overflow-x: hidden;
    }

    a {
      text-decoration: none;
      color: inherit;
    }

    ul {
      list-style: none;
    }

    button,
    input {
      font-family: inherit;
    }

    .container {
      width: min(1180px, 92%);
      margin: auto;
    }

    .section {
      padding: 90px 0;
    }

    .section-header {
      text-align: center;
      max-width: 700px;
      margin: 0 auto 50px;
    }

    .section-header span {
      color: var(--primary);
      font-size: 14px;
      font-weight: 800;
      text-transform: uppercase;
      letter-spacing: 1.5px;
    }

    .section-header h2 {
      font-size: clamp(30px, 5vw, 44px);
      margin: 10px 0 15px;
      line-height: 1.15;
    }

    .section-header p {
      color: var(--light-text);
      font-size: 16px;
    }

    .btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      border: none;
      cursor: pointer;
      padding: 13px 22px;
      border-radius: 10px;
      font-weight: 700;
      transition: 0.3s ease;
    }

    .btn-primary {
      background: var(--primary);
      color: white;
      box-shadow: 0 8px 20px rgba(91, 91, 247, 0.25);
    }

    .btn-primary:hover {
      background: var(--primary-dark);
      transform: translateY(-2px);
    }

    .btn-outline {
      background: white;
      border: 1px solid var(--border);
      color: var(--dark);
    }

    .btn-outline:hover {
      border-color: var(--primary);
      color: var(--primary);
    }

    /* =========================
       NAVBAR
    ========================== */

    header {
      position: sticky;
      top: 0;
      z-index: 1000;
      background: rgba(255, 255, 255, 0.92);
      backdrop-filter: blur(15px);
      border-bottom: 1px solid rgba(229, 231, 235, 0.8);
    }

    .navbar {
      height: 74px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .logo {
      display: flex;
      align-items: center;
      gap: 10px;
      font-size: 22px;
      font-weight: 900;
      color: var(--dark);
    }

    .logo-icon {
      width: 40px;
      height: 40px;
      border-radius: 12px;
      display: grid;
      place-items: center;
      color: white;
      background: linear-gradient(135deg, var(--primary), #8b5cf6);
      box-shadow: 0 7px 18px rgba(91, 91, 247, 0.3);
    }

    .logo span {
      color: var(--primary);
    }

    .nav-links {
      display: flex;
      align-items: center;
      gap: 30px;
    }

    .nav-links a {
      color: #374151;
      font-weight: 600;
      font-size: 14px;
      transition: 0.3s;
    }

    .nav-links a:hover {
      color: var(--primary);
    }

    .nav-buttons {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .mobile-menu {
      display: none;
      border: none;
      background: transparent;
      font-size: 25px;
      cursor: pointer;
    }

    /* =========================
       HERO
    ========================== */

    .hero {
      padding: 85px 0 70px;
      position: relative;
      overflow: hidden;
      background:
        radial-gradient(circle at 85% 20%, rgba(91, 91, 247, 0.14), transparent 28%),
        radial-gradient(circle at 5% 80%, rgba(0, 184, 148, 0.10), transparent 25%),
        var(--bg);
    }

    .hero-grid {
      display: grid;
      grid-template-columns: 1.05fr 0.95fr;
      align-items: center;
      gap: 60px;
    }

    .hero-content h1 {
      font-size: clamp(42px, 6vw, 68px);
      line-height: 1.04;
      letter-spacing: -2px;
      margin: 15px 0 20px;
    }

    .hero-content h1 span {
      color: var(--primary);
    }

    .hero-content > p {
      max-width: 580px;
      font-size: 18px;
      color: var(--text);
      margin-bottom: 28px;
    }

    .hero-badge {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 8px 13px;
      border-radius: 30px;
      background: #eeefff;
      color: var(--primary);
      font-size: 13px;
      font-weight: 800;
    }

    .hero-actions {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
    }

    .hero-stats {
      display: flex;
      gap: 35px;
      margin-top: 35px;
    }

    .stat strong {
      display: block;
      font-size: 25px;
    }

    .stat span {
      color: var(--light-text);
      font-size: 13px;
    }

    .hero-visual {
      position: relative;
      min-height: 470px;
    }

    .dashboard {
      width: 100%;
      max-width: 520px;
      margin-left: auto;
      background: white;
      border: 1px solid var(--border);
      border-radius: 25px;
      padding: 22px;
      box-shadow: var(--shadow);
      transform: rotate(1deg);
    }

    .dashboard-top {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .dashboard-top h3 {
      font-size: 18px;
    }

    .avatar {
      width: 38px;
      height: 38px;
      border-radius: 50%;
      display: grid;
      place-items: center;
      background: #e9e9ff;
      color: var(--primary);
      font-weight: bold;
    }

    .progress-box {
      background: #f5f5ff;
      padding: 18px;
      border-radius: 15px;
      margin-bottom: 18px;
    }

    .progress-info {
      display: flex;
      justify-content: space-between;
      font-size: 13px;
      margin-bottom: 9px;
    }

    .progress-bar {
      height: 8px;
      background: #dddfff;
      border-radius: 20px;
      overflow: hidden;
    }

    .progress-fill {
      width: 72%;
      height: 100%;
      background: var(--primary);
      border-radius: inherit;
    }

    .mini-courses {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 12px;
    }

    .mini-card {
      padding: 15px;
      border: 1px solid var(--border);
      border-radius: 15px;
      background: white;
    }

    .mini-icon {
      width: 42px;
      height: 42px;
      border-radius: 12px;
      display: grid;
      place-items: center;
      margin-bottom: 10px;
      font-size: 20px;
      background: #eef2ff;
    }

    .mini-card h4 {
      font-size: 14px;
      margin-bottom: 4px;
    }

    .mini-card p {
      color: var(--light-text);
      font-size: 12px;
    }

    .floating-card {
      position: absolute;
      background: white;
      padding: 15px;
      border-radius: 15px;
      box-shadow: var(--shadow);
      border: 1px solid var(--border);
    }

    .floating-card.one {
      left: -25px;
      bottom: 65px;
    }

    .floating-card.two {
      right: -15px;
      top: 80px;
    }

    .floating-card strong {
      display: block;
      font-size: 16px;
    }

    .floating-card small {
      color: var(--light-text);
    }

    /* =========================
       FEATURES
    ========================== */

    .features {
      background: white;
      padding: 30px 0;
      border-top: 1px solid var(--border);
      border-bottom: 1px solid var(--border);
    }

    .feature-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px;
    }

    .feature {
      display: flex;
      align-items: center;
      gap: 13px;
      padding: 15px;
    }

    .feature-icon {
      min-width: 45px;
      height: 45px;
      display: grid;
      place-items: center;
      background: #eff0ff;
      border-radius: 12px;
      font-size: 20px;
    }

    .feature h4 {
      font-size: 14px;
    }

    .feature p {
      color: var(--light-text);
      font-size: 12px;
    }

    /* =========================
       COURSES
    ========================== */

    .course-toolbar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 20px;
      margin-bottom: 30px;
      flex-wrap: wrap;
    }

    .categories {
      display: flex;
      gap: 8px;
      flex-wrap: wrap;
    }

    .category-btn {
      border: 1px solid var(--border);
      background: white;
      color: var(--text);
      padding: 9px 15px;
      border-radius: 30px;
      cursor: pointer;
      font-weight: 600;
      transition: 0.3s;
    }

    .category-btn.active,
    .category-btn:hover {
      background: var(--primary);
      color: white;
      border-color: var(--primary);
    }

    .search-box {
      position: relative;
    }

    .search-box input {
      width: 230px;
      padding: 11px 15px 11px 40px;
      border: 1px solid var(--border);
      border-radius: 10px;
      outline: none;
      background: white;
    }

    .search-box span {
      position: absolute;
      left: 14px;
      top: 9px;
    }

    .course-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 24px;
    }

    .course-card {
      background: white;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      overflow: hidden;
      transition: 0.3s;
    }

    .course-card:hover {
      transform: translateY(-7px);
      box-shadow: var(--shadow);
    }

    .course-image {
      height: 180px;
      padding: 20px;
      position: relative;
      display: flex;
      align-items: flex-end;
      background: linear-gradient(135deg, #6366f1, #8b5cf6);
      color: white;
    }

    .course-card:nth-child(2) .course-image {
      background: linear-gradient(135deg, #00b894, #00cec9);
    }

    .course-card:nth-child(3) .course-image {
      background: linear-gradient(135deg, #f97316, #ef4444);
    }

    .course-card:nth-child(4) .course-image {
      background: linear-gradient(135deg, #0ea5e9, #2563eb);
    }

    .course-card:nth-child(5) .course-image {
      background: linear-gradient(135deg, #ec4899, #8b5cf6);
    }

    .course-card:nth-child(6) .course-image {
      background: linear-gradient(135deg, #f59e0b, #eab308);
    }

    .course-icon {
      font-size: 55px;
      opacity: 0.9;
    }

    .level {
      position: absolute;
      right: 15px;
      top: 15px;
      background: rgba(255, 255, 255, 0.2);
      backdrop-filter: blur(5px);
      padding: 5px 9px;
      border-radius: 20px;
      font-size: 11px;
      font-weight: 700;
    }

    .course-body {
      padding: 20px;
    }

    .course-meta {
      display: flex;
      justify-content: space-between;
      color: var(--light-text);
      font-size: 12px;
      margin-bottom: 9px;
    }

    .course-body h3 {
      font-size: 18px;
      margin-bottom: 9px;
    }

    .course-body > p {
      color: var(--light-text);
      font-size: 13px;
      margin-bottom: 17px;
    }

    .course-bottom {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding-top: 15px;
      border-top: 1px solid var(--border);
    }

    .rating {
      color: var(--yellow);
      font-size: 13px;
    }

    .price {
      font-weight: 900;
      color: var(--dark);
    }

    /* =========================
       NOTES
    ========================== */

    .notes-section {
      background: white;
    }

    .notes-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 24px;
    }

    .note-card {
      border: 1px solid var(--border);
      border-radius: var(--radius);
      padding: 23px;
      transition: 0.3s;
      background: #fff;
    }

    .note-card:hover {
      transform: translateY(-5px);
      box-shadow: var(--shadow);
    }

    .note-top {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .note-icon {
      width: 50px;
      height: 50px;
      display: grid;
      place-items: center;
      background: #f0f1ff;
      border-radius: 13px;
      font-size: 22px;
    }

    .note-tag {
      color: var(--primary);
      background: #f0f1ff;
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 11px;
      font-weight: 700;
    }

    .note-card h3 {
      font-size: 18px;
      margin-bottom: 8px;
    }

    .note-card p {
      color: var(--light-text);
      font-size: 13px;
      margin-bottom: 20px;
    }

    .note-footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .note-footer span {
      font-size: 12px;
      color: var(--light-text);
    }

    .read-link {
      color: var(--primary);
      font-size: 13px;
      font-weight: 800;
    }

    /* =========================
       CTA
    ========================== */

    .cta {
      padding: 30px 0 90px;
    }

    .cta-box {
      background: linear-gradient(135deg, #4f46e5, #7c3aed);
      color: white;
      border-radius: 25px;
      padding: 55px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 30px;
      overflow: hidden;
      position: relative;
    }

    .cta-box::after {
      content: "";
      width: 250px;
      height: 250px;
      position: absolute;
      right: -80px;
      top: -100px;
      border: 45px solid rgba(255, 255, 255, 0.08);
      border-radius: 50%;
    }

    .cta-box h2 {
      font-size: clamp(28px, 4vw, 40px);
      line-height: 1.15;
      margin-bottom: 10px;
    }

    .cta-box p {
      opacity: 0.85;
      max-width: 600px;
    }

    .cta-box .btn {
      background: white;
      color: var(--primary);
      flex-shrink: 0;
    }

    /* =========================
       FOOTER
    ========================== */

    footer {
      background: #111827;
      color: white;
      padding: 65px 0 25px;
    }

    .footer-grid {
      display: grid;
      grid-template-columns: 1.5fr 1fr 1fr 1fr;
      gap: 40px;
      margin-bottom: 50px;
    }

    .footer-brand p {
      color: #9ca3af;
      max-width: 320px;
      margin-top: 15px;
      font-size: 14px;
    }

    footer .logo {
      color: white;
    }

    footer h4 {
      margin-bottom: 18px;
    }

    footer li {
      margin-bottom: 10px;
    }

    footer li a {
      color: #9ca3af;
      font-size: 14px;
      transition: 0.3s;
    }

    footer li a:hover {
      color: white;
    }

    .footer-bottom {
      border-top: 1px solid #273244;
      padding-top: 20px;
      display: flex;
      justify-content: space-between;
      color: #9ca3af;
      font-size: 12px;
      gap: 20px;
    }

    /* =========================
       MODAL
    ========================== */

    .modal {
      position: fixed;
      inset: 0;
      background: rgba(17, 24, 39, 0.65);
      display: none;
      align-items: center;
      justify-content: center;
      z-index: 2000;
      padding: 20px;
    }

    .modal.active {
      display: flex;
    }

    .modal-content {
      width: min(500px, 100%);
      background: white;
      border-radius: 20px;
      padding: 30px;
      position: relative;
      animation: modalIn 0.3s ease;
    }

    @keyframes modalIn {
      from {
        opacity: 0;
        transform: scale(0.92);
      }
      to {
        opacity: 1;
        transform: scale(1);
      }
    }

    .close-modal {
      position: absolute;
      right: 18px;
      top: 15px;
      border: none;
      background: transparent;
      font-size: 24px;
      cursor: pointer;
    }

    .modal-content h2 {
      margin-bottom: 10px;
    }

    .modal-content p {
      color: var(--light-text);
      margin-bottom: 20px;
    }

    /* =========================
       RESPONSIVE DESIGN
    ========================== */

    @media (max-width: 1000px) {
      .hero-grid {
        grid-template-columns: 1fr;
      }

      .hero-content {
        text-align: center;
      }

      .hero-content > p {
        margin-left: auto;
        margin-right: auto;
      }

      .hero-actions,
      .hero-stats {
        justify-content: center;
      }

      .hero-visual {
        width: min(600px, 100%);
        margin: auto;
      }

      .feature-grid {
        grid-template-columns: repeat(2, 1fr);
      }

      .course-grid,
      .notes-grid {
        grid-template-columns: repeat(2, 1fr);
      }

      .footer-grid {
        grid-template-columns: repeat(2, 1fr);
      }
    }

    @media (max-width: 760px) {
      .navbar {
        height: 68px;
      }

      .mobile-menu {
        display: block;
      }

      .nav-links,
      .nav-buttons {
        display: none;
      }

      .nav-links.mobile-active {
        display: flex;
        position: absolute;
        top: 68px;
        left: 0;
        width: 100%;
        padding: 20px;
        background: white;
        flex-direction: column;
        align-items: flex-start;
        border-bottom: 1px solid var(--border);
        box-shadow: var(--shadow);
      }

      .hero {
        padding-top: 60px;
      }

      .hero-content h1 {
        letter-spacing: -1px;
      }

      .hero-stats {
        gap: 20px;
      }

      .floating-card.one {
        left: 0;
      }

      .floating-card.two {
        right: 0;
      }

      .course-grid,
      .notes-grid {
        grid-template-columns: 1fr;
      }

      .course-toolbar {
        align-items: stretch;
      }

      .search-box input {
        width: 100%;
      }

      .search-box {
        width: 100%;
      }

      .cta-box {
        padding: 35px 25px;
        flex-direction: column;
        align-items: flex-start;
      }

      .footer-grid {
        grid-template-columns: 1fr;
      }

      .footer-bottom {
        flex-direction: column;
      }
    }

    @media (max-width: 480px) {
      .section {
        padding: 65px 0;
      }

      .feature-grid {
        grid-template-columns: 1fr;
      }

      .hero-visual {
        min-height: 390px;
      }

      .dashboard {
        padding: 15px;
      }

      .floating-card {
        padding: 10px;
      }

      .floating-card.one {
        bottom: 30px;
      }

      .floating-card.two {
        top: 30px;
      }

      .mini-courses {
        gap: 7px;
      }

      .mini-card {
        padding: 10px;
      }

      .hero-stats {
        flex-wrap: wrap;
      }
    }
  </style>
</head>

<body>

  <!-- =========================
       NAVIGATION
  ========================== -->

  <header>
    <div class="container navbar">

      <a href="#home" class="logo">
        <div class="logo-icon">E</div>
        Edu<span>Tech</span>
      </a>

      <nav class="nav-links" id="navLinks">
        <a href="#home">Home</a>
        <a href="#courses">Courses</a>
        <a href="#notes">Notes</a>
        <a href="#about">About</a>
        <a href="#contact">Contact</a>
      </nav>

      <div class="nav-buttons">
        <button class="btn btn-outline" onclick="openModal('login')">
          Login
        </button>
        <button class="btn btn-primary" onclick="openModal('signup')">
          Get Started
        </button>
      </div>

      <button class="mobile-menu" id="mobileMenu" aria-label="Open menu">
        ☰
      </button>

    </div>
  </header>


  <!-- =========================
       HERO
  ========================== -->

  <main>

    <section class="hero" id="home">
      <div class="container hero-grid">

        <div class="hero-content">

          <div class="hero-badge">
            ✨ Learn smarter, not harder
          </div>

          <h1>
            Build Your Future With
            <span>Better Learning.</span>
          </h1>

          <p>
            Learn practical skills from expert instructors, access
            high-quality study notes, and build the knowledge you need
            to succeed in your career.
          </p>

          <div class="hero-actions">
            <a href="#courses" class="btn btn-primary">
              Explore Courses →
            </a>

            <a href="#notes" class="btn btn-outline">
              Browse Notes
            </a>
          </div>

          <div class="hero-stats">
            <div class="stat">
              <strong>50K+</strong>
              <span>Active Learners</span>
            </div>

            <div class="stat">
              <strong>120+</strong>
              <span>Expert Courses</span>
            </div>

            <div class="stat">
              <strong>4.9/5</strong>
              <span>Learner Rating</span>
            </div>
          </div>

        </div>


        <div class="hero-visual">

          <div class="dashboard">

            <div class="dashboard-top">
              <h3>My Learning Dashboard</h3>
              <div class="avatar">A</div>
            </div>

            <div class="progress-box">
              <div class="progress-info">
                <strong>Web Development</strong>
                <span>72%</span>
              </div>

              <div class="progress-bar">
                <div class="progress-fill"></div>
              </div>
            </div>

            <div class="mini-courses">

              <div class="mini-card">
                <div class="mini-icon">💻</div>
                <h4>HTML & CSS</h4>
                <p>18 lessons</p>
              </div>

              <div class="mini-card">
                <div class="mini-icon">⚡</div>
                <h4>JavaScript</h4>
                <p>24 lessons</p>
              </div>

              <div class="mini-card">
                <div class="mini-icon">🎨</div>
                <h4>UI/UX Design</h4>
                <p>16 lessons</p>
              </div>

              <div class="mini-card">
                <div class="mini-icon">📊</div>
                <h4>Data Science</h4>
                <p>21 lessons</p>
              </div>

            </div>
          </div>

          <div class="floating-card one">
            <strong>🎯 87% Goal Progress</strong>
            <small>Keep learning!</small>
          </div>

          <div class="floating-card two">
            <strong>🔥 12 Day Streak</strong>
            <small>You're doing great!</small>
          </div>

        </div>

      </div>
    </section>


    <!-- =========================
         FEATURES
    ========================== -->

    <section class="features">
      <div class="container feature-grid">

        <div class="feature">
          <div class="feature-icon">🎓</div>
          <div>
            <h4>Expert Instructors</h4>
            <p>Learn from professionals</p>
          </div>
        </div>

        <div class="feature">
          <div class="feature-icon">📚</div>
          <div>
            <h4>Quality Resources</h4>
            <p>Curated learning materials</p>
          </div>
        </div>

        <div class="feature">
          <div class="feature-icon">📱</div>
          <div>
            <h4>Learn Anywhere</h4>
            <p>Fully responsive platform</p>
          </div>
        </div>

        <div class="feature">
          <div class="feature-icon">🏆</div>
          <div>
            <h4>Certificates</h4>
            <p>Showcase your skills</p>
          </div>
        </div>

      </div>
    </section>


    <!-- =========================
         COURSES
    ========================== -->

    <section class="section" id="courses">

      <div class="container">

        <div class="section-header">
          <span>Popular Courses</span>
          <h2>Learn Skills That Matter</h2>
          <p>
            Explore our carefully designed courses and learn practical
            skills that can help you grow professionally.
          </p>
        </div>

        <div class="course-toolbar">

          <div class="categories">
            <button class="category-btn active" data-category="all">
              All
            </button>

            <button class="category-btn" data-category="development">
              Development
            </button>

            <button class="category-btn" data-category="design">
              Design
            </button>

            <button class="category-btn" data-category="business">
              Business
            </button>

            <button class="category-btn" data-category="data">
              Data
            </button>
          </div>

          <div class="search-box">
            <span>🔍</span>
            <input
              type="text"
              id="courseSearch"
              placeholder="Search courses..."
            />
          </div>

        </div>


        <div class="course-grid" id="courseGrid">

          <!-- Course 1 -->
          <article class="course-card" data-category="development">
            <div class="course-image">
              <div class="course-icon">💻</div>
              <div class="level">Beginner</div>
            </div>

            <div class="course-body">
              <div class="course-meta">
                <span>Development</span>
                <span>8 Weeks</span>
              </div>

              <h3>Full Stack Web Development</h3>

              <p>
                Learn HTML, CSS, JavaScript and modern web development
                from the ground up.
              </p>

              <div class="course-bottom">
                <span class="rating">★★★★★ 4.9</span>
                <span class="price">Free</span>
              </div>
            </div>
          </article>


          <!-- Course 2 -->
          <article class="course-card" data-category="design">
            <div class="course-image">
              <div class="course-icon">🎨</div>
              <div class="level">Intermediate</div>
            </div>

            <div class="course-body">
              <div class="course-meta">
                <span>Design</span>
                <span>6 Weeks</span>
              </div>

              <h3>UI/UX Design Masterclass</h3>

              <p>
                Understand user experience, wireframing, visual design
                and modern design systems.
              </p>

              <div class="course-bottom">
                <span class="rating">★★★★★ 4.8</span>
                <span class="price">$39</span>
              </div>
            </div>
          </article>


          <!-- Course 3 -->
          <article class="course-card" data-category="business">
            <div class="course-image">
              <div class="course-icon">📈</div>
              <div class="level">Beginner</div>
            </div>

            <div class="course-body">
              <div class="course-meta">
                <span>Business</span>
                <span>5 Weeks</span>
              </div>

              <h3>Digital Marketing Essentials</h3>

              <p>
                Master social media, SEO, content marketing and digital
                growth strategies.
              </p>

              <div class="course-bottom">
                <span class="rating">★★★★★ 4.7</span>
                <span class="price">$29</span>
              </div>
            </div>
          </article>


          <!-- Course 4 -->
          <article class="course-card" data-category="development">
            <div class="course-image">
              <div class="course-icon">⚡</div>
              <div class="level">Intermediate</div>
            </div>

            <div class="course-body">
              <div class="course-meta">
                <span>Development</span>
                <span>7 Weeks</span>
              </div>

              <h3>Modern JavaScript</h3>

              <p>
                Build interactive web applications using modern
                JavaScript concepts.
              </p>

              <div class="course-bottom">
                <span class="rating">★★★★★ 4.9</span>
                <span class="price">$35</span>
              </div>
            </div>
          </article>


          <!-- Course 5 -->
          <article class="course-card" data-category="data">
            <div class="course-image">
              <div class="course-icon">📊</div>
              <div class="level">Intermediate</div>
            </div>

            <div class="course-body">
              <div class="course-meta">
                <span>Data</span>
                <span>10 Weeks</span>
              </div>

              <h3>Data Science Fundamentals</h3>

              <p>
                Learn data analysis, visualization, statistics and
                essential machine learning concepts.
              </p>

              <div class="course-bottom">
                <span class="rating">★★★★★ 4.8</span>
                <span class="price">$49</span>
              </div>
            </div>
          </article>


          <!-- Course 6 -->
          <article class="course-card" data-category="business">
            <div class="course-image">
              <div class="course-icon">💼</div>
              <div class="level">Beginner</div>
            </div>

            <div class="course-body">
              <div class="course-meta">
                <span>Business</span>
                <span>4 Weeks</span>
              </div>

              <h3>Entrepreneurship Basics</h3>

              <p>
                Turn your ideas into actionable business plans and
                understand the fundamentals of entrepreneurship.
              </p>

              <div class="course-bottom">
                <span class="rating">★★★★★ 4.7</span>
                <span class="price">Free</span>
              </div>
            </div>
          </article>

        </div>

      </div>
    </section>


    <!-- =========================
         NOTES
    ========================== -->

    <section class="section notes-section" id="notes">

      <div class="container">

        <div class="section-header">
          <span>Study Resources</span>
          <h2>Smart Notes for Faster Learning</h2>
          <p>
            Access concise notes, revision materials and important
            concepts whenever you need them.
          </p>
        </div>


        <div class="notes-grid">

          <article class="note-card">

            <div class="note-top">
              <div class="note-icon">📘</div>
              <span class="note-tag">Web Dev</span>
            </div>

            <h3>HTML & CSS Quick Notes</h3>

            <p>
              Essential HTML tags, CSS properties, layouts, flexbox,
              grid and responsive design concepts.
            </p>

            <div class="note-footer">
              <span>12 Pages</span>
              <a href="#" class="read-link" onclick="openNote(event, 'HTML & CSS Quick Notes')">
                Read Notes →
              </a>
            </div>

          </article>


          <article class="note-card">

            <div class="note-top">
              <div class="note-icon">⚡</div>
              <span class="note-tag">JavaScript</span>
            </div>

            <h3>JavaScript Revision Guide</h3>

            <p>
              Variables, functions, arrays, objects, DOM manipulation,
              events and modern JavaScript concepts.
            </p>

            <div class="note-footer">
              <span>18 Pages</span>
              <a href="#" class="read-link" onclick="openNote(event, 'JavaScript Revision Guide')">
                Read Notes →
              </a>
            </div>

          </article>


          <article class="note-card">

            <div class="note-top">
              <div class="note-icon">📊</div>
              <span class="note-tag">Data</span>
            </div>

            <h3>Data Science Fundamentals</h3>

            <p>
              Statistics, data analysis, visualization and introductory
              machine learning concepts.
            </p>

            <div class="note-footer">
              <span>20 Pages</span>
              <a href="#" class="read-link" onclick="openNote(event, 'Data Science Fundamentals')">
                Read Notes →
              </a>
            </div>

          </article>


          <article class="note-card">

            <div class="note-top">
              <div class="note-icon">🎨</div>
              <span class="note-tag">Design</span>
            </div>

            <h3>UI/UX Design Notes</h3>

            <p>
              Learn design principles, typography, colors, user flows,
              wireframes and usability.
            </p>

            <div class="note-footer">
              <span>15 Pages</span>
              <a href="#" class="read-link" onclick="openNote(event, 'UI/UX Design Notes')">
                Read Notes →
              </a>
            </div>

          </article>


          <article class="note-card">

            <div class="note-top">
              <div class="note-icon">📣</div>
              <span class="note-tag">Marketing</span>
            </div>

            <h3>Digital Marketing Notes</h3>

            <p>
              SEO, social media marketing, content strategy, email
              marketing and analytics.
            </p>

            <div class="note-footer">
              <span>14 Pages</span>
              <a href="#" class="read-link" onclick="openNote(event, 'Digital Marketing Notes')">
                Read Notes →
              </a>
            </div>

          </article>


          <article class="note-card">

            <div class="note-top">
              <div class="note-icon">💼</div>
              <span class="note-tag">Business</span>
            </div>

            <h3>Entrepreneurship Notes</h3>

            <p>
              Business ideas, market research, business models,
              planning and startup fundamentals.
            </p>

            <div class="note-footer">
              <span>10 Pages</span>
              <a href="#" class="read-link" onclick="openNote(event, 'Entrepreneurship Notes')">
                Read Notes →
              </a>
            </div>

          </article>

        </div>

      </div>
    </section>


    <!-- =========================
         CTA
    ========================== -->

    <section class="cta" id="about">

      <div class="container">

        <div class="cta-box">

          <div>
            <h2>Ready to Start Learning?</h2>
            <p>
              Join thousands of learners building valuable skills
              and creating better opportunities.
            </p>
          </div>

          <button class="btn" onclick="openModal('signup')">
            Start Learning →
          </button>

        </div>

      </div>

    </section>

  </main>


  <!-- =========================
       FOOTER
  ========================== -->

  <footer id="contact">

    <div class="container">

      <div class="footer-grid">

        <div class="footer-brand">

          <a href="#home" class="logo">
            <div class="logo-icon">E</div>
            Edu<span>Tech</span>
          </a>

          <p>
            A modern learning platform designed to make quality
            education simple, accessible and engaging.
          </p>

        </div>


        <div>
          <h4>Platform</h4>

          <ul>
            <li><a href="#courses">Courses</a></li>
            <li><a href="#notes">Study Notes</a></li>
            <li><a href="#about">About Us</a></li>
            <li><a href="#">Certificates</a></li>
          </ul>
        </div>


        <div>
          <h4>Resources</h4>

          <ul>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Learning Guide</a></li>
            <li><a href="#">Help Center</a></li>
            <li><a href="#">Community</a></li>
          </ul>
        </div>


        <div>
          <h4>Connect</h4>

          <ul>
            <li><a href="#">Instagram</a></li>
            <li><a href="#">LinkedIn</a></li>
            <li><a href="#">YouTube</a></li>
            <li><a href="#">Twitter / X</a></li>
          </ul>
        </div>

      </div>


      <div class="footer-bottom">
        <span>© 2026 EduTech. All rights reserved.</span>
        <span>Made for learners 🚀</span>
      </div>

    </div>

  </footer>


  <!-- =========================
       MODAL
  ========================== -->

  <div class="modal" id="modal">

    <div class="modal-content">

      <button class="close-modal" onclick="closeModal()">
        ×
      </button>

      <h2 id="modalTitle">Welcome to EduTech</h2>

      <p id="modalText">
        Start your learning journey today.
      </p>

      <button class="btn btn-primary" onclick="closeModal()">
        Continue
      </button>

    </div>

  </div>


  <!-- =========================
       JAVASCRIPT
  ========================== -->

  <script>

    /* =========================
       MOBILE NAVIGATION
    ========================== */

    const mobileMenu = document.getElementById("mobileMenu");
    const navLinks = document.getElementById("navLinks");

    mobileMenu.addEventListener("click", () => {
      navLinks.classList.toggle("mobile-active");

      mobileMenu.textContent =
        navLinks.classList.contains("mobile-active")
          ? "✕"
          : "☰";
    });


    /* Close mobile menu after clicking link */

    document.querySelectorAll(".nav-links a").forEach(link => {

      link.addEventListener("click", () => {

        navLinks.classList.remove("mobile-active");
        mobileMenu.textContent = "☰";

      });

    });


    /* =========================
       COURSE FILTERING
    ========================== */

    const categoryButtons =
      document.querySelectorAll(".category-btn");

    const courseCards =
      document.querySelectorAll(".course-card");

    const searchInput =
      document.getElementById("courseSearch");


    let selectedCategory = "all";


    categoryButtons.forEach(button => {

      button.addEventListener("click", () => {

        categoryButtons.forEach(btn =>
          btn.classList.remove("active")
        );

        button.classList.add("active");

        selectedCategory =
          button.dataset.category;

        filterCourses();

      });

    });


    searchInput.addEventListener("input", filterCourses);


    function filterCourses() {

      const searchTerm =
        searchInput.value.toLowerCase().trim();

      courseCards.forEach(card => {

        const category =
          card.dataset.category;

        const title =
          card.querySelector("h3")
            .textContent
            .toLowerCase();

        const description =
          card.querySelector("p")
            .textContent
            .toLowerCase();

        const categoryMatch =
          selectedCategory === "all" ||
          category === selectedCategory;

        const searchMatch =
          title.includes(searchTerm) ||
          description.includes(searchTerm);

        if (categoryMatch && searchMatch) {
          card.style.display = "";
        } else {
          card.style.display = "none";
        }

      });

    }


    /* =========================
       MODAL
    ========================== */

    const modal =
      document.getElementById("modal");

    const modalTitle =
      document.getElementById("modalTitle");

    const modalText =
      document.getElementById("modalText");


    function openModal(type) {

      if (type === "login") {

        modalTitle.textContent =
          "Welcome Back! 👋";

        modalText.textContent =
          "Login functionality can be connected to your backend or authentication service.";

      } else {

        modalTitle.textContent =
          "Start Learning Today 🚀";

        modalText.textContent =
          "Create your EduTech account and start exploring courses and study resources.";

      }

      modal.classList.add("active");

    }


    function closeModal() {
      modal.classList.remove("active");
    }


    modal.addEventListener("click", event => {

      if (event.target === modal) {
        closeModal();
      }

    });


    /* =========================
       NOTES
    ========================== */

    function openNote(event, noteName) {

      event.preventDefault();

      modalTitle.textContent =
        noteName;

      modalText.textContent =
        "This demo note viewer can be connected to PDF files, database content, or a dedicated notes page.";

      modal.classList.add("active");

    }


    /* =========================
       ESCAPE KEY
    ========================== */

    document.addEventListener("keydown", event => {

      if (event.key === "Escape") {
        closeModal();
      }

    });

  </script>

</body>
</html>
```
