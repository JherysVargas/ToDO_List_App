import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/helpers/validations_input.dart';
import 'package:todo/core/providers/auth_cubit/auth_cubit.dart';
import 'package:todo/ui/widgets/activity_indicator.dart';
import 'package:todo/ui/widgets/custom_button.dart';
import 'package:todo/ui/widgets/text_form_input.dart';

final injector = GetIt.instance;

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormInput(
            controller: _emailController,
            hintText: 'Correo electrónico',
            textInputAction: TextInputAction.done,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'El email es obligatorio';
              } else if (!ValidationInput.validateEmail(value)) {
                return 'Formato inválido';
              }
              return null;
            },
          ),
          const SizedBox(height: 40),
          TextFormInput(
            controller: _passwordController,
            hintText: 'Contraseña',
            obscureText: true,
            textInputAction: TextInputAction.done,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'La contraseña es obligatoria';
              }
              return null;
            },
          ),
          const SizedBox(height: 60),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (_, state) {
              if (state.status == AuthStatus.loading) {
                return const ActivityIndicator();
              }
              return _buildButton();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return ListenableBuilder(
      listenable: Listenable.merge([
        _emailController,
        _passwordController,
      ]),
      builder: (_, __) {
        return CustomButtom(
          label: 'Ingresar',
          onPressed: (_emailController.text.isNotEmpty &&
                  _passwordController.text.isNotEmpty)
              ? _login
              : null,
        );
      },
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
            _emailController.text,
            _passwordController.text,
          );
    }
  }
}
