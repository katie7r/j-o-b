$ ->
  # Expander for posting filters
  # expanderTrigger = $('#js-expander-trigger')
  # expanderContent = $('#js-expander-content')
  $('#js-expander-trigger').on 'click', ->
    $(this).toggleClass 'expander-hidden'
    # return

  # Filter postings on index
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
      # Show all if no filters set
      $('.flex-box.posting').filter(':hidden').show()
    else
      # Hide currently visible postings that no longer meet selections
      $('.flex-box.posting').not(':hidden').not(dataFilter).hide()
      # Show currently hidden postings that now meet selections
      $('.flex-box.posting').filter(':hidden').filter(dataFilter).show()

  # Convert suchTheString to such-the-string
  uncamel = (camelCaseString) ->
    camelCaseString.replace(/([a-z])([A-Z])/g, '$1-$2').toLowerCase()
