/* ============================================
   COSMIC NOIR - MAIN JAVASCRIPT
   Three.js Particle Galaxy & Interactions
   ============================================ */

// ============================================
// THREE.JS COSMIC BACKGROUND
// ============================================

class CosmicBackground {
    constructor() {
        this.canvas = document.getElementById('cosmic-canvas');
        this.scene = null;
        this.camera = null;
        this.renderer = null;
        this.particles = null;
        this.particleCount = 15000;
        this.mouse = { x: 0, y: 0 };
        this.targetRotation = { x: 0, y: 0 };
        this.currentRotation = { x: 0, y: 0 };

        this.init();
        this.animate();
        this.addEventListeners();
    }

    init() {
        // Scene setup
        this.scene = new THREE.Scene();
        this.scene.fog = new THREE.FogExp2(0x0a0a0f, 0.0008);

        // Camera setup
        this.camera = new THREE.PerspectiveCamera(
            75,
            window.innerWidth / window.innerHeight,
            0.1,
            1000
        );
        this.camera.position.z = 400;

        // Renderer setup
        this.renderer = new THREE.WebGLRenderer({
            canvas: this.canvas,
            alpha: true,
            antialias: true
        });
        this.renderer.setSize(window.innerWidth, window.innerHeight);
        this.renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

        // Create particle system
        this.createParticles();

        // Create nebula clouds
        this.createNebulaClouds();

        // Create distant stars
        this.createDistantStars();
    }

    createParticles() {
        const geometry = new THREE.BufferGeometry();
        const positions = new Float32Array(this.particleCount * 3);
        const colors = new Float32Array(this.particleCount * 3);
        const sizes = new Float32Array(this.particleCount);

        // Color palette: cyan, magenta, purple, white
        const colorPalette = [
            new THREE.Color(0x00f0ff), // Cyan
            new THREE.Color(0xff00ff), // Magenta
            new THREE.Color(0x8b5cf6), // Purple
            new THREE.Color(0xffffff), // White
        ];

        for (let i = 0; i < this.particleCount; i++) {
            const i3 = i * 3;

            // Create galaxy spiral pattern
            const radius = Math.random() * 600;
            const spinAngle = radius * 0.01;
            const branchAngle = (i % 6) * (Math.PI * 2) / 6;

            const randomX = Math.pow(Math.random(), 3) * (Math.random() < 0.5 ? 1 : -1) * 50;
            const randomY = Math.pow(Math.random(), 3) * (Math.random() < 0.5 ? 1 : -1) * 50;
            const randomZ = Math.pow(Math.random(), 3) * (Math.random() < 0.5 ? 1 : -1) * 50;

            positions[i3] = Math.cos(branchAngle + spinAngle) * radius + randomX;
            positions[i3 + 1] = randomY;
            positions[i3 + 2] = Math.sin(branchAngle + spinAngle) * radius + randomZ;

            // Assign colors
            const color = colorPalette[Math.floor(Math.random() * colorPalette.length)];
            colors[i3] = color.r;
            colors[i3 + 1] = color.g;
            colors[i3 + 2] = color.b;

            // Vary particle sizes
            sizes[i] = Math.random() * 4 + 0.5;
        }

        geometry.setAttribute('position', new THREE.BufferAttribute(positions, 3));
        geometry.setAttribute('color', new THREE.BufferAttribute(colors, 3));
        geometry.setAttribute('size', new THREE.BufferAttribute(sizes, 1));

        // Custom shader material for particles
        const material = new THREE.PointsMaterial({
            size: 2,
            vertexColors: true,
            transparent: true,
            opacity: 0.8,
            blending: THREE.AdditiveBlending,
            sizeAttenuation: true
        });

        this.particles = new THREE.Points(geometry, material);
        this.scene.add(this.particles);
    }

    createNebulaClouds() {
        const cloudGeometry = new THREE.BufferGeometry();
        const cloudCount = 200;
        const cloudPositions = new Float32Array(cloudCount * 3);
        const cloudColors = new Float32Array(cloudCount * 3);
        const cloudSizes = new Float32Array(cloudCount);

        for (let i = 0; i < cloudCount; i++) {
            const i3 = i * 3;
            cloudPositions[i3] = (Math.random() - 0.5) * 800;
            cloudPositions[i3 + 1] = (Math.random() - 0.5) * 400;
            cloudPositions[i3 + 2] = (Math.random() - 0.5) * 800;

            // Nebula colors (cyan and magenta)
            const color = Math.random() > 0.5
                ? new THREE.Color(0x00f0ff)
                : new THREE.Color(0xff00ff);

            cloudColors[i3] = color.r;
            cloudColors[i3 + 1] = color.g;
            cloudColors[i3 + 2] = color.b;

            cloudSizes[i] = Math.random() * 50 + 20;
        }

        cloudGeometry.setAttribute('position', new THREE.BufferAttribute(cloudPositions, 3));
        cloudGeometry.setAttribute('color', new THREE.BufferAttribute(cloudColors, 3));
        cloudGeometry.setAttribute('size', new THREE.BufferAttribute(cloudSizes, 1));

        const cloudMaterial = new THREE.PointsMaterial({
            size: 30,
            vertexColors: true,
            transparent: true,
            opacity: 0.1,
            blending: THREE.AdditiveBlending,
            sizeAttenuation: true
        });

        const clouds = new THREE.Points(cloudGeometry, cloudMaterial);
        this.scene.add(clouds);
    }

