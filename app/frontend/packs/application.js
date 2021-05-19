require("@rails/ujs").start()
import 'bootstrap/dist/js/bootstrap'
import 'air-datepicker/dist/js/datepicker.min'
import 'ekko-lightbox/dist/ekko-lightbox.min.js'
import '@fortawesome/fontawesome-free/css/all'
import '../scripts/bootstrap' 
import '../scripts/dp.js'
import '../scripts/lb.js'
import '../scripts/map.js'

import '../styles/application'

const images = require.context('../images', true)
