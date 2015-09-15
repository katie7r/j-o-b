ready = ->

  closed = "[data-status='closed']"

  # Convert suchTheString to such-the-string
  uncamel = (camelCaseString) ->
    camelCaseString.replace(/([a-z])([A-Z])/g, '$1-$2').toLowerCase()

  # Hide closed postings
  hideClosed = () ->
    $(".flex-box.posting#{closed}").hide()

  # Filter postings on index
  if $('#posting-filters').length

    hideClosed() # Hide closed postings by default

    $('#posting-filters input').on 'change', ->
      selectedItem = $(this).closest('.button-group').find('input:checked')
      filterGroup  = selectedItem.attr('name')
      filterValue  = selectedItem.val()

      # Update data attribute for group on #posting-filters to track value
      if filterValue == 'all'
        $('#posting-filters').removeData(filterGroup)
      else
        $('#posting-filters').data(filterGroup, "#{filterValue}")

      # Get selections based on current filters
      dataFilter = ''
      data = $('#posting-filters').data()
      for attr of data
        dataFilter += "[data-#{uncamel(attr)}='#{data[attr]}']"

      if dataFilter == ''
        # Show all (except closed) if no filters set
        $('.flex-box.posting').filter(':hidden').show()
        hideClosed()
      else
        # Hide currently visible postings that no longer meet selections
        $('.flex-box.posting').not(':hidden').not(dataFilter).hide()
        # Show currently hidden postings that now meet selections
        $('.flex-box.posting').filter(':hidden').filter(dataFilter).show()
        # Hide closed postings unless 'closed' filter selected
        hideClosed() unless data['status'] == 'closed'

$(document).ready(ready)
$(document).on('page:load', ready)
