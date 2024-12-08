import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
// final formatter = DateFormat.yMd('zh_tw');
final formatter = DateFormat("yyyy/MM/dd");

enum Category { work, leisure, travel, food }

const Map<Category, IconData> categoryIconMap = {
  Category.work: Icons.work,
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie
};

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

  IconData get categoryIcon {
    return categoryIconMap[category] ?? Icons.help;
  }

  String get formattedDatetime {
    return formatter.format(date);
  }
}
