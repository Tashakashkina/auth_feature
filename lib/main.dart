import 'package:auth_feature/feature/presentation/bloc/bloc/token/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'feature/presentation/pages/entering_otp_page.dart';
import 'feature/presentation/pages/entering_phone_page.dart';
import 'feature/presentation/pages/success_auth_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const BlocNavigate(),
      routes: <RouteBase>[
        GoRoute(
          path: 'phone',
          builder: (BuildContext context, GoRouterState state) =>
              const EnteringPhonePage(),
          routes: <RouteBase>[
            GoRoute(
              path: 'otp',
              builder: (BuildContext context, GoRouterState state) =>
                  const EnteringOtpPage(),
              routes: <RouteBase>[
                GoRoute(
                    path: 'success',
                    builder: (BuildContext context, GoRouterState state) =>
                        SuccessAuthPage()),
              ],
            ),
          ],
        )
      ])
]);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>()..add(CheckAuthToken()),
      lazy: false,
      child: MaterialApp.router(
        routerConfig: _router,
        theme: ThemeData(shadowColor: const Color.fromRGBO(243, 243, 243, 1)),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class BlocNavigate extends StatefulWidget {
  const BlocNavigate({Key? key}) : super(key: key);

  @override
  State<BlocNavigate> createState() => _BlocNavigateState();
}

class _BlocNavigateState extends State<BlocNavigate> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthCompleted) {
          context.go('/otp/phone/success');
        } else {
          context.go('/phone');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