    createDistantStars() {
        const starGeometry = new THREE.BufferGeometry();
        const starCount = 1000;
        const starPositions = new Float32Array(starCount * 3);

        for (let i = 0; i < starCount; i++) {
            const i3 = i * 3;
            const radius = 800 + Math.random() * 200;
            const theta = Math.random() * Math.PI * 2;
            const phi = Math.random() * Math.PI;

            starPositions[i3] = radius * Math.sin(phi) * Math.cos(theta);
            starPositions[i3 + 1] = radius * Math.sin(phi) * Math.sin(theta);
            starPositions[i3 + 2] = radius * Math.cos(phi);
        }

        starGeometry.setAttribute('position', new THREE.BufferAttribute(starPositions, 3));

        const starMaterial = new THREE.PointsMaterial({
            size: 1,
            color: 0xffffff,
            transparent: true,
            opacity: 0.6,
            blending: THREE.AdditiveBlending
        });

        const stars = new THREE.Points(starGeometry, starMaterial);
        this.scene.add(stars);
    }

    addEventListeners() {
        // Mouse move for parallax effect
        document.addEventListener('mousemove', (e) => {
            this.mouse.x = (e.clientX / window.innerWidth) * 2 - 1;
            this.mouse.y = -(e.clientY / window.innerHeight) * 2 + 1;

            this.targetRotation.x = this.mouse.y * 0.3;
            this.targetRotation.y = this.mouse.x * 0.3;
        });

        // Scroll for depth effect
        window.addEventListener('scroll', () => {
            const scrollY = window.scrollY;
            this.camera.position.z = 400 + scrollY * 0.1;
        });

        // Resize handler
        window.addEventListener('resize', () => {
            this.camera.aspect = window.innerWidth / window.innerHeight;
            this.camera.updateProjectionMatrix();
            this.renderer.setSize(window.innerWidth, window.innerHeight);
        });
    }

    animate() {
        requestAnimationFrame(() => this.animate());

        // Smooth rotation interpolation
        this.currentRotation.x += (this.targetRotation.x - this.currentRotation.x) * 0.05;
        this.currentRotation.y += (this.targetRotation.y - this.currentRotation.y) * 0.05;

        // Rotate particles
        if (this.particles) {
            this.particles.rotation.y += 0.0005;
            this.particles.rotation.x = this.currentRotation.x;
            this.particles.rotation.y += this.currentRotation.y * 0.001;
        }

        // Pulse effect for particles
        const time = Date.now() * 0.00005;
        if (this.particles && this.particles.material) {
            this.particles.material.opacity = 0.6 + Math.sin(time) * 0.2;
        }

        this.renderer.render(this.scene, this.camera);
    }
}

// ============================================
// TABS FUNCTIONALITY
// ============================================

class TabManager {
    constructor() {
        this.tabs = document.querySelectorAll('.tab-btn');
        this.tabContents = document.querySelectorAll('.projects-grid');
        this.init();
    }

    init() {
        this.tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                const targetTab = tab.dataset.tab;
                this.switchTab(targetTab, tab);
            });
        });
    }

    switchTab(targetTab, clickedBtn) {
        // Update button states
        this.tabs.forEach(tab => tab.classList.remove('active'));
        clickedBtn.classList.add('active');

        // Update content visibility
        this.tabContents.forEach(content => {
            if (content.id === targetTab) {
                content.classList.add('active');
            } else {
                content.classList.remove('active');
            }
        });
    }
}

// ============================================
// SMOOTH SCROLL
// ============================================

class SmoothScroll {
    constructor() {
        this.init();
    }

    init() {
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', (e) => {
                e.preventDefault();
                const target = document.querySelector(anchor.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
    }
}

// ============================================
// SCROLL ANIMATIONS
// ============================================

class ScrollAnimations {
    constructor() {
        this.elements = document.querySelectorAll('.mission-card, .project-card, .contact-card, .section-header');
        this.init();
    }

    init() {
        // Initial check
        this.checkVisibility();

        // Check on scroll with throttle
        let ticking = false;
        window.addEventListener('scroll', () => {
            if (!ticking) {
                window.requestAnimationFrame(() => {
                    this.checkVisibility();
                    ticking = false;
                });
                ticking = true;
            }
        });
    }

    checkVisibility() {
        const windowHeight = window.innerHeight;

        this.elements.forEach(element => {
            const elementTop = element.getBoundingClientRect().top;
            const elementVisible = 150;

            if (elementTop < windowHeight - elementVisible) {
                element.style.opacity = '1';
                element.style.transform = 'translateY(0)';
            }
        });
    }

