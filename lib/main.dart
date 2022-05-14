// ignore_for_file: use_key_in_widget_constructors, unnecessary_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hiveone/app/data/db/database.dart';

import 'app/routes/app_pages.dart';

import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NotesAdapter());

  await Hive.openBox<Notes>('notes');

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
