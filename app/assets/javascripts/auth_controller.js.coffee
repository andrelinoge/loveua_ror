class AuthController
	constructor: (@redirect_on_success) ->
		$.ajaxSetup({
		  dataType: 'json'
		})

		$('form#login').on('ajax:success', (e, data, status, xhr) =>
			window.location = @redirect_on_success
		)
		.on('ajax:error', (e, data, status, xhr) ->
			$(this).render_form_errors('form#login', data.responseJSON)
		)

window.AuthController = AuthController