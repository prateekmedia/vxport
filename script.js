// ====================================
// THREE.JS SCENE SETUP
// ====================================

let scene, camera, renderer, particles, particleGeometry, particleMaterial;
let morphingShape, clock;
let mouseX = 0, mouseY = 0;
let targetMouseX = 0, targetMouseY = 0;

// Initialize Three.js scene
function initThreeJS() {
    const canvas = document.getElementById('bg-canvas');
    scene = new THREE.Scene();

    // Camera setup
    camera = new THREE.PerspectiveCamera(
        75,
        window.innerWidth / window.innerHeight,
        0.1,
        1000
    );
    camera.position.z = 50;

    // Renderer setup
    renderer = new THREE.WebGLRenderer({
        canvas: canvas,
        alpha: true,
        antialias: true
    });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

    // Clock for animations
    clock = new THREE.Clock();

    // Create particle system
    createParticles();

    // Create morphing geometric shapes
    createMorphingShapes();

    // Add ambient lighting
    const ambientLight = new THREE.AmbientLight(0x00d9ff, 0.5);
    scene.add(ambientLight);

    // Add point lights for drama
    const pointLight1 = new THREE.PointLight(0x00d9ff, 2, 100);
    pointLight1.position.set(20, 20, 20);
    scene.add(pointLight1);

    const pointLight2 = new THREE.PointLight(0x7c3aed, 2, 100);
    pointLight2.position.set(-20, -20, 20);
    scene.add(pointLight2);

    const pointLight3 = new THREE.PointLight(0xf72585, 1.5, 100);
    pointLight3.position.set(0, 0, -20);
    scene.add(pointLight3);

    // Start animation loop
    animate();
}

// Create floating particles with custom animation
function createParticles() {
    const particleCount = 2000;
    const positions = new Float32Array(particleCount * 3);
    const colors = new Float32Array(particleCount * 3);
    const sizes = new Float32Array(particleCount);

    const color1 = new THREE.Color(0x00d9ff);
    const color2 = new THREE.Color(0x7c3aed);
    const color3 = new THREE.Color(0xf72585);

    for (let i = 0; i < particleCount; i++) {
        const i3 = i * 3;

        // Position particles in a sphere around the scene
        const radius = Math.random() * 100 + 50;
        const theta = Math.random() * Math.PI * 2;
        const phi = Math.random() * Math.PI;

        positions[i3] = radius * Math.sin(phi) * Math.cos(theta);
        positions[i3 + 1] = radius * Math.sin(phi) * Math.sin(theta);
        positions[i3 + 2] = radius * Math.cos(phi);

        // Random colors from palette
        const colorChoice = Math.random();
        const color = colorChoice < 0.33 ? color1 : colorChoice < 0.66 ? color2 : color3;

        colors[i3] = color.r;
        colors[i3 + 1] = color.g;
        colors[i3 + 2] = color.b;

        // Random sizes
        sizes[i] = Math.random() * 2 + 0.5;
    }

    particleGeometry = new THREE.BufferGeometry();
    particleGeometry.setAttribute('position', new THREE.BufferAttribute(positions, 3));
    particleGeometry.setAttribute('color', new THREE.BufferAttribute(colors, 3));
    particleGeometry.setAttribute('size', new THREE.BufferAttribute(sizes, 1));

    particleMaterial = new THREE.PointsMaterial({
        size: 1,
        vertexColors: true,
        transparent: true,
        opacity: 0.8,
        blending: THREE.AdditiveBlending,
        sizeAttenuation: true
    });

    particles = new THREE.Points(particleGeometry, particleMaterial);
    scene.add(particles);
}

// Create morphing geometric shapes
function createMorphingShapes() {
    // Create a torus knot that will morph and rotate
    const geometry = new THREE.TorusKnotGeometry(10, 3, 100, 16);
    const material = new THREE.MeshPhongMaterial({
        color: 0x00d9ff,
        wireframe: true,
        transparent: true,
        opacity: 0.3,
        emissive: 0x00d9ff,
        emissiveIntensity: 0.5
    });

    morphingShape = new THREE.Mesh(geometry, material);
    morphingShape.position.set(30, 0, -20);
    scene.add(morphingShape);

    // Add another shape - an icosahedron
    const geo2 = new THREE.IcosahedronGeometry(8, 0);
    const mat2 = new THREE.MeshPhongMaterial({
        color: 0x7c3aed,
        wireframe: true,
        transparent: true,
        opacity: 0.2,
        emissive: 0x7c3aed,
        emissiveIntensity: 0.4
    });

    const shape2 = new THREE.Mesh(geo2, mat2);
    shape2.position.set(-35, -10, -30);
    scene.add(shape2);

    // Store reference for animation
    morphingShape.companion = shape2;
}

