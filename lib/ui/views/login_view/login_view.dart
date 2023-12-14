import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/enums/snack_bar_type.dart';
import 'package:todo/core/providers/auth_cubit/auth_cubit.dart';
import 'package:todo/ui/widgets/logo.dart';
import 'package:todo/ui/widgets/snack_bar_alert_widget.dart';

import 'widgets/form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: _validateState,
          child: const SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
            child: Column(
              children: [
                Logo(),
                SizedBox(height: 100),
                FormLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateState(BuildContext context, AuthState state) {
    if (state is AuthError) {
      SnackBarFloating.show(
        message: state.message,
        context: context,
        snackBarType: SnackBarType.error,
      );
      return;
    }

    if (state is AuthSuccess) {
      Navigator.of(context).pushReplacementNamed('home');
      return;
    }
  }
}
