import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SuccessAuthPage extends StatelessWidget {
  const SuccessAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AuthStyles.backgroundColor,
        ),
        body: SafeArea(
            child: Center(
          child: Column(children: [
            const SizedBox(height: 208),
            Text(
              'УСПЕШНО',
              style: AuthStyles.headlineStyle1,
            ),
            const SizedBox(height: 360),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80)),
                backgroundColor: AuthStyles.buttonColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                fixedSize: const Size(360, 56),
              ),
              onPressed: () => context.go('/'),
              child:
                  Text('Продолжим дальше?', style: AuthStyles.headlineStyle3),
            ),
          ]),
        )));
  }
}
