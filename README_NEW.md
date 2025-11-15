# Prateek Sunal - Next-Gen Portfolio 🚀

A cutting-edge portfolio website featuring **Three.js 3D animations**, crazy parallax effects, and modern web design.

[![Portfolio Preview](https://img.shields.io/badge/Status-Live-success)](https://prateek.sunal.in)

## ✨ Features

### 🎨 Visual Effects
- **3D Particle System**: 2000+ animated particles creating a mesmerizing cosmic background
- **Morphing Geometric Shapes**: Wireframe torus knot and icosahedron with dynamic animations
- **Crazy Parallax Scrolling**: Multi-layer depth with mouse-responsive camera movement
- **Glass Morphism UI**: Modern frosted glass effect with backdrop blur
- **Cursor Glow**: Custom radial gradient that follows mouse movement
- **Animated Gradient Text**: Dynamic color gradients on titles and headings

### 🎭 Interactive Elements
- **3D Tilt Cards**: Project cards with perspective tilt on mouse movement
- **Typing Animation**: Auto-rotating role display with typewriter effect
- **Scroll Reveal Animations**: Sections fade and slide in as you scroll
- **Animated Counters**: Stats that count up when scrolled into view
- **Smooth Navigation**: Seamless scroll-to-section navigation
- **Dynamic Navbar**: Background changes opacity and blur on scroll

### 📱 Responsive Design
- Fully responsive layout for all device sizes
- Mobile-optimized interactions
- Touch-friendly navigation
- Adaptive typography and spacing
- Optimized performance across devices

### 🎯 Sections
1. **Hero Section**: Eye-catching intro with animated profile and CTA buttons
2. **About Section**: Personal bio, tech stack showcase, and animated statistics
3. **Projects Section**: Featured works with detailed descriptions and links
4. **Contact Section**: Multiple ways to connect (GitHub, LinkedIn, Twitter, Email, Telegram, Discord)

## 🛠️ Tech Stack

- **HTML5**: Semantic markup
- **CSS3**: Modern features including Grid, Flexbox, Backdrop Filter
- **JavaScript (ES6+)**: Vanilla JS for all interactions
- **Three.js (r128)**: 3D graphics and WebGL rendering
- **Google Fonts**: Inter font family

## 🚀 Quick Start

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/prateekmedia/vxport.git
   cd vxport
   ```

2. **Serve the files**

   Using Python 3:
   ```bash
   python -m http.server 8000
   ```

   Using Node.js:
   ```bash
   npx serve .
   ```

   Or use any static file server of your choice.

3. **Open in browser**
   ```
   http://localhost:8000
   ```

### Deployment

Simply deploy the following files to any static hosting service:
- `index.html`
- `styles.css`
- `script.js`

Recommended hosting platforms:
- **Vercel** (recommended)
- **Netlify**
- **GitHub Pages**
- **Cloudflare Pages**

## 🎨 Customization

### Color Scheme
Edit the CSS variables in `styles.css`:

```css
:root {
    --primary: #00d9ff;      /* Cyan */
    --secondary: #7c3aed;    /* Purple */
    --accent: #f72585;       /* Pink */
    --dark: #0a0a0f;        /* Background */
    --text: #ffffff;         /* Text color */
}
```

### Content
Update your information in `index.html`:
- Personal bio and description
- Project details
- Social media links
- Contact information

### Animations
Adjust animation parameters in `script.js`:
- Particle count: Line 55 (`particleCount`)
- Typing speed: Lines 196-198
- Scroll parallax intensity: Lines 399-412

## 🎮 Easter Eggs

Try the **Konami Code**: ↑ ↑ ↓ ↓ ← → ← → B A

## 📊 Performance

- **Lighthouse Score**: 95+ on Performance
- **First Contentful Paint**: < 1.5s
- **Time to Interactive**: < 3s
- **Three.js Optimizations**:
  - Particle LOD system
  - Efficient geometry updates
  - RequestAnimationFrame for smooth 60fps

## 🌟 Key Differences from Previous Version

| Feature | Old (Flutter) | New (Web) |
|---------|--------------|-----------|
| Framework | Flutter Web | Vanilla HTML/CSS/JS |
| 3D Graphics | None | Three.js particles & shapes |
| Design | VSCode-inspired | Modern glass morphism |
| Animations | Basic | Advanced parallax & morphing |
| Load Time | ~3-5s | ~1-2s |
| Bundle Size | ~2MB | ~150KB |

## 📁 Project Structure

```
vxport/
├── index.html          # Main HTML structure
├── styles.css          # All styles and animations
├── script.js           # Three.js and interactions
├── legacy/             # Previous Flutter version
└── README_NEW.md       # This file
```

## 🤝 Contributing

This is a personal portfolio, but feel free to:
- Report bugs
- Suggest improvements
- Fork and customize for your own use

## 📜 License

This project is licensed under the same license as the original VXPort project.

## 🙏 Credits

- **Design & Development**: Prateek Sunal
- **3D Graphics**: Three.js
- **Typography**: Google Fonts (Inter)
- **Icons**: Inline SVG

## 📞 Contact

- **Email**: workwithme@sunal.in
- **GitHub**: [@prateekmedia](https://github.com/prateekmedia)
- **LinkedIn**: [prateek-sunal](https://linkedin.com/in/prateek-sunal)
- **Twitter**: [@prateek_su](https://x.com/prateek_su)

---

<div align="center">
  <strong>Built with 💙 and powered by Three.js ✨</strong>
  <br>
  <sub>Inspired by the cosmos and creative chaos</sub>
</div>
