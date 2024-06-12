// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Smart Charging System`
  String get applicationName {
    return Intl.message(
      'Smart Charging System',
      name: 'applicationName',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you a link to reset your password.`
  String get resetPasswordText {
    return Intl.message(
      'Enter your email address and we will send you a link to reset your password.',
      name: 'resetPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed`
  String get passwordChanged {
    return Intl.message(
      'Password Changed',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed successfully. You can now sign in using your new password.`
  String get passwordChangedText {
    return Intl.message(
      'Your password has been changed successfully. You can now sign in using your new password.',
      name: 'passwordChangedText',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Password`
  String get wrongPassword {
    return Intl.message(
      'Wrong Password',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `The password you entered is incorrect. Please try again.`
  String get wrongPasswordText {
    return Intl.message(
      'The password you entered is incorrect. Please try again.',
      name: 'wrongPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection and try again.`
  String get noInternetConnectionText {
    return Intl.message(
      'Please check your internet connection and try again.',
      name: 'noInternetConnectionText',
      desc: '',
      args: [],
    );
  }

  /// `Network Error`
  String get networkError {
    return Intl.message(
      'Network Error',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while trying to connect to the server. Please try again later.`
  String get networkErrorText {
    return Intl.message(
      'An error occurred while trying to connect to the server. Please try again later.',
      name: 'networkErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get unknownError {
    return Intl.message(
      'Unknown Error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again later.`
  String get unknownErrorText {
    return Intl.message(
      'An unknown error occurred. Please try again later.',
      name: 'unknownErrorText',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message(
      'No Data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `No data available. Please try again later.`
  String get noDataText {
    return Intl.message(
      'No data available. Please try again later.',
      name: 'noDataText',
      desc: '',
      args: [],
    );
  }

  /// `Error Occurred`
  String get errorOccurred {
    return Intl.message(
      'Error Occurred',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again later.`
  String get errorOccurredText {
    return Intl.message(
      'An error occurred. Please try again later.',
      name: 'errorOccurredText',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error Occurred`
  String get unknownErrorOccurred {
    return Intl.message(
      'Unknown Error Occurred',
      name: 'unknownErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again later.`
  String get unknownErrorOccurredText {
    return Intl.message(
      'An unknown error occurred. Please try again later.',
      name: 'unknownErrorOccurredText',
      desc: '',
      args: [],
    );
  }

  /// `Passwords Don't Match`
  String get passwordsDontMatch {
    return Intl.message(
      'Passwords Don\'t Match',
      name: 'passwordsDontMatch',
      desc: '',
      args: [],
    );
  }

  /// `The passwords you entered do not match. Please try again.`
  String get passwordsDontMatchText {
    return Intl.message(
      'The passwords you entered do not match. Please try again.',
      name: 'passwordsDontMatchText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
