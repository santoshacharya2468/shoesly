import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/di/di_config.dart';
import 'package:shoesly/core/widget/app_starter_page.dart';
import 'package:shoesly/firebase_options.dart';
import 'package:shoesly/seeder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  await getIt<DatabaseSeeder>().seedReviews();
  runApp(const AppStarter());
}
