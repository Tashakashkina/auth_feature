import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessAuthPage extends StatelessWidget {
  const SuccessAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AuthStyles.backgroundColor,
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AuthStyles.buttonColor)),
              onPressed: () => context.go('/'),
              child: const Text('Продолжим дальше?'),
            ),
          ]),
        ));
  }
}
