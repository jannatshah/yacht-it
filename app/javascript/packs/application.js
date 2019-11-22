import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { loadDynamicBannerText } from '../components/banner';
import Tooltip from 'tooltip.js';
import $ from 'jquery';
initMapbox();
loadDynamicBannerText();

// const button = document.querySelector('.btn-add');
// const ref = document.querySelector('#add-yacht');
// new Tooltip(ref, {
//   title: 'Add a yacht',
//   placement: 'top',
//   template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner">Add a yacht</div></div>'
// });
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});
