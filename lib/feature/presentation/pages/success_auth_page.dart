import 'package:auth_feature/feature/presentation/bloc/bloc/token/auth_bloc.dart';
import 'package:auth_feature/feature/presentation/utils/styles.dart';
import 'package:auth_feature/profile_feature/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../../injection_container.dart';

class SuccessAuthPage extends StatefulWidget {
  const SuccessAuthPage({
    super.key,
  });

  @override
  State<SuccessAuthPage> createState() => _SuccessAuthPageState();
}

class _SuccessAuthPageState extends State<SuccessAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AuthStyles.backgroundColor,
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<AuthBloc>()..add(CheckAuthToken()),
            ),
            BlocProvider(
              create: (context) => sl<ProfileBloc>()..add(GetUserEvent()),
            ),
          ],
          child: SafeArea(
              child: Center(
            child: Column(children: [
              const SizedBox(height: 180),
              Text(
                'УСПЕШНО',
                style: AuthStyles.headlineStyle1,
              ),
              const SizedBox(height: 100),
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
                if (state is ProfileLoaded) {
                  return Card(
                      child: ListTile(
                    title: Text(state.data.uid!),
                    subtitle: Text(state.data.email!),
                    trailing: Text(state.data.time!.toString()),
                  ));
                }
                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Text('нет данных');
                }
              }),
              const SizedBox(height: 200),
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
          )),
        ));
  }
}
