import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sessions_ui_3/services/services.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context, listen: false);

    return Scaffold(
      body: Center(
          child: FutureBuilder(
              future: authService.readToken(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Espere');
                }
                Future.microtask(() {
                  Navigator.of(context).pushReplacementNamed('login');
                });
                return Container();
              })),
    );
  }
}
