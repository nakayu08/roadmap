import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import timeGridPlugin from '@fullcalendar/timegrid';

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ,timeGridPlugin],
    
      //細かな表示設定
      locale: 'ja',
      timeZone: 'Asia/Tokyo',
      firstDay: 1,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek'
        //right: 'month agendaWeek agendaDay'
      },
      weekends: true,
      buttonIcons: false, // show the prev/next text
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      expandRows: true,
      stickyHeaderDates: true,
      buttonText: {
         today: '今日',
         prev:     '<', // <
         next:     '>', // >
         month:    '月',
         week:     '週',
         day:      '日'
      }, 
      allDayText: '終日',
      height: window.innerHeight - 100, // ①
      windowResize: function () { // ②
        $('#calendar').fullCalendar('option', 'height', window.innerHeight - 100);
      },
      events: '/tasks.json', 
  });

  calendar.render();


  $(".error").click(function(){
    calendar.refetchEvents();
});
});


