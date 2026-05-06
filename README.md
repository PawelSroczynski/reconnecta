# Reconnecta

> A regenerative living laboratory at Óbidos Lagoon, Portugal.

This repository contains the public-facing whitepaper and landing page for **Reconnecta** — a 4.83-hectare regenerative project being built by Norbert Roztocki and family on the western coast of Portugal. The site is published at [enklava.co/projects/reconnecta](https://enklava.co/projects/reconnecta/) and is intended to also live at **reconnecta.world** as an independent home for the project.

The repo is open so anyone can read the document, clone it, and serve it from their own domain — that is part of the project's collaborative posture.

---

## What is in here

```
reconnecta/
├── README.md                  ← this file
├── NOTICE.md                  ← content & code rights
├── whitepaper.md              ← canonical English master (markdown)
├── landing/
│   ├── index.html             ← landing page (HTML)
│   ├── style.css              ← styles
│   └── reconnecta-whitepaper.pdf   ← downloadable build
└── scripts/
    ├── build-pdf.sh           ← regenerate the PDF from the landing
    └── deploy.example.sh      ← deploy template for your own host
```

The landing page is plain static HTML/CSS — no build system, no JavaScript framework. Open `landing/index.html` directly in a browser and it works.

---

## Quick start — read it locally

```bash
git clone https://github.com/PawelSroczynski/reconnecta.git
cd reconnecta/landing
python3 -m http.server 8080
# open http://localhost:8080
```

That's it. No dependencies, no build step.

---

## Deploy to your own domain (`reconnecta.world` or any other)

The site is a static directory. Pick whichever path matches your infrastructure.

### Option A — nginx on your own server

1. Copy `landing/` to your web root:
   ```bash
   rsync -a landing/ user@reconnecta.world:/var/www/reconnecta/
   ```

2. Add a server block to nginx (`/etc/nginx/sites-available/reconnecta`):
   ```nginx
   server {
       listen 80;
       listen [::]:80;
       server_name reconnecta.world www.reconnecta.world;

       root /var/www/reconnecta;
       index index.html;

       location / {
           try_files $uri $uri/ =404;
       }

       # PDF download — long cache
       location = /reconnecta-whitepaper.pdf {
           add_header Cache-Control "public, max-age=86400";
       }
   }
   ```

3. Enable + reload:
   ```bash
   sudo ln -s /etc/nginx/sites-available/reconnecta /etc/nginx/sites-enabled/
   sudo nginx -t && sudo systemctl reload nginx
   ```

4. Add HTTPS via Let's Encrypt:
   ```bash
   sudo certbot --nginx -d reconnecta.world -d www.reconnecta.world
   ```

### Option B — Cloudflare Pages (zero ops)

1. Fork this repo on GitHub.
2. Cloudflare dashboard → Workers & Pages → Create application → Pages → Connect to Git.
3. Pick your fork. Build settings:
   - Framework preset: **None**
   - Build command: *(leave empty)*
   - Build output directory: `landing`
4. Add custom domain `reconnecta.world` in the project settings.

Updates to `main` deploy automatically.

### Option C — Netlify

1. Fork this repo.
2. New site from Git → pick the fork.
3. Build settings: command empty, publish directory `landing/`.
4. Domain settings → add `reconnecta.world` and follow the DNS instructions.

### Option D — GitHub Pages

1. Fork this repo.
2. Settings → Pages → Source: `main` branch, folder: `/landing`.
3. Add custom domain `reconnecta.world` and the CNAME file Pages instructs you to add.

### Option E — any static host

Drop `landing/` into S3 + CloudFront, Vercel, Render, Fly.io static, or any other host that serves static files. There is nothing project-specific in the deploy step.

---

## Editing the whitepaper

The canonical content lives in [`whitepaper.md`](./whitepaper.md). The `landing/index.html` is currently rendered from the same content but maintained by hand — they should stay in parity. If you make a change in one, mirror it in the other.

The document is versioned in its footer (`v0.2-beta · 2026-05-06`). When you fork or modify it, please update the version and date so readers can tell the difference between the upstream document and your edits.

Open questions are flagged inline as `[PENDING — Q…]` and registered together in §19. They are intentionally visible — the document tracks what is still to learn rather than hides it.

---

## Regenerating the PDF

The downloadable PDF (`landing/reconnecta-whitepaper.pdf`) is built from the landing page's HTML using [WeasyPrint](https://weasyprint.org/). The `@media print` rules in `style.css` flatten the layout for the printed version (sidebar TOC removed, Miro embed replaced with a static reference note).

```bash
# install once
sudo apt install weasyprint   # Debian/Ubuntu
# or: pip install weasyprint
# or: brew install weasyprint  (macOS)

# rebuild
./scripts/build-pdf.sh
```

The script writes to `landing/reconnecta-whitepaper.pdf`.

---

## Aesthetic reference

§13 *Aesthetic Direction* embeds a live Miro board (`taipa house / clay`) curated by Norbert as the project's visual constitution. The embed is hidden in the printed PDF and replaced by a textual note pointing to the web edition — Miro is interactive in nature and does not render meaningfully on paper.

If you fork the repo and want to swap in your own visual reference: replace the `<iframe>` block in `landing/index.html` (search for `<!--` `Miro` or for `miro.com`).

---

## Provenance

Reconnecta is part of the [Enklava](https://enklava.co/) ecosystem of projects. This document was compiled by Paweł Sroczyński based on conversations with Norbert Roztocki between March and May 2026.

It is a working draft. The bigger plan — Hotel Rural 3★ permit decision, soil tests, climate data, fire plan, operational manager hire, financial model — is the work that turns this draft into a roadmap.

---

## Rights

See [`NOTICE.md`](./NOTICE.md). In short: the **content** of the whitepaper is © the project owners (HOME 4 LIFE LDA / Norbert Roztocki / Enklava ecosystem). The **code** that renders it (HTML, CSS, scripts) is released under the MIT licence so you can reuse it for your own document.

---

## Contact

- Project: [enklava.co/projects/reconnecta](https://enklava.co/projects/reconnecta/)
- Enklava: [enklava.co](https://enklava.co/)
- Repository owner: [@PawelSroczynski](https://github.com/PawelSroczynski)
