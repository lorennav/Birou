import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Here are all your bookings"],
    typeSpeed: 85,
    loop: false
  });
}

export { loadDynamicBannerText };
