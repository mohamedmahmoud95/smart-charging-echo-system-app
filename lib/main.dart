import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/config/app_router.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
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
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: appRouter.getRoute,
    );
  }
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}