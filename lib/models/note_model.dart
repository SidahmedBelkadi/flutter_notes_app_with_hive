import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  NoteModel({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });

  String get formattedDate {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('MMMM dd, yyyy').format(dateTime);
    String formattedTime = DateFormat('HH:mm').format(dateTime); // Hour and minute
    return '$formattedDate - $formattedTime';
  }
}
