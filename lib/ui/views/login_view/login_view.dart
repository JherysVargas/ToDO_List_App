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
          listenWhen: (_, current) {
            return current.status == AuthStatus.error ||
                current.status == AuthStatus.success;
          },
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
    if (state.status == AuthStatus.error) {
      SnackBarFloating.show(
        message: 'Error al iniciar sesión',
        context: context,
        type: SnackBarType.error,
      );
      return;
    }

    if (state.status == AuthStatus.success) {
      Navigator.of(context).pushReplacementNamed('taskList');
      return;
    }
  }
}
