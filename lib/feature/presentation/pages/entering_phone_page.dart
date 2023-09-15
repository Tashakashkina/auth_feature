import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnteringPhonePage extends StatelessWidget {
  const EnteringPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AuthStyles.buttonColor)),
              onPressed: () => context.go('/otp'),
              child: Text('Начнем!'),
            ),
          ]),
        ));
  }
}
