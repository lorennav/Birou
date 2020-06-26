import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const typed = document.getElementById('banner-typed-text');
  if(typed) {
    new Typed('#banner-typed-text', {
      strings: ["Here are all your bookings"],
      typeSpeed: 85,
      loop: false
    });
  }
}

export { loadDynamicBannerText };
