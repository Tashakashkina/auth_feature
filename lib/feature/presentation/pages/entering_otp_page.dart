import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnteringOtpPage extends StatelessWidget {
  static const Key otpInputKey = Key('OtpPhonePage_otpInputKey');
  static const Key sendButtonKey = Key('EnteringOtpPage_sendButtonKey');

  const EnteringOtpPage({super.key});

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
              const SizedBox(height: 129),
              Text('МЫ ОТПРАВИЛИ ВАМ КОД', style: AuthStyles.headlineStyle1),
              const SizedBox(height: 26),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
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
                  maxLength: 4,
                  style: AuthStyles.headlineStyle2,
                  key: EnteringOtpPage.otpInputKey,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: "",
                    labelText: 'Код из SMS',
                    labelStyle: AuthStyles.headlineStyle2,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 259),
              ElevatedButton(
                key: EnteringOtpPage.sendButtonKey,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  backgroundColor: AuthStyles.buttonColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  fixedSize: const Size(360, 56),
                ),
                onPressed: () => context.go('/otp/success'),
                child: const Text('Отправить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

          
// onPressed: () => context.go('/otp/success'),
//               child: const Text('Отправить'),