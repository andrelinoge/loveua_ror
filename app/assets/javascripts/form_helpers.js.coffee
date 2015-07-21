(($) ->
  $.fn.render_form_errors = (model_name, errors) ->
    form = this
    this.clear_form_errors()
    
    if typeof(errors) != 'undefined' && errors != ''
      $.each(errors, (field, messages) ->
        input = form.find('input, select, textarea').filter(->
          name = $(this).attr('name')

          composite_field_name = field.split('.');
          pattern = model_name + '\\[' + field + '\\(?'

          if (composite_field_name.length == 2)
            pattern = model_name + '\\[' + composite_field_name[0] + '_attributes\\]' + '\\[' + composite_field_name[1] + '\\(?'

          if name
            name.match(new RegExp(pattern))
        )

        if input.length
          input.closest('.form-group').addClass('has-error')
          input.parent().append('<span class="help-block">' + $.map(messages, (m) -> m.charAt(0).toUpperCase() + m.slice(1)).join('<br />') + '</span>')
      )

  $.fn.clear_form_errors = () ->
    this.find('.form-group').removeClass('has-error')
    this.find('span.help-block').remove()
) jQuery