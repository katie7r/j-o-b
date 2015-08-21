ready = ->

  # Nav menu (bourbon/refill)
  menuToggle = $('#js-centered-navigation-mobile-menu').unbind()
  $('#js-centered-navigation-menu').removeClass 'show'
  menuToggle.on 'click', (e) ->
    e.preventDefault()
    $('#js-centered-navigation-menu').slideToggle ->
      if $('#js-centered-navigation-menu').is(':hidden')
        $('#js-centered-navigation-menu').removeAttr 'style'
      return
    return

  # Expander for posting filters
  $('#js-expander-trigger').on 'click', ->
    $(this).toggleClass 'expander-hidden'

$(document).ready(ready)
$(document).on('page:load', ready)
