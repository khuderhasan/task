import 'package:get_it/get_it.dart';

import '../connectivity/connectivity_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  getIt.registerSingleton<ConnectionCubit>(ConnectionCubit());
}
