<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Digital Aesthetic Profile</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
:root{
  --bg:#0b0e1a;
  --card:rgba(255,255,255,.08);
  --text:#f8fafc;
  --muted:#94a3b8;
  --accent:#a78bfa;
  --border:rgba(255,255,255,.18);
}

.light{
  --bg:#f8fafc;
  --card:rgba(0,0,0,.05);
  --text:#0b0e1a;
  --muted:#475569;
  --border:rgba(0,0,0,.1);
}

*{
  margin:0;
  padding:0;
  box-sizing:border-box;
  font-family:'Inter',sans-serif;
}

body{
  background:var(--bg);
  color:var(--text);
  scroll-behavior:smooth;
  transition:.4s;
  overflow-x:hidden;
}

/* VIDEO BACKGROUND */
.video-bg{
  position:fixed;
  inset:0;
  z-index:-2;
}

.video-bg video{
  width:100%;
  height:100%;
  object-fit:cover;
}

.video-overlay{
  position:absolute;
  inset:0;
  background:linear-gradient(
    to bottom,
    rgba(10,10,20,.7),
    rgba(10,10,20,.85)
  );
}

/* NAV */
nav{
  position:fixed;
  top:0; left:0; right:0;
  padding:1rem 2.5rem;
  display:flex;
  justify-content:space-between;
  align-items:center;
  backdrop-filter:blur(16px);
  background:rgba(10,10,20,.35);
  border-bottom:1px solid var(--border);
  z-index:100;
}

nav h1{
  font-size:1.1rem;
  letter-spacing:1px;
}

nav ul{
  display:flex;
  gap:1.5rem;
  list-style:none;
}

nav a{
  color:var(--muted);
  text-decoration:none;
  font-size:.9rem;
}

nav a:hover{color:var(--accent);}
.toggle{cursor:pointer;}

/* HERO */
.hero{
  min-height:100vh;
  display:flex;
  flex-direction:column;
  justify-content:center;
  align-items:center;
  text-align:center;
  padding:2rem;
}

/* PROFILE PHOTO */
.avatar{
  width:150px;
  height:150px;
  border-radius:50%;
  overflow:hidden;
  border:3px solid var(--accent);
  box-shadow:
    0 0 25px rgba(167,139,250,.6),
    0 0 60px rgba(56,189,248,.4);
  margin-bottom:1.8rem;
}

.avatar img{
  width:100%;
  height:100%;
  object-fit:cover;
}

.hero h2{
  font-size:3.2rem;
  font-weight:700;
}

