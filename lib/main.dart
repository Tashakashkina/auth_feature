import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'feature/presentation/bloc/bloc/authentication/bloc/authentication_bloc.dart';
import 'feature/presentation/pages/entering_otp_page.dart';
import 'feature/presentation/pages/entering_phone_page.dart';
import 'feature/presentation/pages/success_auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

User? result = FirebaseAuth.instance.currentUser;
final GoRouter _router = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) =>
        const BlocNavigate(),
    routes: <RouteBase>[
      GoRoute(
        path: 'otp',
        builder: (BuildContext context, GoRouterState state) =>
            const EnteringOtpPage(),
        routes: <RouteBase>[
          GoRoute(
              path: 'success',
              builder: (BuildContext context, GoRouterState state) =>
                  const SuccessAuthPage()),
        ],
      ),
    ],
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(shadowColor: const Color.fromRGBO(243, 243, 243, 1)),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BlocNavigate extends StatelessWidget {
  const BlocNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return const SuccessAuthPage();
        } else {
          return const EnteringPhonePage();
        }
      },
    );
  }
}
