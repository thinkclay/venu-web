//= require chosen.jquery
//= require modal.jquery

ready = ->
  $(".input.select select").chosen
    width: '100%'

  $(".input.datetime select, .input.date select, .input.time select").chosen
    width: '18%'

  return

$(document).ready(ready)
$(document).on('page:load', ready)