.hero span{
  background:linear-gradient(90deg,#a78bfa,#38bdf8);
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
}

.hero p{
  max-width:600px;
  margin-top:1.2rem;
  color:var(--muted);
  line-height:1.6;
}

.hero button{
  margin-top:2.5rem;
  padding:1rem 2.8rem;
  border:none;
  border-radius:999px;
  background:linear-gradient(90deg,#a78bfa,#38bdf8);
  color:#020617;
  font-weight:600;
  cursor:pointer;
  transition:.3s;
}

.hero button:hover{
  transform:translateY(-4px);
}

/* SECTION */
section{
  padding:5rem 2.5rem;
}

.title{
  text-align:center;
  font-size:2.3rem;
  margin-bottom:2rem;
}

/* GLASS */
.glass{
  max-width:900px;
  margin:auto;
  background:var(--card);
  border:1px solid var(--border);
  backdrop-filter:blur(18px);
  border-radius:26px;
  padding:3rem;
}

/* SKILLS */
.skills{
  display:flex;
  flex-wrap:wrap;
  justify-content:center;
  gap:.8rem;
}

.skill{
  padding:.5rem 1.3rem;
  border-radius:999px;
  background:rgba(255,255,255,.15);
  font-size:.85rem;
}

/* PROJECTS */
.projects{
  display:grid;
  grid-template-columns:repeat(auto-fit,minmax(230px,1fr));
  gap:1.5rem;
}

.card{
  padding:1.8rem;
  background:var(--card);
  border-radius:20px;
  border:1px solid var(--border);
  transition:.4s;
}

.card:hover{
  transform:translateY(-10px) scale(1.02);
  box-shadow:0 40px 80px rgba(0,0,0,.5);
}

/* CONTACT */
.contact{
  text-align:center;
}

.contact a{
  color:var(--accent);
  text-decoration:none;
}

/* FOOTER */
footer{
  text-align:center;
  padding:2rem;
  font-size:.85rem;
  color:var(--muted);
}

/* SCROLL ANIMATION */
.reveal{
  opacity:0;
  transform:translateY(50px);
  transition:.9s ease;
}

.reveal.active{
  opacity:1;
  transform:translateY(0);
}

/* RESPONSIVE */
@media(max-width:768px){
  .hero h2{font-size:2.4rem;}
  .avatar{width:120px;height:120px;}
}
</style>
</head>

<body>

<!-- VIDEO BG -->
<div class="video-bg">
  <video autoplay muted loop playsinline>
    <source src="vidio.mp4 (2).mp4" type="video/mp4">
  </video>
  <div class="video-overlay"></div>
</div>

<nav>
  <h1>DIGITAL PROFILE</h1>
  <ul>
    <li><a href="#home">Home</a></li>
    <li><a href="#about">About</a></li>
    <li><a href="#works">Works</a></li>
    <li><a href="#contact">Contact</a></li>
  </ul>
  <div class="toggle" onclick="toggleTheme()">🌙</div>
</nav>

<!-- HERO -->
<section class="hero" id="home">
  <div class="avatar">
    <img src="IMG_0042.jpg" alt="Profile Photo">
  </div>
  <h2>Hi, I'm <span id="typing"></span></h2>
  <p>
    Menciptakan pengalaman digital yang estetik,
    emosional, dan berkesan.
  </p>
  <button onclick="scrollToId('about')">Explore</button>
</section>

<!-- ABOUT -->
<section id="about" class="reveal">
  <h3 class="title">About Me</h3>
  <div class="glass">
    <p>
      Saya adalah developer & digital creator yang fokus
      pada estetika visual, detail kecil, dan storytelling
      dalam setiap produk digital.
    </p>
    <br>
    <div class="skills">
      <div class="skill">HTML</div>
      <div class="skill">CSS</div>
      <div class="skill">JavaScript</div>
      <div class="skill">UI / UX</div>
      <div class="skill">Creative Coding</div>
    </div>
  </div>
</section>

<!-- WORKS -->
<section id="works" class="reveal">
  <h3 class="title">Selected Works</h3>
  <div class="projects">
    <div class="card">
      <h4>Personal Website</h4>
      <p>Estetik & modern branding</p>
    </div>
    <div class="card">
      <h4>Landing Page</h4>
      <p>Visual storytelling</p>
    </div>
    <div class="card">
      <h4>Creative UI</h4>
      <p>Eksplorasi desain & animasi</p>
    </div>
  </div>
</section>

<!-- CONTACT -->
<section id="contact" class="reveal">
  <h3 class="title">Let’s Connect</h3>
  <div class="glass contact">
    <p>Email: <a href="mailto:hello@example.com">hello@example.com</a></p>
    <p>Instagram: <a href="#">@yourname</a></p>
    <br>
    <a href="cv.pdf" download>
      <button>📄 Download CV</button>
    </a>
  </div>
</section>

<footer>
  © 2026 • Crafted with aesthetic & emotion ✨
</footer>

<script>
// typing effect
const text = "Digital Creator";
let i = 0;
function typing(){
  if(i < text.length){
    document.getElementById("typing").textContent += text.charAt(i);
    i++;
    setTimeout(typing,90);
  }
}
typing();

// scroll reveal
window.addEventListener("scroll",()=>{
  document.querySelectorAll(".reveal").forEach(el=>{
    if(el.getBoundingClientRect().top < window.innerHeight - 120){
      el.classList.add("active");
    }
  });
});

// theme toggle
function toggleTheme(){
  document.body.classList.toggle("light");
}

// smooth scroll
function scrollToId(id){
  document.getElementById(id).scrollIntoView({behavior:"smooth"});
}
</script>

</body>
</html>
