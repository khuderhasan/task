import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/services/dependency_injection/di.dart';
import 'package:flutter_task/core/globals.dart';
import 'package:flutter_task/core/routes.dart';
import 'package:flutter_task/core/services/connectivity/connectivity_cubit.dart';
import 'package:flutter_task/pages/first_page.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectionCubit>(
      create: (context) => getIt<ConnectionCubit>(),
      child: MaterialApp(
        title: 'Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FirstPage(),
        scaffoldMessengerKey: snackbarKey,
        routes: routes,
      ),
    );
  }
}
