   $(document).ready(function(){
    var options ={
      sideBySide: true,
      format: "YYYY-MM-DD HH:mm",
      locale: 'fr',
      minDate: moment(),
    };
         $('#datetimepicker1').datetimepicker(options);
         $('#datetimepicker2').datetimepicker(options);
         $('#datetimepicker3').datetimepicker(options);

    });
