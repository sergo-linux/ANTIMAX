const root = document.documentElement;
const toggle = document.getElementById('themeToggle');

function setTheme(theme) {
  root.setAttribute('data-theme', theme);
  if (toggle) toggle.textContent = theme === 'dark' ? '🌙' : '☀️';
}

const media = window.matchMedia('(prefers-color-scheme: dark)');
const saved = localStorage.getItem('theme');

if (saved === 'light' || saved === 'dark') {
  setTheme(saved);
} else {
  setTheme(media.matches ? 'dark' : 'light');
}

if (toggle) {
  toggle.addEventListener('click', () => {
    const current = root.getAttribute('data-theme') === 'dark' ? 'dark' : 'light';
    const next = current === 'dark' ? 'light' : 'dark';
    setTheme(next);
    localStorage.setItem('theme', next);
  });
}

if (media.addEventListener) {
  media.addEventListener('change', (event) => {
    if (!localStorage.getItem('theme')) {
      setTheme(event.matches ? 'dark' : 'light');
    }
  });
} else if (media.addListener) {
  media.addListener((event) => {
    if (!localStorage.getItem('theme')) {
      setTheme(event.matches ? 'dark' : 'light');
    }
  });
}
