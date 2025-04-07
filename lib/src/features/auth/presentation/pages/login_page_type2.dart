import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/login_form_type2.dart';

class LoginPageType2 extends StatelessWidget {
  const LoginPageType2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - Type 2'),
      ),
      body: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: const LoginFormType2(),
      ),
    );
  }
}