// Animation loop
function animate() {
    requestAnimationFrame(animate);

    const elapsedTime = clock.getElapsedTime();

    // Smoothly interpolate mouse position
    mouseX += (targetMouseX - mouseX) * 0.05;
    mouseY += (targetMouseY - mouseY) * 0.05;

    // Rotate particles based on mouse position with parallax
    if (particles) {
        particles.rotation.y = elapsedTime * 0.05 + mouseX * 0.0002;
        particles.rotation.x = elapsedTime * 0.03 + mouseY * 0.0002;

        // Animate individual particles
        const positions = particles.geometry.attributes.position.array;
        for (let i = 0; i < positions.length; i += 3) {
            positions[i + 1] += Math.sin(elapsedTime + positions[i]) * 0.01;
        }
        particles.geometry.attributes.position.needsUpdate = true;
    }

    // Animate morphing shapes
    if (morphingShape) {
        morphingShape.rotation.x = elapsedTime * 0.3;
        morphingShape.rotation.y = elapsedTime * 0.2;
        morphingShape.position.y = Math.sin(elapsedTime * 0.5) * 5;

        // Animate companion shape
        if (morphingShape.companion) {
            morphingShape.companion.rotation.x = -elapsedTime * 0.2;
            morphingShape.companion.rotation.z = elapsedTime * 0.3;
            morphingShape.companion.position.y = Math.cos(elapsedTime * 0.7) * 4;
        }
    }

    // Camera parallax effect based on mouse
    camera.position.x = mouseX * 0.01;
    camera.position.y = -mouseY * 0.01;
    camera.lookAt(scene.position);

    renderer.render(scene, camera);
}

// Handle window resize
window.addEventListener('resize', () => {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
});

// ====================================
// CURSOR GLOW EFFECT
// ====================================

const cursorGlow = document.querySelector('.cursor-glow');

document.addEventListener('mousemove', (e) => {
    targetMouseX = e.clientX - window.innerWidth / 2;
    targetMouseY = e.clientY - window.innerHeight / 2;

    // Update cursor glow position
    cursorGlow.style.left = e.clientX + 'px';
    cursorGlow.style.top = e.clientY + 'px';
});

// Hide cursor glow on mobile
if ('ontouchstart' in window) {
    cursorGlow.style.display = 'none';
}

// ====================================
// TYPING ANIMATION
// ====================================

const typingText = document.querySelector('.typing-text');
const roles = [
    'Full Stack Developer',
    'Open Source Enthusiast',
    'Flutter Expert',
    'UI/UX Designer',
    'Linux Developer',
    'Creative Builder'
];

let roleIndex = 0;
let charIndex = 0;
let isDeleting = false;
let typingSpeed = 100;

function typeRole() {
    const currentRole = roles[roleIndex];

    if (isDeleting) {
        typingText.textContent = currentRole.substring(0, charIndex - 1);
        charIndex--;
        typingSpeed = 50;
    } else {
        typingText.textContent = currentRole.substring(0, charIndex + 1);
        charIndex++;
        typingSpeed = 100;
    }

    if (!isDeleting && charIndex === currentRole.length) {
        isDeleting = true;
        typingSpeed = 2000; // Pause at end
    } else if (isDeleting && charIndex === 0) {
        isDeleting = false;
        roleIndex = (roleIndex + 1) % roles.length;
        typingSpeed = 500; // Pause before next word
    }

    setTimeout(typeRole, typingSpeed);
}

// ====================================
// SMOOTH SCROLLING
// ====================================

document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// ====================================
// SCROLL ANIMATIONS (AOS)
// ====================================

function isInViewport(element) {
    const rect = element.getBoundingClientRect();
    return (
        rect.top <= (window.innerHeight || document.documentElement.clientHeight) * 0.85 &&
        rect.bottom >= 0
    );
}

function checkScroll() {
    const elements = document.querySelectorAll('[data-aos]');
    elements.forEach(element => {
        if (isInViewport(element)) {
            element.classList.add('aos-animate');
        }
    });
}

window.addEventListener('scroll', checkScroll);
window.addEventListener('load', checkScroll);

// ====================================
// ANIMATED COUNTERS
// ====================================

function animateCounter(element) {
    const target = parseInt(element.getAttribute('data-target'));
    const duration = 2000;
    const increment = target / (duration / 16);
    let current = 0;

    const timer = setInterval(() => {
        current += increment;
        if (current >= target) {
            current = target;
            clearInterval(timer);
        }
        element.textContent = Math.floor(current) + '+';
    }, 16);
}

