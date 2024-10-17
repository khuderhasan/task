import 'package:flutter/material.dart';
import 'package:flutter_task/core/services/dependency_injection/di.dart';
import 'package:flutter_task/taskapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(const TaskApp());
}
