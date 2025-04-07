import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/login_form_type3.dart';

class LoginPageType3 extends StatelessWidget {
  const LoginPageType3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - Type 3'),
      ),
      body: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: const LoginFormType3(),
      ),
    );
  }
}