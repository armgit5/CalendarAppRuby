# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->  
  $('#schedule_location_id').parent().hide()
  states = $('#schedule_location_id').html()
  $('#schedule_company_id').change ->
    country = $('#schedule_company_id option:selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    
    if options
      $('#schedule_location_id').html(options)
      $('#schedule_location_id').parent().show()
      
    else
      $('#schedule_location_id').empty()
      $('#schedule_location_id').parent().hide()