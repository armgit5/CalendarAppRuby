jQuery(function() {
  var states;
  $('#schedule_location_id').parent().hide();
  states = $('#schedule_location_id').html();
  return $('#schedule_company_id').change(function() {
    var country, escaped_country, options;
    country = $('#schedule_company_id option:selected').text();
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(states).filter("optgroup[label='" + escaped_country + "']").html();
    if (options) {
      $('#schedule_location_id').html(options);
      return $('#schedule_location_id').parent().show();
    } else {
      $('#schedule_location_id').empty();
      return $('#schedule_location_id').parent().hide();
    }
  });
});