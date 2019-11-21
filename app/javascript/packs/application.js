import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

initMapbox();

import '../components/algolia_form.js'

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();


//= require algolia/v3/algoliasearch.min
