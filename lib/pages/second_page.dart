import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/colors_manager.dart';
import '../core/services/connectivity/connectivity_cubit.dart';
import 'first_page.dart';

class SecondPage extends StatelessWidget {
  static const routeName = '/second_page';
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: BlocBuilder<ConnectionCubit, ConnectivityState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: (state.connectionType == 'Not Connected')
                            ? ColorsManager.customRed
                            : ColorsManager.customGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Connection Type : ${state.connectionType}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: (!state.vpnConnected!)
                              ? ColorsManager.customRed
                              : ColorsManager.customGreen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('VPN Connected : ${state.vpnConnected} ')),
                    const SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(FirstPage.routeName),
                        child: const Text('To Screen 1'))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
