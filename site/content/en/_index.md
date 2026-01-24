---
title: Campfyre
---

<style>
  .td-heading-self-link {
    display: none;
  }
  
  .td-cover-block {
    position: relative;
    overflow: hidden;
  }
  
  .td-cover-block h1,
  .td-cover-block .lead,
  .td-cover-block p {
    font-family: 'PixelDigivolve', monospace;
  }
  
  #smoke-canvas {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 0;
    pointer-events: none;
    image-rendering: pixelated;
    image-rendering: crisp-edges;
  }
  
  .td-cover-block .td-overlay {
    position: relative;
    z-index: 1;
  }
</style>

{{< blocks/cover title="A portable, durable backup internet box" image_anchor="top" height="full" >}}

<canvas id="smoke-canvas"></canvas>

<div class="video-embed">
<iframe src="https://www.youtube.com/embed/kp6JwRd7_2c?si=8U0waY4wramVZBd4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>

<a class="btn btn-lg btn-primary me-3 mb-4" href="/docs">
  Get Started
</a>
<a class="btn btn-lg btn-secondary me-3 mb-4" href="https://discord.gg/4y4aQuCQWj">
  Join the Community <i class="fab fa-discord ms-2 "></i>
</a>
<p class="lead mt-5">Backup internet for whenever you need it</p>

{{< blocks/link-down color="info" >}} {{< /blocks/cover >}}

<script>
(function() {
  const canvas = document.getElementById('smoke-canvas');
  if (!canvas) return;
  
  const ctx = canvas.getContext('2d');
  const PIXEL_SIZE = 6;
  
  let width, height, cols, rows;
  
  function resize() {
    const cover = canvas.closest('.td-cover-block');
    if (cover) {
      width = cover.offsetWidth;
      height = cover.offsetHeight;
    } else {
      width = window.innerWidth;
      height = window.innerHeight;
    }
    canvas.width = width;
    canvas.height = height;
    cols = Math.ceil(width / PIXEL_SIZE);
    rows = Math.ceil(height / PIXEL_SIZE);
  }
  
  resize();
  window.addEventListener('resize', resize);
  
  const particles = [];
  const MAX_PARTICLES = 150;
  
  const SMOKE_COLORS = [
    'rgba(60, 60, 70, 0.4)',
    'rgba(70, 70, 80, 0.35)',
    'rgba(80, 80, 90, 0.3)',
    'rgba(90, 90, 100, 0.25)',
    'rgba(100, 100, 110, 0.2)',
    'rgba(110, 110, 120, 0.15)',
    'rgba(120, 120, 130, 0.1)',
  ];
  
  class SmokeParticle {
    constructor() {
      this.reset();
    }
    
    reset() {
      this.x = Math.random() * cols;
      this.y = rows + Math.random() * 5;
      this.size = 1 + Math.floor(Math.random() * 3);
      this.vy = -(0.3 + Math.random() * 0.4);
      this.vx = (Math.random() - 0.5) * 0.3;
      this.drift = Math.random() * Math.PI * 2;
      this.driftSpeed = 0.02 + Math.random() * 0.02;
      this.opacity = 0.6 + Math.random() * 0.4;
      this.fadeRate = 0.002 + Math.random() * 0.002;
      this.colorIndex = 0;
    }
    
    update() {
      this.y += this.vy;
      this.drift += this.driftSpeed;
      this.x += this.vx + Math.sin(this.drift) * 0.15;
      
      const progress = 1 - (this.y / rows);
      this.colorIndex = Math.min(SMOKE_COLORS.length - 1, Math.floor(progress * SMOKE_COLORS.length));
      
      this.opacity -= this.fadeRate;
      
      if (this.y < -this.size || this.opacity <= 0) {
        this.reset();
      }
    }
    
    draw() {
      if (this.opacity <= 0) return;
      
      const px = Math.floor(this.x) * PIXEL_SIZE;
      const py = Math.floor(this.y) * PIXEL_SIZE;
      
      ctx.globalAlpha = this.opacity;
      ctx.fillStyle = SMOKE_COLORS[this.colorIndex];
      
      for (let i = 0; i < this.size; i++) {
        for (let j = 0; j < this.size; j++) {
          if (Math.random() > 0.3) {
            ctx.fillRect(
              px + i * PIXEL_SIZE,
              py + j * PIXEL_SIZE,
              PIXEL_SIZE,
              PIXEL_SIZE
            );
          }
        }
      }
      
      ctx.globalAlpha = 1;
    }
  }
  
  for (let i = 0; i < MAX_PARTICLES; i++) {
    const p = new SmokeParticle();
    p.y = Math.random() * rows;
    p.opacity = Math.random() * 0.6;
    particles.push(p);
  }
  
  function animate() {
    ctx.clearRect(0, 0, width, height);
    
    for (const particle of particles) {
      particle.update();
      particle.draw();
    }
    
    requestAnimationFrame(animate);
  }
  
  animate();
})();
</script>

{{% blocks/lead color="primary" %}}

After the Verizon outage in Jan of 2026, I wanted a backup internet connection
that I could put in a car or take with me if I needed. So I built Campfyre - a
battery-powered Starlink, Raspberry Pi, and network switch, in a water-resistant
case.

{{% /blocks/lead %}}

{{% blocks/section color="black" type="row" %}}

{{% blocks/feature icon="fa-hill-rockslide" title="Durable" %}}

Campfyre is built into a rock-solid and water-resistant carrying case, so you
can take it into the field, wherever you like.

{{% /blocks/feature %}}

{{% blocks/feature icon="fab fa-github" title="Open Source" url="https://github.com/space55/campfyre" %}}

Everything is open-source, including CAD, printable files, wiring diagrams, and
component listing. Found a better way to do something? Suggest a change!

{{% /blocks/feature %}}

{{% blocks/feature icon="fa-solid fa-earth-americas" title="Works anywhere" %}}

This works anywhere on Earth you can use Starlink. On a boat in the open ocean,
in a car driving through the wilderness, or on the roof of a building in a city.

{{% /blocks/feature %}}

{{% /blocks/section %}}
