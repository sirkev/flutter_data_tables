import 'package:intl/intl.dart';

List<String> days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];
List<String> workingHours = [
  '9.00am - 17.00pm',
  '18:00am - 22:00pm',
];
List<String> staff = [
  'Staff 1',
  'Staff 2',
  'Staff 3',
  'Staff 4',
  'Staff 5',
  'Staff 6',
  'Staff 7',
];

List<String> staffNames = [
  'Jordan Anatol',
  'Wendy Smith',
];

List<DateTime> dates = [
  DateTime(2023, 1, 1),
  DateTime(2023, 1, 2),
  DateTime(2023, 1, 3),
  DateTime(2023, 1, 4),
  DateTime(2023, 1, 5),
  DateTime(2023, 1, 6),
  DateTime(2023, 1, 7),
];

Map<String, dynamic> getEmployees() {
  return {
    "employees": [
      {
        "name": 'wendy smith',
        "avatarUrl": "https://38m73l2s.twic.pics/barber.png?twic=v1/resize=400",
        "workingHours": {
          '2023-04-16': [
            '10:00 - 14:00',
            '17:00 - 22:00',
            '17:00 - 22:00',
            '17:00 - 22:00',
            '17:00 - 22:00',
            '17:00 - 22:00',
            '17:00 - 22:00',
          ],
          '2023-04-17': ['09:00 - 17:00'],
          '2023-04-18': ['09:00 - 17:00'],
          '2023-04-19': ['09:00 - 17:00'],
          '2023-04-20': ['09:00 - 17:00'],
          '2023-04-21': ['09:00 - 17:00'],
          '2023-04-22': ['09:00 - 17:00'],
        },
      },
      {
        "name": 'Jordan Anatol',
        "avatarUrl": "https://38m73l2s.twic.pics/barber.png?twic=v1/resize=400",
        "workingHours": {
          '16-04-2023': [
            '10:00 - 14:00',
            '17:00 - 22:00',
            '17:00 - 22:00',
            '17:00 - 22:00',
            '17:00 - 22:00',
            '17:00 - 22:00',
            '17:00 - 22:00',
          ],
          '17-04-2023': ['09:00 - 17:00'],
          '18-04-2023': ['09:00 - 17:00'],
          '19-04-2023': ['09:00 - 17:00'],
          '20-04-2023': ['09:00 - 17:00'],
          '21-04-2023': ['09:00 - 17:00'],
          '22-04-2023': ['09:00 - 17:00'],
        },
      },
    ]
  };
}

//parse string to date
DateTime parseDate(String date) {
  DateTime parsedDate = DateTime.parse(date);
  return parsedDate;
}

//get weekday name from date data
String getWeekdayFromDate(DateTime workingDays) {
  String dateFormat = DateFormat('EEE,d,MMM').format(workingDays);
  return dateFormat;
}

//get working days and Parse to day, month, year
void getWorkingDays(Map<String, dynamic> workingHours) {
  workingHours.forEach((key, value) {
    String reversedKey = reverseDateFormats(key);
    DateTime parsedKeys = parseDate(reversedKey);
  });
}

//reverse date formats
String reverseDateFormats(String date) {
  date.split('').reversed.join('');
  return date;
}
