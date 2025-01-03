import 'package:intl/intl.dart';

class TimeUtils {
  // Phương thức tĩnh formatTime để định dạng thời gian theo yêu cầu
  static String formatTime(String dateString) {
    final DateTime now = DateTime.now();
    final DateTime inputDate = DateTime.parse(dateString);
    final Duration diff = now.difference(inputDate);

    // Nếu chưa quá 1 phút
    if (diff.inSeconds < 60) {
      return 'Now'; // Hiển thị "Now" nếu trong vòng 1 phút
    }
    // Nếu trong vòng 1 giờ
    else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} phút trước'; // Hiển thị số phút
    }
    // Nếu trong vòng 24 giờ
    else if (diff.inHours < 24) {
      return DateFormat('HH:mm').format(inputDate); // Hiển thị giờ
    }
    // Nếu quá 24 giờ nhưng chưa qua 1 tháng
    else if (diff.inDays < 30) {
      return DateFormat('dd MMM').format(inputDate); // Hiển thị ngày
    }
    // Nếu quá 1 tháng
    else {
      int month = inputDate.month;
      String monthString =
          "Th" + month.toString().padLeft(2, '0'); // Thêm "Th" vào tháng
      return DateFormat('dd').format(inputDate) + " " + monthString;
    }
  }
}
