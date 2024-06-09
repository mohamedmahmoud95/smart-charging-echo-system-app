import 'package:flutter/material.dart';
import '../../features/authentication/presentation/pages/reset_password_screen.dart';
import '../../features/authentication/presentation/pages/sign_in_screen.dart';
import '../../features/authentication/presentation/pages/sign_up_screen.dart';
import '../../features/home_screen/presentation/pages/home_sceen.dart';
import '../../features/location_tracker/presentation/pages/location_tracker_test.dart';


const String rootRoute = '/';
const String signInRoute = 'sign_in_screen_route';
const String signUpRoute = 'sign_up_screen_route';
const String resetPasswordRoute = 'reset_password_screen_route';
const String settingsRoute = 'settings_screen_route';
const  String profileRoute = 'profile_screen_route';
const  String homeRoute = 'home_screen_route';
const String locationTrackerScreenRoute = "location_tracker_screen_route";

class AppRouter {


  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
    // case '/':
    //   return MaterialPageRoute(builder: (context) =>  AuthUtilityFunctions.authenticationGateRouter());

      case 'sign_in_screen_route':
        return MaterialPageRoute(builder: (context) => const SignInScreen());

      case 'sign_up_screen_route':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());


      case 'reset_password_screen_route':
        return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());

      case 'homeRoute':
        return MaterialPageRoute(builder: (context) => const HomeSceen());

      case "location_tracker_screen_route":
        return MaterialPageRoute(builder: (context) =>  const LocationScreen());
      default:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
    }
  }
}
