/* 
 * Basic model of a task.
 */

class Task {
  final String date;
  final String text;
  final int colorCode;

  Task({this.date, this.text, this.colorCode});

  toJson() {
    return {date: date, text: text, colorCode: colorCode};
  }
}
