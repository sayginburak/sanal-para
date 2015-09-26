# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    project_count = $('select').length
    if project_count < 10
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time))
      $('select').select2({
        placeholder:"Yatırım yapmak istediğiniz projeyi seçiniz.",
        allowClear:true,
        width:'330px'})
      event.preventDefault()
    else if !$(".max-invest-warn").length > 0
        $(this).before("<div class='max-invest-warn' style='color:red;'>En fazla 10 şirkete yatırım yapılabilir.</div>")


$(document).ready(ready)
$(document).on('page:load', ready)