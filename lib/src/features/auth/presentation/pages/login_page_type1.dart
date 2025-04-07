import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/login_form_type1.dart';

class LoginPageType1 extends StatelessWidget {
  const LoginPageType1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - Type 1'),
      ),
      body: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: const LoginFormType1(),
      ),
    );
  }
}