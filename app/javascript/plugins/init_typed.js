import Typed from 'typed.js';

const typeAnimation = () => {
  const movingText = document.querySelector(".typed");
  if (movingText) {
    const options = {
      strings: ["Showered", "Cleaned", "Shiny", "Purified", "Scrubbed", "Polished", "Wet"],
      typeSpeed: 100,
      loop: true
    };
    const typed = new Typed(".typed", options)
  }
};

export { typeAnimation };
