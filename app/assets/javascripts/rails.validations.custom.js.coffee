clientSideValidations.validators.remote['email'] = (element, options) ->
  if $.ajax({
    url: '/validators/email.json',
    data: { email: element.val() },
    async: false
  }).status == 404
    return options.message || 'невалиден e-mail формат'