    setupInitialState() {
        this.elements.forEach(element => {
            element.style.opacity = '0';
            element.style.transform = 'translateY(30px)';
            element.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
        });
    }
}

// ============================================
// GLITCH EFFECT INTENSIFIER
// ============================================

class GlitchEffect {
    constructor() {
        this.glitchElement = document.querySelector('.glitch');
        this.init();
    }

    init() {
        if (!this.glitchElement) return;

        // Randomize glitch intensity
        setInterval(() => {
            if (Math.random() > 0.95) {
                this.glitchElement.style.animation = 'none';
                setTimeout(() => {
                    this.glitchElement.style.animation = '';
                }, 100);
            }
        }, 3000);
    }
}

// ============================================
// PERFORMANCE MONITOR
// ============================================

class PerformanceOptimizer {
    constructor() {
        this.reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
        this.init();
    }

    init() {
        // Detect low-end devices
        const isLowEnd = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);

        if (isLowEnd || this.reduceMotion) {
            // Reduce particle count for better performance
            document.body.classList.add('performance-mode');
            console.log('Performance mode activated');
        }
    }
}

// ============================================
// EASTER EGGS
// ============================================

class EasterEggs {
    constructor() {
        this.konamiCode = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'];
        this.konamiIndex = 0;
        this.init();
    }

    init() {
        document.addEventListener('keydown', (e) => {
            if (e.key === this.konamiCode[this.konamiIndex]) {
                this.konamiIndex++;
                if (this.konamiIndex === this.konamiCode.length) {
                    this.activateWarpSpeed();
                    this.konamiIndex = 0;
                }
            } else {
                this.konamiIndex = 0;
            }
        });
    }

    activateWarpSpeed() {
        // Create warp speed effect
        document.body.style.animation = 'warpSpeed 2s ease-in-out';

        // Add CSS keyframe
        const style = document.createElement('style');
        style.textContent = `
            @keyframes warpSpeed {
                0%, 100% { filter: blur(0px); }
                50% { filter: blur(10px) brightness(2); }
            }
        `;
        document.head.appendChild(style);

        setTimeout(() => {
            document.body.style.animation = '';
        }, 2000);

        console.log('🚀 WARP SPEED ACTIVATED! 🚀');
    }
}

// ============================================
// CURSOR TRAIL EFFECT
// ============================================

class CursorTrail {
    constructor() {
        this.trails = [];
        this.maxTrails = 20;
        this.init();
    }

    init() {
        document.addEventListener('mousemove', (e) => {
            this.createTrail(e.clientX, e.clientY);
        });
    }

    createTrail(x, y) {
        const trail = document.createElement('div');
        trail.className = 'cursor-trail';
        trail.style.cssText = `
            position: fixed;
            left: ${x}px;
            top: ${y}px;
            width: 4px;
            height: 4px;
            background: radial-gradient(circle, rgba(0, 240, 255, 0.8), transparent);
            border-radius: 50%;
            pointer-events: none;
            z-index: 9999;
            animation: trailFade 1s ease-out forwards;
        `;

        // Add CSS animation if not exists
        if (!document.querySelector('#cursor-trail-style')) {
            const style = document.createElement('style');
            style.id = 'cursor-trail-style';
            style.textContent = `
                @keyframes trailFade {
                    to {
                        opacity: 0;
                        transform: scale(2);
                    }
                }
            `;
            document.head.appendChild(style);
        }

        document.body.appendChild(trail);

        setTimeout(() => trail.remove(), 1000);

        // Limit trails
        this.trails.push(trail);
        if (this.trails.length > this.maxTrails) {
            const oldTrail = this.trails.shift();
            if (oldTrail && oldTrail.parentNode) {
                oldTrail.remove();
            }
        }
    }
}

// ============================================
// INITIALIZATION
// ============================================

document.addEventListener('DOMContentLoaded', () => {
    // Initialize cosmic background
    const cosmic = new CosmicBackground();

    // Initialize tab manager
    const tabManager = new TabManager();

    // Initialize smooth scroll
    const smoothScroll = new SmoothScroll();

    // Initialize scroll animations
    const scrollAnimations = new ScrollAnimations();

    // Initialize glitch effect
    const glitchEffect = new GlitchEffect();

    // Initialize performance optimizer
    const perfOptimizer = new PerformanceOptimizer();

    // Initialize easter eggs
    const easterEggs = new EasterEggs();

    // Initialize cursor trail (optional, can be disabled for performance)
    const cursorTrail = new CursorTrail();

    console.log('🌌 Temporal Voyager initialized successfully');
    console.log('💫 Cosmic systems online');
    console.log('⚡ Ready for exploration');
});

// ============================================
// UTILITY FUNCTIONS
// ============================================

// Debounce function for performance
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Throttle function for performance
function throttle(func, limit) {
    let inThrottle;
    return function(...args) {
        if (!inThrottle) {
            func.apply(this, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    };
}

// Random range utility
function randomRange(min, max) {
    return Math.random() * (max - min) + min;
}

// Map value from one range to another
function mapRange(value, inMin, inMax, outMin, outMax) {
    return (value - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}
