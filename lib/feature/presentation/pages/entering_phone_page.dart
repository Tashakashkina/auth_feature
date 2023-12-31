import 'package:auth_feature/feature/presentation/bloc/bloc/token/auth_bloc.dart';
import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:auth_feature/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnteringPhonePage extends StatefulWidget {
  const EnteringPhonePage({super.key});

  @override
  State<EnteringPhonePage> createState() => _EnteringPhonePageState();
}

class _EnteringPhonePageState extends State<EnteringPhonePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
      ),
      body: BlocProvider(
        create: (context) => sl<AuthBloc>()..add(CheckAuthToken()),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const ImageIcon(
                  AssetImage('assets/icons/closecancel.png'),
                ),
                const SizedBox(height: 69),
                Text('АВТОРИЗАЦИЯ', style: AuthStyles.headlineStyle1),
                const SizedBox(height: 20),
                Text('Введите Ваш номер', style: AuthStyles.headlineStyle2),
                Text('Мы вышлем Вам код', style: AuthStyles.headlineStyle2),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 264.14),
                  child: Text('Email', style: AuthStyles.headlineStyle2),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(129, 128, 125, 0.2),
                            blurRadius: 15.0,
                            spreadRadius: 0.0,
                            offset: Offset(0, 7),
                            blurStyle: BlurStyle.normal)
                      ]),
                  child: TextFormField(
                    style: AuthStyles.headlineStyle2,
                    keyboardType: TextInputType.emailAddress,
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
                const SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.only(right: 264.14),
                  child: Text('Пароль', style: AuthStyles.headlineStyle2),
                ),
                const SizedBox(height: 20),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(129, 128, 125, 0.2),
                              blurRadius: 15.0,
                              spreadRadius: 0.0,
                              offset: Offset(0, 7),
                              blurStyle: BlurStyle.normal)
                        ]),
                    child: TextFormField(
                      style: AuthStyles.headlineStyle2,
                      keyboardType: TextInputType.visiblePassword,
                      controller: password,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                const SizedBox(height: 169),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    backgroundColor: AuthStyles.buttonColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    fixedSize: const Size(360, 56),
                  ),
                  onPressed: () async {
                    context.read<AuthBloc>().add(GetTokenFromFirebase(
                        email: email.text, password: password.text));
                    Navigator.pushNamed(context, 'success');
                  },
                  child: Text('Начнем!', style: AuthStyles.headlineStyle3),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