// Trigger counters when stats section is in view
let statsAnimated = false;
window.addEventListener('scroll', () => {
    if (statsAnimated) return;

    const statsSection = document.querySelector('.about-stats');
    if (statsSection && isInViewport(statsSection)) {
        statsAnimated = true;
        document.querySelectorAll('.stat-number').forEach(animateCounter);
    }
});

// ====================================
// 3D TILT EFFECT ON PROJECT CARDS
// ====================================

document.querySelectorAll('.project-card').forEach(card => {
    card.addEventListener('mousemove', (e) => {
        const rect = card.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;

        const centerX = rect.width / 2;
        const centerY = rect.height / 2;

        const rotateX = (y - centerY) / 20;
        const rotateY = (centerX - x) / 20;

        card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-10px)`;
    });

    card.addEventListener('mouseleave', () => {
        card.style.transform = 'perspective(1000px) rotateX(0) rotateY(0) translateY(0)';
    });
});

// ====================================
// PROFILE IMAGE 3D TILT
// ====================================

const profile3DCard = document.querySelector('.profile-3d-card');
if (profile3DCard) {
    profile3DCard.addEventListener('mousemove', (e) => {
        const rect = profile3DCard.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;

        const centerX = rect.width / 2;
        const centerY = rect.height / 2;

        const rotateX = (y - centerY) / 15;
        const rotateY = (centerX - x) / 15;

        profile3DCard.style.transform = `rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale(1.05)`;
    });

    profile3DCard.addEventListener('mouseleave', () => {
        profile3DCard.style.transform = 'rotateX(0) rotateY(0) scale(1)';
    });
}

// ====================================
// NAVBAR BACKGROUND ON SCROLL
// ====================================

let lastScroll = 0;
window.addEventListener('scroll', () => {
    const nav = document.querySelector('.nav-glass');
    const currentScroll = window.pageYOffset;

    if (currentScroll > 100) {
        nav.style.background = 'rgba(10, 10, 15, 0.8)';
        nav.style.boxShadow = '0 10px 30px rgba(0, 0, 0, 0.3)';
    } else {
        nav.style.background = 'rgba(255, 255, 255, 0.05)';
        nav.style.boxShadow = 'none';
    }

    lastScroll = currentScroll;
});

// ====================================
// PARALLAX SCROLL EFFECT
// ====================================

window.addEventListener('scroll', () => {
    const scrolled = window.pageYOffset;

    // Parallax for hero section
    const hero = document.querySelector('.hero-section');
    if (hero) {
        hero.style.transform = `translateY(${scrolled * 0.5}px)`;
        hero.style.opacity = 1 - (scrolled / 800);
    }

    // Parallax for floating card
    const floatingCard = document.querySelector('.hero-floating-card');
    if (floatingCard) {
        floatingCard.style.transform = `translateY(${-scrolled * 0.3}px)`;
    }

    // Parallax for profile
    const profileContainer = document.querySelector('.profile-float-container');
    if (profileContainer) {
        profileContainer.style.transform = `translateY(${-scrolled * 0.2}px)`;
    }
});

// ====================================
// INITIALIZE EVERYTHING
// ====================================

window.addEventListener('DOMContentLoaded', () => {
    // Initialize Three.js
    initThreeJS();

    // Start typing animation
    setTimeout(typeRole, 1000);

    // Initial AOS check
    checkScroll();

    // Add smooth reveal on page load
    document.body.style.opacity = '0';
    setTimeout(() => {
        document.body.style.transition = 'opacity 0.5s ease';
        document.body.style.opacity = '1';
    }, 100);
});

// ====================================
// EASTER EGG - KONAMI CODE
// ====================================

let konamiCode = [];
const konamiPattern = [
    'ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown',
    'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'b', 'a'
];

document.addEventListener('keydown', (e) => {
    konamiCode.push(e.key);
    konamiCode = konamiCode.slice(-10);

    if (konamiCode.join(',') === konamiPattern.join(',')) {
        // Easter egg activated!
        document.body.style.animation = 'rainbow 2s infinite';
        setTimeout(() => {
            document.body.style.animation = '';
        }, 5000);
    }
});

// Add rainbow animation to CSS dynamically
const style = document.createElement('style');
style.textContent = `
    @keyframes rainbow {
        0% { filter: hue-rotate(0deg); }
        100% { filter: hue-rotate(360deg); }
    }
`;
document.head.appendChild(style);
