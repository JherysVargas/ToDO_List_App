import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/config/inital_config.dart';
import 'package:todo/config/routes/app_router.dart';
import 'package:todo/config/theme/app_theme.dart';
import 'package:todo/core/providers/auth_cubit/auth_cubit.dart';
import 'package:todo/core/providers/tasks_cubit/tasks_cubit.dart';
import 'package:todo/domain/use_cases/auth/auth_use_cases.dart';
import 'package:todo/domain/use_cases/task/task_use_cases.dart';

final injector = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskCubit>(
          create: (context) => TaskCubit(
            taskUseCase: injector.get<TaskUseCase>(),
          ),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            authUseCase: injector.get<AuthUseCase>(),
          ),
        )
      ],
      child: MaterialApp(
        initialRoute:
            injector.get<FirebaseAuth>().currentUser != null ? 'taskList' : '/',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
