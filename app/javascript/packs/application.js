// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import flatpickr from "flatpickr";
import { initMapbox } from '../plugins/init_mapbox';
import { autocompleteSearch } from '../plugins/autocomplete';
import { loadDynamicBannerText } from '../components/banner';
import 'js-autocomplete/auto-complete.css';


document.addEventListener('turbolinks:load', () => {

  const currentDate = new Date();
  const year = currentDate.getFullYear();
  const month = currentDate.getMonth() + 1;
  const day = currentDate.getDate();

  flatpickr(".date-picker", {
    altInput: true,
    time_24hr: true,
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    minDate: `${year}-${month}-${day + 1}`
  });

  initMapbox();

  autocompleteSearch();


  loadDynamicBannerText();

});


