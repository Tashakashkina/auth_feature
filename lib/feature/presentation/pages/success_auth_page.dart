import 'package:auth_feature/feature/presentation/bloc/bloc/token/auth_bloc.dart';
import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:auth_feature/profile_feature/presentation/bloc/profile_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../../injection_container.dart';
import '../../../profile_feature/domain/entities/user.dart';

class SuccessAuthPage extends StatefulWidget {
  const SuccessAuthPage({
    super.key,
  });

  @override
  State<SuccessAuthPage> createState() => _SuccessAuthPageState();
}

class _SuccessAuthPageState extends State<SuccessAuthPage> {
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AuthStyles.backgroundColor,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return SafeArea(
              child: Center(
            child: Column(children: [
              const SizedBox(height: 180),
              Text(
                'УСПЕШНО',
                style: AuthStyles.headlineStyle1,
              ),
              const SizedBox(height: 100),
              //
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return Card(
                        child: ListTile(
                      title: Text('uid'),
                      subtitle: Text(user!.email!),
                      trailing: Text('time'),
                    ));
                  }),
              const SizedBox(height: 130),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  backgroundColor: AuthStyles.buttonColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  fixedSize: const Size(360, 56),
                ),
                onPressed: () async {
                  context.read<AuthBloc>().add(ClearTokenStorage());
                  Navigator.pushNamed(context, 'phone');
                },
                child: Text('LogOut', style: AuthStyles.headlineStyle3),
              ),
            ]),
          ));
        },
      ),
    );
  }
}
