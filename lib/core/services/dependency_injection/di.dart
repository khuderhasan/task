import 'package:flutter_task/core/services/connectivity/connectivity_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  getIt.registerSingleton<ConnectionCubit>(ConnectionCubit());
}
