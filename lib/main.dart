import 'dart:async';
import 'package:auth_feature/feature/presentation/bloc/bloc/token/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/presentation/pages/entering_phone_page.dart';
import 'feature/presentation/pages/success_auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>()..add(CheckAuthToken()),
      lazy: false,
      child: MaterialApp(
        initialRoute:
            FirebaseAuth.instance.currentUser == null ? 'phone' : 'success',
        routes: {
          'phone': (context) => const EnteringPhonePage(),
          'success': (context) => const SuccessAuthPage(),
        },
        theme: ThemeData(shadowColor: const Color.fromRGBO(243, 243, 243, 1)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
