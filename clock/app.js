const clock = document.getElementById('clock');
const themeSelector = document.getElementById('themeSelector');
const darkToggle = document.getElementById('darkToggle');

function updateClock() {
  const now = new Date();
  const hours = String(now.getHours()).padStart(2, '0');
  const minutes = String(now.getMinutes()).padStart(2, '0');
  const seconds = String(now.getSeconds()).padStart(2, '0');

  clock.textContent = `${hours}:${minutes}:${seconds}`;
}

setInterval(updateClock, 1000);
updateClock();

/* Theme switching */
themeSelector.addEventListener('change', () => {
  document.body.className = themeSelector.value;
  saveSettings();
});

/* Dark mode toggle */
darkToggle.addEventListener('click', () => {
  document.body.classList.toggle('dark');
  saveSettings();
});

/* Persistence */
function saveSettings() {
  localStorage.setItem('theme', themeSelector.value);
  localStorage.setItem('dark', document.body.classList.contains('dark'));
}

function loadSettings() {
  const theme = localStorage.getItem('theme');
  const dark = localStorage.getItem('dark') === 'true';

  if (theme) {
    document.body.className = theme;
    themeSelector.value = theme;
  }

  if (dark) {
    document.body.classList.add('dark');
  }
}

loadSettings();

const controls = document.querySelector('.controls');
let controlsTimeout;

function showControls() {
  controls.classList.add('visible');
  clearTimeout(controlsTimeout);

  controlsTimeout = setTimeout(() => {
    controls.classList.remove('visible');
  }, 5000);
}

document.addEventListener('mousemove', showControls);
