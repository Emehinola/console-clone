class ConsoleService{
  // process readable date
  static String processReadableDate(dynamic date) {
    try {

      DateTime? realDate = DateTime.parse(date);

      Map<String, String> monthsMap = {
        '1': 'January',
        '2': 'February',
        '3': 'March',
        '4': 'April',
        '5': 'May',
        '6': 'June',
        '7': 'July',
        '8': 'August',
        '9': 'September',
        '10': 'October',
        '11': 'November',
        '12': 'December',
      };

      return "${realDate.day} ${monthsMap[realDate.month.toString()]}, ${realDate.year}";
    } catch (e) {
      //
    }
    return "";
  }
}