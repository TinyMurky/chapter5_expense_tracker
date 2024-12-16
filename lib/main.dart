import 'package:flutter/material.dart';

import 'package:chapter5_expense_tracker/widgets/expenses.dart';

const expenseTrackerApp = MaterialApp(
  home: Expenses(),
);

void main() {
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  ExpenseTrackerApp({super.key});

  // 一般Theme global會用k放在開頭
  final ColorScheme kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 72, 201, 176),
  );

  final ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 14, 102, 85),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Expenses(),
      themeMode: ThemeMode.system, // 預設就是system
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
        datePickerTheme: const DatePickerThemeData().copyWith(
          headerHeadlineStyle: const TextStyle(fontSize: 12),
        ),

        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),

        textTheme: const TextTheme().copyWith(
          titleLarge: ThemeData.dark().textTheme.titleLarge?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: kDarkColorScheme.onSecondaryContainer,
              ),
          bodyLarge: ThemeData.dark().textTheme.bodyLarge?.copyWith(fontSize: 12),
          bodyMedium: ThemeData.dark().textTheme.bodyMedium?.copyWith(fontSize: 10),
          bodySmall: ThemeData.dark().textTheme.bodySmall?.copyWith(fontSize: 8),
          labelLarge: ThemeData.dark().textTheme.labelLarge?.copyWith(fontSize: 12),
          labelMedium:
              ThemeData.dark().textTheme.labelMedium?.copyWith(fontSize: 10),
          labelSmall: ThemeData.dark().textTheme.labelSmall?.copyWith(fontSize: 8),
        ),
        // elevatedButtonTheme "default" is not copy from but "style from"
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                  fontSize: 10, // 覆蓋 ElevatedButton 的字體大小
                ),
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer
          ),
        ),
      ),
      // 不要直接把設定放在ThemeData, 不然其實要implement所有setting
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        // 使用copyWith 才可以保留預設的style
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
        datePickerTheme: const DatePickerThemeData().copyWith(
          headerHeadlineStyle: const TextStyle(fontSize: 12),
        ),

        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),

        textTheme: const TextTheme().copyWith(
          titleLarge: ThemeData().textTheme.titleLarge?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
              ),
          bodyLarge: ThemeData().textTheme.bodyLarge?.copyWith(fontSize: 12),
          bodyMedium: ThemeData().textTheme.bodyMedium?.copyWith(fontSize: 10),
          bodySmall: ThemeData().textTheme.bodySmall?.copyWith(fontSize: 8),
          labelLarge: ThemeData().textTheme.labelLarge?.copyWith(fontSize: 12),
          labelMedium:
              ThemeData().textTheme.labelMedium?.copyWith(fontSize: 10),
          labelSmall: ThemeData().textTheme.labelSmall?.copyWith(fontSize: 8),
        ),
        // elevatedButtonTheme "default" is not copy from but "style from"
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                  fontSize: 10, // 覆蓋 ElevatedButton 的字體大小
                ),
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer
          ),
        ),
      ),
    );
  }
}
