import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 79,
                ),
                const ImageIcon(
                  AssetImage('assets/icons/closecancel.png'),
                ),
                const SizedBox(height: 119),
                Text('АВТОРИЗАЦИЯ', style: AuthStyles.headlineStyle1),
                const SizedBox(height: 16),
                Text('Введите Ваш номер', style: AuthStyles.headlineStyle2),
                Text('Мы вышлем Вам код', style: AuthStyles.headlineStyle2),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(right: 264.14),
                  child: Text('Телефон*', style: AuthStyles.headlineStyle2),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(195, 186, 176, 0.2),
                            blurRadius: 15.0,
                            spreadRadius: 0.0,
                            offset: Offset(0, 7),
                            blurStyle: BlurStyle.normal)
                      ]),
                  child: TextField(
                    maxLength: 10,
                    style: AuthStyles.headlineStyle2,
                    key: EnteringPhonePage.phoneInputKey,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: "",
                      prefix: const Text('+7'),
                      prefixStyle: AuthStyles.headlineStyle2,
                      labelText: '+7',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: AuthStyles.headlineStyle2,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 202),
                ElevatedButton(
                  key: EnteringPhonePage.letsStartButtonKey,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    backgroundColor: AuthStyles.buttonColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    fixedSize: const Size(360, 56),
                  ),
                  onPressed: () => context.go('/otp'),
                  child: Text('Начнем!', style: AuthStyles.headlineStyle3),
                ),
              ],
            ),
          ),
        ));
  }
}
