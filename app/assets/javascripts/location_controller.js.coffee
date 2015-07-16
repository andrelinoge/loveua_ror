class LocationController
  track_region_change: (@region_selector, @city_selector) ->
    $(@region_selector).on('change', (e) => 

      region_id = $(e.target).val()

      if region_id.length > 0 
        console.log @city_selector
        $(@city_selector).prop('disabled', false).load('/location/cities', { region_id: region_id }, (response, status, xhr) ->
          
          console.log('!!!')
        )
      else
        $(@city_selector).attr('disabled', true)
    )
    
window.LocationController = LocationController