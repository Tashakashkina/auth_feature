import 'package:auth_feature/feature/presentation/bloc/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EnteringOtpPage extends StatefulWidget {
  const EnteringOtpPage({super.key});

  @override
  State<EnteringOtpPage> createState() => _EnteringOtpPageState();
}

class _EnteringOtpPageState extends State<EnteringOtpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController otpCode = TextEditingController();

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
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    maxLength: 4,
                    style: AuthStyles.headlineStyle2,
                    keyboardType: TextInputType.number,
                    controller: otpCode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Введите код из смс';
                      }
                      return null;
                    },
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
              ),
              const SizedBox(height: 259),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  backgroundColor: AuthStyles.buttonColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  fixedSize: const Size(360, 56),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.go('/otp/success');
                  }
                },
                child: const Text('Отправить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
