$ ->
   $('.datepicker').datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: 'dd/mm/yy'
        });

   dt = new Date($.now())
   $('#application-timer').html(dt.getDate()+"/"+dt.getMonth()+"/"+dt.getFullYear()+" "+dt.getHours()+":"+dt.getMinutes())
