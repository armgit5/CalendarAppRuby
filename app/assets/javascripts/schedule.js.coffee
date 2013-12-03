# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->  
  $('#schedule_location').parent().hide()
  states = $('#schedule_location').html()
  $('#schedule_customer').change ->
    country = $('#schedule_customer option:selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    
    if options
      $('#schedule_location').html(options)
      $('#schedule_location').parent().show()
      
    else
      $('#schedule_location').empty()
      $('#schedule_location').parent().hide()