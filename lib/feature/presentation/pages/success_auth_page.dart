import 'package:auth_feature/feature/domain/usecases/clear_storage.dart';
import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/bloc/token/auth_bloc.dart';

class SuccessAuthPage extends StatefulWidget {
  SuccessAuthPage({super.key});

  @override
  State<SuccessAuthPage> createState() => _SuccessAuthPageState();
}

class _SuccessAuthPageState extends State<SuccessAuthPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              fixedSize: const Size(360, 56),
            ),
            onPressed: () {
              context.read<AuthBloc>().add(ClearTokenStorage());
            },
            child: Text('LogOut', style: AuthStyles.headlineStyle3),
          ),
        ]),
      )),
    );
  }
}
