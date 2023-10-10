import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/datasources/auth_feature_remote_data_source.dart';

class SuccessAuthPage extends StatelessWidget {
  const SuccessAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AuthStyles.backgroundColor,
        ),
        body: SafeArea(
            child: Center(
          child: Column(children: [
            const SizedBox(height: 208),
            Text(
              'УСПЕШНО',
              style: AuthStyles.headlineStyle1,
            ),
            const SizedBox(height: 360),
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
                AuthFeatureRemoteDataSourceImpl(auth)
                    .clearStorage()
                    .then((value) => context.go('/'));
              },
              child: Text('LogOut', style: AuthStyles.headlineStyle3),
            ),
          ]),
        )));
  }
}
