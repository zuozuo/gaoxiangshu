$(document).on 'turbolinks:load', ->
  setTimeout ->
    $('.alert').fadeOut('fast')
  , 2000
