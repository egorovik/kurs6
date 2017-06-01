ajax_post_city_fill = (e) ->
  selectedCity = $(this).val()
  $.ajax
    url: '/city_fill',
    type: 'POST',
    dataType: 'script',
    data: {
      city_id: +$(this).val()
    },
    error: (jqXHR, textStatus, errorThrown) ->
      console.log("AJAX Error: #{textStatus}")
    success: (data, textStatus, jqXHR) ->
      console.log("Ajax succeed!")

hidden_fields = ->
  if ($("#edit_excursions").length > 0)
    $(".hidden-edit").remove()
  else
    $(".hidden-new").remove()


insert_form = ->
  f = $("#city-fieldset").attr("data-content")
  if ($('#city_select').val() == '' || $("#edit_excursions").length > 0)
    $("#city-fields").html(f)
    hidden_fields()
  else
    $("#city-fields").html("Выбран существующий город")

excursion_ready = ->
  insert_form()
  $('#city_select').on 'change', insert_form

$(document).on 'page:load', excursion_ready
$(document).on 'turbolinks:load', excursion_ready
$(document).ready excursion_ready
