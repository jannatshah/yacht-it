import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Come Aboard!"],
    typeSpeed: 30,
    loop: false,
    showCursor: false
  });
}

export { loadDynamicBannerText };
