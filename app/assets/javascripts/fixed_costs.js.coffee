# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Realign links when a different type is selected.
window.set_link = () ->
	type_id = $("#fixed_cost_type_id").val();
	$( "#edit_type").attr("href", "/types/#{type_id}/edit" )
	$( "#destroy_type" ).attr("href", "/types/#{type_id}" )
