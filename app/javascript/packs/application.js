// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap'
import $ from 'jquery';

global.$ = $
global.jQuery = $

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery-ui")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(function() {
  $('table tbody').sortable({
    cursor: 'move',
    update: function(event, ui) {
      var id = ui.item[0].children[2].textContent;
      $.ajax({
        // I know this is a little hacky, but for the
        // sake of time and a simple exercise I'm just going to
        // do this for now
        url: `/providers/${id}`,
        type: 'put',
        data: { position: ui.item.index() + 1},
        dataType: 'script',
        complete: function(request){
          $('#tasks').effect('highlight');
        }
      });
    }
  });
});
