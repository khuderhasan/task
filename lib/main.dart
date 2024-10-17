import 'package:flutter/material.dart';
import 'core/services/dependency_injection/di.dart';
import 'taskapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(const TaskApp());
}
