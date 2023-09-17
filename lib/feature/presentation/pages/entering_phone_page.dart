import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class EnteringPhonePage extends StatefulWidget {
  static const Key phoneInputKey = Key('EnteringPhonePage_phoneInputKey');
  static const Key letsStartButtonKey =
      Key('EnteringPhonePage_letsStartButtonKey');
  const EnteringPhonePage({super.key});

  @override
  State<EnteringPhonePage> createState() => _EnteringPhonePageState();
}

class _EnteringPhonePageState extends State<EnteringPhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 10, 0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 109,
                    ),
                    const ImageIcon(
                      AssetImage('assets/icons/closecancel.png'),
                    ),
                    const SizedBox(height: 129),
                    const Text('АВТОРИЗАЦИЯ'),
                    const SizedBox(height: 16),
                    const Text('Введите Ваш номер'),
                    const Text('Мы вышлем Вам код'),
                    const Padding(
                      padding: EdgeInsets.only(right: 264.14),
                      child: Text(
                        'Телефон*',
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AuthStyles.buttonColor)),
                      onPressed: () => context.go('/otp'),
                      child: const Text('Начнем!'),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
