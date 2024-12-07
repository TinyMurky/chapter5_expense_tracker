import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { work, leisure, travel, food }

class Expense {
  /// id is UUID
  final String id;
  final DateTime date;
  final String title;
  final double amount;
  final Category category;

  Expense({
    required this.date,
    required this.title,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();
}
