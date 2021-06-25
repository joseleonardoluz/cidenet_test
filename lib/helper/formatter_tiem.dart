import 'package:intl/intl.dart';

class FormatterTime{
  
   String dateFormatted;
   String timeNew;

  String dateFormat(DateTime dateEpisode) {
    if (dateEpisode == null) {
      dateFormatted = ' ';
      return dateFormatted;
    }
    DateFormat dateFormat = DateFormat('d MMM. y');
    dateFormat.format(dateEpisode);
    this.dateFormatted = dateFormat.format(dateEpisode);
    this.dateFormatted = this.dateFormatted;
    return dateFormatted;
  }

  String timeFormat(DateTime dateEpisode) {
    if (dateEpisode == null) {
      dateFormatted = ' ';
      return dateFormatted;
    }
    DateFormat dateFormat = DateFormat('dd MMM. y hh:mm:ss');
    dateFormat.format(dateEpisode);
    this.dateFormatted = dateFormat.format(dateEpisode);
    return dateFormatted;
  }

  String durationEpisode(Duration durationEpisode) {
    if (durationEpisode == null) {
      timeNew = ' ';
      return timeNew;
    } else {
      num hour = durationEpisode.inHours.remainder(60);
      num minute = durationEpisode.inMinutes.remainder(60);
      this.timeNew = convertToString(hour, minute);
      return ' | ' + timeNew;
    }
  }

  convertToString(num hour, num minute) {
    if (hour <= 0) {
      return minute.toString() + ' min';
    } else if (hour > 0 && hour < 10) {
      hour = hour;
      return hour.toString() + ' h';
    }
    // hour >= 10
    else {
      return hour.toString() + ' h';
    }
  }
  
}