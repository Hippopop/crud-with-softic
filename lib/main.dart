import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/my_app.dart';
import 'src/helpers/initializer.dart' as initializer;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await initializer.init(prefs);
  runApp(const MyApp());
}
