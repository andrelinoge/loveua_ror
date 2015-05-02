class InitialRegistration
	constructor: (@redirect_on_success) ->

		$.ajaxSetup({
		  dataType: 'json'
		})

		$('#initial_registration').on('ajax:success', (e, data, status, xhr) =>
			window.location = @redirect_on_success
		)
		.on('ajax:error', (e, data, status, xhr) ->
			$(this).render_form_errors('initial_registration_form', data.responseJSON)
		)

window.InitialRegistration = InitialRegistration