import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_application/constants/app_theme_colors.dart';
import 'package:to_do_application/constants/routes/app_pages.dart';
import 'package:to_do_application/constants/routes/app_routes.dart';
import 'package:to_do_application/widgets/pages/todo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppThemeColors.appThemeColor),
        useMaterial3: true,
      ),
      home: ToDoView(),
      initialRoute: AppRoutes.initial,
      getPages: AppPages.pages,
    );
  }
}
