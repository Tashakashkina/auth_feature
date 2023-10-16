import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EnteringPhonePage extends StatefulWidget {
  const EnteringPhonePage({super.key});

  @override
  State<EnteringPhonePage> createState() => _EnteringPhonePageState();
}

class _EnteringPhonePageState extends State<EnteringPhonePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

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
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    style: AuthStyles.headlineStyle2,
                    keyboardType: TextInputType.number,
                    controller: email,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: AuthStyles.headlineStyle2,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 202),
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
                  context.go('/phone/otp');
                  email.clear();
                },
                child: Text('Начнем!', style: AuthStyles.headlineStyle3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
