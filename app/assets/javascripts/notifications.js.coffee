(($) ->
  $.ajaxSetup({
      global: true
    })

  $(document).ajaxComplete (event, xhr, ajaxOptions, thrownError) ->
    if xhr.responseJSON
      if xhr.responseJSON.error_message != '' && typeof(xhr.responseJSON.error_message) != 'undefined' 
        $.notify(xhr.responseJSON.error_message, 'error')

      if xhr.responseJSON.success_message != '' && typeof(xhr.responseJSON.success_message) != 'undefined' 
        alert 'Success: ' + xhr.responseJSON.success_message
    return
  
) jQuery