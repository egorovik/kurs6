ajax_post_route_fill = (e) ->
  selectedRoute = $(this).val()
  $.ajax
    url: '/route_fill',
    type: 'POST',
    dataType: 'script',
    data: {
      route_id: +$(this).val()
    },
    error: (jqXHR, textStatus, errorThrown) ->
      console.log("AJAX Error: #{textStatus}")
    success: (data, textStatus, jqXHR) ->
      console.log("Ajax succeed!")
      
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
  if ($("#edit_tours").length > 0)
    $(".hidden-edit").remove()
  else
    $(".hidden-new").remove()

insert_city_form = ->
  f = $("#city-fieldset").attr("data-content")
  if ($('#city_select').val() == '' || $("#edit_routes").length > 0)
    $("#city-fields").html(f)
    hidden_fields()
  else
    $("#city-fields").html("Выбран существующий город")

insert_form = ->
  f = $("#route-fieldset").attr("data-content")
  if ($('#route_select').val() == '' || $("#edit_tours").length > 0)
    $("#route-fields").html(f)
    insert_city_form()
    hidden_fields()
  else
    $("#route-fields").html("Выбран существующий маршрут")

tour_ready = ->
  insert_form()
  $('#route_select').on 'change', insert_form
  $('#city_select').on 'change', insert_city_form

$(document).on 'page:load', tour_ready
$(document).on 'turbolinks:load', tour_ready
$(document).ready tour_ready
