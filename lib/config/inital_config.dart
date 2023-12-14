import 'package:jiffy/jiffy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/core/di/di_config.dart';

Future<void> initalConfig() async {
  await Firebase.initializeApp();
  await Jiffy.setLocale('es');
  await configureDIDependencies();
}
