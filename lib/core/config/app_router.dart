import 'package:flutter/material.dart';

import '../../features/authentication/presentation/pages/reset_password_screen.dart';
import '../../features/authentication/presentation/pages/sign_in_screen.dart';

const String homeRoute = '/';
const String signInRoute = 'sign_in_screen_route';
const String signUpRoute = 'sign_up_screen_route';
const String resetPasswordRoute = 'reset_password_screen_route';
const String settingsRoute = 'settings_screen_route';
const  String profileRoute = 'profile_screen_route';


class AppRouter {
  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SignInScreen());

      case 'sign_in_screen_route':
        return MaterialPageRoute(builder: (context) => const SignInScreen());

      case 'reset_password_screen_route':
        return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());

      default:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
    }
  }
}