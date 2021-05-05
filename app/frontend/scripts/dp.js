jQuery(function() {

  function parseISOString(s) {
    var b = s.split(/\D+/);
    return new Date(b[0], --b[1], b[2], b[3], b[4], b[5], b[6]);
  }

  var dp = $('#datepick').datepicker().data('datepicker');
  var today = new Date();
  var datetime = parseISOString($('#event_datetime').val()); 

  if ( $('#event_datetime').val() == '' ) {
    dp.selectDate(today);
    $('#event_datetime').val($('#datepick').val());
  } else { dp.selectDate(datetime) }  
  
  $('#datepick').datepicker({
      onSelect: function onSelect() {
        $('#event_datetime').val($('#datepick').val());
      }
    })
});
