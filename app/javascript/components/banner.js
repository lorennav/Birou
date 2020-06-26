import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Here are all your bookings"],
    typeSpeed: 75,
    loop: true
  });
}

export { loadDynamicBannerText };
