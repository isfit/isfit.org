$ ->
  twttr.ready ->
    renderTimelines()
    $(document).on 'page:change', renderTimelines

renderTimelines = ->
  $('.twitter-timeline-container').each ->
    $container = $(this)
    widgetId = $container.data 'widget-id'
    widgetOptions = $container.data 'widget-options'

    $container.empty()
    twttr?.widgets.createTimeline widgetId, $container[0], null, widgetOptions