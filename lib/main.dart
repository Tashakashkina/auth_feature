import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'feature/presentation/pages/entering_otp_page.dart';
import 'feature/presentation/pages/entering_phone_page.dart';
import 'feature/presentation/pages/success_auth_page.dart';

void main() => runApp(const MyApp());
final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
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
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(shadowColor: const Color.fromRGBO(243, 243, 243, 1)),
      debugShowCheckedModeBanner: false,
    );
  }
}
