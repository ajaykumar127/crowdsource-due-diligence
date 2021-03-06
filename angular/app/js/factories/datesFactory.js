doesItSuck.factory('datesFactory', datesFactory);

function datesFactory() {

  return {
     getTwitterDates: function(dateRange){
      var today = new Date();
      var dates = [];
      var newDay;
      var dd, mm, yyyy;
      for (i=0; i<dateRange.length; i++){
        newDay = new Date();
        newDay.setDate(today.getDate() - dateRange[i]);
        dd = newDay.getDate();
        mm = newDay.getMonth()+1; //January is 0!
        yyyy = newDay.getFullYear();
        if(dd<10) { dd='0'+dd;}
        if(mm<10) {mm='0'+mm;}
        dates.push(yyyy+'-'+mm+'-'+dd);
      }
      return dates;
    }
  };
}
