ready = ->

  # Dismiss flash messages
  $('.flash').on 'click', ->
    $(this).hide('slow')

$(document).ready(ready)
$(document).on('page:load', ready)
