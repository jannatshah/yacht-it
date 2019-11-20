import places from 'places.js';

const initAutocomplete = () => {
  const locationInput = document.getElementById('yacht_address');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initAutocomplete };
