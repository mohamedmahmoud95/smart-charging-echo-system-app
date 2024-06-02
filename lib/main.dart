import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/config/app_router.dart';
import 'firebase_options.dart';
void main(){
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  _initializeFirebase();

  runApp(SmartChargingEchoSystemApp(appRouter: AppRouter(),));
}
class SmartChargingEchoSystemApp extends StatelessWidget {
  final AppRouter appRouter;

  const SmartChargingEchoSystemApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.getRoute,
    );
  }
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}