/* Datepicker */
$(function() {
    var dates = $( "#from, #to " ).datepicker({
    prevText: 'Prev' ,
    nextText: 'Next',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    dateFormat: 'yy-mm-dd',
    showOtherMonths:true,
    showMonthAfterYear: true,
    changeMonth:true,
    yearSuffix: '년',
    minDate:'+1d',
    maxDate:'+3m',
    onSelect: function( selectedDate ) {
      var option = this.id == "from" ? "minDate" : "maxDate",
        instance = $( this ).data( "datepicker" ),
        date = $.datepicker.parseDate(
          instance.settings.dateFormat ||
          $.datepicker._defaults.dateFormat,
          selectedDate, instance.settings );
      dates.not( this ).datepicker( "option", option, date );
    }
    });
    $("#from").datepicker("setDate","+1d");
    $("#to").datepicker("setDate","+2d");
  });