//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

ready = ->
  $("select[multiple=multiple]").chosen
    width: '95%'

  return

$(document).ready(ready)
$(document).on('page:load', ready)