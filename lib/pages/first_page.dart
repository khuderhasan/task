import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/services/connectivity/connectivity_cubit.dart';
import 'package:flutter_task/pages/second_page.dart';

class FirstPage extends StatelessWidget {
  static const routeName = '/first_page';
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
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
                    Text('Connection Type : ${state.connectionType}'),
                    const SizedBox(height: 50),
                    Text('VPN Connected : ${state.vpnConnected} '),
                    const SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(SecondPage.routeName),
                        child: const Text('To Screen 2'))
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
